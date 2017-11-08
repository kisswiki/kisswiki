## Uninstall McAfee Enterprise

Because we cannot uninstall the program when it is in Managed Mode, we have to first change McAfee into Unmanaged Mode.

1. Run `cmd.exe` as administrator.
2. `cd "C:\Program Files (x86)\McAfee\Common Framework"` or `cd "C:\Program Files\McAfee\Common Framework"`.
3. Turn McAfee into Unmanaged Mode: `frminst.exe /remove=agent`.
4. Uninstall McAfee VirusScan Enterprise, McAfee AntiSpyware Enterprise.
5. remove McAfee Agent. Make sure McAfee Agent is removed last

https://it.uoregon.edu/node/4094

This worked to uninstall VirusScan Enterprise 8.8 without goin into Unmanaged Mode:

`msiexec /x {CE15D1B6-19B6-4D4D-8F43-CF5D2C3356FF} REMOVE=ALL REBOOT=R /q`

https://www.growse.com/2012/04/16/want-to-remove-mcafee-virusscan-enterprise-here-s-how/

## Disable McAfee Enterprise

Notice that it still will occasionally run McAffe Core Installer eating your resources. If that bothers you, uninstall it.

### Disable Access Protection

- Click Start, Programs, McAfee, VirusScan Enterprise, VirusScan Console.
- Right-click Access Protection and select Disable.

https://kc.mcafee.com/corporate/index?page=content&id=KB52204

### Disable the option Prevent McAfee services from being stopped

1. Start > Programs > McAfee > VirusScan Console.
2. Right-click **Access Protection** and select **Properties**.
3. Deselect **Prevent McAfee services from being stopped**.
4. Click **Apply**.

Disable anything that can be disabled.

http://superuser.com/questions/67265/how-to-disable-a-mcafee-service

### Disable services

`Start > services.msc`

I was able to stop and disable:

- McAfee Framework Service
- McAfee McShield
- McAfee Task Manager

### Check

Control Panel > System and Security > Security and Maintainance > Click 'Security' fold and see that Spyware is off, and Virus protection is off.
