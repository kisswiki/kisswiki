- https://github.com/rofrol/makefile-md5sum

## Portable

portable Makefile to run on on gnu make:

```Makefile
NOW=$$(date)
print-now:
	@echo $(NOW)
```

gnu make specific:

```Makefile
NOW=${date}
print-now:
	@echo $(NOW)
```

## Variable accesible on mutliple lines

```Makefile
md5sum:
	@SUM=$$(md5sum file.txt | cut -d' ' -f 1); \
	echo $$SUM; \
	cp file.txt file.$${SUM}.txt; \
```

You need to use `; \` at line ends. And commands in line after that line without `@` before it. So this will not copy file:

```Makefile
md5sum:
	@SUM=$$(md5sum file.txt | cut -d' ' -f 1); \
	echo $$SUM; \
	@cp file.txt file.$${SUM}.txt; \
```
