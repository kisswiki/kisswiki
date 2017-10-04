#!/bin/bash

git add -A && git ci -a -m 'bump'; git pull --rebase; git push
