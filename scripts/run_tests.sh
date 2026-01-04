#!/bin/sh

set -eu

script_dir="$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd)"
# shellcheck disable=SC1091
. "${script_dir}/../build/sixlogger.sh"

OSes="alpine debian freebsd"
shells=''

for os in $OSes; do
	# Yash is being tested manually because of a bug in shellspec:
	# https://github.com/shellspec/shellspec/issues/299
	# The bug was fixed but not released yet.
	case "$os" in
	alpine | debian)
		# alpine: loksh -> ksh
		shells="sh bash dash ksh mksh oksh posh zsh"
		test_command="docker run --rm \
			--volume ${script_dir}/..:/mnt \
			shellspec-${os} \
			sh -c"
		;;
	freebsd)
		# `dash` is not working
		shells="sh bash ksh93 mksh oksh zsh"
		test_command="vagrant ssh -c"

		export VAGRANT_CWD="${script_dir}/../vagrant/"
		;;
	esac

	for shell in $shells; do
		sixlogger info "Testing '$shell' in '$os'"
		eval "${test_command} \"shellspec --shell=${shell} spec/\""
	done
done
