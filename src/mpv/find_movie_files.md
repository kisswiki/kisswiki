`find . -type f -exec file -N -i -- {} + | sed -n 's!: video/[^:]*$!!p' | rg -v ".*\.sub$" | awk '{printf "\"%s\"\n", $0}' | xargs mpv`

- https://askubuntu.com/questions/844711/how-can-i-find-all-video-files-on-my-system/844720#844720
- sub is video file? https://www.iana.org/assignments/media-types/media-types.xhtml#video
- https://unix.stackexchange.com/questions/251360/add-quotation-marks-comma-to-each-word-in-a-file/251387#251387
