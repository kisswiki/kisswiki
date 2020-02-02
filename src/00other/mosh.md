It's just my daily Android phone with a mini foldable Bluetooth keyboard.

I'm running Termux on the Android device (full native Linux environment) and connecting to a remote tmux session running on the server via Mosh.

Mosh supports roaming so I can switch between data/WiFi or experience connection loss without losing the session, it just automatically re-connects when connectivity comes back. The remote tmux session is a persistent session that's been running on the server for over a year. Connecting via my phone has all my tmux windows/panes laid out exactly how they were left from my last connection on my normal workstation.

I have a tmux session running locally on all my machines with all my local windows and then a window for each server I access regularly which then has a remote tmux session nested inside via Mosh.

This means I'm always a single key combination away from being directly inside any of my servers. The entire environment persists across connections/laptop sleep and is the same on all devices desktop/laptop/phone etc.


This is true strictly only for remote-terminal stuff. If you need to forward an agent (-A), or do port tunneling (-L, -R, -D), then stick with SSH. Mosh also uses high UDP ports rather than just 22/TCP so you'll need to make sure whoever's responsible for network firewalls is aware of that.

##

I really like mosh and use it for my primary "remote in" server because mobile/phone clients support it.

That said, it requires installation on both the client and server. The server also requires use of a high-number UDP port which makes it a bit cumbersome if you have a hardware firewall or cloud firewall. In the case of a firewall, you're explicitly punching 60000-61000 UDP through the firewall. Though security might not be that big of an issue (since the mosh server daemon is transient in nature), it still requires extra effort for what equates to most as a persistent SSH connection.


Mosh has other benefits for high-latency connections (LTE, etc.) other than autoconnect. Local echo, more efficient redraws, and the general lack of needing to keep an active TCP connection open after auth, are all useful.

##

My concern with Mosh is that it hasn't been around as long as SSH. So security wise it hasn't been battle tested. Anyone have any thought to ease my mind.

The design is relatively simple and piggy backs on SSH for authentication so there shouldn't be a large attack surface. But you're absolutely right, it hasn't been battle tested as well as SSH.

The huge increase in convenience is worth the small chance that it may be less secure than vanilla SSH to me. You'll obviously have to make your own mind up.

https://mosh.org/#faq

##

How does one establish, and connect to a remote tmux session?

Run tmux when logged in to the remote server to start a tmux session. Just don't kill the session when you're done, detach from it instead which leaves it running, then log out.

Next time you log in to the server again, run tmux a to re-attach to the existing session.

I normally use mosh server.hostname -- tmux a to connect via Mosh and autoconnect to my tmux session.

Also, how does authentication work with mosh? Can you use public / private keys? Or does it run on top of SSH?

It piggybacks on SSH to bootstrap the connection, all auth is handled by SSH.

https://www.reddit.com/r/linux/comments/augvwx/had_to_do_an_emergency_update_on_my_server_from/
