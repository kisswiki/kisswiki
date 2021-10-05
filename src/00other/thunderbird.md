- https://alternativeto.net/software/mozilla-thunderbird/?license=opensource&platform=windows

## import from gmail

- https://support.mozilla.org/en-US/kb/thunderbird-and-gmail

## How to download all messages with all folders and attachments in Thunderbird

Open `Account Settings > Synchronization & Storage > Message Synchronising` then tick the box immediately under this section.

https://support.mozilla.org/en-US/questions/1282954

## Restoring to a different location

- https://support.mozilla.org/en-US/kb/profiles-where-thunderbird-stores-user-data#w_restoring-a-profile-backup
- https://support.mozilla.org/en-US/kb/profiles-where-thunderbird-stores-user-data
- https://support.mozilla.org/en-US/kb/using-multiple-profiles

## filter messages by attachment size

From Edit/Find/Search Messages (Ctrl+Shift+F), select Size as the filter rule and enter 'is greater than' and a number like 6826 KB (see picture). Keep in mind that encoding overhead adds about 33% of the size of an attachment to the total size of a message, so a message with a 6MB attachment has a total size of 8MB. 'Save as Search Folder' if you perform this function frequently.

https://support.mozilla.org/en-US/questions/1226013

## How do I find what my email folders file sizes are?

`Right-click a folder > Properties > look at 'Size on disk'`

Or, `View > Layout >Folder Pane Columns` to show the Total number and Size.

The size may decrease after you Compact Folders.

https://support.mozilla.org/en-US/questions/1201896#answer-1070299

## Group by

- `View > Sort By`
- `View > Sort by > Grouped By Sort`

- https://www.lifewire.com/how-to-group-messages-thunderbird-1173111
- https://addons.thunderbird.net/en-US/thunderbird/addon/sender-frequency/

## how can I empty a mail folder quickly?

To select all emails in a folder:

- click on folder to see emails
- press 'Ctrl' + 'A' keys and all emails should get highlighted.

A list of 'conversations will appear in the lower Message Pane

- click on 'Delete'

To completely remove all hidden marked as deleted emails and release space in the folder:

- right click on folder and select: 'Compact'

If you would like old emails in a particular folder to be deleted on a regular basis, you can set up a 'retention policy' on a folder.
Please note this will delete messages in Thunderbird and originals on remote server.

- Right click on folder and select 'Properties'
- select 'Retention Policy' tab
- uncheck 'Use my account settings'
- choose from the options listed
- eg: select : 'Delete messages more than xx days old.'
- click on 'OK'

https://support.mozilla.org/en-US/questions/1126525

## compact header

- https://addons.thunderbird.net/en-US/thunderbird/addon/compact-headers/
- https://addons.thunderbird.net/en-US/thunderbird/addon/msghdr-toolbar-customize/

## remove the remote content warning, the yellow box

- https://support.mozilla.org/en-US/questions/1273397
- https://addons.thunderbird.net/en-us/thunderbird/addon/remote-content-by-folder/
- https://www.reddit.com/r/Thunderbird/comments/4o0x3v/remote_content_notice/d49j090/

## threading

`View > Sort > Threaded`

- https://support.mozilla.org/en-US/kb/message-threading-thunderbird
- https://superuser.com/questions/126356/manual-threading-in-thunderbird

## full address colum

- https://addons.thunderbird.net/en-us/thunderbird/addon/full-address-column/

## analyze emails

- https://addons.thunderbird.net/pl/thunderbird/addon/thirdstats/
  - https://github.com/devmount/third-stats
  - https://superuser.com/questions/1340854/thunderbird-show-space-usage-by-sender/1677099#1677099
- https://www.sisense.com/blog/analyzing-your-email-with-sql/
  - https://www.americaninno.com/boston/how-to-export-your-gmail-to-excel/
- https://moderndata.plotly.com/analyze-your-gmail-inbox-in-ipython-notebook/
- https://codehandbook.org/how-to-read-email-from-gmail-using-python/
- https://codehandbook.org/how-to-read-email-from-gmail-api-using-python/
- https://towardsdatascience.com/email-automation-analytics-and-visualization-53b022e0f9a0
- https://www.cdata.com/kb/articles/sql-query-gmail.rst

## search

- https://support.mozilla.org/en-US/kb/quick-filter-toolbar

## Office 365

###

Dean478

Wholesome

I have a premium Outlook.com account (part of Office 365 subscription). Normally I use it with Outlook 365 (desktop program) and have for many, many years. Through all my testing and research I have found that basic Thunderbird cannot work with Outlook.com/Exchange without addons. At the very minimum I require:

- Lighting calendar addon (technically it appears to be part of 'basic' Thunderbird these days)
- TB Sync (this will allow me to configure and setup my Microsoft Account in Thunderbird)
- Provider for Exchange Sync (which required TB Sync and allows me to sync my Outlook calendars, tasks and contacts)

Once those addons are installed, for me, it actually works quite well. And I can use Thunderbird on Linux or Windows without any problem. All of those addons are free and updated frequently. They also allow me to use other providers if I decided to change to Google or some other lesser known free or paid mail/calendar/tasks/contacts options.

vigneshprabhud

Ditto to what Dean478 said. With those AddOns, I am able to 1.) Autocomplete email id when composing email 2.) Sync calendar

The only issue I am having is, when I create an Event in a shared calendar, it does not sync. Throws some error. But I rarely use this functionality, so I am good for now.

HolmesToYourWatson

Microsoft supports IMAP, but not in conjunction with their more secure auth model. If you want to be upset at them, it should be over their refusal to use the OAuth 2 standard, which they took and modified to create their own proprietary, incompatible "standard".

wizzo18

You can always use Evolution as a mail client it is easy to import your local folders

https://www.reddit.com/r/Thunderbird/comments/ezjuns/best_solution_for_office365_with_thunderbird_in/

The only option available to connect to Office 365 and that works. Only snag that I find is it does not display outlook emails that have been archived. Should have an option to display achieved folders.

https://addons.thunderbird.net/en-us/thunderbird/addon/owl-for-exchange/reviews/1167949/
