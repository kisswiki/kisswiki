## droplet

vps, virtual machine

More than just virtual machines. Droplets are a scalable compute platform with add-on storage, security, and monitoring capabilities to easily run production applications.

https://www.digitalocean.com/products/droplets/

###

To understand how DigitalOcean works, will require some extensive knowledge, but I will try to explain it as simple as possible.
DigitalOcean has some really powerful computers, called servers. When running the appropriate software on the server you can create Virtual Private Servers (also known as Droplets or Containers). The VPS is a virtual machine, which utilizes part of the server resources (CPU, RAM, HDD) and runs its own copy of the operating system and provides superuser (root) access to DigitalOcean`s clients. 
This means that each client can have his own Droplet, running a chosen Operating system. The client has administrator (root) access to the VPS, so he can make changes without conforming with the other users, which have their Droplets on the same DigitalOcean server.

When you create a Droplet, you will have the choice what Operating System should it use. For various reasons you can not have any Operating System installed on a DigitalOcean`s Droplet, but actually they do provide a good variety of options.

What will you do from then on with your Droplet depends on you. Yes, you can run web/mail/database services and host your websites on a Droplet. You can also use it for test purposes like developing code in a specific environment or learning how to manage a specific server configuration. Actually the possibilities are quite large, people use Virtual Servers for game server hosting, private file storage, seedboxes (using the VPS as a torrent seeder), VOIP/chat, VPN, etc...

https://www.digitalocean.com/community/questions/how-does-digital-ocean-work