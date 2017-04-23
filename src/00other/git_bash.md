## Polish characters displayed incorrectly

- `Options > Text > Locale > pl_PL`
- `Options > Text > Character set > UTF-8`

Restart terminal

## Slow

```bash
git config --global core.preloadindex true
git config --global core.fscache true
git config --global gc.auto 256
```

- PS1 http://stackoverflow.com/questions/4485059/git-bash-is-extremely-slow-in-windows-7-x64/43569540#43569540
