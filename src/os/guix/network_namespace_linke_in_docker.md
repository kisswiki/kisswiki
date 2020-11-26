But in case it helps, I think this is how you could approximate what
"docker run --network --publish ..." does:

1) Create a persistent network namespace with `ip netns add`.
2) Use `ip link add` to create a pair of virtual ethernet interfaces (veth)
- one for the host and one for the container.
3) Use `ip link set <iface> netns <namespace>` so that one of the veth
interfaces appears inside of the namespace, while its peer remains on the
host side.
4) Assign each of the veth interfaces an address in the same subnet, but
choose a subset that's unused on your system. For example, 192.168.0.1 and
192.168.0.2 within the subnet 192.168.0.0/24.
5) Bring up the interfaces with `ip link set <iface> up`. Do the same for
the loopback interface (lo) inside the namespace.
6) Inside the namespace, set up a default route using the address of the
veth interface on the host side.
7) Use iptables to configure source network address translation (SNAT) for
the traffic originating from the namespace so that it can connect to
external hosts (e.g. via eth0).
8) Enable IP forwarding: set /proc/sys/net/ipv4/ip_forward to 1, and add
related rules to iptables' FORWARD chain (if your default iptables policy
is to DROP packets).
9) Finally, use iptables again to enable port forwarding (DNAT) from
external hosts to your container.

Here, "do X inside of a namespace" usually means `ip netns exec <namespace>
<command>`. When the command is /bin/bash you can explore the namespace's
environment interactively. The namespace persists until you call `ip netns
del <namespace>`.

With the exception of #9, there are examples of each task in the script I
mentioned up-thread:
https://gist.github.com/dpino/6c0dca1742093346461e11aa8f608a99#file-ns-inet-sh

For my purposes, dynamic configuration of namespaces, interfaces, routes,
etc. (like Docker does) seems unnecessarily complicated and fragile, so
I've taken the approach of setting up my namespaces once at boot, and then
the container startup script is as simple as `ip netns exec <namespace>
<guix-container-script>`. Even when the Guix container itself shuts down
and restarts, the namespace settings above are unchanged.

How would these network settings be implemented using Guix services? I
don't have experience in this area, so the following is just a guess:
iptables-service seems suitable for tasks #7 - #9, and there's
static-networking-service for assigning addresses in task #4 (but I think
it will only know about the veth interface outside the namespace, not the
one inside). For the rest, I think you'd need to define some new service to
set up the namespace and virtual interfaces, and ensure that this service
runs before static-networking-service.

https://lists.gnu.org/archive/html/help-guix/2020-11/msg00185.html