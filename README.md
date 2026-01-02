# SixLogger

<!-- markdownlint-disable MD033 -->
[![Language](https://img.shields.io/github/languages/top/esaporski/sixlogger.svg)](https://github.com/esaporski/sixlogger/search?l=Shell)
[![kcov](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fesaporski.github.io%2Fsixlogger%2Fcoverage.json&query=percent_covered&label=kcov&suffix=%25)](https://esaporski.github.io/sixlogger/)
[![License](https://img.shields.io/github/license/esaporski/sixlogger.svg)](https://github.com/esaporski/sixlogger/blob/master/LICENSE)<br>
![GNU Coreutils](https://img.shields.io/badge/GNU%20Coreutils-ecd53f?style=flat)
![BusyBox](https://img.shields.io/badge/BusyBox-ecd53f?style=flat)
![BSD](https://img.shields.io/badge/BSD-ecd53f?style=flat)<br>
![sh](https://img.shields.io/badge/sh-cec7d1.svg?style=flat)
![bash](https://img.shields.io/badge/bash-cec7d1.svg?style=flat)
![dash](https://img.shields.io/badge/dash-cec7d1.svg?style=flat)
![ksh93u+m](https://img.shields.io/badge/ksh93u+m-cec7d1.svg?style=flat)
![loksh](https://img.shields.io/badge/loksh-cec7d1.svg?style=flat)
![mksh](https://img.shields.io/badge/mksh-cec7d1.svg?style=flat)
![oksh](https://img.shields.io/badge/oksh-cec7d1.svg?style=flat)
![posh](https://img.shields.io/badge/posh-cec7d1.svg?style=flat)
![yash](https://img.shields.io/badge/yash-cec7d1.svg?style=flat)
![zsh](https://img.shields.io/badge/zsh-cec7d1.svg?style=flat)

A **S**imple POS**IX**-compliant **Logger** function.

[![asciicast](https://asciinema.org/a/765449.svg)](https://asciinema.org/a/765449)

## Requirements

Has only a few requirements:

- `basename`
- `date`
- `tr`

## Globals

`SIXLOGGER_DEBUG` and `SIXLOGGER_NO_COLOR` take precedence over `DEBUG` and `NO_COLOR`.

| Name | Description | Type | Default |
| ---- | ----------- | ---- | ------- |
| `SIXLOGGER_DEBUG` or `DEBUG` | If set to `true` or `1`, show `debug` messages | `boolean` | `false` |
| `SIXLOGGER_NO_COLOR` or `NO_COLOR` | If set to `true` or `1`, disable colored terminal output | `boolean` | `false` |
| `SIXLOGGER_COLOR_DEBUG` | Set output color for `debug` messages | `ANSI escape sequence` | `\033[0;34m` |
| `SIXLOGGER_COLOR_INFO` | Set output color for `info` messages | `ANSI escape sequence` | `\033[0;32m` |
| `SIXLOGGER_COLOR_WARN` | Set output color for `warn` messages | `ANSI escape sequence` | `\033[1;33m` |
| `SIXLOGGER_COLOR_ERROR` | Set output color for `error` messages | `ANSI escape sequence` | `\033[1;31m` |
| `SIXLOGGER_COLOR_FATAL` | Set output color for `fatal` messages | `ANSI escape sequence` | `\033[0;31m` |
| `E_SIXLOGGER_UNKNOWN_LOGLEVEL` | Set status code for unknown loglevel error | `number` | `30` |

## Arguments

The `sixlogger` function takes two arguments:

| Sh | Name | Description | Type |
| -- | ---- | ----------- | ---- |
| `$1` | loglevel | Loglevel for logger (e.g.: `info`) | `string` |
| `$*` | message | Message to log (e.g.: `"My log message"`) | `string` |

## Outputs

| Output | Description |
| ------ | ----------- |
| `stdout` | Writes `info`, `warn` and `debug` log messages to `stdout`. |
| `stderr` | Writes `error` and `fatal` log messages to `stderr`. |

## Returns

| Status Code | Description |
| ----------- | ----------- |
| `0` | No errors. |
| `30` | `E_SIXLOGGER_UNKNOWN_LOGLEVEL` |

## Usage

### Download script

```sh
# Create a new script with sixlogger
SIXLOGGER_VERSION=0.1.0
cat <<EOF > sixlogger.sh && chmod +x sixlogger.sh
#!/bin/sh
$(curl -sSfL "https://github.com/esaporski/sixlogger/releases/download/${SIXLOGGER_VERSION}/sixlogger.sh")
EOF
```

### Embedding into a file

```shell
# Add the sixlogger function after shebang `#!`
SIXLOGGER_VERSION=0.1.0
curl -sSfL "https://github.com/esaporski/sixlogger/releases/download/${SIXLOGGER_VERSION}/sixlogger.sh" |
  sed -i '/#!/r /dev/stdin' my_script.sh
```

### Source it from another file

After downloading the script with the command above, add these lines in your script:

```sh
#!/bin/sh

# Get script directory absolute path
script_dir="$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd)"

. "${script_dir}/sixlogger.sh"
```

## Examples

- [Simple](examples/simple.sh)
- [Advanced](examples/advanced.sh)
- [Capture command output](examples/fail_capture_command_output.sh)

### `SIXLOGGER_DEBUG` and `SIXLOGGER_NO_COLOR`

```sh
DEBUG=true
sixlogger debug "A debug message"
# Outputs:
# > \e[0;34m2025-01-01T00:00:00+00:00 | debug | example.sh | A debug message\e[0m

# `SIXLOGGER_DEBUG` takes precedence over `DEBUG`
# so you will not see this message
SIXLOGGER_DEBUG=false
sixlogger debug "You will not see me!"
# Outputs:
# >

# ...but this works
DEBUG=false
SIXLOGGER_DEBUG=true
sixlogger debug "Now you can see me again"
# Outputs:
# > \e[0;34m2025-01-01T00:00:00+00:00 | debug | example.sh | Now you can see me again\e[0m

# It's the same thing for `SIXLOGGER_NO_COLOR` and `NO_COLOR`
NO_COLOR=false
sixlogger info "Colored terminal output is enabled by default"
# Outputs:
# > \e[0;32m2025-01-01T00:00:00+00:00 | info | example.sh | Colored terminal output is enabled by default\e[0m

# Disables colored output even with `NO_COLOR` still set to `false`
SIXLOGGER_NO_COLOR=true
sixlogger info "Colored terminal output is disabled now"
# Outputs:
# > 2025-01-01T00:00:00+00:00 | info | example.sh | Colored terminal output is disabled now
```

### Capturing output and status code from commands

```sh
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

# On success:
# > 2025-01-01T00:00:00+00:00 | info | example.sh | Removing file 'my_file'
# > 2025-01-01T00:00:00+00:00 | info | example.sh | Deleted 'my_file'

# On failure:
# > 2025-01-01T00:00:00+00:00 | info | example.sh | Removing file 'my_file'
# > 2025-01-01T00:00:00+00:00 | fatal | example.sh | Failed to remove 'my_file' with status code '1': rm: cannot remove 'my_file': No such file or directory
# > echo $?
# > 1
```

### Logging into a file

When logging into a file, you need to remember that:

- `error` and `fatal` messages are sent to `stderr`.
- You need to disable colored output with `SIXLOGGER_NO_COLOR` or `NO_COLOR`.

```sh
SIXLOGGER_NO_COLOR=true # or NO_COLOR=true
export SIXLOGGER_NO_COLOR

# You can log `stdout` and `stderr` into different files
./my_script.sh 1>/var/log/my_script.log 2>/var/log/my_script.err.log

# Or you can log everything into a single file
./my_script.sh >/var/log/my_script.log 2>&1
```

If you want to disable colored output when `stdout` or `stderr` are being redirected to another file or command, you can include this snippet in your own script:

```shell
# Disable color if redirecting `stdout` or `stderr` to another command or file
if ! { [ -t 1 ] && [ -t 2 ]; }; then SIXLOGGER_NO_COLOR=true; fi && export SIXLOGGER_NO_COLOR

# Or...
if ! { [ -t 1 ] && [ -t 2 ]; }; then NO_COLOR=true; fi && export NO_COLOR
```

## Changelog

[CHANGELOG.md](CHANGELOG.md)

## License

[MIT License](https://github.com/esaporski/sixlogger/blob/master/LICENSE)
