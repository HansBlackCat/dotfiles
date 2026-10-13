#!/bin/sh

# Called by the init config template, never as an apply script.
# stdout is only the code; interact with the terminal directly because chezmoi
# captures stdout when calling this helper with the output template function.
set -eu

if ! exec 3<>/dev/tty; then
    echo "A terminal is required to generate machineCode." >&2
    exit 1
fi

tty_state=$(stty -g <&3)
trap 'stty "$tty_state" <&3 || :' 0
trap 'exit 129' HUP
trap 'exit 130' INT
trap 'exit 143' TERM

printf 'Machine name: ' >&3
IFS= read -r machine_name <&3

stty -echo <&3
printf 'Machine salt: ' >&3
IFS= read -r machine_salt <&3
stty "$tty_state" <&3
printf '\n' >&3

if command -v sha256sum >/dev/null 2>&1; then
    printf '%s' "${machine_name}:${machine_salt}" | sha256sum | cut -c1-8
elif command -v shasum >/dev/null 2>&1; then
    printf '%s' "${machine_name}:${machine_salt}" | shasum -a 256 | cut -c1-8
else
    echo "Error: sha256sum or shasum is required." >&2
    exit 1
fi
