## Look

- https://github.com/PapirusDevelopmentTeam/papirus-calibre-theme

## DRM

1. Because I was unable to "Download & transfer via USB" for newly bought book I needed to downgrade Kindle for Mac to 1.31
   - Install https://s3.amazonaws.com/kindleformac/60175/KindleForMac-1.31.60175.dmg
   - more versions https://gist.github.com/marccarre/645fe68da31678f9191cd3aafecfea1b
   - https://www.mobileread.com/forums/showthread.php?t=283371
   - https://www.mobileread.com/forums/showpost.php?p=3819708&postcount=508
   - https://askubuntu.com/questions/1017461/how-can-i-remove-the-drm-from-a-kindle-book/1448876#1448876
   - https://geoffstratton.com/remove-drm-amazon-kindle-books/
2. Disable kindle updates with chmod. Unchecking in kindle preferences does not work.
   `chmod 000 ~/Library/Application\ Support/Kindle/updates`
   - https://www.reddit.com/r/kindle/comments/k6c0hj/permanent_fix_for_kindle_app_autoupdate_from_117/
3. Close Kindle and disable kfx
   `chmod -x /Applications/Kindle.app/Contents/MacOS/renderer-test`
   - https://www.mobileread.com/forums/showthread.php?t=283371
4. Reopen Kindle and download book.
5. Install calibre plugins:
   - https://github.com/noDRM/DeDRM_tools/releases/tag/v10.0.3
   - KFX input plugin 1.50 https://www.mobileread.com/forums/showthread.php?t=291290
6. Close calibre and add from cli to see progress info:

```shell
% cd /Applications/calibre.app/Contents/MacOS
% calibredb add /Users/rfrolow/Library/Application\ Support/Kindle/My\ Kindle\ Content/B01CLR25ZW_EBOK/B01CLR25ZW_EBOK.azw
Gather KFX-ZIP (from KFX Input) 1.50.0: Importing /Users/rfrolow/Library/Application Support/Kindle/My Kindle Content/B01CLR25ZW_EBOK/B01CLR25ZW_EBOK.azw
Gather KFX-ZIP (from KFX Input): File is not KFX format
DeDRM v10.0.3: Trying to decrypt B01CLR25ZW_EBOK.azw
Using Library AlfCrypto Python
MobiDeDrm v1.1.
Copyright © 2008-2020 The Dark Reverser, Apprentice Harper et al.
Decrypting Mobipocket 4 ebook: 70 Best Recipes For Health And Weight Loss: The Guerrilla Diet Way
Got DSN key from database kindle_key_1672926759_1
Got DSN key from database kindle_key_1672926759_2
Found 4 keys to try after 0.2 seconds
Crypto Type is: 2
File is encoded with PID JD7sabsBM2.
Decrypting. Please wait . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . done
Decryption succeeded after 184.7 seconds
DeDRM v10.0.3: Finished after 184.8 seconds
Added book ids: 1161
```

- https://github.com/apprenticeharper/DeDRM_tools/blob/master/CALIBRE_CLI_INSTRUCTIONS.md
- https://www.mobileread.com/forums/showthread.php?t=345902

7. In calibre appeared azw4 file which need to be unpacked with another plugin
   - https://github.com/dougmassay/kindleunpack-calibre-plugin/releases/download/v0.83.1/kindle_unpack_v0831_plugin.zip
   - https://www.mobileread.com/forums/showthread.php?t=335259

### Invalid dylib load: libsystem_c.dylib

`"asi" : {"libcrypto.dylib":["Invalid dylib load. Clients should not load the unversioned libcrypto dylib as it does not have a stable ABI."],"libsystem_c.dylib":["abort() called"]},`

Install newer dedrm plugin

- https://www.mobileread.com/forums/showthread.php?t=350063
- https://developer.apple.com/forums/thread/119429

### kfx-zip

If you see a kfx-zip it almost certainly means that the DeDRM has failed. The whole kfx and Kindle-for-PC is a huge and constantly changing minefield. Look at the more recent posts in [this huge thread](https://github.com/noDRM/DeDRM_tools/issues/240) and maybe you'll see an answer.

- https://www.reddit.com/r/Calibre/comments/q67ten/comment/hgadb3n/
- https://www.mobileread.com/forums/showthread.php?t=283371&page=108
- https://github.com/noDRM/DeDRM_tools/issues/240
- https://github.com/noDRM/DeDRM_tools/issues/239
- https://github.com/apprenticeharper/DeDRM_tools/issues/1406

## scroll flow in reader

the flow mode that is enabled by the button in the top right corner.

https://www.mobileread.com/forums/showpost.php?s=20eb64f8ba38ceab3fa6fa64e7a890ca&p=3577443&postcount=2

Also change number of lines scrolled:

`Preferences > General > Page flip/scrolling options > Control the amount the mouse wheel scrolls: 50%`

## Change default viewer

`Preferences > Interface > Behavior > Use internal viewer for:`

These are the formats that the Calibre Default viewer will open when you click on a title in the Library browser. Unclick whichever format that you don't want Calibre to automatically launch its viewer to read. Click apply and exit. The next time you click on a book, ep. epub or pdf, the Windows default reader app, configured by you, will launch instead of the Calibre book viewer.

https://www.reddit.com/r/Calibre/comments/fw8qk7/how_to_change_the_default_viewer_for_calibre_to/fqufk42/

## Automatically merge added books

`Preferences > Adding books > Auto-merge added books if they already exist: Ignore ducplicate incomming formats`.

https://www.mobileread.com/forums/showpost.php?p=1808947&postcount=3

## Merging two books in Calibre's index

Just select all entries belonging to the same book, then right-click and find "Merge book records" under "Edit metadata".

Or alt-drag with mouse.

https://superuser.com/questions/748199/merging-two-books-in-calibres-index/748207#748207

## switch author and title

Button to the left of the title field while in Edit Metadata

https://www.mobileread.com/forums/showpost.php?p=3676174&postcount=3

## How to specify multiple authors

Use ampersands (&) between each author

- https://www.mobileread.com/forums/showpost.php?p=1322701&postcount=2
- https://ebooks.stackexchange.com/questions/8216/calibre-adding-as-a-separator-for-splitting-the-authors-string

You can also specify that one is contributor `Audrey Pavia & Shannon Sand (Contributor)` and sorting will be `Pavia, Audrey & Sand, Shannon`

## Changing Library Folder

`Library icon in the top row > dropdown arrow > Switch/create library > Move current library to new location

https://www.mobileread.com/forums/showpost.php?p=1105741&postcount=3

## ISBN-10 vs ISBN-13

You can in fact convert a 10-digit ISBN to a 13-digit ISBN by adding 978 to the beginning and then recalculating the last digit (the 'check digit').

https://www.quora.com/What-is-the-difference-between-an-ISBN-10-and-an-ISBN-13

## Tags

You can click in sidebar for tags.

First click selects, second click `not tag`.

Click and shift+click uses `or`. To have `and` you need to change in input field.

To have both Mathematics and Programming:

`tags:"=Mathematics" and tags:"=Programming"`

## Rename files based on metadata

Generally each time you change the metadata, the directory structure is automatically self correcting.

https://www.mobileread.com/forums/showthread.php?t=98539

it is intentional to name (ok yeah why else would he program it this way) the files to be compatible with any and every OS even if it has a limitation for the size of a name.

https://www.reddit.com/r/Calibre/comments/ancn4u/getting_calibre_to_rename_actual_pdfepub_file/efswgdb/

- https://github.com/agilecreativity/ebook_renamer

## Viewer Default Format

`Preferences > Behaviour > Preferred input format order > Move PDF to top`

https://www.mobileread.com/forums/showpost.php?p=3308062&postcount=5

## Viewer epub continuous scroll

If chapter are separate files, you still will encounter jumps when scrolling. To overcome it:

- convert to mobi
- join all chapter files to one
- add css but this will make big spaces between chapters

https://www.reddit.com/r/Calibre/comments/ru1810/is_it_possible_to_enable_truly_continuous/

## Filter by published date

`pubdate:>=1945-1-1 and pubdate:<=1950-12-31`

https://www.reddit.com/r/Calibre/comments/jy3gyi/search_by_date_range/gd3hz04/

## Import series

Go to `Calibre > Preferences > Adding books`

I have used this regex

```
(?P<series>[^_0-9]*) (?P<series_index>[0-9]*) \((?P<published>[0-9]+)\)
```

to import file names like this:

```
Y - The Last Man On Earth 001 (2006) something.cbr
```

Also:

There’s a “Manage Series” plugin that would be the easiest option. You can literally highlight all the files in your library in the series and then tell it what you want to change the series name to. It’ll list the books out and you can move them around if needed to make sure they’re in correct series order. I’ve done this multiple times, it’s super easy and fast.

- https://www.reddit.com/r/Calibre/comments/odfsss/mass_renaming_of_the_title_of_a_series_of_books_i/
- https://manual.calibre-ebook.com/regexp.html
- https://manual.calibre-ebook.com/regexp_quick_reference.html
- [Importing Series information into Calibre - MobileRead Forums](https://www.mobileread.com/forums/showthread.php?t=119554)

## Calibre viewer

zoom in: ctrl++

zoom out: ctrl+-

## "Added" column

The normal date column is the date the book was added to the library

http://www.mobileread.mobi/forums/showthread.php?t=180120

## Trash

### Why?

The system trash never worked to restore a file to Calibre. You had to "add" them, because the system trash only had the file and not the metadata.

https://www.mobileread.com/forums/showthread.php?p=4324488#post4324488

### How to delete on close?

`Right-click the book > Remove Books > Restore Recently Deleted > Permanently delete after: on close`

https://www.reddit.com/r/Calibre/comments/14nyrye/how_to_permanently_delete_removed_books_when/

### Where is trash located?

.caltrash

## convert cbr and cbz to pdf

- Right-click > Convert
  - PDF
  - Comic Input > Disable comic processing (option otherwise the colorful comic will turn into black-and-white one)

- https://www.epubor.com/convert-cbr-to-pdf.html
  - https://www.reddit.com/r/Calibre/comments/i1scu3/comment/g0ejf6s/
- https://www.reddit.com/r/mangapiracy/comments/15oyt7s/lack_a_decent_continuous_vertical_smooth/

### ebook-convert

- `Automator > Quick Action`
  - `Workflow receives current: files or folders`
  - `in: Finder.app`
  - on the left search for `Run Shell Script` and drag-and-drop it to the right.
  - `Pass input: as arguments`

The conent will be:

```zsh
. $HOME/.zprofile
~/bin/ebook-convert2pdf.sh "$@"
```

Then `File > Save`

- https://askubuntu.com/questions/344339/how-do-i-convert-epub-to-mobi-using-calibre
- https://www.reddit.com/r/mangapiracy/comments/15oyt7s/lack_a_decent_continuous_vertical_smooth/

- https://apple.stackexchange.com/questions/129929/automating-ffmpeg-using-automator-service/129931#129931
- [Creating Custom Finder Quick Actions With Automator - YouTube](https://www.youtube.com/watch?v=0BEPkM_gkGU)
