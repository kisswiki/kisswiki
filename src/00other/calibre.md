## Look

- https://github.com/PapirusDevelopmentTeam/papirus-calibre-theme

## DRM

- https://github.com/noDRM/DeDRM_tools/releases/tag/v10.0.3
- http://www.geoffstratton.com/remove-drm-amazon-kindle-books
  - about fkx https://www.mobileread.com/forums/showthread.php?t=291290
- https://askubuntu.com/questions/1017461/how-can-i-remove-the-drm-from-a-kindle-book

### Invalid dylib load: libsystem_c.dylib

` "asi" : {"libcrypto.dylib":["Invalid dylib load. Clients should not load the unversioned libcrypto dylib as it does not have a stable ABI."],"libsystem_c.dylib":["abort() called"]},`

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

SOLVED:

1. Install https://s3.amazonaws.com/kindleformac/60175/KindleForMac-1.31.60175.dmg
   - more versions https://gist.github.com/marccarre/645fe68da31678f9191cd3aafecfea1b
   - https://www.mobileread.com/forums/showpost.php?p=3819708&postcount=508
2. Install calibre plugins:
   - https://github.com/noDRM/DeDRM_tools/releases/tag/v10.0.3
   - KFX input plugin 1.50 https://www.mobileread.com/forums/showthread.php?t=291290
3. Close calibre and add from cli to see progress info:
   `cd /Applications/calibre.app/Contents/MacOS && ./calibredb add /Users/rfrolow/Library/Application\ Support/Kindle/My\ Kindle\ Content/B01CLR25ZW_EBOK/B01CLR25ZW_EBOK.azw`
4. In calibre appeared azw4 file which need to be unpacked with another plugin
   - https://github.com/dougmassay/kindleunpack-calibre-plugin/releases/download/v0.83.1/kindle_unpack_v0831_plugin.zip
   - https://www.mobileread.com/forums/showthread.php?t=335259

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
