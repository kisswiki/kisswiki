`sudo apt install weechat`

weechat is more recent version than weechat-curses https://askubuntu.com/questions/839784/difference-between-weechat-and-weechat-curses.

##

- http://micropipes.com/blog/2012/04/09/10-years-of-irssi-use-and-i-switched-to-weechat-last-weekend/
- http://blog.didrocks.fr/post/Moving-away-from-%28screen-irssi%29-to-%28bip-weechat%29
- http://pascalpoitras.com/2013/05/25/my-weechat-configuration/
- https://plus.google.com/communities/104181302778416960107
- http://weechat.org/files/doc/stable/weechat_user.en.html

## Quick Start

Freenode

```
/server add freenode chat.freenode.net/6697 -ssl
/set irc.server.freenode.autoconnect on
/set irc.server.freenode.autoreconnect on
/set irc.server.freenode.nicks "rofrol"
/set irc.server.freenode.username "rofrol"
/set irc.server.freenode.realname "rofrol"
/set irc.server.freenode.command "/msg nickserv identify xxxxxxx"
/set irc.server.freenode.autojoin "#exherbo"
/set irc.look.server_buffer independent
/save
/connect freenode
```

And mozilla

```
/server add mozilla irc.mozilla.org/6697 -ssl
/set irc.server.mozilla.nicks "rofrol"
/set irc.server.mozilla.autojoin "#rust,#rust-beginners"
/set irc.server.mozilla.autoconnect on
/set irc.server.mozilla.autoreconnect on
/save
/connect mozilla
```

You can also use this for login:

```
/set irc.server.freenode.sasl_username wikimatze
/set irc.server.freenode.sasl_password {your password}
/save
/reconnect
```

- http://www.weechat.org/files/doc/stable/weechat_quickstart.en.html
- https://wiki.archlinux.org/index.php/WeeChat
- https://gist.github.com/wikimatze/e19a312833b1be881f788ca795880fba
- https://weechat.org/files/doc/devel/weechat_faq.en.html#irc_sasl
- https://en.wikipedia.org/wiki/Simple_Authentication_and_Security_Layer

## Keys

alt + left/right arrows (or F5/F6): switch to previous/next buffer

F11/F12: scroll nicklist

page up/down: scroll text in current buffer

#to get key binding and representation

alt+k press key

alt+1, alt+2, alt+3, etc. to switch between networks and channels.

in tmux:

alt+pgup/pgdown to scroll

## fset

`/fset autojoin`

`alt+Enter` to edit

to quit press `q` and then `Enter`.

## Ignore

```
/ignore add somenick freenode #somechat
```

## What is the difference between the /ignore and /filter commands?

The /ignore command is an IRC command, so it applies only for IRC buffers (servers and channels). It lets you ignore some nicks or hostnames of users for a server or channel (command will not apply on content of messages). Matching messages are deleted by IRC plugin before display (so you’ll never see them).

The /filter command is a core command, so it applies to any buffer. It lets you filter some lines in buffers with tags or regular expression for prefix and content of line. Filtered lines are only hidden, not deleted, and you can see them if you disable filters (by default, the key Alt+= toggles filters).

http://www.weechat.org/files/doc/weechat_faq.en.html#ignore_vs_filter

## Filter

by default, the key alt+= toggles filters

```
/set irc.look.smart_filter on
/filter add irc_smart * irc_smart_filter *
/filter add joinquit * irc_join,irc_part,irc_quit *
#don't show nicks (366), cause they are displayed on the right
/set irc.look.display_join_message "332,333,329"
#filter all other
/filter add irc_join_topic_date * irc_332,irc_333,irc_329 *
```

## Filter nicks

```
/filter add exherbo_bots irc.freenode.#exherbo,irc.freenode.#paludis nick_zebrapig,nick_gerritwk*,nick_irker*,nick_u-u-commit* *
/filter add exherbo_pqpdpl irc.freenode.#exherbo,irc.freenode.#paludis * ^!p(q|d|l)
/key bind meta2-12~ /filter toggle exherbo_bots;/filter toggle exherbo_pqpdpl
```

## smart_filter

A new smart filter for IRC join/part/quit message has been added. It is disabled by default (so you'll see all join/part/quit by default).

To enable it, use following commands:

```
/set irc.look.smart_filter on
/filter add irc_smart * irc_smart_filter *
```

and help

```
/help irc.look.display_join_message
```

http://weechat.org/files/doc/weechat_faq.en.html#filter_irc_join_part_quit

## smart_filter_delay

You can setup delay: /set irc.look.smart_filter_delay 5
How does it work?

When a nick spoke on channel during past X minutes (where X is delay irc.look.smart_filter_delay), its join/part/quit will be displayed by default. Otherwise, if nick did not speak for a long time, all join/part/quit messages will be tagged with "irc_smart_filter". So you have to define a filter on this tag to hide join/part/quit from users that are not speaking on channel (see command above).o

http://dev.weechat.org/post/2008/10/25/Smart-IRC-join-part-quit-message-filter

## Smart filter 2

Smart Filter
First, we need to enable smart filters:

```
/set irc.look.smart_filter "on"
```

Next, we will create the sfilter alias:

```
/alias sfilter filter add irc_smart_$server_$channel irc.$server.$channel irc_smart_filter *
```

We can now type

```
/sfilter
```

in any buffer, and the smart filter will only be enabled for that buffer.

The following alias will remove a previously enabled smart filter in the current buffer:
Add the alias:

```
/alias rmsfilter filter del irc_smart_$server_$channel
```

and execute it by

```
/rmsfilter
```

https://wiki.archlinux.org/index.php/WeeChat

## Disable save on exit
/set weechat.look.save_config_on_exit off

## Have you ever wondered what are the arguments for a command while you are typing it? For example /buffer, /window, /filter, /server, ...

If yes, just follow these steps:
1) /script install cmd_help.py
2) bind help on F1: /key bind meta2-11~ /cmd_help  (tip: do alt+k then F1 to get the key code, which can be different in your terminal)
3) type a command with or without arguments, then press F1 and enjoy!
https://plus.google.com/102544516035551247301/posts/9qrG7ccBkmA

## Solarized

```
/set logger.color.backlog_line default
```

on #weechat

```
14:47:47         rofrol | I have some problem with colors after reconnecting
14:47:52         rofrol | http://img41.imageshack.us/img41/3830/7x77.png
14:48:12         rofrol | I'm using putty and solarized colors
14:48:47         rofrol | in this screenshot you can see that I've selected lines, and it shows there is some text but the same color as background
14:52:15     @FlashCode | rofrol: try to change the color for the backlog
14:52:25     @FlashCode | for example, /set logger.color.backlog_line default
14:52:34     @FlashCode | sometimes "darkgray" has a bad render
14:52:51     @FlashCode | or if you have 256 colors, better use for example 240
14:53:06     @FlashCode | I use 245 here
15:03:10         rofrol | FlashCode: thanks, I can see text now.
15:03:25         rofrol | FlashCode: Can I get this backlog colorized?
15:03:36     @FlashCode | not the same as chat, no
15:03:43     @FlashCode | because it's read from log files, which have no colors
15:03:52     @FlashCode | and no tags (many colors are found using tags)
```

## Columns

```
#nicks on the left
/set weechat.look.prefix_align_min 15
/set weechat.look.prefix_align_max 15
#nicks on the right
/set weechat.bar.nicklist.size 15
/set weechat.bar.nicklist.size_max 15
```

or hide it

```
/set weechat.bar.nicklist.hidden on
```

## Interactive option setting - iset

```
/script install iset.pl
/iset
```

http://dev.weechat.org/post/2008/04/19/Script-iset


to view the whole list of all the options with a value of ‘magenta’ or ‘lightmagenta’.

```
/iset =magenta
```

To show only magenta, not both, type :

```
/iset ==magenta
```

You can change the color! Either use :

```
alt + +
```

until you reach the desired color, or :

```
alt + enter
```

If it doesn't work try: Esc Enter or alt+ctrl+m or alt+ctrl+j

Putty can use alt+enter for fullscreen. Check Putty > Configuration > Window > Behavior > Full screen on Alt-Enter

to enter the color name.

http://pascalpoitras.com/2013/06/14/improve-weechat-by-using-script-iset/


more

```
/iset freenode
```

unset

```
alt+iu
```

If something goes wrong and you see no options:

```
/iset *
```

close iset with '/close'

## To view list of all buffers (windows) open

```
/buffer
```

## encrypt your passwords or private data

Encrypt your passwords or private data in a new configuration file called "sec.conf".

http://dev.weechat.org/post/2013/08/04/Secured-data

## ssl

http://blog.e-shell.org/289

http://freenode.net/irc_servers.shtml#ssl

http://freenode.net/faq.shtml#nocloakonjoin

http://freenode.net/sasl/

https://wiki.archlinux.org/index.php/WeeChat#SSH_connection_lost_when_idle

## get number of nicks in channel

```
/names #<channel>
```

The list and count will be displayed in the channel window

http://stackoverflow.com/questions/3204175/getting-user-count-from-irc

## beautify

```
/set weechat.look.prefix_suffix "│"
/set weechat.look.read_marker_string "─"
/set weechat.look.bar_more_down "▼"
/set weechat.look.bar_more_left "◀"
/set weechat.look.bar_more_right "▶"
/set weechat.look.bar_more_up "▲"
/set weechat.look.buffer_time_format "%H:%M"
```

http://dev.weechat.org/post/2011/08/28/Beautify-your-WeeChat

## mouse

To enable mouse at startup:

```
/set weechat.look.mouse on
```

To enable mouse now

```
/mouse enable
```

Now you can scroll buffer with mouse wheel.

After changing font size in gnome-terminal, I had to enable mouse again.

## get back your nick

```
/msg NickServ RELEASE yournick yourpassword
```

after couple of seconds

```
/nick yournick
```

http://freenode.net/faq.shtml#nickisgone

or script http://www.weechat.org/scripts/source/stable/nickregain.pl.html/

## debug

mugu: does another client allow connection? or something like

```
openssl s_client -connect irc.mozilla.org:6697
```

allow for irc handshake?

@FlashCode: compile weechat with debug symbols, and get a backtrace of the running process when it is frozen (with gdb)?

@FlashCode      please try weechat without any script loaded
rofrol  only iset
@FlashCode      ok, then this one is not a problem



http://www.weechat.net/files/doc/devel/weechat_user.en.html#report_crashes

http://weechat.org/files/doc/devel/weechat_tester.en.html

weechat recompiled with:

```
-DCMAKE_BUILD_TYPE=Debug
```

then get backtrace with gdb.

http://bpaste.net/show/174920/

## url

http://weechat.org/scripts/stable/tag/url/
