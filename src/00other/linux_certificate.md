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
