Change boot order

`sudo vim /etc/default/grub`

Find the line that contains

`GRUB_DEFAULT`

and set it to

To boot to the sixth item in the list, the line would read:

`GRUB_DEFAULT=5`

https://askubuntu.com/questions/100232/how-do-i-change-the-grub-boot-order/110738#110738
