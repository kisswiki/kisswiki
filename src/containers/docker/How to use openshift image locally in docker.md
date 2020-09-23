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
- `RUN npm install` - No need to cd to directory. This is probably S2I, source2image, so that you can easily run some nodejs and other applications.

## Run image

```bash
docker build -t pre-ui/server .
docker run --name pre-ui-server -p 8080:8080 -d -e RTDMURL='http://host.docker.internal:4000' -e DISABLE_KAFKA=false pre-ui/server
docker ps
docker exec -it <CONTAINER_ID> sh
# exit or in another terminal
docker stop <CONTAINER_ID>
```

- `docker build` will overwrite image with the same name
- `-e RTDMURL='http://host.docker.internal:4000'` - passing environment variables to container
- you can also provide name: `docker run --name <CONTAINER_NAME>` and use `CONTAINER_NAME` instead of `<CONTAINER_ID>` in subsequent commands like `stop`.
- If after `docker exec -it` running `ls /opt/` shows empty directory, you have probably enterd stopped image.
- This works in `git bash`: `docker exec -it <CONTAINER_ID> ls`. This doesn't work in `git bash` but works in `cmd.exe`: `docker exec -it <CONTAINER_ID> ls /opt/`.
