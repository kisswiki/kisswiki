My recent adventure was trying to use a allyx with those miracle cables. VRR only works connected directly to the tv because it does not have a proper vrr implementation, only "freesync".
Using that solution, I immediately lose proper dts of any kind audio passthrough because LG oleds don't passthrough dts via earc.
It's a mess.

Just put a hdmi 2.1 capable AVR in the middle of your gpu and the TV and you are literally forced to use a nvidia card because they actually have a proper hdmi 2.1 with VRR implementation under linux.

- <https://www.phoronix.com/forums/forum/phoronix/latest-phoronix-articles/1543505-valve-s-proton-10-0-beta-released-with-more-windows-games-now-playable-on-linux?p=1543643#post1543643>

1. AMD GPUs on Linux today are effectively stuck at HDMI 2.0 speeds
Despite your RDNA2 board and a “certified HDMI 2.1” cable, the amdgpu driver in the mainline kernel still only negotiates HDMI 2.0 link rates. 4 K @ 120 Hz RGB modes simply never make it through the “HDMI 2.1” handshake, because AMD’s legal team hasn’t finished the required HDMI Forum certification and licensing for their hardware on Linux [AMD Community](https://community.amd.com/t5/general-discussions/will-amd-gpus-ever-support-hdmi-forum-vrr-4k-120hz-on-linux/m-p/629101) [Arch Linux Forums](https://bbs.archlinux.org/viewtopic.php?id=292497).

2. VRR (“FreeSync” / HDMI Forum VRR) is supported…over DP or HDMI 2.0 only
Starting in Linux 5.18, the kernel will enable HDMI Forum VRR and FreeSync by default on RX 6000 series cards—but only at HDMI 2.0 link rates (i.e. ≤ 4 K @ 60 Hz) [AMD Community](https://community.amd.com/t5/pc-graphics/help-vrr-variable-refresh-rate-not-working/td-p/552130). The moment you try to push beyond 60 Hz, the amdgpu driver simply caps you back down.

3. The one and only real “fix” today is DisplayPort

- If your display has a DP input, you can run 4 K @ 120 Hz + RGB 8 bit (or even higher with DSC) and get full Linux-native VRR.

- Unfortunately, most TVs (including LG OLEDs) lack a DP port, so you’re back to HDMI.

4. Active DP→HDMI 2.1 adapters are a mixed bag
A handful of “miracle” adapters using LSPCON bridge chips (e.g. Realtek RTD2173) claim to convert DP 1.4→HDMI 2.1, but in practice Linux support is spotty at best—and the moment you layer in VRR it all falls apart. Even swapping through two or three “firmware-updated” VMM7100 adapters (Cable Matters, StarTech, etc.) won’t get you past 60 Hz RGB plus VRR.

5. AVR in the chain doesn’t help until AMD ships native HDMI 2.1
Putting an HDMI 2.1-capable receiver between GPU and TV simply hands off whatever the GPU will give it — and right now that’s HDMI 2.0 only. You still need an HDMI 2.1-licensed source device (i.e. an NVIDIA card) to get true 4 K @ 120 Hz + VRR through an AVR.

6. And yes, LG’s eARC “feature” kills DTS passthrough
Even if you could force 4 K @ 120 Hz + VRR, LG’s current eARC implementation won’t bit-stream DTS out to your AVR, so you lose native DTS anyway. Your only workaround there is to bypass the TV completely for audio:

- Route audio (and only audio) directly from the GPU’s HDMI output into your AVR over a separate HDMI run, or
- Use a simple HDMI-audio extractor that spits out optical S/PDIF, which LG will pass through.

<https://chatgpt.com/c/68138e8a-65d4-800b-ae71-c345dd6b6c9c>

The licensing group that controls the HDMI standard, the HDMI Forum, has reportedly told AMD that it does not allow an open source implementation of the HDMI 2.1 (or HDMI 2.1+) specification, blocking tools such as AMD's FreeSync from working over HDMI connections at resolution/rate combinations like 4K at 120 Hz, or 5K at 240 Hz.

- <https://grok.com/chat/37544d43-0280-43d2-9095-81f107c98b7d>
- <https://arstechnica.com/gadgets/2024/02/hdmi-forum-to-amd-no-you-cant-make-an-open-source-hdmi-2-1-driver>
- <https://www.theregister.com/2024/03/02/hdmi_blocks_amd_foss/>
- <https://www.gamingonlinux.com/2024/02/the-hdmi-forum-rejected-amds-open-source-hdmi-21-implementation/>
