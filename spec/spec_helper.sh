# shellcheck shell=sh

# Defining variables and functions here will affect all specfiles.
set -eu

# Support commands are generated in the `spec/support/bin` directory by the `--gen-bin` option.
# Run `shellspec --gen-bin @date` to generate the `@date` command.
date() {
	@date -d "2025-12-01" "$@"
}

get_date() {
	date -u -Iseconds
}

get_filename() {
	# Workaround for zsh
	# "$0" prints `shellspec_yieldxx` or `shellspec_parameters1` in zsh
	case $(basename "$SHELLSPEC_SHELL") in
	zsh) printf "sixlogger" ;;
	*) basename "$0" ;;
	esac
}

# Example: set_env MYVAR="my value" mycommand "myarg"
set_env() {
	env_name=$(printf "%s" "$1" | awk -F'=' '{ print $1 }')
	env_value=$(printf "%s" "$1" | awk -F'=' '{ print $2 }')

	eval "export ${env_name}=${env_value}"
	printf "%s: '%s'\n" "$env_name" "$env_value"
	shift

	"$@"
}

# This callback function will be invoked only once before loading specfiles.
spec_helper_precheck() {
	minimum_version "0.28.1"

	setenv SCRIPT_PATH="${SHELLSPEC_SPECDIR}/../build/sixlogger.sh"

	# sixlogger.sh environment variables
	setenv SIXLOGGER_NO_COLOR=true # Default is `false`
	setenv SIXLOGGER_COLOR_INFO='\033[0;32m'
	setenv SIXLOGGER_COLOR_OFF='\033[0m'
	setenv E_SIXLOGGER_UNKNOWN_LOGLEVEL=99
}

# This callback function will be invoked after a specfile has been loaded.
spec_helper_loaded() {
	:
}

# This callback function will be invoked after core modules has been loaded.
spec_helper_configure() {
	:
}
