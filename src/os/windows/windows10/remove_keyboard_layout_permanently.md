Use `pinky.ahk` to have polish diactrics with US keyboard.

## This works for permanently removing keyboard laytout and blocking from adding new one

Can't remove a Keyboard layout in Windows 10

How to fix: simply delete key for that "parasitic" layout.

Step-By-Step:

1) Open registry Editor (Win+R -> regedit) as Administrator.

2) Navigate to Computer\HKEY_USERS\.DEFAULT\Keyboard Layout\Preload

3) Here you can see some files like this:

 Image

That is your layouts. Then, find keyboard codes using search engine you want.

In my case I have three layouts: 809 is for UK, 409 is for US, 419 is for Russian.

4) You know what to do. Simply delete unneeded key. 

5) Reboot you device. Voila!

Image

!!!UPDATE PLS READ!!!

If you want this fix to be permanent:

1) Right-click on "Preload" branch and choose "Permissions".

2) Click on "Advanced".

3) Click on "Disable Inheritance" and confirm disabling. Then click "Apply" button.

4) Head back to "Permissions for Preload" and left-click on System.

5) In "Permissions for System" part of the window UNCHECK "Full Control" box and hit "Apply".

WARNING! DO NOT ACCIDENTALLY UNCHECK THIS BOX ON YOUR ADMINISTER USER

Image

6) Reboot again. 

Be advised: after doing this stuff you WILL NOT be able to add/delete layouts. If you for some reason want to change your layout setting allow Full Control again, make your changes and then uncheck this box again.

https://answers.microsoft.com/en-us/windows/forum/windows_10-start-winpc/cant-remove-a-keyboard-layout-in-windows-10/058acf33-16d9-47f4-a24b-245b8823d90e

## Maybe this for removing Polish keyboard

https://superuser.com/questions/483086/how-do-i-remove-automatically-added-keyboard-layouts/484595#484595

## Below does not work

!!! US keyboard appears after reboot with below solution. Let's try this https://superuser.com/questions/1092246/how-to-remove-us-keyboard-from-windows-10-language-list/1094953#1094953

`Settings > Region & language > Click you language on the list > Options > Add a keyboard > US`

Then remove the US keyboard.

https://superuser.com/questions/1092246/how-to-remove-us-keyboard-from-windows-10-language-list/1172554#1172554
