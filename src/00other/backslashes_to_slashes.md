```bash
$ rg receiveEmails -l -tts -g '!*.spec.ts' | sed -e 's@\\@/@g'
```

or tr

```bash
$ rg receiveEmails -l -tts -g '!*.spec.ts' | tr '\\\\\' '/'
```

- https://stackoverflow.com/questions/9984748/-ow-do-i-get-sed-to-read-from-standard-input/9984761#9984761
- https://www.mhonarc.org/archive/html/procmail/2010-12/msg00019.html
