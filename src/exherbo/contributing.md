## create patch for file

`git format-patch -1  --output-directory ~/patches 25992944573c09a070ffd384ebe7c659d1a9f820 -- print_context.c`

http://stackoverflow.com/questions/7885075/format-patch-for-a-single-file

## from working copy

`git diff > mypatch.patch`

http://stackoverflow.com/questions/5159185/create-a-git-patch-from-the-changes-in-the-current-working-directory
