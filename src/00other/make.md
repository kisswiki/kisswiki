- https://github.com/rofrol/makefile-md5sum
- https://opensourceforu.com/2012/06/gnu-make-in-detail-for-beginners/

## Portable

portable Makefile to run on on gnu make:

```Makefile
NOW=$$(date)
print-now:
	@echo $(NOW)
```

this also works

```Makefile
NOW=`date`
print-now:
	@echo $(NOW)
```

"gnu make"-specific:

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

## My conversation from #gnu or freenode

```
2019-05-15 18:28:41	rofrol	hello
2019-05-15 18:28:47	rofrol	I need help with Makefile
2019-05-15 18:29:32	jmd	rofrol: The name of the program is "make".
2019-05-15 18:29:57	jmd	"Makefile" is the default name of the input file which controls it.
2019-05-15 18:30:49	oni-on-ion	"" these are quotes, and this is text to describe them. <-- that was text describing some quotes. "this is text" is an example of the quoting we are describing
2019-05-15 18:32:29	rofrol	Thanks, I know.
2019-05-15 18:33:10	rofrol	I am trying to store something in variable and print it
2019-05-15 18:33:12	rofrol	I use:
2019-05-15 18:33:28	rofrol	$(eval NOW = $(shell date)
2019-05-15 18:33:36	oni-on-ion	missing end paren
2019-05-15 18:33:53	jmd	rofrol: You are unlikely to need eval
2019-05-15 18:33:58	rofrol	you are quick :)
2019-05-15 18:34:22	jmd	NOW=${shell date}
2019-05-15 18:34:36	jmd	print-now:
2019-05-15 18:34:49	jmd	  echo $(NOW)
2019-05-15 18:35:10	rofrol	So I need to get md5 sum of file and add it copy of it. Cache-busting.
2019-05-15 18:35:24	rofrol	So I get it with
2019-05-15 18:35:38	rofrol	d5sum $(tmp_dir)/build/$(name).js | cut -d' ' -f 1
2019-05-15 18:36:37	jmd	I would have used awk,  but I guess cut works too.
2019-05-15 18:36:47	rofrol	yes, it works in terminal
2019-05-15 18:38:04	jmd	It'll work from make too.
2019-05-15 18:39:50	rofrol	wow, works
2019-05-15 18:40:02	rofrol	It's the first time I see this syntax ${shell ...}
2019-05-15 18:40:10	rofrol	and echo $(NOW)
2019-05-15 18:40:24	rofrol	And I read a lot of materials, answers.
2019-05-15 18:41:02	jmd	You need to read the make manual.  It's all there.
2019-05-15 18:42:06	rofrol	Ok
2019-05-15 18:42:12	rofrol	So now it does not work
2019-05-15 18:42:22	rofrol	when I removed if else clause
2019-05-15 18:44:49	jmd	In my experience, conditionals are rarely needed in make.  If you find yourself using one, then there's probably a better way to solve the problem.
2019-05-15 18:45:23	rofrol	Yes, I don't need them
2019-05-15 18:45:37	rofrol	But it does not work outside if else clause
2019-05-15 18:47:09	jmd	Now if I was one of the so called "helpers" on #debian or #perl, I'd trigger some snarky bot to chastise you for the "doesn't work" bit.
2019-05-15 18:47:26	rofrol	And now it does not work even in if else clause
2019-05-15 18:47:49	rofrol	Thanks for being patient
2019-05-15 18:51:01	jmd	rofrol: So when does it work.  And what is "it" anyway?
2019-05-15 18:51:29	rofrol	I will make git repo with my example
2019-05-15 18:52:58	jmd	rofrol: You could do that with a rule like
2019-05-15 18:53:03	jmd	init-git:
2019-05-15 18:53:09	jmd	       git init
2019-05-15 18:53:49	jmd	(it would be a strange thing to use make for, but there's no reason it wouldn't work)
2019-05-15 18:59:37	rofrol	I got it https://github.com/rofrol/makefile-tryout
2019-05-15 18:59:46	rofrol	so make print-now works
2019-05-15 18:59:53	rofrol	but make md5sum does not
2019-05-15 19:01:50	jmd	You are setting SUM in a different environment to which you are using it.
2019-05-15 19:05:55	pehjota	Line 5 sets SUM as a shell parameter (with a GNU Make function), line 6 tries to expand it as a makefile macro.
2019-05-15 19:06:27	jmd	pehjota: Yep.  That too!
2019-05-15 19:06:58	pehjota	You could replace both lines with just "@md5sum file.txt | cut -d' ' -f 1".
2019-05-15 19:07:04	jmd	rofrol: Why do you need the variable anyway?  Why not just write
2019-05-15 19:07:18	jmd	md5sum file.txt | awk '{print $$1}'
2019-05-15 19:07:41	rofrol	I need this variable later
2019-05-15 19:07:46	pehjota	Heh, same as what I said, but with awk. :)
2019-05-15 19:08:06	rofrol	for sth like: `mv file.txt to file.${md5sum}.txt`
2019-05-15 19:08:08	pehjota	Later in the same "md5sum" target, or in another target?
2019-05-15 19:08:15	rofrol	in the same target
2019-05-15 19:09:19	pehjota	rofrol: Line 5: "@SUM=$$(md5sum file.txt | cut -d' ' -f 1)", line 6: "@echo $${SUM}"
2019-05-15 19:09:24	jmd	rofrol: In make rules, each line is evaluated in it's own shell.  So if you want to use a shell variable, then you need it to be all on one line.
2019-05-15 19:09:43	jmd	And like pehjota says, don't get make variables and shell variables mixed up.
2019-05-15 19:09:53	pehjota	Err yeah, line 5: "@SUM=$$(md5sum file.txt | cut -d' ' -f 1); \", line 6: "echo $${SUM}"
2019-05-15 19:10:49	pehjota	Or, put "SUM = $$(md5sum file.txt | cut -d' ' -f 1)" at the top of the makefile and "@echo $(SUM)" in the target.
2019-05-15 19:11:29	pehjota	(Same effect as the "${shell" function, but portable and deferred execution.)
2019-05-15 19:13:06	rofrol	Wow, works
2019-05-15 19:13:30	rofrol	But now I want to copy file.txt to new file
2019-05-15 19:13:34	rofrol	and it is a problem :)
2019-05-15 19:13:48	jmd	cp file.txt newfile.txt
2019-05-15 19:14:48	pehjota	miscapples: Most people just use a ski mask or something for that, except it's not soundproof (you want to talk to yourself privately?).
2019-05-15 19:16:05	pehjota	rofrol: "mv file.txt file.$(SUM).txt"?
2019-05-15 19:16:08	rofrol	thanks, works. I was trying with @cp file.txt newfile.txt
2019-05-15 19:17:07	pehjota	"@" just doesn't print the command.  It still runs.
2019-05-15 19:17:48	rofrol	$(SUM) does not worked for me
2019-05-15 19:18:14	rofrol	this worked: cp file.txt file.$${SUM}.txt
2019-05-15 19:18:27	pehjota	Oh, just re-checked your makefile.  You're still confusing make and shell.
2019-05-15 19:18:59	pehjota	So yeah, no "@" within a continued shell command.
2019-05-15 19:20:02	rofrol	Can you look at it now: https://github.com/rofrol/makefile-md5sum
2019-05-15 19:20:07	rofrol	It works for me locally
2019-05-15 19:20:12	rofrol	What can I improve?
2019-05-15 19:20:43	rofrol	How am I 'confusing make and shell'?
2019-05-15 19:23:27	jmd	<jmd> rofrol: In make rules, each line is evaluated in it's own shell.  So if
2019-05-15 19:23:27	jmd	      you want to use a shell variable, then you need it to be all on one
2019-05-15 19:23:27	jmd	      line.
2019-05-15 19:23:27	jmd
2019-05-15 19:24:01	jmd	... and a make variable is accessed with $(VAR)
2019-05-15 19:24:20	jmd	wheras a shell variable (when called from a make rule) you need $$VAR
2019-05-15 19:25:56	rofrol	So what I can change If I need this variable SUM available in multiple lines?
2019-05-15 19:26:24	jmd	Terminate all your lines with ; \
2019-05-15 19:26:48	jmd	Or consider putting the entire shell script in its own file
2019-05-15 19:29:17	pehjota	Or put "SUM = $$(md5sum file.txt | cut -d' ' -f 1)" at the top of the makefile and use "$(SUM)" as I suggested.  Then you don't need "; \" in the commands (SUM is a makefile macro available everywhere).
2019-05-15 19:32:46	pehjota	Also, NOW could be defined as "NOW = $$(date)" if you want to be portable to non-GNU make implementations.
2019-05-15 19:35:52	rofrol	I cannot calculate this sum at the top, because this file will be generated in some target.
2019-05-15 19:37:48	rofrol	Thanks people
2019-05-15 19:38:33	pehjota	It won't actually be calculated up top.
2019-05-15 19:38:42	pehjota	It'll be deferred until use.
2019-05-15 19:39:08	jmd	pehjota: Err ... that depends.
2019-05-15 19:39:11	pehjota	(Unless you use "${shell ...}".)
2019-05-15 19:40:18	rofrol	ok, but I would rather have in the target.
2019-05-15 19:40:25	pehjota	jmd: No, "NOW = $$(date)" assigns the literal string "$(date)" to NOW, to be executed by the shell later (unless quoted of course).
2019-05-15 19:40:50	pehjota	rofrol: OK, then you need the "; \" as you have.
2019-05-15 19:40:51	jmd	Right
2019-05-15 19:41:46	jmd	on the other hand, NOW=`date` will not do that.
2019-05-15 19:43:21	pehjota	Does for me?
2019-05-15 19:46:03	jmd	Oh maybe it does.
2019-05-15 19:49:12	pehjota	Yeah, "`" isn't a makefile operator (in any make AFAIK), so it just gets used in the literal string.
2019-05-15 19:53:09	rofrol	NOW=`date` works for me
2019-05-15 19:55:03	pehjota	Yup, like I said, "`" is interpreted by the shell, not make.
```
