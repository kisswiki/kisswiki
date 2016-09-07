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
- https://trix-editor.org/
- https://github.com/ianstormtaylor/slate
- comparison https://github.com/ianstormtaylor/slate

## Android keyboard problems

> It's very difficult to make a fully working browser/webview based editor on Android. Every keyboard interacts with applications differently, sometimes differing significantly between keyboard versions. I think a rewrite of the Android keyboard composition interface is needed. Most of the issues occur because the keyboard needs to keep track of the document state itself, and has race conditions/inconsistencies with the editable which maintains the "true" state.
> All web based rich text editors on Android right now (Quill, Draft.js, Dropbox Paper, Quip, etc.) have similar problems. One easier to reproduce problem is to make a list and then exit the list by pressing enter twice. The next time you backspace a few characters, the composition will be messed up (cursor will jump around, characters get duplicated, etc.) There are other issues too--oftentimes the keyboard will lose focus, backspacing will paste in characters, jumping cursors, etc. These issues are keyboard/browser version specific too, most of them disappear if you use Samsung's keyboard instead of the Google one.
> For Quora's Android editor I spent some time fixing all the issues I could find with the latest Google keyboard+WebView, and fixed the majority. I built the open source version of Google's keyboard (LatinIME), and a fork of Chromium (Crosswalk) for the WebView so that I could debug both, which worked pretty well. Then, Google updated the keyboard which introduced bugs, but didn't update the open source project, making it difficult to fix the new issues. There's also a separate rewrite in Chromium to use a separate thread for the IME, which will change behavior again.
> https://news.ycombinator.com/item?id=12440052

## quill

> I use Quilljs because it's a great implementation of a modern-thinking WYSIWYG text editor. The underlying parchment[0] library helps a lot to separate out the data model from the rendered view (instead of relying on contenteditable to handle your data model, like many other classic rich text editors do). My users type stuff in Quill, and my front end shoots data in the rich-text[1] format back to the back-end. I have a small (and not great, but functional for my needs) library [2] I wrote to convert rich-text back into HTML, so we never actually store user-entered HTML entities in our database (which helps a lot for things like protecting against XSS attacks, and since rich-text is just a JSON object, I can do interesting database queries that are a bit trickier to pull off if it had been HTML).
> On top of all of that, Quill emits delta objects on user interaction (that conform to an operational transform model), so it's pretty straightforward to wire it into a concurrent editing system. This isn't batteries-included (you have to deal with resolving the operational transforms yourself, which is of course tricky) but it's a great start in that direction.
> 1. https://github.com/quilljs/parchment
> 2. https://github.com/ottypes/rich-text
> 3. https://github.com/ericeslinger/delta-transform-html
> https://news.ycombinator.com/item?id=12437829

<br>

> I'd love to see some work on doing OT with Quill deltas.
A simple Quill + Meteor/Firebase bridge could be a pretty great, easy to spin-up, real-time collaborative document editing tool.
>
> Quill's OT type is compatible with ShareDB, which provides a simple to use backend that takes care of all this coordination. Here is a simple example of using the two together:
> https://github.com/share/sharedb/tree/master/examples/rich-text
> https://news.ycombinator.com/item?id=12438606

<br>

> I noticed how adding an image doesn't actually upload it to the server, but rather encodes it - which becomes a very large text. What implication does that have? What if I have a very large text with many images?
I've been using CKEditor, which has been somewhat of a go-to text editor for many and it's been around for many years. Its image uploading seems to work relatively well.
> jhchen gave a nice simple example of how to just insert a URL in this issue - https://github.com/quilljs/quill/issues/863
In theory it should be possible to integrate file upload and CDN APIs such as Filestack/Filepicker or others.
> https://news.ycombinator.com/item?id=12439777

<br>

> Disclosure: As the maintainer of Quill, I am much more aware if its strengths and have worked hard to limit its weaknesses.
> The main idea behind Trix as stated in their README[1]:
> "Most WYSIWYG editors are wrappers around HTML’s contenteditable and execCommand APIs... Trix sidesteps these inconsistencies by treating contenteditable as an I/O device: when input makes its way to the editor, Trix converts that input into an editing operation on its internal document model, then re-renders that document back into the editor. This gives Trix complete control over what happens after every keystroke, and avoids the need to use execCommand at all."
> I think the first portion is only historically true. Everyone has figured out contenteditable/execCommand alone is a problem and all notable editors I have seen released in the past few years have reasonable solutions--Trix's solution included. Quill is slightly different in that it prevents problematic operations in the first place and reimplements them itself, such as enter and backspace, but the main idea is the same: maintain a document model as the source of truth, define operations to mutate it, and build an editing experience on top of this.
> Some strengths unique to Quill:
> * API Quill has the most powerful API of any editor I have seen. You can make any text or formatting change in any part of the editor at any time. Trix by contrast only allows changes to the current selection.
> * Modules Quill's internals are broken into modules[2] that themselves can be configured or even swapped out. Many modules also include their own APIs. Trix does not have documentation in this regard, but looking at its codebase, it does not appear designed to support major modification of its internals.
> * Formats/Content Quill's document model itself is customizable, which allows users to define their own formats or customize existing ones. This capability is what kicked of 1.0 development, now being released today. This gives Quill extensive coverage of well known formats (tables to my knowledge is the only missing one), but more exotic formats/content like formulas, tweets or syntax highlighted code is also supported. Some editor frameworks have this same idea, but lack the actual editor and UI on top of this so you have to build a big portion of functionality to realize the full benefits.
> One main idea I'd like to highlight is this: Text is no longer written to be printed. It is written to be rendered on the web—a much richer canvas than paper. Quill 1.0 was designed and built to support this next generation canvas.
> [1] https://github.com/basecamp/trix#different-by-design [2] http://quilljs.com/docs/modules/
> https://news.ycombinator.com/item?id=12438719
