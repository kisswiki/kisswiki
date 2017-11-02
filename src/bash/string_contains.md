## regex string contains

```bash
$ pwd
/home/terdon
$ line="I'm in /home/terdon"
$ [[ "$line" =~ "$PWD"$ ]] && echo yes
yes
```

https://unix.stackexchange.com/questions/192887/shell-test-to-find-a-pattern-in-a-string
