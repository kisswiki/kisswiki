Unless you sell support: it's not your job to support it in the first place. If you do sell support, and you think you can dictate to companies what container/virtualization/orchestration frameworks they should be using, you're leaving a lot of support contracts on the table.

Containers are not a way of packaging and distributing software, that's what an operating system's package manager exists for. Containers are a tool for allocating and managing infrastructure resources. Some random developer should not be dictating to an organization how they should be allocating their compute resources.

If the only way to install your program is to run a Dockerfile: you have failed as a developer to adequately package your software. The absurdity of distributing software as containers becomes apparent if you spend any appreciable time working with proprietary software. In my organization your Docker containers would not be able to do something trivial like "spin up an instance of MS SQL Server" as we'd now be out of compliance and liable to get audited.

Properly packaging software means:

- Providing build instruction(s) for supported OSes
- Providing a list of service dependencies
- Exposing configuration parameters for those services (hostname, port, credentials, etc.)
- Optionally creating binary packages for supported operating systems

Interestingly enough, when you take the time to document this stuff, you'll find that a lot of volunteers from many communities will start popping up and packaging your software for all sorts of Linux distributions, etc. -- Because, as it turns out, many administrators like having their operating system aware of what precisely has been installed regardless of whether that system is a host, a guest, or a container.


I agree with what you say. Though as far as projects i release for free, i spend my time writing code. Make it compatible with Alpine, which in turn makes it compatible with pretty much all distros. The Dockerfile defines the build process, which you can translate to whatever distro you're on.

It gets much more complicated, when the app depends on several other services. If i'd have to handhold the power users, on how to configure their stack - i would spend less time with code. Compose is a great tool, where i can provide the necessary services - with the configurations the app depends on. For company projects, we have ops people to write configuration documentation.

Just like third party scripts, it's up to you or your company to analyze the software - to make sure it lives up to your audit requirements. A private docker registry is a great first step, review the dockerfiles, customize and push to your registry for production deployments. Portus is what we use internally, and what i use for my pet projects.

https://www.reddit.com/r/programming/comments/8k2frh/the_sad_state_of_sysadmin_in_the_age_of_containers/dz5974p/