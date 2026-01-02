# shellcheck shell=sh
# shellcheck disable=SC2034,SC2329

Include "$SCRIPT_PATH"

Describe 'log color'
	Parameters
		# shellcheck disable=SC2286
		# SIXLOGGER_NO_COLOR | STDOUT
		"" "$(printf "%b%s%b" "$SIXLOGGER_COLOR_INFO" "$(get_date) | info | $(get_filename) | test output color" "$SIXLOGGER_COLOR_OFF")"
		false "$(printf "%b%s%b" "$SIXLOGGER_COLOR_INFO" "$(get_date) | info | $(get_filename) | test output color" "$SIXLOGGER_COLOR_OFF")"
		0 "$(printf "%b%s%b" "$SIXLOGGER_COLOR_INFO" "$(get_date) | info | $(get_filename) | test output color" "$SIXLOGGER_COLOR_OFF")"
		"true" "$(get_date) | info | $(get_filename) | test output color"
		TRUE "$(get_date) | info | $(get_filename) | test output color"
		1 "$(get_date) | info | $(get_filename) | test output color"
	End

	It 'calls sixlogger info'
		preserve() {
			%preserve SIXLOGGER_NO_COLOR
		}
		AfterRun preserve

		When call set_env SIXLOGGER_NO_COLOR="$1" sixlogger info "test output color"
		The status should be success
		The line 1 of stdout should equal "SIXLOGGER_NO_COLOR: '${1}'"
		The line 2 of stdout should equal "$2"
	End
End
