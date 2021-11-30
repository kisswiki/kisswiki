```bash
$ sudo nix-shell -p gptfdisk
# blkid
/dev/nvme0n1p1: LABEL="Windows RE tools" BLOCK_SIZE="512" UUID="3C7CF7997CF74C60" TYPE="ntfs" PARTLABEL="Basic data partition" PARTUUID="593e6f89-fa68-472f-85d7-b6fe1dbb2e56"
/dev/nvme0n1p2: LABEL_FATBOOT="SYSTEM" LABEL="SYSTEM" UUID="DCF7-772A" BLOCK_SIZE="512" TYPE="vfat" PARTLABEL="EFI System Partition" PARTUUID="2b95e4aa-736e-45a8-b654-9330261c002f"
/dev/nvme0n1p4: LABEL="Windows" BLOCK_SIZE="512" UUID="4E98FE2698FE0C69" TYPE="ntfs" PARTLABEL="Basic data partition" PARTUUID="916bd45a-eaf0-4a13-83a6-054828309907"
/dev/nvme0n1p5: LABEL="Dane" BLOCK_SIZE="512" UUID="CC242F3B242F2842" TYPE="ntfs" PARTLABEL="Basic data partition" PARTUUID="97257a5d-c2b0-48c7-a3f3-c1aa0da7076a"
/dev/nvme0n1p6: LABEL="nixos" UUID="a86a408b-2039-4002-bb13-ae15ae3d6d1a" BLOCK_SIZE="4096" TYPE="ext4" PARTUUID="a529a036-1e3c-4f5f-af32-6702890eb8b4"
/dev/nvme0n1p7: LABEL="debian" UUID="381b1f3e-67b9-46af-8ad9-dace488e197b" BLOCK_SIZE="4096" TYPE="ext4" PARTUUID="a141548b-5cb7-43e8-ac0a-08c149f18a10"
/dev/nvme0n1p3: PARTLABEL="Microsoft reserved partition" PARTUUID="5d833726-0e87-430b-b015-dd511b387b19"
```
