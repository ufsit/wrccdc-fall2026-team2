#!/bin/sh
# reset_all_passwords.sh
# Sets the same password for every account in /etc/passwd, including root.
# Usage: ./reset_all_passwords.sh <new_password>

set -eu

if [ $# -ne 1 ]; then
    echo "Usage: $0 <new_password>" >&2
    exit 1
fi

NEWPASS="$1"

if [ "$(id -u)" -ne 0 ]; then
    echo "Error: must be run as root." >&2
    exit 1
fi

if [ -z "$NEWPASS" ]; then
    echo "Error: password must not be empty." >&2
    exit 1
fi

COUNT=0
FAILED=""

while IFS=: read -r user _; do
    if printf '%s:%s\n' "$user" "$NEWPASS" | chpasswd 2>/dev/null; then
        COUNT=$((COUNT + 1))
    else
        FAILED="$FAILED $user"
    fi
done < /etc/passwd

echo "Updated password for $COUNT account(s)."
if [ -n "$FAILED" ]; then
    echo "Failed for:$FAILED" >&2
fi
