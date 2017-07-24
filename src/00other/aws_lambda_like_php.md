spullara: I think that containers are a transitionary technology. Lambda and its ilk are the future of application development. Those systems will likely run on top of container based infrastructure so you can have a variety of lambda environments but not something the application dev worries about directly. Managing the full operating system stack is just not something application developers should have to worry about.

orthecreedence: It's funny how PHP had it right all along. Serverless/lambda -> stateless "functions" being passed arguments -> same as PHP (w/o sessions and junk).
To be honest, when I jumped from PHP dev to more app-based backends years ago, I thought it was fairly crude to have a stateful server handling everything. Now everyone's starting to move back to (hosted) versions of what amounts to "bring up and tear down the entire app on each request."

rckclmbr: That's not what it is at all. Lambda functions persist, unless traffic drops, then it is killed. But if traffic is going to it, they try to be smart about reusing a hot app.
PHP is even moving toward "stateful" server handling. Just look at hhvm
reply
	
orthecreedence: php-fpm does the exact same thing. It scales up/down the number of workers (down to 0 if configured) with the incoming load, reusing workers up to a certain threshold.
Lambda == PHP. It's full circle. Don't try to pretend otherwise.
Never heard of HHVM (I've been out of the PHP world for a while), but I know PHP's default operational mode is complete start up and teardown on every request.

Open Container Initiative specifications are 1.0 https://news.ycombinator.com/item?id=14804624
