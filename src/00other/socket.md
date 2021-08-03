A socket is effectively a type of file handle, behind which can lie a network session.

You can read and write it (mostly) like any other file handle and have the data go to and come from the other end of the session.

The specific actions you're describing are for the server end of a socket. A server establishes (binds to) a socket which can be used to accept incoming connections. Upon acceptance, you get another socket for the established session so that the server can go back and listen on the original socket for more incoming connections.

How they're represented in memory varies depending on your abstraction level.

At the lowest level in C, they're just file descriptors, a small integer.

I learnt mostly at Uni which was quite a while ago, but the current reference I have is the W Richard Stevens book "UNIX network programming". It's pretty good in my opinion

https://stackoverflow.com/questions/16233193/what-exactly-is-socket/16233249#16233249

##

A socket is an abstraction through which an application may send and receive data,in much the same way as an open file allows an application to read and write data to stable storage. A socket allows an application to "plug in" to the network and communicate with other applications that are also plugged in to the same network. Information written to the socket by an application on one machine can be read by an application on a different machine, and vice versa.

a port identifies a socket on a host

more than one socket can be associated with one local port

TCP/IP Sockets in C, Practical Guide for Programmers - Michael J. Donahoo, Kenneth L. Calvert (2009)

https://stackoverflow.com/questions/16233193/what-exactly-is-socket/47675598#47675598

##

A communication between two processes running on two computer systems can be completely specified by the association: {protocol, local-address, local-process, remote-address, remote-process} We also define a half association as either {protocol, local-address, local-process} or {protocol, remote-address, remote-process}, which specify half of a connection. This half association is also called socket, or transport address. The term socket has been popularized by the Berkeley Unix networking system, where it is "an end point of communication", which corresponds to the definition of half association.

https://stackoverflow.com/questions/16233193/what-exactly-is-socket/62490622#62490622

##

A connected socket is that 4 tuple, but a generic "socket" isn't necessarily. It sounds like you're thinking mostly in terms of TCP

https://stackoverflow.com/questions/4994025/what-is-a-socket-physically#comment5694494_5076655

##

sockets are not only subject to the TCP/IP stack. See UNIX domain sockets or inter process communication sockets in general

- https://stackoverflow.com/questions/152457/what-is-the-difference-between-a-port-and-a-socket#comment13423119_152463
- https://en.m.wikipedia.org/wiki/Unix_domain_socket

##

You can use HTTP to communicate with another process via sockets without assigning a port

https://stackoverflow.com/questions/152457/what-is-the-difference-between-a-port-and-a-socket#comment108237641_152463

##

In a broad sense, Socket - is just that, a socket, just like your electrical, cable or telephone socket. A point where "requisite stuff" (power, signal, information) can go out and come in from. It hides a lot of detailed stuff, which is not required for the use of the "requisite stuff". In software parlance, it provides a generic way of defining a mechanism of communication between two entities (those entities could be anything - two applications, two physically separate devices, User & Kernel space within an OS, etc)

A Port is an endpoint discriminator. It differentiates one endpoint from another. At networking level, it differentiates one application from another, so that the networking stack can pass on information to the appropriate application.

https://stackoverflow.com/questions/152457/what-is-the-difference-between-a-port-and-a-socket/402490#402490
