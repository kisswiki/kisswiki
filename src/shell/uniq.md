## unique without sorting

`cat data.txt | awk '!seen[$0]++'`

`cat data.txt | perl -ne 'print unless $seen{$_}++'`

http://unix.stackexchange.com/questions/11939/how-to-get-only-the-unique-results-without-having-to-sort-data
