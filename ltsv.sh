#!/bin/bash

user_awk_script=$(cat <<-'EOS'
{ print $0 }
EOS
)

ltsv_awk_script=$(cat <<-'EOS'
function key(name) {
    for (i = 1; i <= NF; i++) {
        match($i, ":");
        xs[substr($i, 0, RSTART)] = substr($i, RSTART+1);
    };
    return xs[name":"];
}
EOS
)

awk_scripts="${ltsv_awk_script} ${1:-$user_awk_script}"

if [[ ! -p /dev/stdin ]]; then
    echo "Error: failed to parse: you must supply something to work with via stdin" >&2
    exit 1
fi

awk -F'\t' "$awk_scripts"
