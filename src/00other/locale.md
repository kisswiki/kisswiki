
in your ~/.bashrc

```
unset LC_ALL
export LC_MESSAGES=C
```

then

```bash
source ~/.bashrc
```

Check it

```bash
$ locale
LANG=pl_PL.utf8
LANGUAGE=
LC_CTYPE="pl_PL.utf8"
LC_NUMERIC="pl_PL.utf8"
LC_TIME="pl_PL.utf8"
LC_COLLATE="pl_PL.utf8"
LC_MONETARY="pl_PL.utf8"
LC_MESSAGES=C
LC_PAPER="pl_PL.utf8"
LC_NAME="pl_PL.utf8"
LC_ADDRESS="pl_PL.utf8"
LC_TELEPHONE="pl_PL.utf8"
LC_MEASUREMENT="pl_PL.utf8"
LC_IDENTIFICATION="pl_PL.utf8"
LC_ALL=
```

http://askubuntu.com/questions/264283/switch-command-output-language-from-native-language-to-english/818241#818241
