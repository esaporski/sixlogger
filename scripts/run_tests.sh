#!/bin/sh

set -eu

script_dir="$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd)"
# shellcheck disable=SC1091
. "${script_dir}/../build/sixlogger.sh"

OSes="alpine debian"
shells=''

for os in $OSes; do
	# Yash is being tested manually because of a bug in shellspec:
	# https://github.com/shellspec/shellspec/issues/299
	# The bug was fixed but not released yet.
	case "$os" in
	alpine)
		# loksh -> ksh
		shells="sh bash dash ksh mksh oksh posh zsh"
		;;
	debian)
		shells="sh bash dash ksh mksh oksh posh zsh"
		;;
	esac

	for shell in $shells; do
		sixlogger info "Testing '$shell' in '$os'"
		docker run --rm \
			--volume "${script_dir}/..:/mnt" \
			"shellspec-${os}" \
			shellspec --shell="$shell" spec/
	done
done
