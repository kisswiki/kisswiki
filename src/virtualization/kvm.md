- https://help.ubuntu.com/community/KVM
- https://help.ubuntu.com/lts/serverguide/libvirt.html
- https://www.linux-kvm.org/page/Tuning_KVM

## release pointer

`Ctrl_Left + Alt_Left` to release the pointer

## exit fullscreen

When in full screen mode, hit Ctrl+Alt to 'unhinge' the mouse and move the mouse to the top-middle of the screen. A little applet drops down to allow you to leave full screen and send key-combinations.

https://askubuntu.com/questions/43861/how-do-i-unmaximize-full-screen-view-in-virt-manager/403635#403635

## Install

- https://help.ubuntu.com/community/KVM/Installation
- https://www.microsoft.com/pl-pl/software-download/windows10ISO
- Windows 10 Pro keys: Home: TX9XD-98N7V-6WMQ6-BX7FG-H8Q99, Pro: W269N-WFGWX-YVC9B-4J6C9-T83GX. However, these won't activate as they are KMS keys https://www.reddit.com/r/Windows10/comments/3det9q/build_10240_now_available_for_windows_insiders_in/ct4hp9p/

```
sudo apt install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils
sudo adduser `id -un` kvm
sudo adduser `id -un` libvirtd
# relogin
# install graphical
sudo apt install virt-manager
```

## Virt-Manager can't connect to graphical console

append:

```
# allow connect with openGraphicsFD to work
unix (send, receive) type=stream addr=none peer=(label=/usr/sbin/libvirtd),
```

to the file `/etc/apparmor.d/abstractions/libvirt-qemu` but not in the qemu-bridge-helper section. (So right after `owner @{PROC}/0-9*/fd/ r,`)

Then reload the profiles with sudo systemctl reload apparmor

https://askubuntu.com/questions/833964/virt-manager-cant-connect-to-graphical-console

## no bootable device - add iso

virt-manager > virtual machine > Show virtual hardware details:

  - Boot Options > Enable IDE CDROM 1
  - IDE CDROM 1 > Virtual Disk > Source path > Browse

- https://unix.stackexchange.com/questions/15789/qemu-no-boot-device-found

I noticed that for some reason the type of disk image is not detected; it just defaults to “raw”. So if your disk image is e.g. “qcow2”, the virtual machine will not be configured correctly upon import.

The solution is to go into the information tab of VirtManager, under the “advanced options” of the disk item and set the correct storage format.

- https://azitech.wordpress.com/2011/07/23/no-bootable-device-on-kvmqemu/

## video drivers

if you're using virt-manager, it doesn't let you change the vram in the gui.  You'll have to do that with the virsh edit command.  I did receive slightly better performance cranking that up and switching to vmvga (instead of qxl).  Nothing as good as remmina though -- but like I said, remmina's pretty useless if you want to play games or watch videos.  With remmina, MS Office and Photoshop are a go.

https://help.ubuntu.com/community/KVM/Virsh

https://bbs.archlinux.org/viewtopic.php?id=203826

http://bart.vanhauwaert.org/hints/installing-win10-on-KVM.html

## 

`virsh edit Windows10`

16384 -> 65536

Change

`<model type='qxl' ram='65536' vram='65536' vgamem='16384' heads='1'/>`

to

`<model type='qxl' ram='65536' vram='65536' vgamem='65536' heads='1'/>`

## qxl vs virtio vs spice

- https://www.ovirt.org/documentation/internal/guest-agent/understanding-guest-agents-and-other-tools/
- https://pve.proxmox.com/wiki/SPICE
- https://www.linux-kvm.org/page/SPICE

QXL - 2d graphics driver
QXL + SPICE - QEMU with SPICE support enable (among other things) the more powerful QXL display device and makes clipboard sharing possible (copy/paste between clients and the virtual machine). https://wiki.gentoo.org/wiki/QEMU/Windows_guest
virtio - virtio-gpu is 3graphics driver, performance should be better than QXL http://linux-blog.anracom.com/2017/05/18/kvm-video-virtio-debian-8-guest-host-with-intel-hd-4000-install-a-4-9-kernel-on-the-guest-for-optimal-2d-graphics-performance/

## gpu passthrough

- https://wiki.archlinux.org/index.php/PCI_passthrough_via_OVMF
- HOW-TO make dual-boot obsolete using kvm VGA passthrough https://forums.linuxmint.com/viewtopic.php?f=231&t=212692

## virgil3d

- https://virgil3d.github.io/
- https://www.phoronix.com/scan.php?page=news_item&px=virtio-drm-kms-gpu-driver

I'd also recommend you take a look at the virgil3d home page itself. The author is fairly up front on what he believes works or not, and the architecture. As he describes, when implemented it doesn't require hardware pass-through, but on the other hand I highly doubt that it's possible to have virtualized 3D graphics without HostOS hardware capability. He also doesn't fully describe any hardware GPU or CPU requirements and doesn't really describe what his own machine has...

https://forums.opensuse.org/showthread.php/523943-How-to-use-virtio-gpu-for-3D-acceleration-in-a-Windows-guest

## virtio-gpu

virtio-vga / virtio-gpu is a paravirtual 3D graphics driver based on virgl. Currently a work in progress, supporting only very recent (>= 4.4) Linux guests with mesa (>=11.2) compiled with the option --with-gallium-drivers=virgl.
https://wiki.archlinux.org/index.php/QEMU#virtio

>For example the binary drivers for Ubuntu can be found here. https://launchpad.net/kvm-guest-drivers-windows/+download
http://www.linux-kvm.org/page/WindowsGuestDrivers/Download_Drivers

But after downloading https://launchpad.net/kvm-guest-drivers-windows/20120712/20120712/+download/virtio-win-drivers-20120712-1.iso and mounting on Windows10, I can't see directory `viostor` in the iso as shown here http://bart.vanhauwaert.org/hints/installing-win10-on-KVM.html.

>If your distribution does not provide binary drivers for Windows, you can use the package from the Fedora Project. These drivers are digitally signed, and will work on 64-bit versions of Windows: https://fedoraproject.org/wiki/Windows_Virtio_Drivers

Probably should dowload this https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/latest-virtio/virtio-win.iso

Oh, viostor is for storage.

TODO: Check those

- https://www.kraxel.org/blog/2016/09/using-virtio-gpu-with-libvirt-and-spice/
- https://github.com/hpaluch/hpaluch.github.io/wiki/Install-Windows7-on-KVM-Qemu
- https://serverfault.com/questions/478726/am-i-using-virtio-for-my-kvm-guest
- https://askubuntu.com/questions/767124/why-cant-i-see-a-qxl-device-in-my-windows-10-kvm-guest
- https://superuser.com/questions/598374/how-to-change-the-resolution-of-the-bash-for-a-debian-vm
- https://superuser.com/questions/438883/how-can-i-turn-off-display-resolution-auto-detection-in-windows-vista
- https://github.com/vrozenfe/qxl-dod
- https://answers.microsoft.com/en-us/windows/forum/windows_10-hardware/kvm-avr-switch-monitor-resolution-problem-on/7e48cd08-6ef6-415c-9b4c-40ef49098ef1?auth=1

## KVM script that can boot win 7

https://ubuntuforums.org/showthread.php?t=2330074&p=13516078#post13516078

## Performance

The virtio drivers really improve the performance of the machine. You can find the Windows binaries from the fedora project http://alt.fedoraproject.org/pub/alt/vi ... st/images/

Other ways to improve the performance are setting the VM to use hugepages if you don't use memory balloning:

http://fedoraproject.org/wiki/Features/ ... ked_Memory

Also if you are giving the machine more than one CPU pin them. To choose to which physical CPU to reduce context switches and IRQ you can check the CPU cache sharing. Choose the physical CPUs that share the cache. You can do a 

# cat /sys/devices/system/cpu/cpu0/cache/index0/shared_cpu_list

Changing the cpu0 for whichever cpu you want to know the sharing and index0 up to index3 for the cache level. Pinning them to the right CPUs makes the VMs much quieter.

Also about the thing about X, you can control your VMs from the console using virsh. And as said connecting to them using RDP is much faster.

https://arstechnica.com/civis/viewtopic.php?p=24393635&sid=1281975f2196bad9335b6e25372c41fe#p24393635

## 2019-01-29

## General documentation

- https://www.linux-kvm.org
  - https://www.linux-kvm.org/page/HOWTO
  - https://www.linux-kvm.org/page/Documents 
- https://wiki.gentoo.org/wiki/QEMU

## Managements

- https://www.linux-kvm.org/page/Management_Tools
  - You can run qemu/kvm straight from the command line
  - virsh A minimal shell around libvirt for managing VMs
- https://drewdevault.com/2018/09/10/Getting-started-with-qemu.html

## Networking

- use virtio for network https://en.wikibooks.org/wiki/QEMU/Devices/Network
- Default - without any -netdev option - is Pass-through https://wiki.gentoo.org/wiki/QEMU/Options#Networking
  - No mention about macvtap
