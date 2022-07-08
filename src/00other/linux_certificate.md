- https://www.proprofs.com/quiz-school/story.php?title=mtq1mtq2oqtx8h

## Linux essentials

preemtpive - linux can intterupt program and give time to anoterh program

monolithic kernel vs microkernel - in microkernel functions can be separte programs and loaded on-demand

`firefox&`

Pressing ctrl + z sends the TSTP signal to your process. This halts execution (the kernel won't schedule any more CPU time to the process) and the process is awaiting a CONT to continue processing.

You can emulate/replicate this via kill -TSTP and kill -CONT (since kill will send a nominated signal to your process, despite the name!)

The shell has the functionality to background the process, but this is a relationship between the shell and the process. The process itself doesn't really have the concept of background or foreground.

https://superuser.com/questions/476873/what-is-effect-of-ctrl-z-on-a-unix-linux-application/476874#476874

A job running in the foreground can be stopped by typing the suspend character (Ctrl-Z). This sends the "terminal stop" signal (SIGTSTP) to the process group. By default, SIGTSTP causes processes receiving it to stop, and control is returned to the shell. However, a process can register a signal handler for or ignore SIGTSTP. A process can also be paused with the "stop" signal (SIGSTOP), which cannot be caught or ignored.

https://en.m.wikipedia.org/wiki/Job_control_(Unix)#Implementation

`man 5 password`

/etc/passwd

`name:passwd:uid:gid::change:expire:gecos:home_dir:shell`

POSIX (Portable Operating System Interface)

`man man`

`whatis passwd`

`appropos passwd` or equivalent `man -k passwd`

update man db: `makewhatis` or `mandb`

man navigation

- ctr+v, ctrl+b
- /phrase
- ?backward_phrase
- n to find next
- g, shift+g

`info info`

`logout` or `exit` to end a text-mode terminal session

`locate` is on macos but db not created

`uname -a` works on macos.

- motherboard - lspci

  - cpu - lscpu
  - memory - free
  - power supply
  - interfaces - lsusb, etc

  power supply converts electricity from alternating power to direct power. (przemienny do stały)

File System Hierarchy

```
/
/etc
/boot
/bin - critical binaries, users also can run
/sbin - criticial binaries, users cannot run
/lib - critical libraries
/usr - programs and data, not critical
  - /usr/bin
  - /usr/sbin
/home
/root
/var - transient files like logs
/tmp
/mnt - old removable media mount point
/media - new removable media mount point
/dev - device files
/run - info about running system
```

`touch -c` or `touch --no-create` - to not create file if it does not exist. Useful when we want to update time stamps but do not create file accidentally.

`touch -d`

`touch -t`

`cp -f` force

`cp -i` asks

`cp -p` preserve ownership

use `cp -R` over `cp -r`

`cp -a` as `cp -R` but preserves ownership and copies links as is

`cp -u` update only if source is newer

if you use hard links, you must delete all copies of file to delete the file itself.

only root can create hard links to directories, as it can be to dangerous.

WARNING: `cp file*` will copy first files to the last one

`mkdir -p`

`rmdir` can delete only empty directories. `rmdir p one/two` can delete nested dir without files.

`rm -rf`

`cp *`

`cp [a-z]f`

`cp b??l`

grep

`.*`

`^workd$`

`.?` one possible character excluding new line

`[^t]` not t

`car|truck` car or truck

`grep -E` or `egrep` uses extended regular expressions

`grep -E "(games|mail).*nologin" /etc/passwd`

find

wc

`cut -f 6 -d : /etc/passwd`

`sort -d` dictionary order

`-f` ignore case

`-n` numeric

`-o` output

`-r` reverse

cat

head

tail

`&>` new file (overwrites existing) contaning both stdout and stderr

`2> /dev/null` discard stderr

`find` CAN delete files with `exec` or `-delete`

`find / -name .DS_Store -exec rm {} +`

https://unix.stackexchange.com/questions/167823/finds-exec-rm-vs-delete/194348#194348

xargs - build a command from it standard input

`find / -name .DS_Store | xargs rm`

```
rm `find ./ -name "*~"`
```

or

`rm $(find ./ -name "*~")`

`tar xf file`

`tar cf file.xz dir`

`tar -tf file` list contents of an archive

### Chapter 9 Exploring Processes and Data

Kernel runs one program: `/lib/systemd` or `/sbin/init`

Change starting program with `init=/bin/bash`

all processes are children of init process. Process is adopted by init process when it's parent closes.

PID - Process ID

PPID - Parent PID

Internally kernel maintains process information in the process table. ps and top enable to view and manipulate this table.

on mac `ps u U romanfrolow` does not work. This works `ps u -U romanfrolow`

Also there is no option `-forest`.

in top and macos and iterm `P` or `M` does not change soring. Use `top -o cpu` or `top -o mem`.

top and `load average`

`sudo grep sshd /var/log/*`

dmesg displays kernel ring buffer, stored in memory

general messages in `/var/log/messages` or `/var/log/syslog`

ASCII - American Standard Code for Information Interchange, 7-bit code, supports 2^7 or 128 characters. In practice ASCII uses 8 bits so supports additional 128 characters.
