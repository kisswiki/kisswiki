- https://github.com/guardian/scribe A rich text editor framework for the web platform
- https://github.com/summernote/summernote Super simple WYSIWYG editor
- https://github.com/kenshin54/popline Popline is an HTML5 Rich-Text-Editor Toolbar
- https://github.com/tinymce/tinymce TinyMCE is a platform independent web based Javascript HTML WYSIWYG editor control released as Open Source under LGPL
- https://github.com/jawerty/Hyro A real-time desktop HTML5 editor -- view your html while you code it
- https://github.com/Voog/wysihtml Open source rich text editor for the modern web
- https://github.com/neilj/Squire HTML5 rich text editor
- https://github.com/quilljs/quill A cross browser rich text editor with an API
- https://github.com/jakiestfu/Medium.js A tiny JavaScript library for making contenteditable beautiful (Like Medium's editor)
- https://github.com/alohaeditor/Aloha-Editor Aloha Editor is a JavaScript content editing library
- https://github.com/wikimedia/VisualEditor Stand-alone contentEditable-based rich HTML5 editor
- https://github.com/yabwe/medium-editor Medium.com WYSIWYG editor clone. Uses contenteditable API to implement a rich text solution
- https://github.com/ProseMirror/prosemirror The ProseMirror WYSIWYM editor
- https://github.com/danielearwicker/carota Simple, flexible rich text rendering/editing on HTML Canvas
- https://github.com/facebook/draft-js A React framework for building text editors

## Android keyboard problems

> It's very difficult to make a fully working browser/webview based editor on Android. Every keyboard interacts with applications differently, sometimes differing significantly between keyboard versions. I think a rewrite of the Android keyboard composition interface is needed. Most of the issues occur because the keyboard needs to keep track of the document state itself, and has race conditions/inconsistencies with the editable which maintains the "true" state.
> All web based rich text editors on Android right now (Quill, Draft.js, Dropbox Paper, Quip, etc.) have similar problems. One easier to reproduce problem is to make a list and then exit the list by pressing enter twice. The next time you backspace a few characters, the composition will be messed up (cursor will jump around, characters get duplicated, etc.) There are other issues too--oftentimes the keyboard will lose focus, backspacing will paste in characters, jumping cursors, etc. These issues are keyboard/browser version specific too, most of them disappear if you use Samsung's keyboard instead of the Google one.
> For Quora's Android editor I spent some time fixing all the issues I could find with the latest Google keyboard+WebView, and fixed the majority. I built the open source version of Google's keyboard (LatinIME), and a fork of Chromium (Crosswalk) for the WebView so that I could debug both, which worked pretty well. Then, Google updated the keyboard which introduced bugs, but didn't update the open source project, making it difficult to fix the new issues. There's also a separate rewrite in Chromium to use a separate thread for the IME, which will change behavior again.
> https://news.ycombinator.com/item?id=12440052
