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

### oauth2

Jeremy Reeves

Oauth does not mean never reauthenticate. Oauth also does not mean SSO. Oauth is an authentication protocol that offers the opportunity to utilize SSO, and in some cases would mean the user does not have to authenticate themselves because it’s already been done through some other means.

The issue I see here is Tbird is behaving like a service or service principal working on behalf of the account, and not behaving like a client allowing the user to act for itself.

I know Tbird would not work this way, but let’s consider OWA with ADFS as the IdP. After a period of time(session expires) or password change, a user token is no longer valid and it is required to reauth through the IdP to refresh. Sure this is usually SSO with cached credentials, but it’s still a reauth as the account. Outlook does the same thing using Windows credentials with Modern Auth. Tbird is bypassing that requirement by reauthing through the azure app on behalf of the user as a service, not allowing the user to reauthenticate themselves with the new credential.

And because it’s acting like a service, Microsoft is letting it squeak past the security measure in place leading us to this active issue. I’m going to have a couple hundred angry folks later this year if it can’t be resolved because when Basic Auth is finally killed, we likely will not allow them to use Tbird with Oauth in the current state. Trying to avoid this scenario.

Jason Gunthorpe

Thunderbird is absolutely not a confidental client, it cannot maintain the secrecy of the globally issued client secret (it is currently published for all to see in the github). It should be using the public client type, with no client secret, using PCKE instead. Apps that can't maintian the client secret can't have app-specific security policies applied because basically anyone can forge the authentication source.

David

And additional issue I have noticed recently in multiple o365 School / corporate environments is that the Thunderbird client does not provide the required "DeviceID" value from the Azure Primary Refresh Token. The device ID value is used to determine authorization for Conditional Access rules based on device state or compliance.

As a result any organizations which use Conditional Access policies which referrence the DeviceID - the Thunderbird client will be automatically blocked from connecting (Even if connecting from a compliant device) due to the required value not being provided in the Auth process. Users will instead get a pop up which states:

This application contains sensitive information and can only be accessed from: Devices and Client applications that meet <organizations> management compliance policy.

Under the "more details" section of the client security popup the DeviceID information will show as blank indicating this information was not provided by the Thunderbird client. Similarly the O365 signin logs will show this information was not provided by the client and you will see an explicit failure in the Conditional Access section showing the rule could not be evaluated as the DeviceID was not provided.

You can pull this information on a windows machine using the cmd "dsregcmd /status". Its also available from AD joined MAC machines. o365 OAuth process clients are meant to provide this information when available.

https://bugzilla.mozilla.org/show_bug.cgi?id=1528136#c182

https://techcommunity.microsoft.com/t5/exchange-team-blog/announcing-oauth-2-0-support-for-imap-and-smtp-auth-protocols-in/ba-p/1330432

https://eightwone.com/2020/07/01/configuring-exchange-account-with-imap-oauth2/
