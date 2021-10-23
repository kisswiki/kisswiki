### end-to-end vs point-to-point encryption

Let's define end-to-end as where the message is encrypted by the sender and decrypted by the receiver. Nobody in the middle, not even the chat provider, has the ability to decrypt it.

Compare this to a simple chat over HTTPS. The message is encrypted by the sender, just based on the fact that TLS is used. Now, while the intended recipient is another user, the TLS connection is initiated with a server (think Facebook). TLS terminates at the server, and whoever controls the server has the ability to view the messages since they are not encrypted. Then, the message may be passed on encrypted over TLS again to the recipient.

The key difference is that the provider is able to view the messages in the second case.

https://security.stackexchange.com/questions/157292/whats-the-difference-between-end-to-end-and-regular-tls-encryption/157293#157293
