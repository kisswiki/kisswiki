https://www.reddit.com/r/programming/comments/8k2frh/the_sad_state_of_sysadmin_in_the_age_of_containers/dz4nx5g/

Debugging anything is a pain in the ass.

With regular local environment setup, everything is within reach. Say I have a postgresql server and I want to inspect the data: trivial (assuming I know how to use postgresql).

Something wrong with the python script? Trivial to see! In fact, there's a terminal tab dedicated to showing the server logs because the only way to run the server is to execute a command on the command line. I can restart it instantly or even run it with different arguments or environment variables.

With Kubernetes, everything is a confusing mess.

- When there's a python error, I can't restart the server without tearing down the whole thing and relaunching it again, which takes several minutes.
- Interacting with the postgres database requires setting up port mappings, and that's not easy to do. There's a command to do it but it keeps expiring and you never know if the mapping is on or not. Not to mention I never know which port it is and keep having to refer to some docker file somewhere, and I have to remember where that docker file is.
- It keeps resetting the database and I don't know when or why it does that. I do know that happens when I have to rebuild the environment to force the server to restart, but I think there are other scenarios where it does that.
- When you sleep the laptop and wake up, the docker clock goes out of sync and suddenly random things start failing on the server (the things that depend on the current time), and you have to remember to run some special script to put the docker in sync, and you never know if takes effect right away or after some time, or maybe you have to restart the server again for the time sync to work. Who knows? I certainly don't know.

Bottom line is, the environment is completely out of my control. Every step in the process of developing/debugging has much higher friction than is needed.

And the thing is, it provides me absolutely no benefit in return!

It's just a fucking piece of shit.

##

while a minikube environment has a learning curve and is occasionally difficult to debug, I haven't run into any of OP's problems (to which my answers are exec into or kill the pod, kubectl port-forward, use a persistent volume claim

##

Not sure of your exact setup but:

Kill the pod or exec into the pod running your server. If you mean runtime debugging, use a tool like PyCharm that supports remote debugging inside containers.

It should be as simple as something like kubectl port-forward svc/postgres 5432:5432. If it's not, then your DB isn't defined as a service and ops dude fucked up.

That shouldn't happen at all, ensure your database can retain storage across different replicas with a persistent volume claim. Honestly your ops dude should be installing postgres with a helm chart that already has this shit configured.

I haven't run into this bug on minikube, but I would definitely report it upstream.

##

k8s is still a young project, and personally I did avoid it for a few years but it's starting to mature - 1.7 and 1.8 are great releases. I'm now using it in production and haven't experienced any real issues.

I'm running on Google's implementation, GKE, though it's a pretty basic patch set over stock Kubernetes and not some wildly different thing. Vendor implementations must be very similar so they can confirm to the CNCF Certified Kubernetes spec.

If you want to host Kubernetes yourself, I'd go with a vendor solution like Red Hat's OpenShift.

##

A pod will only restart according to its restartPolicy. Set it to never. Your database disappearing is a misconfiguration and not the fault of Kubernetes.

##

Uh, what? It sounds from your description like you are just interacting with a particularly shittily constructed set of containers that someone else built (of course, the implication is that you don't have the time or knowledge to fix them, otherwise you wouldn't just blame the tool).

>Debugging anything is a pain in the ass

Use a remote debugger

>... there's a terminal tab dedicated to showing the server logs because the only way to run the server is to execute a command on the command line.

`docker logs -f <container> kubectl logs -f <pod>`

>I can restart it instantly or even run it with different arguments or environment variables.

`docker restart <container> docker run -e ENV_VAR=foo <image> arg1 arg2`

`kubectl delete pod <pod> <- deployment should recreate`

>When there's a python error, I can't restart the server without tearing down the whole thing and relaunching it again, which takes several minutes

There is no reason why you can't restart processes running within a container, you just have to set it your processes appropriately. If the root process exits, the container exits. Also, if your container takes several minutes to start .... something is wrong. Starting a properly built container should be nearly the same as starting a regular process, unless you decided to embed some crazy startup procedure into it.

>Interacting with the postgres database requires setting up port mappings, and that's not easy to do

`-p 5342:5432`?? I use both the library/postgres and custom postgres images every day. Use a compose file if you want multiple containers to always startup the same way with the same options. And while we're at it ...

>Say I have a postgresql server and I want to inspect the data

psql takes host/port. Nothing stopping you from connecting to postgres in a container and poking around.

>It keeps resetting the database and I don't know when or why it does that

Are you mounting a volume for local storage? If not, then your database gets wiped when you remove the container and create a new one. The same as you should expect for any stateful container.

When you sleep the laptop and wake up, the docker clock goes out of sync

I've never run into that problem somehow, but that sounds quite irritating.

Based on your description I'm 99% sure that someone you work with dropped every process you need to run into one image, probably from the setup code for VM's? So you have a ton of processes running in one container, most are not accessible, and you basically have to treat it like a shitty-halfway-VM.

That is not how docker is meant to be used, and I'm not surprised you're having a bad time. Almost certainly pain caused by your setup, not the tool.

EDIT: I know I gave the docker commands but there is an analogous piece for everything in kubernetes. The commands aren't hugely important, your problems seem mostly inflicted by whoever set up your deployment.

##

>`docker logs -f <container> kubectl logs -f <pod>`

The pod name keeps fucking changing, e.g. between server restarts.

>`docker run -e ENV_VAR=foo <image> arg1 arg2`

The image is not up because the server is crashing. Sometimes the server is crashing because of a syntax error. Othertimes it's down because it doesn't like the database state. I can fix the database state if only I could shell into the server, but I can't because it's crashed.

##

I use Docker every day with multiple containers all talking to one another. I'm on a laptop so I'm sleeping it and waking it all the time. I have not seen these sort of problems. What the fuck are you doing?

- Checking your Python output is no more difficult than `docker logs <container name> -f`, I keep a tab open with this command running all the time
- A port mapping in docker is as difficult as `-p <local port>:<container process port>`
- If your container is blown away, data not contained in the original image will be blown away too. Use the `-v <local path>:<container path>` volume mapping to map a path in the container to some location on the host.

The benefit I gain from Docker is I get to do my development and testing on a Mac and then deploy to Linux systems easily. I can even build artifacts for production on my dev Mac and distribute them to multiple Linux machines trivially. It's pretty trivial to push things into a container for development like dev-only environment variables or map a volume to my git working copy for development but bundle it all up in an image for deployment. The clean cut between "artifact" and execution environment is really useful. When deployed I can have containers only accessible to other containers and completely blocked off from the outside world.