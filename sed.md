## unicode

```bash
$ echo -ne '\u00b2' | xxd -p
c2b2
$ echo -ne '\u00b2' | sed -e 's/\x00\xb2/ą/g'
ą
$ echo -ne '\u00b2' | sed -e "s/$(echo -ne '\u00b2')/ą/g"
```
