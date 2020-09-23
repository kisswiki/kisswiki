# How to use openshift image locally in docker?

## Where to get images from redhat

You can search here https://catalog.redhat.com/software/containers.

For example this image https://catalog.redhat.com/software/containers/ubi8/nodejs-12/5d3fff015a13461f5fb8635a.

On tab [Get this image](https://catalog.redhat.com/software/containers/ubi8/nodejs-12/5d3fff015a13461f5fb8635a?container-tabs=gti) are instructions how to pull image from registry.redhat.io.

But first we need Red Hat Developer Account:
1. Create normal Red Hat account on https://redhat.com.
2. Then Sing up for Developer Account on https://developers.redhat.com/.
3. Then go to your account settings https://sso.redhat.com/auth/realms/redhat-external/account/ and copy your Red Hat Login ID
4. `docker login registry.redhat.io` and provide Red Hat Login ID and password.
5. We probably don't need to pull image manually with `docker pull registry.redhat.io/ubi8/nodejs-12` if it is in Dockerfile in `FROM`.

## UBI or not UBI?

>When deploying on OpenShift and/or RHEL, developers can use any package accessible via their Red Hat subscription. When deploying on non-Red Hat platforms, developers can only use the reduced set of packages that are tagged with the UBI-EULA. 
>
>“UBI content” and “non-UBI content” are different primarily due to the EULA. The former can be freely redistributable; the latter is not.

https://developers.redhat.com/articles/ubi-faq

## Dockerfile

```Dockerfile
FROM registry.redhat.io/ubi8/nodejs-12:latest

USER 0
# required: diffutils contains cmp
# iputils contains ping
RUN yum --disableplugin=subscription-manager -y install python3 diffutils
USER 1001

# Add application sources
COPY . .

# Install the dependencies
RUN npm install

# Run script uses standard ways to run the application
CMD npm run -d start
```

- `USER 0` is root
- `COPY . .` is equivalent to `cp -r . /opt/app-root/src`
- `yum --disableplugin=subscription-manager` is needed if you don't have redhat subscription.
- If you are preparing base image, run `yum clean all -y` after `yum install`.
- `RUN npm install` - No need to cd to directory. This is probably S2I, source2image, so that you can easily run some nodejs and other applications.

## Run image

```bash
docker build -t pre-ui/server .
docker run --name pre-ui-server -p 8080:8080 -d -e RTDMURL='http://host.docker.internal:4000' -e DISABLE_KAFKA=false pre-ui/server
docker ps
docker exec -it <CONTAINER_ID> sh
# in another terminal
docker logs -f <CONTAINER_ID>
# in another terminal
docker stop <CONTAINER_ID>
```

- `docker build` will overwrite image with the same name
- If you do not detach with `-d` while `docker run`, you will see output. Otherwise you need to use `docker logs`.
- `-e RTDMURL='http://host.docker.internal:4000'` - passing environment variables to container
- `host.docker.internal` is a dns to access host.
- you can also provide name: `docker run --name <CONTAINER_NAME>` and use `CONTAINER_NAME` instead of `<CONTAINER_ID>` in subsequent commands like `stop`.
- If after `docker exec -it` running `ls /opt/` shows empty directory, you have probably enterd stopped image.
- This works in `git bash`: `docker exec -it <CONTAINER_ID> ls`. This doesn't work in `git bash` but works in `cmd.exe`: `docker exec -it <CONTAINER_ID> ls /opt/`.

## Links

- https://catalog.redhat.com/software/containers/ubi8/nodejs-12/5d3fff015a13461f5fb8635a
  - https://github.com/sclorg/nodejs-ex
- https://docs.docker.com/engine/reference/commandline/build/
- https://stackoverflow.com/questions/55642737/how-to-use-ping-on-fedora-docker/55642818#55642818
- https://forums.docker.com/t/accessing-host-machine-from-within-docker-container/14248/27
  - https://docs.docker.com/docker-for-windows/networking/#known-limitations-use-cases-and-workarounds
- https://stackoverflow.com/questions/30494050/how-do-i-pass-environment-variables-to-docker-containers
- Beware of binding to `127.0.0.1` https://stackoverflow.com/questions/39525820/docker-port-forwarding-not-working
- https://stackoverflow.com/questions/20845056/how-can-i-expose-more-than-1-port-with-docker
- https://stackoverflow.com/questions/47829345/how-to-see-the-logs-of-a-docker-container#comment95284246_47829441
  - https://docs.docker.com/engine/reference/commandline/logs/
  - https://docs.docker.com/config/containers/logging/
  - https://stackoverflow.com/questions/49116606/docker-watch-logs-in-real-time-while-building-image
  - copy log from container `docker container cp 9917:/tmp/builderr024321.log .` https://pythonspeed.com/articles/debugging-docker-build/
- https://stackoverflow.com/questions/18152168/using-cygwin-for-ffmpeg-build-error-cmp-command-not-found/18152456#18152456
- `yum install python3` to add python to ubi/nodejs image
  - https://github.com/IBM/nodejs-express-app/issues/31#issuecomment-574741666
  - https://python-forum.io/Thread-How-do-I-install-Python-3-8-1-in-a-RHEL-8-UBI-container?pid=101844#pid101844

## To read

- https://docs.openshift.com/container-platform/4.5/openshift_images/create-images.html
- https://developers.redhat.com/blog/2018/03/12/rhoar-nodejs-annoucement/
  - https://developers.redhat.com/blog/2018/04/16/zero-express-openshift-3-commands/
  - https://learn.openshift.com/middleware/rhoar-getting-started-nodejs/
- https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux_atomic_host/7/html/getting_started_with_containers/using_red_hat_universal_base_images_standard_minimal_and_runtimes
- https://github.com/IBM/python-ubi-openshift
- https://www.openshift.com/blog/a-guide-to-openshift-and-uids
- https://www.openshift.com/blog/create-s2i-builder-image
- https://www.openshift.com/blog/how-to-use-entitled-image-builds-to-build-drivercontainers-with-ubi-on-openshift
- https://docs.openshift.com/container-platform/4.5/openshift_images/using_images/using-images-overview.html
- https://www.zdnet.com/article/red-hat-universal-base-image-rhel-containers-for-everyone/
- - https://github.com/evanshortiss/openshift-typescript-example