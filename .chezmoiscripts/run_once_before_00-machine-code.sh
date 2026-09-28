#!/bin/sh

set -eu

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/chezmoi"
CONFIG_FILE="$CONFIG_DIR/chezmoi.toml"

mkdir -p "$CONFIG_DIR"

# Already configured
if [ -f "$CONFIG_FILE" ] &&
   grep -qE '^[[:space:]]*machineCode[[:space:]]*=' "$CONFIG_FILE"; then
    exit 0
fi

printf 'Machine name: '
IFS= read -r machine_name

printf 'Machine salt: '
stty -echo
IFS= read -r machine_salt
stty echo
printf '\n'

input="${machine_name}:${machine_salt}"

if command -v sha256sum >/dev/null 2>&1; then
    machine_code="$(printf '%s' "$input" | sha256sum | cut -c1-8)"
elif command -v shasum >/dev/null 2>&1; then
    machine_code="$(printf '%s' "$input" | shasum -a 256 | cut -c1-8)"
else
    echo "Error: sha256sum or shasum is required." >&2
    exit 1
fi

unset machine_name machine_salt input

if [ ! -f "$CONFIG_FILE" ]; then
    cat > "$CONFIG_FILE" <<EOF
[data]
machineCode = "$machine_code"
EOF
elif grep -qE '^[[:space:]]*\[data\][[:space:]]*$' "$CONFIG_FILE"; then
    # Append immediately after [data]
    tmp="${CONFIG_FILE}.tmp.$$"
    awk -v code="$machine_code" '
        /^\[data\][[:space:]]*$/ && !done {
            print
            print "machineCode = \"" code "\""
            done = 1
            next
        }
        { print }
    ' "$CONFIG_FILE" > "$tmp"
    mv "$tmp" "$CONFIG_FILE"
else
    cat >> "$CONFIG_FILE" <<EOF

[data]
machineCode = "$machine_code"
EOF
fi

chmod 600 "$CONFIG_FILE"

printf 'Machine code: %s\n' "$machine_code"
printf 'Saved to %s\n' "$CONFIG_FILE"
