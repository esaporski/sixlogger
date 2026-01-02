# shellcheck shell=sh

Describe 'examples'
	Parameters:dynamic
		for script in "${SHELLSPEC_SPECDIR}/../examples/"*.sh; do
			status_should_be="success"
			if printf '%s' "$(basename "$script")" | grep -Eq '^fail_'; then
				status_should_be="failure"
			fi

			%data "$script" "$status_should_be"
		done
	End

	It 'run script'
		When run script "$1"
		The status should be "$2"
		The stdout should be defined
		The stderr should be defined
	End
End
