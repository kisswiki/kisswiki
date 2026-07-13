## Reset password

No reset.

```
atuin account delete
atuin register
```

- <https://forum.atuin.sh/t/delete-account-without-password/240/2>
- <https://docs.atuin.sh/reference/sync/>

## delete history

```
atuin stats -c 50
# problem: below will show lines starting with time but also with timeout
# atuin search "^time "
atuin search 'r/^time\b/'
atuin search --delete 'r/^time\b/'
```

- https://docs.atuin.sh/cli/guide/delete-history/
- about regex support https://blog.atuin.sh/release-v18-1/ https://github.com/atuinsh/atuin/pull/1745

## dotfiles

atuin help dotfiles
