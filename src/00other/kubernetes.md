- https://www.digitalocean.com/community/tutorials/an-introduction-to-kubernetes
- https://github.com/hermanjunge/kubernetes-digitalocean-terraform

## About

> tools like kubernetes, which are really useful if you're deploying a number of heterogeneous apps
> Something like kubernetes also lets you abstract away the lock-in of your cloud infrastructure
> https://news.ycombinator.com/item?id=12307950

<br>

> When scaling an app out, an administrator cares that the various instances of a service are not all being assigned to the same host.
> On the other side of things, many distributed applications build with scaling in mind are actually made up of smaller component services. These services must be scheduled on the same host as related components if they are going to be configured in a trivial way. This becomes even more important when they rely on specific networking conditions in order to communicate appropriately.
> https://www.digitalocean.com/community/tutorials/an-introduction-to-kubernetes

<br>

> Kubernetes for managing the cluster
> https://circleci.com/blog/container-war/

<br>

> Kubernetes is a system for managing containerized applications across a cluster of machines.
> https://rocket.readthedocs.io/en/stable/Documentation/using-rkt-with-kubernetes/

<br>

>My advice for container orchestration: pick Kubernetes and don't look back (or at least give it a solid try). It falls at the right layer of abstraction and gets so much right. You get automatic container scaling (by CPU usage for now), container composability, service discovery, configuration and (kind of) secret management, portability, it's open source, and really a whole lot more. It's spearheaded by Google, RedHat, CoreOS, and other organizations, so it's fairly safe to say that it won't completely disappear a la Google reader if it's abandoned.
>
>I recently migrated a whole microservice stack of a half dozen services to OpenID connect and Kubernetes in two weeks. This is with about a year of casual familiarity and playing with Kubernetes, and the same migration to OpenID connect would have easily taken me 5 or 6 weeks to do in Amazon ECS, which is what we currently use in production.
>
>Not to mention I can run a cluster on my three computers at home at no extra charge beyond electricity and play around for free. (See, dear, I'm not a hoarder!)
>
>Setting up a cluster is even simpler now with tools like kops and kubeadm. Or just get one provisioned for you by Google or Red Hat with GKE or OpenShift.
>
>I would highly recommend at the very least making it one of the solutions you try.
>
>-- https://news.ycombinator.com/item?id=13256568
