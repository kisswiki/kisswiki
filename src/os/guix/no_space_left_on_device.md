This should reclaim dead store paths while retaining current system generations. If more space is needed:

```sh
guix system delete-generations
guix package --delete-generations
rm -rf /root/.cache/guix
# remove old files from /gnu/store until there will be 5 GB free on system partition
guix gc -F 5G
df -h /gnu/store
```

```
guix system list-generations
# delete from generation 1 to 5
guix system delete-generations 1..5
# delete older than 1 month
guix system delete-generations 1m
# delete older than 2 weeks
guix system delete-generations 2w
```

guix system delete-generations removes rollback generations, so omit it if those are needed.

For recurring builds, enlarge the VM filesystem. qemu.sh uses the 20-GiB guix-system-vm-image-1.5.0.aarch64-linux-modified.qcow2; increasing -m 8G will
not help. With the VM shut down:

```sh
qemu-img resize guix-system-vm-image-1.5.0.aarch64-linux-modified.qcow2 +15G
```

Then expand partition 2 and ext4 inside the guest:

```sh
parted /dev/vda resizepart 2 100%
resize2fs /dev/vda2
```
