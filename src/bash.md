- split string ` echo -n 'one;two;three;' | tr ';' '\n'` http://stackoverflow.com/questions/18234378/using-sed-to-split-a-string-with-a-delimiter
- extract substring

  ```bash
  ${var#*SubStr}  # will drop begin of string upto first occur of `SubStr`
  ${var##*SubStr} # will drop begin of string upto last occur of `SubStr`
  ${var%SubStr*}  # will drop part of string from last occur of `SubStr` to the end
  ${var%%SubStr*} # will drop part of string from first occur of `SubStr` to the end
  ```
