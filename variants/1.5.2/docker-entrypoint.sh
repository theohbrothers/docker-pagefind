#!/bin/sh
set -eu

if [ $# -gt 0 ] && [ "${1#-}" != "$1" ]; then
    set -- pagefind_extended "$@"
fi

exec "$@"