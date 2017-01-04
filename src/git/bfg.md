cloning with mirror (bare) option does not work for me.

`bfg --replace-text /tmp/replacements.txt --no-blob-protection`

/tmp/replacements.txt

```
PASSWORD1 # Replace literal string 'PASSWORD1' with '***REMOVED***' (default)
PASSWORD2==>examplePass         # replace with 'examplePass' instead
PASSWORD3==>                    # replace with the empty string
regex:password=\w+==>password=  # Replace, using a regex
regex:\r(\n)==>$1               # Replace Windows newlines with Unix newlines
```

- http://stackoverflow.com/questions/4110652/how-to-substitute-text-from-files-in-git-history/15730571#15730571
- https://rtyley.github.io/bfg-repo-cleaner/
- https://github.com/rtyley/bfg-repo-cleaner/issues/150
