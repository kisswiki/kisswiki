```bash
$ git stash push -m "guacamole sauce WIP"
$ git stash apply stash^{/guacamo}
```

.gitconfig file:

```
[alias]
sshow = "!f() { git stash show stash^{/$*} -p; }; f"
sapply = "!f() { git stash apply stash^{/$*}; }; f"
```

- https://stackoverflow.com/questions/11269256/how-to-name-and-retrieve-a-stash-by-name-in-git
- https://medium.freecodecamp.org/useful-tricks-you-might-not-know-about-git-stash-e8a9490f0a1a
