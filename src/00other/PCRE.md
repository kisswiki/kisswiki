ag cannot search files > 2Gb https://github.com/ggreer/the_silver_searcher/issues/975

The regex Engine (PCRE) can't handle files that large.
You can find [here](http://pcre.org/original/doc/html/pcrelimits.html) that the maximum subject (file) length is INT_MAX which is 2147483647 for a signend 32bit int. Therefore the maximum file size is INT_MAX in bytes.

https://serverfault.com/questions/408265/what-are-pcre-limits