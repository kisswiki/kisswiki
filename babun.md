# Babun

I have problems with conemu and git bash that I can't scroll sometimes. So now I'm trying babun.

- run with `~/.babun/babun.bat`
- `babun --welcome`
- `$HOME` is set to `.babun/cygwin/home/<user>`
- change `$HOME`: set HOME C:\Users\<user> (probably better before installing) then `babun install`, change home in `/etc/passwd` to `/cygdrive/c/Users/<user>`
  - https://github.com/babun/babun/issues/289
  - https://github.com/babun/babun/issues/173
- change default shell: `babun shell /bin/bash` http://babun.github.io/
- proxy: set in ` ~/.babunrc`
- conemu http://babun.github.io/faq.html
- colors
  - `base16-builder -s oceanicnext.yml -t mintty -b dark` https://github.com/babun/babun/issues/179 - problems with unicode on Windows when run this https://groups.google.com/forum/#!topic/keystonejs/b_REKzd7RxA
  - Remember to run it in babun or put `.minttyrc` in `.babun\cygwin\home\<user>`: `curl https://raw.githubusercontent.com/wbinnssmith/base16-oceanic-next/master/mintty/base16-oceanicnext.dark.256.minttyrc -o ~/.minttyrc`
- update git `pact remove git; pact install git` http://stackoverflow.com/questions/25280199/how-to-upgrade-git-in-babun
- babun uses cygwin, not mingw
  - http://stackoverflow.com/questions/13503533/mingw-or-cygwin-gcc
  - http://superuser.com/questions/608106/how-can-i-use-a-bash-like-shell-on-windows
- NPM doesn't run in interactive mode under Cygwin https://github.com/babun/babun/issues/517#issuecomment-160858902
- tabs
  - fatty (couldn't compile on windows) https://github.com/babun/babun/issues/81
  - conemu, tmux https://github.com/babun/babun/issues/39
  - https://github.com/babun/babun/issues/101
- bash and git completion: in `~/.bashrc`: `source /cygdrive/c/Users/frolow/AppData/Local/GitHub/PortableGit_25d850739bc178b2eb13c3e2a9faafea2f9143c0/mingw32/share/git/completion/git-completion.bash` https://github.com/babun/babun/issues/47
