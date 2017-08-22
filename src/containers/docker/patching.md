The big thing with Docker containers is that you don't patch or update them.
You include patches in the build process that produces a patched image. You then tear down your containers and deploy the new image.
One of the main benefits is once you have a proper pipeline setup you just modify your Dockerfile commit it to git, the build happens automatically and then it's automatically deployed once the new image is checked in to the repo.
Now the all your containers are "magically" patched. Imagine having to patch a CVE in each of your VMs. Quite different.
VMs are pets. Containers are cattle.

https://news.ycombinator.com/item?id=15053438
