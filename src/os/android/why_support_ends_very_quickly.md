skeevy420

The phone manufacturers are reliant on Qualcomm and other chipset manufacturers to keep on providing drivers. Samsung can't update a Galaxy WhoGivesAShit if Qualcomm doesn't provide drivers for the 510 GPU or whatever past Android 5 which forces Samsung to design a new phone around the 512 GPU that will get Android 5.5 to Android 7 drivers. Once that new version rolls around they can either have their own internal XDA rom hacking team to support older phones with drivers that are no longer supported by their manufacturer or use new hardware that is supported by its manufacturer.

That said, Google has made it easier to re-use old drivers for newer versions of Android which is why you can go to Amazon and eBay and find shitloads of old Android 3 and 4 tablets repackaged as Android 6 and 8 tablets (which has made it fucking difficult as fuck to buy cheap tablets). The problem is that it seems that very few phone manufacturers want to have a long-term rom hacking team to maintain older products because they all make their money selling hardware. Google, who sells software and can get away with shittier hardware sales than everyone else, can afford to keep the Nexus and Pixels and What-have-yous updated longer than LG can keep their other flaghships up-to-date.

The major manufacturers also have more liability than the crap on Amazon which is why they churn out so many phones. Qualcomm drops support, rom hacking team makes drivers use legacy interfaces, new exploit comes out and uses old drivers, phone manufacturer gets in trouble. If they stay up-to-date, however, they get to blame Qualcomm and the liability shifts from them to where they get their stuff.

Then, at least in America, there are the phone carriers to consider. They all want their own special version of a phone and they want a new one every couple of months just so they can say "we have this new phone with 15 razors". That dictates a lot of the trends the assholes above do. Samsung says "why have LTS when those American assholes want new crap every 6 days?" and Qualcomm says "why have LTS when those Korean assholes keep making new crap for the American assholes". This is a case of shit flows down hill. 


jo-erlend

I'm only asking why it is not possible for one phone to get a kernel patch when so many others have the same versions of Android and does. You say it's because patching the kernel is the same amount of work as designing a new BSP for a new device for a new version of Android, right? I don't understand why that would be the case. Can you explain it in more technical terms?


skeevy420

Because the kernel version used varies greatly from manufacturer, device, chipset maker, etc. Android version is irrelevant in regards to kernels for up to Android 8 or 9 (not sure which) because Google didn't enforce minimum kernel versions until then.

My LG phone, a V20, from 2016 or 2017 still runs Linux 3.x. Then there are a lot of half-ass published kernel sources where they'll release the kernel version used but not any of their closed-door changes that make it difficult to even update a phone from 3.xx to 3.xy. You'd be very, very surprised about just how many different kernels are in use and the efforts that some open source developers do to even bring a device up to using a 4.0 kernel, let alone any kernel past 4.4...it's freakin crazy fragmented on Android.

Nowadays we have Qualcomm, etc moving drivers from the kernel to userspace but then not providing updates when the Android userspace updates -- in the custom rom scene, that's where they'll figure out how to build Android 8 with Android 7's audio stack (just making something up because I've been out of the rom game since around 5.5/6.0) -- but manufacturers can't do that backport effort. Android might be open source, but Google is very stringent on what they'll allow to be called Android and using a fustercluck of sources, kernels, and blobs from 6, 7, and 8 to build a 9 rom is just not allowed and that leaves them in a bind on how to proceed forward...or another line gets drawn and there is further fragmentation of everything.

Android development is a fustercluck.


starshipeleven

>Then, at least in America, there are the phone carriers to consider. They all want their own special version of a phone and they want a new one every couple of months just so they can say "we have this new phone with 15 razors". That dictates a lot of the trends the assholes above do.

This is true for OEMs too, but the main point here is that having a new phone every 6 months is the only way to get money in a saturated market if your businness model is based on hardware sales and not on services.


starshipeleven

Sorry what, How many Android phones ever get a kernel patch in ever? Afaik only Google devices get them, and only very rarely when it is an actual functionality bug.

The kernel is part of the BSP/SDK and none touches that ever. It isn't vanilla kernel, it's hacked around and has crappy blobs with no shim interfaces (like NVIDIA and Broadcomm blob wifi drivers that allow anyone to adapt the shim to kernel changes and keep the blob happy). Adding patches may or may not break the blobs (upgrading kernel version 99% breaks blobs). You think the OEM has all the source? No they don't, they have kernel source and blobs and documentation with NDAs on it. The hardware manufacturers (that made the BSP/SDK) have the source or otherwise the ability to get updated blobs.

This is the entire reason why Android from 8 onwards with Project Treble has done more shenanigans to isolate more and more from the BSP and allow easier upgrades while not touching the hardware support part of the OS.

The same situation can be found in embedded devices like NAS, routers and wifi access points, a sizeable amount of new devices are still shipped with kernel 2.6 and proprietary stuff on top because the hardware manufacturer does not feel like upgrading their proprietary stuff to run on the newest Linux kernel versions. 


It makes more sense when you stop thinking of mobile devices as computers. PCs are an outlier, with actual standards and ridicolously huge retrocompatibility and user freedom, which is weirdly enforced by Microsoft's iron fist.

For everything else it's always been like this, the concept of "operating system" and "updates" is completely alien, each product line is its own thing and it loses support as soon as legally possible.

This is actually one of the reasons Linux is so big in embedded, because it allows manufacturers to keep doing like they always did and not having to conform to any standard or give up any of their freedoms.

This is also one of the reasons quite a few people I know and some well-known tech youtubers have thrown their trust and support behind Sony's self-driving vehicle efforts without a second thought. Sony (due to playstations and other consumer electronics products they make) is likely to grasp the basics of complex computing devices needing isolation and to be locked down, also needing updates and long software support for bugs and whatnot. Meanwhile the average car manufacturer still fails to implement basic shit like securing car remote lock/unlock signals against attacks and still place the onboard media system on the CAN bus with total access to all onboard systems that actually run the damn car, while talking up of how they plan to make AI self-driving cars.

https://www.phoronix.com/forums/forum/phoronix/latest-phoronix-articles/1154414-android-x86-is-still-working-towards-its-9-0-pie-release?p=1154552#post1154552
