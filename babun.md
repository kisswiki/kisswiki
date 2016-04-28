# Babun

- run with `~/.babun/babun.bat`
- `babun --welcome`
- `$HOME` is set to `.babun/cygwin/home/<user>`
- Change `$HOME`: set HOME C:\Users\<user> (probably better before installing) then `babun install`, change home in `/etc/passwd` https://github.com/babun/babun/issues/289
- change default shell: `babun shell /bin/bash` http://babun.github.io/
- proxy: set in ` ~/.babunrc`
- conemu http://babun.github.io/faq.html
- colors
  - `base16-builder -s oceanicnext.yml -t mintty -b dark` https://github.com/babun/babun/issues/179 - problems with unicode on Windows when run this https://groups.google.com/forum/#!topic/keystonejs/b_REKzd7RxA
  - Remember to run it in babun or put `.minttyrc` in `.babun\cygwin\home\<user>`: `curl https://raw.githubusercontent.com/wbinnssmith/base16-oceanic-next/master/mintty/base16-oceanicnext.dark.256.minttyrc -o ~/.minttyrc`
- update git `pact remove git; pact install git` http://stackoverflow.com/questions/25280199/how-to-upgrade-git-in-babun
- babun uses cygwin, not mingw
- NPM doesn't run in interactive mode under Cygwin https://github.com/babun/babun/issues/517#issuecomment-160858902
- tabs
  - fatty (couldn't compile on windows) https://github.com/babun/babun/issues/81
  - conemu, tmux https://github.com/babun/babun/issues/39
