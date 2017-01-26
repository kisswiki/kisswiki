https://groups.google.com/forum/#!msg/elm-discuss/vH1eyviVWEs/CyhRzGkvBgAJ

You need the --assume_function_wrapper flag. 

Also, if you have more troubles you could also drop the compilation level to SIMPLE. The difference should be no larger than few kb in gzipped form. 

It is worth mentioning that at such small sizes, even the unminified output gzips to very tiny sizes. 
In other words, having gzip enabled on the webserver would do more for the transfer size than even the most aggressive minimizer. 
