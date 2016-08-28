> A single physical CPU can be utilized as many vCPUs. You rarely run out of CPU resources in virtualization solutions. RAM and storage are always the limiting factors...
> Remember, in VMware, CPU utilization is represented in MHz used, not cores...
>
> unless you have applications which can explicitly take advantage of multiple vCPUs, or multiple cores per vCPU there is absolutely zero benefit in allocating multiple vCPUs/cores to a VM. In fact, more often than not you will actually end up with lower performance as opposed to running on a single vCPU that has one core assigned to it, in part because of the scheduling overhead required to run multiple vCPUs.
> FWIW, in a VDI setting the often cited number is 5 vCPUs per physical core.
>
> The underlying problem is basically the same as with process-scheduling on a physical system. As long as the system load is below the number of cores (or even logical processors, in case of HyperThreading) all is well and the processors can handle the load.
> So as long as the concurrent load on all used vCPUs does not exceed the load that can be handled by your physical cores all is well.
> http://serverfault.com/questions/504626/best-practice-vcpus-per-physical-core
