Here we combine stderr (2) with stdout (1) and then pipe it (|) to tee. Tee is a program that can ouput to stdout and file in the same time.

```bash
command 2>&1 | tee file.log
```
