#!/bin/bash

git add -A && git commit -a -m 'bump'; git pull --rebase; git push
