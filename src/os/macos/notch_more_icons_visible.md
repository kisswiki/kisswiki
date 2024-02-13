```
# Change the whitespace settings value
defaults -currentHost write -globalDomain NSStatusItemSelectionPadding -int 6
defaults -currentHost write -globalDomain NSStatusItemSpacing -int 6

# After running these commands, you need to log out and log back in
```

revert:

```
# Revert to the original values
defaults -currentHost delete -globalDomain NSStatusItemSelectionPadding
defaults -currentHost delete -globalDomain NSStatusItemSpacing

# After running these commands, you need to log out and log back in
```

- https://flaky.build/built-in-workaround-for-applications-hiding-under-the-macbook-pro-notch
  - https://news.ycombinator.com/item?id=39343919
