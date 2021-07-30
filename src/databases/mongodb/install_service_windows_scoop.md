`scoop install mongodb`

Run cmd.exe as Administrator

NOTE: `mongod --install` installed service, but I wanted to change config path. Couldn't install service with mongod:

```cmd.exe
>mongod --config %USERPROFILE%\scoop\apps\mongodb\current\bin\mongod.cfg --install
Error parsing command line:  Multiple occurrences of option "--config"
```

```powershell
>New-Item -ItemType Directory -Force -Path $Env:USERPROFILE\.local\share\mongodb
:: If you are creating config from scratch
>New-Item -ItemType Directory -Force -Path $Env:USERPROFILE\.config\mongodb
>copy $Env:USERPROFILE\scoop\apps\mongodb\current\bin\mongod.cfg $Env:USERPROFILE\.config\mongodb\mongod.cfg
```

- https://stackoverflow.com/questions/16906170/create-directory-if-it-does-not-exist/16911470#16911470

Edit `%USERPROFILE%\scoop\apps\mongodb\mongod.cfg`.

NOTE: dbPath and systemLog path needs to be absolute paths. Cannot use `%USERPROFILE%` or `$Env:USERPROFILE` etc.

```
# Where and how to store data.
storage:
  dbPath: C:\Users\rofro\.local\share\mongodb\data
  journal:
    enabled: true
#  engine:
#  wiredTiger:

# where to write logging data.
systemLog:
  destination: file
  logAppend: true
  path:  C:\Users\rofro\.local\share\mongodb\log\mongod.log

# network interfaces
net:
  port: 27017
  bindIp: 127.0.0.1
```

First try to run this

```cmd.exe
>%USERPROFILE%\scoop\apps\mongodb\current\bin\mongod.exe --service --config %USERPROFILE%\.config\mongodb\mongod.cfg
```

If it works, then run below command.

NOTE: Beware that there should be space before equal sign, like `binPath= "...`.

NOTE: There is one double quote around whole `binPath=` value.

NOTE: Theres is also https://docs.mongodb.com/manual/reference/program/mongod/#std-option-mongod.--directoryperdb

```
:: `start= auto` or `start= delayed-auto`
>sc.exe create MongoDB binPath= "%USERPROFILE%\scoop\apps\mongodb\current\bin\mongod.exe --service --config %USERPROFILE%\.config\mongodb\mongod.cfg" DisplayName= MongoDB start= auto
:: powershell needs to be run as administrator for below
>sc.exe start mongodb
:: Find out if STATE is RUNNING
>sc.exe query mongodb | findstr /i state
:: Connect to mongodb
>mongo
```

To delete service you may need to close services.msc. Also didn't work without `exe`: `sc delete mongodb`. Then:

```powershell
>sc.exe delete mongodb
```

- https://stackoverflow.com/questions/2438055/how-can-i-run-mongodb-as-a-windows-service/41073438#41073438
  - https://stackoverflow.com/questions/22969325/how-to-install-mongodb-as-service-on-windows-8-1/32331910#32331910
  - multiline and double quotes https://stackoverflow.com/questions/51095435/create-the-mongodb-windows-service-command-does-nothing/51097291#51097291
  - Without config https://stackoverflow.com/questions/2741039/running-mongod-as-a-windows-service/4099016#4099016
  - https://stackoverflow.com/questions/4661670/cannot-start-mongodb-as-a-service/30536693#30536693
- https://docs.mongodb.com/manual/tutorial/install-mongodb-on-windows/
- https://stackoverflow.com/questions/3325081/how-to-check-if-a-service-is-running-via-batch-file-and-start-it-if-it-is-not-r/3325102#3325102
  - https://stackoverflow.com/questions/353161/how-to-test-whether-a-service-is-running-from-the-command-line/40903034#40903034
- `net` is sync, `sc` is async. So using `sc.exe start <service>` sate will be `START_PENDING` and then later will be `RUNNING` https://superuser.com/questions/315166/net-start-service-and-sc-start-what-is-the-difference/552234#552234
- https://www.wikihow.com/Copy-Files-in-Command-Prompt
- https://serverfault.com/questions/919546/set-service-starttype-to-automatic-delayed
  - example with depend https://stackoverflow.com/questions/35828041/how-to-install-a-service-with-the-delayed-auto-startup-type-in-windows-xp
- https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/sc-config

## Windows could not start the MongoDB4 on Local Computer

> Windows could not start the MongoDB4 on Local Computer. For more information, review the System Event Log. If this is a non-Microsoft service, contact the service vendor, and refer to service-specific error code 100.

Solution: Look at mongodb log.

You man also look at System EventLog

`Right-click Start > Event Viewer > On the left: Event Viewer > Custom Views > Administrative Events`

There was just message `cannot create another system semaphore mongodb`.

- https://stackoverflow.com/questions/32973499/the-mongodb-service-terminated-with-service-specific-error-cannot-create-another/32974341#32974341
- https://www.dummies.com/computers/operating-systems/windows-10/how-to-use-event-viewer-in-windows-10/
