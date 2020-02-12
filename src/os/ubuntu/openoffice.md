Install the ttf-mscorefonts-installer and Tahoma fonts to have some of the MS default fonts. So things can look the same, while sharing. 

`sudo apt install ttf-mscorefonts-installer`

`wget https://gist.githubusercontent.com/titobrasolin/d347b67ad2ea5d52affbd9f8d8e67692/raw/f95aac269ec36ff63698213c71e4a53f62e28757/ttf-wine-tahoma-installer.sh -q -O - | sudo bash`


When things don't look the same. I either change the format, if nothing have to be edit between sharing. Like RT, HTML, JPEG, PDF, Slideshow, GIF, etc. Then you have the online Office Suite Tools available that work with Linux just fine.

- https://www.reddit.com/r/linuxquestions/comments/bvvg4p/does_anyone_use_libreoffice_at_schoolwork/epsvyls/
- https://askubuntu.com/questions/30043/how-to-install-the-package-ttf-mscorefonts-installer
- https://wiki.ubuntu.com/Fonts

## Tahoma context

>latest Wine Tahoma Regular and Wine Tahoma Bold fonts on Ubuntu distros from the Wine Project. The Wine project includes the free and open-source fonts Wine Tahoma Regular and Wine Tahoma Bold released under LGPL designed to have identical metrics to the Microsoft Tahoma font. This was done because Tahoma is available by default on Windows, and many applications expect the font to be available. https://gist.github.com/maxwelleite/ee5a1a4222dd43c8b4af5c99ed72b3fc

Fork with updated font urls https://gist.github.com/titobrasolin/d347b67ad2ea5d52affbd9f8d8e67692

Maybe use winehq master branch?

- https://source.winehq.org/git/wine.git/blob/HEAD:/fonts/tahoma.ttf
- https://source.winehq.org/git/wine.git/blob/HEAD:/fonts/tahomabd.sfd
- https://www.wfonts.com/font/tahoma
- https://wiki.debian.org/tahoma
