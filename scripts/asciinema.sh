#!/usr/bin/env bash

# To record a session, run:
# 	asciinema rec --command "./scripts/asciinema.sh" "./docs/asciinema.cast"
# To play back a local recording file, run:
#	asciinema play "./docs/asciinema.cast"
# To upload a recording to 'asciinema.org', run:
#	asciinema upload --server-url "https://asciinema.org" "./docs/asciinema.cast"
# To generate a GIF from a `.cast` file, run:
#	agg --theme asciinema --font-family "Fira Code" --font-size 20 --fps-cap 60 --rows 10 "./docs/asciinema.cast" "./docs/asciinema.gif"

script_dir="$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd)"
# shellcheck disable=SC1091
. "${script_dir}/../build/sixlogger.sh"

trap "sleep 2" DEBUG # Run sleep after each log message

sixlogger info "Information, information"
sixlogger warn "Who are you?"
sixlogger error "Error messages go to 'stderr'"
sixlogger fatal "Fatal messages also go to 'stderr'"
sixlogger info "You can show debug messages with 'SIXLOGGER_DEBUG=true' or 'DEBUG=true'"

SIXLOGGER_DEBUG=true sixlogger debug "This is a debug message ;)"
SIXLOGGER_NO_COLOR=true sixlogger info "You can disable colored output with 'SIXLOGGER_NO_COLOR=true' or 'NO_COLOR=true'"
