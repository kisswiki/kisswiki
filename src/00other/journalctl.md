```bash
$ journalctl -g ipsets*
$ journalctl -b -o cat --no-pager | grep -v "ACPI" | less
$ journalctl -b -o json | jq -C . | less -R
$ journalctl -b -o json | jq '. | select(._TRANSPORT=="kernel")' | jq -r .MESSAGE | head -n 1
```

- https://serverfault.com/questions/754953/systemds-journalctl-how-to-filter-by-message
