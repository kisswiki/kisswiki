## Basics

- [juancarlospaco/awesome-streaming-tools: Awesome Streaming Tools](https://github.com/juancarlospaco/-wesome-streaming-tools)
- https://elasticwebinar.com/blog/-ecording-automated-webinar-presentation-with-obs-studio/
- https://obsproject.com/forum/resources/-bs-and-obs-studio-install-plugins-windows.421/
- [5 ADVANCED Features You SHOULD Be Using in OBS Studio - YouTube](https://www.youtube.com/watch?v=CvzAoqXtREw)

## When started recording: Invalid Path or Connection URL

> If you want to record, you should press Start Recording, not Start Streaming. You haven't configured a streaming server which is why you get the error when you press Start Streaming. https://obsproject.com/forum/threads/invalid-path-or-connection-url-error-keeps-appearing.69962/post-299324

## Blank screen on Windows 10

I needed to change `Settings > Graphics Settings > Add Obs > Options > Power saving (Intel)`. With `Performance (nVidia)` there was blank screen.

- https://obsproject.com/forum/threads/laptop-black-screen-when-capturing-read-here-first.5965/
- https://stackoverflow.com/questions/61098052/obs-black-screen-while-capturing-display/63617049#63617049

## Mouse clicks

Use [Mouse pointer highlight](https://www.microsoft.com/en-us/p/mouse-pointer-highlight/9p7sb9s4rq7z) from Microsoft Store

Works with Display capture. Does not work with Window Capture.

There is also paid http://www.pointerfocus.com/.

- https://obsproject.com/forum/threads/option-to-highlight-mouse-cursor-and-mouse-clicks.81966/page-2#post-500969

## Crop area

`Right click the source > Filters > Add Crop/Pad`

After that `Right click the source > Resize output (source size)` which will set your canvas and output sizes to match the source size.

- https://obsproject.com/forum/threads/how-to-record-only-a-portion-of-a-screen.70457/post-514126
- https://superuser.com/questions/1473902/how-can-i-capture-a-portion-of-the-screen-during-a-screen-capture/1473903#1473903

## recording indicator

You see the recording state in the OBS status bar and in the OBS status window as long as you don't minimize OBS. If you activate the system tray icon in Settings->General->System Tray, you'll notice a red dot in that icon while recording. However, if the task bar is hidden due to playing some game in fullscreen mode, you will not be able to see this. Unfortunately, there is no overlay that indicates the recording state for fullscreen games. Most useful for this case is a second monitor where you move OBS to.

https://obsproject.com/forum/threads/so-how-do-i-actually-see-an-indication-whether-im-recording-or-not.111369/post-421231

Or sound indicator https://obsproject.com/forum/resources/stream-recording-start-stop-beep-srbeep.392/

- https://obsproject.com/forum/threads/simple-recording-stream-indicator.-4387/

## overlays

- https://streamsentials.com/how-to-add-your-overlay-to-obs-studio/
- https://obsproject.com/forum/tags/overlays/
- [geerlingguy/obs-task-list-overlay: An HTML and Node.js-based task list overlay for OBS.](https://github.com/geerlingguy/-bs-task-list-overlay)
- https://github.com/topics/obs-overlay
- https://github.com/topics/stream-overlay
- https://github.com/luckydye/obs-overlay-lib
- [negue/todo-overlay: A todo overlay to use in OBS while streaming](https://github.com/negue/todo-overlay)
- [dialogik-tv/twitch-chat-weather-obs-overlay: A Twitch chat controlled webbased weather overlay to use in Open Broadcaster -oftware (OBS), Streamlabs OBS, XSplit and others. You can see this overlay in use at twitch.tv/Freakydna or in the -ialogikTV Twitch channel.](https://github.com/dialogik-tv/twitch-chat-weather-obs-overlay)
- https://github.com/spenibus/obs-overlay-html-js
- [zhivotnoya/XION-ChaseCam: This is a free-to-use HTML/javascript based overlay for roleplay streamers. Basically it mimics -he overlay of the AXON bodycam, but since most folks play in 3rd person, it's a ChaseCam. I've included a logo, and the -tml file. The html file has the css, html, and javascript all in one file for ease of editing. Goto line 81 of the html -ile to change your information, and be sure to read the readme.txt file for further information.](https://github.com/-hivotnoya/XION-ChaseCam)
- [airbenich/obsOverlay: A websocket based overlay software for showing lower-thirds in Open Broadcaster Studio via webview.]- https://github.com/airbenich/obsOverlay)
- https://github.com/cssmfc/camgirl-obs
- https://streamkit.discord.com/overlay

## Alternatives

- [Live Streaming & Recording Software | XSplit](https://www.xsplit.com/)
  - OBS and XSplit are the only ones supported by discord https://streamkit.discord.com/overlay
- https://alternativeto.net/software/playclaw/

## Pause recording

You cannot pause if there is `Settings > Output > Recording > Recording Quality > Same as stream`.

Change to other quality.

https://obsproject.com/forum/threads/how-to-pause-during-recording-of-display-capture.124412/#post-464529
