## Cannot install librdkafka on image `node:14.8.0` which is based on debian

## nodejs-legacy

>You must have nodejs-legacy installed on Ubuntu systems in order to be able to install iotivity-node (npm install iotivity-node). Otherwise, the installation fails as it does not find the node executable (see the full error message below. Given that nodejs-legacy seems to do nothing more than installing a symlink called node that points at nodejs

- https://github.com/intel/iotivity-node/issues/149

## Unable to locate package nodejs

Run `apt-get update` before running `apt-get install`

- https://github.com/openstreetmap/openstreetmap-website/issues/2289#issuecomment-506979244

## time-drift and cannot run `apt-get update` when host is Windows

### Not in WSL2

When run:

```Dockerfile
RUN apt-get update -y
```

I got error:

`Release file for http://security.ubuntu.com/ubuntu/dists/focal-security/InRelease is not valid yet`

Cause: `Time Synchronization Lost Communication` and after suspend/sleep/hibernate etc.

To get above status run: Get-VMIntegrationService -VMName DockerDesktopVM`. To get `VMName` run `Hyper-V Manager`.

```PowerShell
Get-VMIntegrationService -VMName DockerDesktopVM -Name "Time Synchronization" | Disable-VMIntegrationService
Get-VMIntegrationService -VMName DockerDesktopVM -Name "Time Synchronization" | Enable-VMIntegrationService
```

sync_docker_time.ps1 to run on every wake/resume:

```PowerShell
Write-Host "Synchronizing your docker time."

$principal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if ($principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
	$name = (Get-VMIntegrationService -VMName DockerDesktopVM | Where-Object { $_.Id.StartsWith("Microsoft:") -and $_.Id.EndsWith("\2497F4DE-E9FA-4204-80E4-4B75C46419C0") }).Name # "Time Synchronization" for English Windows
	Get-VMIntegrationService -VMName DockerDesktopVM -Name $name | Disable-VMIntegrationService
	Get-VMIntegrationService -VMName DockerDesktopVM -Name $name | Enable-VMIntegrationService
	echo $name
	Write-Host "Time synced!"
	Read-Host -Prompt "Press Enter to exit."
} else {
	Write-Host "Elevated privileges are required."
	Start-Process -FilePath "powershell" -ArgumentList "$('-File ""')$(Get-Location)$('\')$($MyInvocation.MyCommand.Name)$('""')" -Verb runAs
}
```

Check time. Run cmd.exe (some problems in git bash): 

```shell
$ docker run -e TZ=Europe/Warsaw debian date --rfc-3339=seconds
2020-08-20 15:55:50+02:00
```

When there is no timezone data:

```shell
ENV TZ 'Europe/Tallinn'
RUN echo $TZ > /etc/timezone && \
apt-get update && apt-get install -y tzdata && \
rm /etc/localtime && \
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
dpkg-reconfigure -f noninteractive tzdata && \
apt-get clean
```

To get timzeone:

`date +%Z`

- https://askubuntu.com/questions/1059217/getting-release-is-not-valid-yet-while-updating-ubuntu-docker-container/1208252#1208252
  - https://github.com/docker/for-win/issues/5593#issuecomment-578488330
    - Solved https://github.com/docker/for-win/issues/4526#issuecomment-539647660
      - https://sumtips.com/how-to/run-program-windows-wakes-up-sleep-hibernate/
      - https://gist.github.com/FilipChalupa/7c4dedec4541ee097f145f874361a297
- https://serverfault.com/questions/683605/docker-container-time-timezone-will-not-reflect-changes/826222#826222
- https://serverfault.com/questions/683605/docker-container-time-timezone-will-not-reflect-changes/856593#856593
- https://superuser.com/questions/309034/how-to-check-which-timezone-in-linux/309037#309037

### In WSL2

`sudo hwclock -s`

- https://stackoverflow.com/questions/38002543/apt-get-update-returned-a-non-zero-code-100#comment109624583_38004106

## The command '/bin/sh -c npm run postinstall' returned a non-zero code: 1

Default user is root in docker, but npm refuses to install global packages as root.

Solution:  `npm i -g --unsafe-perm nodemon`

- https://serverfault.com/questions/875909/npm-postinstall-not-running-in-docker/891399#891399

## old version of npm and self-signed certificates: `npm i`

`Error: SSL Error: SELF_SIGNED_CERT_IN_CHAIN`

Solution:

`npm config set ca=""`

- https://stackoverflow.com/questions/9626990/receiving-error-error-ssl-error-self-signed-cert-in-chain-while-using-npm/22089950#22089950
- https://blog.npmjs.org/post/78165272245/more-help-with-selfsignedcertinchain-and-npm

## build-essential vs buildpack-deps

`apt install build-essential`

or

`FROM buildpack-deps:focal`

- https://elegantinfrastructure.com/containers/cotw-buildpack-deps/
- https://github.com/nodejs/docker-node/blob/master/14/buster/Dockerfile

## Sometimes I need to run build again because some problems with network

## Non-interactive

>This worked for me until one day it didn't. Some kind of `"urgency=high"` message. You need `DEBIAN_FRONTEND`, `y` AND the `q` flag set, i.e. `DEBIAN_FRONTEND=noninteractive apt-get -yq install [packagename]`

- https://serverfault.com/questions/227190/how-do-i-ask-apt-get-to-skip-any-interactive-post-install-configuration-steps#comment1000493_227194
- https://askubuntu.com/questions/972516/debian-frontend-environment-variable
- https://github.com/twilco/kosmonaut/blob/ebe0e32e782a70c19e1ba16ee5da645a9e1dcb35/docker/Dockerfile-ubuntu#L2

## Commands

`docker build` builds image. Overwrites images with the same name.

`docker start` starts container.

`docker run` creates and starts container. Sets ports which cannot be modify easy. Look at `change_hostport_of_existing_container.md`.

- https://docs.docker.com/engine/reference/commandline/build/
- https://stackoverflow.com/questions/44785585/how-to-delete-all-local-docker-images

## In Dockerfile

`CMD vs RUN`

`WORKDIR /some/path/to/create` is equivalent to `mkdir -p /some/path/to/create && cd /some/path/to/create`

- https://stackoverflow.com/questions/51066146/what-is-the-point-of-workdir-on-dockerfile/52964306#52964306
- Dockerfile reference https://docs.docker.com/engine/reference/builder/

## Tutorial

- https://medium.com/swlh/a-free-apache-kafka-cloud-service-and-how-to-quickly-get-started-with-it-8f14520fff35
  - https://github.com/AMIS-Services/online-meetups-introduction-of-kafka/tree/master/lab2-programmatic-consume-and-produce/node-kafka-client

1. Create account at https://cloudkarafka.com
2. Connection details: https://customer.cloudkarafka.com/instance > Click the name of instance
  - DETAILS > Connection details >  Download
  - TOPICS > Copy topic
  - BROWSER > Consumer > paste topic > Consume
2. edit `config.js`
3. `npm i`
4. `node consume.js`.
5. Cloudkafka > BROWSER > Producer > Consumer
  - paste topic
  - Message: enter some message
  - Produce
6. You should see the message in web browser and in terminal where `node consume.js` is run.

### Troubleshooting on WSL2

During install I got output: `make: warning:  Clock skew detected.  Your build may be incomplete.`

And when run `node consume.js` I got error: `node-librdkafka.node: invalid ELF header`.

`rm -rf node_modules && npm i` fixed the issue.

- https://stackoverflow.com/questions/3824500/compiling-c-on-remote-linux-machine-clock-skew-detected-warning
- https://github.com/Blizzard/node-rdkafka/issues/315