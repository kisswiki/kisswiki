## Filter

Look for any unread:

`from:allegro.pl is:unread`


Search for those already archived:

`from:allegro.pl -in:Sent -in:Chat -in:Draft -in:Inbox`

Only read:

`from:allegro.pl is:read -in:Sent -in:Chat -in:Draft -in:Inbox`

- http://webapps.stackexchange.com/questions/1168/can-i-see-only-mail-i-have-archived-in-gmail
- https://productforums.google.com/forum/#!topic/gmail/NeIZDlhRaVA
- Search operators you can use with Gmail https://support.google.com/mail/answer/7190?hl=en

### subject not having words

-" one two three "

- https://productforums.google.com/forum/#!topic/gmail/zzimzlffJls
- https://webapps.stackexchange.com/questions/11855/filtering-subjects-with-not
- https://webapps.stackexchange.com/questions/31411/how-to-use-boolean-and-and-not-operators-in-gmail-search

### bug?

There is a bug in the Gmail filter system. If you try to set up complex Boolean such as

from:user1@me.com -to:user2@me.com -junk_term
It will work fine on the initial search, but if you use it to create a filter, the terms, especially the NOTs, will be garbled.

The correct syntax, (hat tip to chenghuayang) is to ignore the to's and from's.

user1@me.com -user2@me.com -junk_term

https://stackoverflow.com/questions/32213696/how-to-use-not-in-gmail-filters/32227368#32227368

## Without phone

Just go to https://accounts.google.com/SignUp

https://www.quora.com/What-is-a-way-to-create-many-Gmail-accounts-without-mobile-number-verification

## Backup

- https://github.com/gaubert/gmvault

## permanent url to specific account

https://mail.google.com/mail/u/?authuser=test@example.com

https://inbox.google.com/u/?authuser=test@example.com 

https://webapps.stackexchange.com/questions/45229/permalink-to-specific-gmail-inbox

## multiple emails in filter

`to:(name1@domain.com | name2@domain.com | name3@domain.com)`

https://webapps.stackexchange.com/questions/686/how-to-specify-or-conditions-for-gmail-filter/42051#42051
