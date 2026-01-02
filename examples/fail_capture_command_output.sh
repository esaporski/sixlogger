#!/bin/sh

# You can copy and paste the sixlogger function directly in your script
# or source it from another file
script_dir="$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd)"

# shellcheck disable=SC1091
. "${script_dir}/../src/sixlogger.sh"

filename="my_file"
sixlogger info "Removing file '${filename}'"

# Initialize the `status_code` variable with `0`
status_code=0

# Let's redirect `stderr` to `stdout` and save the output of the command we want to run
# If the command fails, we save the exit status code into `status_code`
output=$(rm "$filename" 2>&1) || status_code=$?

# Now we check if the exit status code is still `0` (success)
# If not, we print a message and exit passing the failed command's status code
[ "$status_code" -eq 0 ] || {
	sixlogger fatal "Failed to remove '${filename}' with status code '${status_code}': ${output}"
	exit "$status_code"
}
sixlogger info "Deleted '${filename}'"
