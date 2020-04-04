#!/bin/bash

set -eo pipefail

function echo_err () {
    echo >&2 -e "$@"
}
function echo_debug () {
    if [ "$KD_DEBUG" == "1" ]; then
        echo >&2 ">>>> DEBUG >>>>> $(date "+%Y-%m-%d %H:%M:%S") $KD_NAME: " "$@"
    fi
}

KD_NAME="mdline"
echo_debug "begin"

# mdline command check
mdlineCMD="$(which mdline)"
if [ "$mdlineCMD" == "" ]; then
    echo ">>>>>> mdline: Missing 'mdline' command. Abort"
    exit 1
fi

# Parameter check
if [ $# -eq 0 ]; then
    "$mdlineCMD"
    echo_debug "end"
    exit 1
fi

# Execute mdline
"$mdlineCMD" "$@"

echo_debug "end"
