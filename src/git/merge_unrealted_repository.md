1. In local copy of original repository move root to subdirectory https://github.com/rofrol/dotfiles/blob/master/bin/git-rewrite-history-move-to-subdirectory.sh
2. Add this local repostitory `git remote add B /home/sas/dev/apps/smx/repo/bak/ontologybackend/.git` https://stackoverflow.com/questions/10603671/how-to-add-a-local-repo-and-treat-it-as-a-remote-repo/10603750#10603750
3. Merge `git merge -s ours --allow-unrelated-histories B/master; git add -A; git commit -a -m 'Merging B/master'` https://stackoverflow.com/questions/6426247/merge-git-repository-in-subdirectory#comment98353531_6442034
