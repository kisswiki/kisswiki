for git aliases

`__git_complete gco _git_checkout`

https://stackoverflow.com/questions/342969/how-do-i-get-bash-completion-to-work-with-aliases/15009611#15009611

for git subcommand `tagarchive`

```
_git_tagarchive() 
{
    _git_branch
}
```

https://stackoverflow.com/questions/11466991/git-aliases-git command-line-autocompletion-of-branch-names/11469302#11469302

## to complete local branches

in ~/.bash_profile

```
_git_fe() 
{
    __gitcomp_direct "$(__git_heads "" "$cur" " ")"
}
```

- https://cmetcalfe.ca/blog/git-checkout-autocomplete-local-branches-only.html
- https://github.com/git/git/commit/227307a639c96b3579b7fe60840fdae123d1ee88