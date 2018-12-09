- https://www.infoq.com/news/2018/12/aws-firecracker

## About

An example use case is that you want to execute potentially unsafe/malicious code & prevent it from affecting your server, or other code running on that server. Like if you run a platform where you download and execute other peoples' code, but you want to make it so each customer cannot affect the other customer, or take over your server, this would let you do this.

It spins up (cheap) virtual machine, and the process(es) that are running think theyre running in their own, full, server, but in reality, there could be thousands of these little virtual machines on the same physical server.

If you're not familiar with AWS Lambda, its a platform that allows you to just submit some code in the form of a single function, and have it execute on certain events. Like you can upload the code of a single java function, and that code will be executed every time an event happens.

AWS wants to run a billion of these functions using as few, highly-utilized machines as they can. If I asked you to naively implement this service, as quickly as possible, you would just allocate one server per function, or maybe one server per customer, so that each customer can't affect the other customers. But that's expensive. The problem is trying to run functions from different customers on the same physical machine. Its somewhat acceptable if a customer can ruin themselves if one of their functions hogs the resources of the physical machine melts the server running that same customer's other functions, but its not acceptable for one customer to be able to melt the server that has a different customer's code. And besides hogging the resources of the computer, security is the big one, truly. AWS's first principal is security, so the easiest way to make different customers from not being able to affect each other, is to put them on different physical machines, which could be costly if there are many many tiny customers.

This would allow AWS to smush as many customers on as few servers as possible, which would save AWS lots of $.

Firecracker would be used by someone trying to implement something like Lambda. Perhaps the most obvious & great example would be the little sandbox-rust coding things you see amongst the documentation. Whoever runs that service could use Firecracker to run these little functions safely, preventing one function from affecting any other running function, and efficiently, so they could run more of these sandbox functions on fewer servers.

https://www.reddit.com/r/rust/comments/a0rph0/aws_firecracker_microvm_is_all_rust/ealu4vn/
