#!/bin/sh
#
# A Simple POSIX-compliant Logger function for shell scripts.

#######################################
# Logger function.
# Globals:
#	`SIXLOGGER_DEBUG` or `DEBUG`: If set to `true` or `1`, show `debug` messages.
#	`SIXLOGGER_NO_COLOR` or `NO_COLOR`: If set to `true` or `1`, disable colored terminal output.
#	`SIXLOGGER_COLOR_DEBUG`: Set output color for `debug` messages.
#	`SIXLOGGER_COLOR_INFO`: Set output color for `info` messages.
#	`SIXLOGGER_COLOR_WARN`: Set output color for `warn` messages.
#	`SIXLOGGER_COLOR_ERROR`: Set output color for `error` messages.
#	`SIXLOGGER_COLOR_FATAL`: Set output color for `fatal` messages.
#	`E_SIXLOGGER_UNKNOWN_LOGLEVEL`: Set status code for unknown loglevel error.
# Arguments:
#	Loglevel for logger
#	Message to log
# Outputs:
#	Writes `info`, `warn` and `debug` log messages to `stdout`.
#	Writes `error` and `fatal` log messages to `stderr`.
# Returns:
#	`0` if no errors.
#	`30` on `E_SIXLOGGER_UNKNOWN_LOGLEVEL` error.
#######################################
sixlogger() {
	# `SIXLOGGER_DEBUG` and `SIXLOGGER_NO_COLOR` take precedence over `DEBUG` and `NO_COLOR`
	_sl_debug=$(printf "%s" "${SIXLOGGER_DEBUG:-${DEBUG:-false}}" | tr '[:upper:]' '[:lower:]')
	_sl_no_color=$(printf "%s" "${SIXLOGGER_NO_COLOR:-${NO_COLOR:-false}}" | tr '[:upper:]' '[:lower:]')

	_sl_color_debug=${SIXLOGGER_COLOR_DEBUG:-'\033[0;34m'} # Blue
	_sl_color_info=${SIXLOGGER_COLOR_INFO:-'\033[0;32m'}   # Green
	_sl_color_warn=${SIXLOGGER_COLOR_WARN:-'\033[1;33m'}   # Yellow
	_sl_color_error=${SIXLOGGER_COLOR_ERROR:-'\033[0;31m'} # Red
	_sl_color_fatal=${SIXLOGGER_COLOR_FATAL:-'\033[1;31m'} # Light Red
	_sl_color_off='\033[0m'

	e_sl_unknown_loglevel=${E_SIXLOGGER_UNKNOWN_LOGLEVEL:-30}
	_sl_status_code=0

	_sl_timestamp=$(date -u -Iseconds) # ISO 8601 date format
	_sl_filename=$(basename "$0")      # Script name
	_sl_loglevel=$(printf "%s" "$1" | tr '[:upper:]' '[:lower:]')
	shift
	_sl_message="$*"

	case $_sl_loglevel in
	info)
		_sl_color_output=$_sl_color_info
		;;
	warn)
		_sl_color_output=$_sl_color_warn
		;;
	error)
		_sl_color_output=$_sl_color_error
		;;
	fatal)
		_sl_color_output=$_sl_color_fatal
		;;
	debug)
		if ! [ "$_sl_debug" = "true" ] && ! [ "$_sl_debug" = 1 ]; then return; fi
		_sl_color_output=$_sl_color_debug
		;;
	*)
		_sl_message="Unknown log level '$_sl_loglevel'"
		_sl_loglevel="fatal"
		_sl_color_output=$_sl_color_fatal
		_sl_status_code=$e_sl_unknown_loglevel
		;;
	esac

	_sl_output=$(printf '%s | %s | %s | %s' "$_sl_timestamp" "$_sl_loglevel" "$_sl_filename" "$_sl_message")
	if [ "$_sl_no_color" != "true" ] && [ "$_sl_no_color" != 1 ]; then
		_sl_output=$(printf "%b%s%b" "$_sl_color_output" "$_sl_output" "$_sl_color_off")
	fi

	case $_sl_loglevel in
	error | fatal) printf '%s\n' "$_sl_output" >&2 ;; # stderr
	*) printf '%s\n' "$_sl_output" >&1 ;;             # stdout
	esac
	return "$_sl_status_code"
}
