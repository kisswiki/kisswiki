Typically, “serverless” is marketing speak for “you don't need to manage the underlying virtual machines”. For compute, this often means “pick n virtualized CPU cores and m megabytes of memory” and the cloud provider will schedule your workload accordingly on a warm pool of virtual machines that they manage.



"cloud computing" is a general term for a lot of things. There's a lot of divisions:

- VPSes
- Infrastructure as a Service
- Platform as a Service
- Serverless

and probably many more. As you go down this list, you give up control, but get benefits.

A VPS is a "virtual private server", so you sign up, and you get a thing you can ssh into. It's a virtualized computer, running on the same hardware as a bunch of other computers, but it feels like a full computer. You have full control and can do whatever you want.

Infrastructure as a service is sort of a broader but similar term. Some people say that VPS has to be real hardware, and Iaas has to be virtualized. IAAS is just a newer term for the same basic idea, as far as I'm concerned.

A Platform as a service gives you a way to deploy a specific platform. Think Heroku back in the day; they support Ruby on Rails, and you deploy your Ruby on Rails app, and you're done. You give up managing individual servers, but you also don't have to do the work of managing individual servers. Just slide the slider and boom, you've scaled. That slider still controls a number of servers, but maybe they're split between "web server" and "database servers" or whatever.

Serverless computing changes the abstraction again; instead of thinking about servers at all, you think about "functions". Maybe this is a better way to put it: With PaaS, you're scaling your whole app. With Serverless, you can scale each individual route. The notion of your app being on a specific server is totally gone; you instead scale specific inputs and outputs.

https://www.reddit.com/r/rust/comments/97iavn/zeit_using_rusthyper_as_an_example_for_their_new/e48qz8z/?context=8&depth=9
