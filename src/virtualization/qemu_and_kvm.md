- https://help.ubuntu.com/community/KVM
- https://help.ubuntu.com/lts/serverguide/libvirt.html
- https://www.linux-kvm.org/page/Tuning_KVM

## release pointer

`Ctrl_Left + Alt_Left` to release the pointer

## exit fullscreen

When in full screen mode, hit Ctrl+Alt to 'unhinge' the mouse and move the mouse to the top-middle of the screen. A little applet drops down to allow you to leave full screen and send key-combinations.

https://askubuntu.com/questions/43861/how-do-i-unmaximize-full-screen-view-in-virt-manager/403635#403635

## Install

```
sudo apt install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils
# is adding to kvm needed
sudo adduser `id -un` kvm
sudo adduser `id -un` libvirt
# relogin
# install graphical
sudo apt install virt-manager
```

- https://help.ubuntu.com/community/KVM/Installation
- https://www.microsoft.com/pl-pl/software-download/windows10ISO
- Windows 10 Pro keys: Home: TX9XD-98N7V-6WMQ6-BX7FG-H8Q99, Pro: W269N-WFGWX-YVC9B-4J6C9-T83GX. However, these won't activate as they are KMS keys https://www.reddit.com/r/Windows10/comments/3det9q/build_10240_now_available_for_windows_insiders_in/ct4hp9p/
- https://askubuntu.com/questions/930491/group-libvirtd-does-not-exist-while-installing-qemu-kvm/993276#993276

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

- https://wiki.qemu.org/Documentation
  - https://stackoverflow.com/questions/155109/whats-a-good-source-to-learn-about-qemu
- https://qemu.weilnetz.de/doc/qemu-doc.html
- https://git.qemu.org/?p=qemu.git;a=tree;f=docs;hb=master
- https://www.linux-kvm.org
  - https://www.linux-kvm.org/page/HOWTO
  - https://www.linux-kvm.org/page/Documents
  - https://www.linux-kvm.org/page/Tuning_Kernel
  - https://www.linux-kvm.org/page/10G_NIC_performance:_VFIO_vs_virtio
  - https://www.linux-kvm.org/page/Networking
- https://wiki.libvirt.org
- https://libvirt.org/docs.html
- https://wiki.gentoo.org/wiki/QEMU
- https://wiki.debian.org/QEMU
- https://debian-handbook.info/browse/stable/sect.virtualization.html
- https://www.suse.com/documentation/sles-15/book_virt/data/book_virt.html
- https://doc.opensuse.org/documentation/leap/virtualization/html/book.virt/cha.kvm.html
- https://docs.fedoraproject.org/en-US/quick-docs/qemu/
- https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/virtualization_administration_guide/
- select virtualization on the left, formats like html, pdf, epub https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/
  - https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/virtualization_getting_started_guide/
  - https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/virtualization_deployment_and_administration_guide
  - https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/virtualization_tuning_and_optimization_guide/
  - https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/virtualization_security_guide/
  - [Converting Virtual Machines from Other Hypervisors to KVM with virt-v2v in RHEL 7](https://access.redhat.com/articles/1351473)
- https://www.funtoo.org/Windows_10_Virtualization_with_KVM
- https://www.ibm.com/support/knowledgecenter/linuxonibm/liaaf/lnz_r_kvm_base.html
- http://www.linuxfromscratch.org/blfs/view/stable-systemd/postlfs/qemu.html
- http://www.linuxfromscratch.org/blfs/view/stable/postlfs/qemu.html
- blogs https://planet.virt-tools.org/

## Links

- Tutorial about qemu and kvm, i.e. using `kvm -monitor` https://medium.com/@dbclin/aws-just-announced-a-move-from-xen-towards-kvm-so-what-is-kvm-2091f123991
- Installing kvm on AWS, Linux kernel configuration https://www.twosixlabs.com/running-thousands-of-kvm-guests-on-amazons-new-i3-metal-instances/
- Introduction to KVM - slides  http://www3.nccu.edu.tw/~yuf/slides/kvm.pdf
- Using the KVM API https://lwn.net/Articles/658511/
- KVM API in the kernel source tree https://www.kernel.org/doc/Documentation/virtual/kvm/api.txt
  - https://stackoverflow.com/questions/37426916/any-good-training-or-even-reference-books-on-kvm-libvirt
- https://www.itworld.com/article/2827037/virtualization/crash-course--virtualization-with-kvm-on-ubuntu-server.html
- https://mkdev.me/en/posts/virtualization-basics-and-an-introduction-to-kvm
- https://www.linux.com/learn/intro-to-linux/2017/5/creating-virtual-machines-kvm-part-1
- many images for different architectures with https://www.qemu-advent-calendar.org/2018/
- https://rust-embedded.github.io/book/start/qemu.html
- [Setting up Qemu with a tap interface](https://gist.github.com/extremecoders-re/e8fd8a67a515fee0c873dcafc81d811c)
- https://unix.stackexchange.com/questions/81044/emulate-unplugging-a-network-cable-with-qemu-kvm
- network user mode and port forwarding https://stackoverflow.com/questions/22654634/difference-between-net-user-and-net-nic-in-qemu
- [How to use Network](http://archive.is/2dV1s#selection-11.0-11.18)
- https://www.oreilly.com/library/view/mastering-embedded-linux/9781787283282/a57e95ea-8d76-4a84-8424-10b6ac0d5015.xhtml

## Books

- https://www.amazon.com/KVM-Virtualization-Cookbook-effectively-production/dp/178829467X
- Book about virtualization and qemu/kvm https://www.amazon.com/Teach-Yourself-Linux-Virtualization-Availability/dp/1365847209

## Managements

- https://www.linux-kvm.org/page/Management_Tools
  - You can run qemu/kvm straight from the command line
  - virsh A minimal shell around libvirt for managing VMs
- https://drewdevault.com/2018/09/10/Getting-started-with-qemu.html

## Networking

`qemu -net nic -net user` is default if you just run `qemu`.

- use virtio-net-pci for network https://www.linux-kvm.org/page/10G_NIC_performance:_VFIO_vs_virtio
  - https://en.wikibooks.org/wiki/QEMU/Devices/Network
- Default - without any -netdev option - is Pass-through https://wiki.gentoo.org/wiki/QEMU/Options#Networking
  - No mention about macvtap

## CPU

To pass all available host processor features to the guest, use the command line switch

`qemu -cpu host`

- https://www.linux-kvm.org/page/Tuning_KVM


## TCG doesn't support requested feature: CPUID.01H:ECX.vmx

The "Nested VMX" feature adds this missing capability - of running guest
hypervisors (which use VMX) with their own nested guests.

https://www.kernel.org/doc/Documentation/virtual/kvm/nested-vmx.txt

Solved by running qemu with `-cpu host -enable-kvm` parameters.

Running with `-cpu qemu64,+vmx -enable-kvm` I got `warning: host doesn't support requested feature: CPUID.80000001H:ECX.svm`

https://stackoverflow.com/questions/39154850/how-to-emulate-vmx-feature-with-qemu/39277264#39277264

## Mounting QEMU images

linux kernel in Ubuntu 18.10 does not have nbd compiled in.

- https://wiki.debian.org/QEMU#Mounting_QEMU_images
- https://gist.github.com/shamil/62935d9b456a6f9877b5
- https://askubuntu.com/questions/4396/how-do-i-mount-a-qcow2-disk-image
  - While libguestfs looks really nice, but is heavyweight. It has a ton of dependencies (It recommends up to 55 dependencies, and installs an entire supermin appliance. https://askubuntu.com/questions/4396/how-do-i-mount-a-qcow2-disk-image#comment329906_61748
- http://www.microhowto.info/howto/connect_to_a_remote_block_device_using_nbd.html
- http://blog.siphos.be/2016/09/mounting-qemu-images/

## passthrough

- https://wiki.archlinux.org/index.php/PCI_passthrough_via_OVMF
- https://wiki.qemu.org/Features/VT-d

A pass-through NIC setup means as if the hardware would be itself connected to the machine instead of being connected to the host machine. Likewise, it will also mean you have to setup the hw and drivers directly in the VM and will be only able to use it from that VM.

This configuration is often used for performance reasons when dealing with GPUs, or for dealing with special uses of wifi chipsets, mainly for hacking purposes.

As for the bridge or NAT setups, multiple VMs are then able to share the network connection/hw of the host, and are giving an abstraction of hardware that does not often map to the brand of the real hardware.

The obvious advantages here are sharing the connection, not having to setup difficult brands in the VM, or even using a more generic abstraction of paravirtualizing hw for the hypervisor//host not have to emulate the full hw, and so not use so much resources.

https://unix.stackexchange.com/questions/456399/difference-betweeen-passthrough-nic-and-bridge-setup-in-qemu

## vga vs bochs-display

- https://www.kraxel.org/blog/2018/10/qemu-vga-emulation-and-bochs-display/
  - https://www.phoronix.com/scan.php?page=news_item&px=QEMU-Legacy-Free-Display

## kvm vs containers

KVM is a Hypervisor based on emulating virtual hardware. Containers, on the other hand, are based on shared operating systems and is skinnier. But this poses a limitation on the containers that that we are using a single shared kernel and hence cant run Windows and Linux on the same shared hardware

https://stackoverflow.com/questions/20578039/difference-between-kvm-and-lxc

## macvtap

- https://superuser.com/questions/1199099/what-is-macvtap-and-where-is-it-supported/1199169

## Set root password if it is not set

`$ virt-customize -a bionic-server-cloudimg-amd64.img --root-password password:coolpass`

- https://stackoverflow.com/questions/29137679/login-credentials-of-ubuntu-cloud-server-image
- https://www.kraxel.org/blog/2018/11/fedora-29-images/
- https://serverascode.com/2018/06/26/using-cloud-images.html

## Security

- [Security in QEMU: How Virtual Machines Provide Isolation by Stefan Hajnoczi - YouTube](https://www.youtube.com/watch?v=YAdRf_hwxU8)

## Creating images

- https://rwmj.wordpress.com/2018/09/13/creating-windows-templates-for-virt-builder/
- http://libguestfs.org/virt-builder.1.html
- https://www.kraxel.org/blog/2018/11/fedora-29-images/
  - It's a bunch of scripts to create bootable linux distro images.
  - qemu image can be run as container by systemdli-nspawn!!!
I'm using it for both arm toys (raspberry pi) and for qemu. https://git.kraxel.org/cgit/imagefish/tree/README.md
- https://buildroot.org/
