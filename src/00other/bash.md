- split string ` echo -n 'one;two;three;' | tr ';' '\n'` http://stackoverflow.com/questions/18234378/using-sed-to-split-a-string-with-a-delimiter

## extract substring

```bash
${var#*SubStr}  # will drop begin of string upto first occur of `SubStr`
${var##*SubStr} # will drop begin of string upto last occur of `SubStr`
${var%SubStr*}  # will drop part of string from last occur of `SubStr` to the end
${var%%SubStr*} # will drop part of string from first occur of `SubStr` to the end
```

http://stackoverflow.com/questions/918886/how-do-i-split-a-string-on-a-delimiter-in-bash/15988793#15988793

## Set environment variables from file

-o allexport enables all following variable definitions to be exported. +o allexport disables this feature.

```bash
set -o allexport
source conf-file
set +o allexport
```

http://stackoverflow.com/questions/19331497/set-environment-variables-from-file/30969768#30969768

## check if file exists before removing

> Don't bother checking if the file exists, just try to remove it. eg: `rm -f /p/a/t/h`

http://stackoverflow.com/questions/31318068/shell-script-to-remove-a-file-if-it-already-exist

## Multiple Conditions If

- Use -a (for and) and -o (for or) operations `if [ $my_error_flag -eq 1 -o $my_error_flag_o -eq 2 ]; then fi`
- use `||`: `if [ $my_error_flag -eq 1 ] ||  [ $my_error_flag_o -eq 2 ]; then fi`

http://stackoverflow.com/questions/16203088/multiple-conditions-if-statement-bash-script

## Check if variable is set or empty

This will return true if a variable is unset or set to the empty string ("").

`if [ -z "$VAR" ];`

http://serverfault.com/questions/7503/how-to-determine-if-a-bash-variable-is-empty

## Iterate fast

```bash
typeset -i i END # Let's be explicit
for ((i=1;i<=END;++i)); do echo $i; done
```

http://stackoverflow.com/questions/169511/how-do-i-iterate-over-a-range-of-numbers-defined-by-variables-in-bash/169602#169602
