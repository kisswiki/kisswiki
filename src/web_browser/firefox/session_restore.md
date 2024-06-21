Firefox opened without tabs from previous session. Reopening closed tabs (3.5k) failed - too much RAM needed.

What I just did:

`cp sessionstore-backups/recovery.jsonlz4 sessionstore.jsonlz4` and run Firefox

Here is original procedure:

I'm pasting the right procedure here for future reference, but all credits go to Martin Brinkmann from Ghacks: How to restore Firefox sessions if Session Restore is not working correctly:

I solved following these steps:

1. Close the Firefox browser. Make sure no instance of the browser is running.
2. Open the profile folder and rename the current session file sessionstore.jsonlz4 to sessionstore-backup.jsonlz4.
3. Open the sessionstore-backups folder of the profile.
4. Rename recovery.jsonlz4 to recovery-backup.jsonlz4.
5. Rename recovery.backlz4 to recovery-backup.backlz4.
6. Copy the session restore backup that you want to restore, e.g. previous.jsonlz4.
7. Go back to the root directory of the Firefox profile.
8. Paste the copied file to the root folder.
9. Rename it to sessionstore.jsonlz4.
10. Restart the Firefox browser.
11. Firefox might pick up the session automatically. If it does not, press the Alt-key on your keyboard and select History > Restore Previous Session.

https://superuser.com/questions/1309864/can-i-restore-the-previous-previous-session-in-firefox/1609871#1609871
