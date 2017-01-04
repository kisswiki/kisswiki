## Exctract dir

`tar xf tarfile.tar /home/parent_dir/child_dir`

If /home/parent_dir/child_dir is not where you want them to be, GNU tar provides a --transform option that would be used like:

`tar  --transform 's,/home/parent_dir/child_dir,foo,' --show-transformed -xf tarfile.tar`

http://stackoverflow.com/questions/2824065/how-to-extract-files-inside-a-directory-from-a-tar-file-in-terminal/2824154#2824154
