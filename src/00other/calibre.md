## Look

- https://github.com/PapirusDevelopmentTeam/papirus-calibre-theme

## DRM

- DeDRM https://apprenticealf.wordpress.com/2012/09/10/drm-removal-tools-for-ebooks/
- http://www.geoffstratton.com/remove-drm-amazon-kindle-books
  - about fkx https://www.mobileread.com/forums/showthread.php?t=291290
- https://askubuntu.com/questions/1017461/how-can-i-remove-the-drm-from-a-kindle-book

## scroll flow in reader

the flow mode that is enabled by the button in the top right corner.

https://www.mobileread.com/forums/showpost.php?s=20eb64f8ba38ceab3fa6fa64e7a890ca&p=3577443&postcount=2

Also change number of lines scrolled:

`Preferences > General > Page flip/scrolling options > Control the amount the mouse wheel scrolls: 50%`

## Change default viewer

Go to Calibre preference icon on the top menu bar and click. Under Interface, select Behavior and click. On the right, is a list of book formats. These are the formats that the Calibre Default viewer will open when you click on a title in the Library browser. Unclick whichever format that you don't want Calibre to automatically launch its viewer to read. Click apply and exit. The next time you click on a book, ep. epub or pdf, the Windows default reader app, configured by you, will launch instead of the Calibre book viewer.

https://www.reddit.com/r/Calibre/comments/fw8qk7/how_to_change_the_default_viewer_for_calibre_to/fqufk42/

## Merging two books in Calibre's index

Just select all entries belonging to the same book, then right-click and find "Merge book records" under "Edit metadata".

https://superuser.com/questions/748199/merging-two-books-in-calibres-index/748207#748207

## switch author and title

Button to the left of the title field while in Edit Metadata

https://www.mobileread.com/forums/showpost.php?p=3676174&postcount=3

## How to specify multiple authors

Use ampersands (&) between each author

https://www.mobileread.com/forums/showpost.php?p=1322701&postcount=2

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

## rename files based on metadata

Generally each time you change the metadata, the directory structure is automatically self correcting.

https://www.mobileread.com/forums/showthread.php?t=98539

it is intentional to name (ok yeah why else would he program it this way) the files to be compatible with any and every OS even if it has a limitation for the size of a name.

https://www.reddit.com/r/Calibre/comments/ancn4u/getting_calibre_to_rename_actual_pdfepub_file/efswgdb/

- https://github.com/agilecreativity/ebook_renamer
