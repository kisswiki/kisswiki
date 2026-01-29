## macos aarch64 apple silicon

Download qcow2 aarch64 from https://guix.gnu.org/en/download/

save below as guix.xml:

```xml
<domain type='hvf' xmlns:qemu='http://libvirt.org/schemas/domain/qemu/1.0'>
    <name>guix</name>
    <uuid>A64ACFE8-0974-450C-A344-31AE6D717B62</uuid>
    <memory unit='GiB'>2</memory>
    <cpu mode='custom' match="exact">
       <model>host</model>
    </cpu>
    <vcpu>2</vcpu>
    <features>
        <gic version='2'/>
    </features>
    <os firmware='efi'>
        <type arch='aarch64' machine='virt'>hvm</type>
    </os>
    <clock offset='localtime'/>
    <devices>
        <emulator>/opt/homebrew/bin/qemu-system-aarch64</emulator>
        <controller type='usb' model='qemu-xhci'/>
        <disk type='file' device='disk'>
            <driver name='qemu' type='qcow2'/>
            <source file='/Users/roman.frolow/personal_projects/guix/guix-system-vm-image-1.5.0.aarch64-linux.qcow2'/>
            <target dev='vda' bus='virtio'/>
            <boot order='1'/>
        </disk>
        <console type='pty'>
            <target type='serial'/>
        </console>
        <input type='tablet' bus='usb'/>
        <input type='keyboard' bus='usb'/>
        <graphics type='vnc' port='5900' listen='127.0.0.1' passwd='pass1'/>
        <video>
            <model type='virtio' vram='32768'/>
        </video>
    </devices>
    <seclabel type='none'/>
    <qemu:commandline>
        <qemu:arg value='-machine'/>
        <qemu:arg value='highmem=off'/>
        <qemu:arg value='-netdev'/>
        <qemu:arg value='user,id=n1,hostfwd=tcp::2222-:22'/>
        <qemu:arg value='-device'/>
        <qemu:arg value='virtio-net-pci,netdev=n1,bus=pcie.0,addr=0x19'/>
    </qemu:commandline>
</domain>
```

Make sure the path to qcow2 is correct. You may also change uuid with `uuidgen`.

then run these commands:

```shell
brew install qemu libvirt gcc
brew services start libvirt
virsh define guix.xml
virsh start guix
```

now you can open window with GUI:

`open 'vnc://:PASSWORD@localhost:5900'`

or console:

`virsh console guix`

and login as `guest`.

To exit `virst console`: `Ctrl+]` or `Ctrl+5`.

More virsh:

```shell
virsh edit Guix
#virsh shutdown Guix
virsh destroy Guix
virsh list --all
virsh edit Guix
virsh domrename Guix guix
virsh list --all
virsh start guix
guix-bare-bones
virsh undefine guix2-bare-bones
```

- https://n8henrie.com/2022/09/linux-vms-on-my-m1-mac/
- https://n8henrie.com/2022/10/guix-system-guixsd-vm-on-an-m1-mac/
- https://askubuntu.com/questions/1417854/how-to-open-the-graphical-console-of-a-qemu-kvm-vm-with-virsh#comment2467149_1417860
- https://superuser.com/questions/637669/how-to-exit-a-virsh-console-connection

## guix pull OOM kill

```shell
hint: Consider setting the necessary environment variables by running:

     GUIX_PROFILE="/root/.config/guix/current"
     . "$GUIX_PROFILE/etc/profile"
     unset GUIX_PROFILE

Alternately, see `guix package --search-paths -p "/root/.config/guix/current"'.


hint: After setting `PATH', run `hash guix' to make sure your shell refers to `/root/.config/guix/current/bin/guix'.
```

```
