#!/bin/sh

set -eu

# You can copy and paste the sixlogger function directly in your script
# or source it from another file
script_dir="$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd)"

# shellcheck disable=SC1091
. "${script_dir}/../src/sixlogger.sh"

# Disable color if redirecting `stdout` or `stderr` to another command or file
if ! { [ -t 1 ] && [ -t 2 ]; }; then SIXLOGGER_NO_COLOR=true; fi && export SIXLOGGER_NO_COLOR

# Script parameters
URL="https://cowsay.morecode.org/say?format=text&message=Hello+from+'$(basename "$0")"

cleanup() {
	sixlogger info "Running cleanup"
	{
		output=$(rm "$tmp_file" 2>&1) && sixlogger info "Deleted '${tmp_file}'"
	} || sixlogger error "Failed to remove '${tmp_file}': ${output}"
	exit
}

sixlogger info "Creating temporary file"
if ! tmp_file="$(mktemp 2>&1)"; then
	sixlogger warn "Could not create temporary file with 'mktemp': ${tmp_file}"
	sixlogger warn "Trying to create temporary file with 'touch' in the current directory"

	tmp_file="./tmp.$(awk 'BEGIN{print srand(srand())}')"
	if ! err=$(touch "$tmp_file" 2>&1); then
		sixlogger fatal "Could not create temporary file with 'touch': ${err}"
		exit 1
	fi
fi
sixlogger info "Temporary file created: '${tmp_file}'"

# `cleanup` removes temporary file
trap cleanup INT TERM EXIT

status_code=0
if [ -x "$(command -v curl)" ]; then
	sixlogger info "Running 'curl'"
	output=$(curl "$URL" --output "$tmp_file" 2>&1) || status_code=$?
elif [ -x "$(command -v wget)" ]; then
	sixlogger info "Running 'wget'"
	output=$(wget --output-document "$tmp_file" "$URL" 2>&1) || status_code=$?
else
	output="Need 'curl' or 'wget' to continue, exiting"
	status_code=1
fi

[ "$status_code" -eq 0 ] || {
	sixlogger fatal "Request failed with status code '${status_code}': ${output}"
	exit "$status_code"
}

# It will only show if `SIXLOGGER_DEBUG` or `DEBUG` is set to `true` or `1`
sixlogger debug "$(cat "$tmp_file")"
