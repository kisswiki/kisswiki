- https://github.com/mpc-hc/mpc-hc
- MPC-BE (Media Player Classic Black Edition) https://sourceforge.net/projects/mpcbe/
- https://mpv.io/
  - http://www.smplayer.info/
  - https://github.com/cmdrkotori/mpc-qt
- https://potplayer.daum.net/
  - https://wiki.mikejung.biz/PotPlayer#Potplayer_Optimal_MadVR_Video_Settings_for_GTX_970_and_GTX_960
  - Pot player is a hack job that doesn’t respect the licensing agreements and wishes of several open source projects. I know this is the piracy subreddit but I don’t like the idea of supporting software that goes against the intent of good open source software. https://forum.doom9.org/showthread.php?t=165743 https://www.reddit.com/r/Piracy/comments/7wm0xf/vlc_media_player_30_full_hardware_decode_support/du1pxe8/
- https://www.videolan.org
  - https://github.com/nurupo/vlc-pause-click-plugin
- https://kiooplayer.com/

## MadVR

- https://wiki.mikejung.biz/MadVR
- https://www.reddit.com/r/software/comments/7qdave/explain_to_me_how_is_madvr_a_better_renderer_than/

###

I tested it with the 4k 60FPS HDR Billy Lynn video and it kicked MPC's ass. VLC is BACK!

VLC doesn't handle 4k content very well. Dropped frames and stutters all over the place on several of my systems. MPC+MadVR is great for even high bitrate conent with HDR. Smooth and looks fantastic. Only the interface is a little meh, but it's functional.

https://www.reddit.com/r/Piracy/comments/7wm0xf/vlc_media_player_30_full_hardware_decode_support/

###

Media Player Classic + MadVR is way better imo I just downloaded VLC 3.0 and made a comparison, and its really clear MadVR has way sharper clear image. Here are my settings if anyone wants them so you dont have to go through the hassle of setting shit up, but i highly suggest using that instead for crispier quality. Also this is on 1050ti, i5. you do need to have good specs to use the program, or you will get frameskips. It is possible to go beyond this too and make the image even better but thats on you, my rig coudn't handle it cause i was getting frameskips on 4k video every 10-15 seconds. Also second monitor option for HDR, chose it if you want MadVR to automatically convert HDR to SDR on the FLY.

This is MadVR+ K-Lite Codec Pack Mega

https://www.codecguide.com/download_k-lite_codec_pack_mega.htm

http://madvr.com/

https://streamable.com/1es39

https://www.reddit.com/r/Piracy/comments/7wm0xf/vlc_media_player_30_full_hardware_decode_support/
###

Pardon my ignorance, but I'm just curious what MPC-HC has over VLC? I see people who like to use it and I'm just wondering what all the fuss is about?


It has support for external, high quality renderers (madVR) and filters (LAV, VobSub) which makes the output much better than VLC's.

The interface (bar the settings) is simple, familiar and kind of nostalgic.


I tried madVR with all the extra options and I did not see the difference with VLC... Apart from CPU/GPU usage.


It largely depends on the madvr settings you choose and the content you watch. Low-res content should look a little better, colours should be more accurate and/or less blurry. The big one for me is debanding, which prevents the blocky "shimmer" effect you get when scenes fade in and out.

For anime, the external subtitle renderers you can get are objectively better than VLC's.

High-bitrate 1080P live-action media should look just as good on really any media player.

https://www.reddit.com/r/opensource/comments/6nnm0z/mpchc_is_sadly_dead_anyone_know_a_good_alternative/

###

You can't use madVR with mpv, but that doesn't mean you can't have high quality scaling and dithering. madVR has NGU, which mpv doesn't have, and it has error-diffusion dithering, which mpv doesn't have, so if you need those, the lack of madVR support could be a deal breaker, but the difference in quality between those algorithms and the ones in mpv is fairly subjective. I feel like all the trendy super-resolution algorithms introduce too many ringing, aliasing and strange watercolour-like artefacts, so I much prefer mpv's EWA Lanczos filter, though if you want, there are a number of super-res algorithms available as mpv user-shaders, including SSimSuperRes and NNEDI3. See: https://github.com/mpv-player/mpv/wiki/User-Scripts#pixel-shaders
mpv supports display calibration and HDR conversion as well. You can load a 3DLUT for display calibration if you want, but for mpv, you would more likely load an ICC profile and have it generate the correct LUT automatically. You can even just let it pick up the ICC profile configured in the operating system. As for HDR, there are a number of built-in tone mapping algorithms: https://mpv.io/manual/master/#options-hdr-tone-mapping


I'll grant you that you can take advantage of calibration in mpv if you can generate a ICC profile containing 3dlut data, I didn't know that.
I disagree on a couple of points though. Jinc may in fact produce noticeable ringing (while NGU doesn't), and neither produce aliasing so asserting the opposite seems strange. The difference in sharpness is also quite obvious. On top of that mpv's anti-ringing filter is very basic in comparison.

HDR processing also seems quite limited and requires a lot of hand-tuning compared to madVR.


I'll admit I haven't watched any HDR content in mpv yet, but it supports all the standard tone-mapping algorithms (hable, reinhard, etc.) and apparently the default algorithm (mobius) was chosen for its colour accuracy.

I'm not saying madVR doesn't have its strengths. Error-diffusion dithering is strictly more accurate than what mpv does, and for people who like super-resolution upscalers, madVR tends to have a larger selection and faster implementations. Still, it would be disingenuous to say that madVR has a larger feature-set than mpv. They have different feature-sets. mpv's convolution-based upscalers are much more tunable and its colour management is more advanced, since it can use an ICC profile to auto-generate a LUT for any input gamut, rather than relying on an external CMS for this.

https://news.ycombinator.com/item?id=14786409