```
# cd ~/personal_projects/vendor
$ git clone https://github.com/aseprite/aseprite.git
$ cd aseprite
# To download any new submodules you need --init, not sure about --force
$ git submodule update --init --recursive --force
# You may want to build beta: `git switch beta`
$ ./build.sh
# Select N for new
# There will be aseprite-release/bin/Aseprite.app
```

- https://github.com/aseprite/aseprite/blob/main/INSTALL.md
