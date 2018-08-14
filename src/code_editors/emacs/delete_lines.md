## Delete lines starting with space

`M-x delete-matching-lines`

`^ `

- https://stackoverflow.com/questions/26478594/how-to-delete-empty-lines-in-a-file-by-emacs
- https://stackoverflow.com/questions/4214949/emacs-removing-all-lines-that-dont-match
- https://stackoverflow.com/questions/20891835/regex-search-in-emacs-for-line-not-starting-with-semicolon
- http://ergoemacs.org/emacs/elisp_list_matching_lines.html

## Combine empty lines with one empty line

`C-M-%`

`^`
`C-q C-j`
`\{2,\} RET`

After pressing `RET` you will see `^^J\{2,\}`

- https://www.masteringemacs.org/article/removing-blank-lines-buffer
- http://ergoemacs.org/emacs/emacs_line_ending_char.html
- https://emacs.stackexchange.com/questions/14943/difference-between-the-physical-ret-key-and-the-command-newline-in-the-minibu
