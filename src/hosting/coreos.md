https://www.quora.com/How-is-CoreOS-compared-to-Ubuntu

##

CoreOS has very little in common with Ubuntu. Most people know Ubuntu as a desktop OS. However Canonical also provides server and other versions of Ubuntu.

CoreOS is meant for large scale container deployments. One can think of containers as a poor man’s Virtual Machine. Containers provide partial isolation for applications. This has positive and negative benefits. One positive is that containers can be deployed in milliseconds, since the overhead is less. A negative would be restrictions in patching since all Containers use the same underlying OS. The most popular container technology these days is Docker.

CoreOS is very bare-bones since its only purpose is to run containers in a cluster. Also it is reputed not to have a package management system so updates involve replacing a CoreOS instance.

Another difference is that CoreOS is meant to be run in the cloud. The recommended way of deploying is through an Amazon Machine Image (AMI) which runs on their AWS cloud. CoreOS also runs on other clouds , such as digital ocean, openstack etc. You can install it as a VM under vmware, virtualbox and , if necesary, on a bare metal system.

##

The goal of CoreOS is to make deployment of an application in a multi-machine environment, using container technology EASY and have a loose coupling between OS and application running on it, this helps CoreOS machines to the upgrade OS as soon as updates are available. CoreOS is designed for running containers simple and efficiently.

CoreOS doesn’t have any packages manager like apt or yum hence anything running inside a CoreOS should be containers which has dependencies packaged within.

It helps deployment in various ways - systemd, ETCD, support to docker, rkt.

There are lot of ‘service and container management’ service that can be easily built over a CoreOS cluster like Fleet or Kubernetes which will help deployment in multi-machine environment.