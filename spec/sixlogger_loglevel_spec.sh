# shellcheck shell=sh
# shellcheck disable=SC2034,SC2329

Include "$SCRIPT_PATH"

Describe 'log level types'
	It 'calls sixlogger info'
		When call sixlogger info "info message"
		The status should be success
		The stdout should equal "$(get_date) | info | $(get_filename) | info message"
	End

	It 'calls sixlogger warn'
		When call sixlogger warn "warn message"
		The status should be success
		The stdout should equal "$(get_date) | warn | $(get_filename) | warn message"
	End

	It 'calls sixlogger error'
		When call sixlogger error "error message"
		The status should be success
		The stderr should equal "$(get_date) | error | $(get_filename) | error message"
	End

	It 'calls sixlogger fatal'
		When call sixlogger fatal "fatal message"
		The status should be success
		The stderr should equal "$(get_date) | fatal | $(get_filename) | fatal message"
	End

	It 'calls sixlogger debug with SIXLOGGER_DEBUG=false'
		When call sixlogger debug "debug message"
		The status should be success
		The stdout should be blank
	End

	It 'calls sixlogger debug with SIXLOGGER_DEBUG=true'
		preserve() { %preserve SIXLOGGER_DEBUG; }
		AfterRun preserve

		When call set_env SIXLOGGER_DEBUG=true sixlogger debug "debug message"
		The status should be success
		The line 1 of stdout should equal "SIXLOGGER_DEBUG: 'true'"
		The line 2 of stdout should equal "$(get_date) | debug | $(get_filename) | debug message"
	End

	It 'calls sixlogger debug with SIXLOGGER_DEBUG=false but DEBUG=true'
		preserve() {
			%preserve SIXLOGGER_DEBUG
			%preserve DEBUG
		}
		AfterRun preserve

		When call set_env SIXLOGGER_DEBUG=false set_env DEBUG=true sixlogger debug "debug message"
		The status should be success
		The line 1 of stdout should equal "SIXLOGGER_DEBUG: 'false'"
		The line 2 of stdout should equal "DEBUG: 'true'"
		The line 3 of stdout should be blank
	End

	It 'calls sixlogger debug with SIXLOGGER_DEBUG=true but DEBUG=false'
		preserve() {
			%preserve SIXLOGGER_DEBUG
			%preserve DEBUG
		}
		AfterRun preserve

		When call set_env SIXLOGGER_DEBUG=true set_env DEBUG=false sixlogger debug "debug message"
		The status should be success
		The line 1 of stdout should equal "SIXLOGGER_DEBUG: 'true'"
		The line 2 of stdout should equal "DEBUG: 'false'"
		The line 3 of stdout should equal "$(get_date) | debug | $(get_filename) | debug message"
	End

	It 'calls invalid sixlogger type'
		When call sixlogger asdf "This message will be discarded"
		The status should be failure
		The status should equal "$E_SIXLOGGER_UNKNOWN_LOGLEVEL"
		The stderr should equal "$(get_date) | fatal | $(get_filename) | Unknown log level 'asdf'"
	End
End
