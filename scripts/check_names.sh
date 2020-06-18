#!/bin/bash

# execute from project root, i.e. ~/github/docs-diagrams/
# and not a subfolder

RED='\033[0;31m'
GRN='\033[0;32m'
BLU='\033[0;34m'
RST='\033[0m'

grep_git() {
    git grep "$1\.\(png\|jpg\|svg\)" content | grep "image::images/"
}

svgs=$(mktemp)
find out -name "*.svg" > "$svgs"
adocs=$(mktemp)
find ../docs -name "*.adoc" > "$adocs"

echo -e "${BLU}OLD FILES${RST}"
pushd ../docs >/dev/null
for name in $(cat ../docs-diagrams/scripts/names.txt | cut -d':' -f1); do
    cnt="$( grep_git "$name" | wc -l)"
    if (( cnt != 1 )); then
        COLOR="$RED"
    else
        COLOR="$GRN"
    fi

    echo -e "${COLOR}### $name${RST}\t${cnt}"
    if (( cnt != 1 )); then
        grep_git "$name"
    fi
done
popd >/dev/null


echo -e "${BLU}NEW FILES${RST}"
pushd out >/dev/null
for name in $(cat ../scripts/names.txt | cut -d':' -f2); do
    cnt="$( find . -name "$name.svg" | wc -l)"
    if (( cnt != 1 )); then
        COLOR="$RED"
    else
        COLOR="$GRN"
    fi

    echo -e "${COLOR}### $name${RST}\t${cnt}"
    if (( cnt != 1 )); then
        find . -name "$name.svg" | sed 's/.svg//g'
    fi
done
popd >/dev/null
