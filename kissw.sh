#!/usr/bin/env bash

# https://unix.stackexchange.com/questions/114244/replace-all-newlines-to-space-except-the-last/114281#114281
git add -A && git commit -a -m "$(git diff --name-only --staged | perl -p00e 's/\n(?!\Z)/, /g')"; git pull --rebase; git push
