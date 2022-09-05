- I want a script that does the following things:
  1. identify all open PRs on a GitHub project, e.g. ziglang/zig
  2. for each one with failed CI status, rebase against master & force push with lease
  3. if step 2 fails, close the PR & comment "please reopen against master"
  - https://mobile.twitter.com/andy_kelley/status/1565166168507555840
