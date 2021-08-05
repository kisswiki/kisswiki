## unicode

```bash
$ echo -ne '\u00b2' | xxd -p
c2b2
$ echo -ne '\u00b2' | sed -e 's/\x00\xb2/ą/g'
ą
$ echo -ne '\u00b2' | sed -e "s/$(echo -ne '\u00b2')/ą/g"
```

## backslashes to slashes

```bash
$ rg receiveEmails -l -tts -g '!*.spec.ts' | sed -e 's@\\@/@g'
```

or tr

```bash
$ rg receiveEmails -l -tts -g '!*.spec.ts' | tr '\\\\\' '/'
```

- https://stackoverflow.com/questions/9984748/-ow-do-i-get-sed-to-read-from-standard-input/9984761#9984761
