#!/bin/sh
# shellcheck disable=SC2034

set -eu

# You can copy and paste the sixlogger function directly in your script
# or source it from another file
script_dir="$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd)"

# shellcheck disable=SC1091
. "${script_dir}/../src/sixlogger.sh"

# You can alias the `sixlogger` function to a shorter name if you want:
#	alias log=sixlogger
#	log info "Hello world"

sixlogger info "Info message"
sixlogger warn "Warn message"
sixlogger error "Error messages go to 'stderr'"
sixlogger fatal "Fatal messages also go to 'stderr'"
sixlogger debug "You won't be able to see this message!"

# Showing debug messages
SIXLOGGER_DEBUG=true # or set `DEBUG=true`
sixlogger debug "This is a debug message ;)"

# Or change the default color for a specific loglevel
sixlogger warn "Default color for 'warn' is yellow"
SIXLOGGER_COLOR_WARN='\033[1;36m' # Cyan
sixlogger warn "Changed color!"

# You can also disable the colored text output
SIXLOGGER_NO_COLOR=true # or set `NO_COLOR=true` (https://no-color.org/)
sixlogger info "Non-colored..."
sixlogger fatal "...text output"
SIXLOGGER_NO_COLOR=false

# Be careful, the `sixlogger` function exits with an error if loglevel is unknown
sixlogger asdf "This message will be discarded" || last_command_status_code="$?" # preventing script from exiting
sixlogger error "Last command exited with status code '${last_command_status_code}'"

# We can disable that behaviour by setting `E_SIXLOGGER_UNKNOWN_LOGLEVEL=0`
E_SIXLOGGER_UNKNOWN_LOGLEVEL=0
sixlogger asdf "The message will still be discarded..."
