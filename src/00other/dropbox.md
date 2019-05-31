## dbxcli

- [`get` does not work on folders · Issue #60 · dropbox/dbxcli](https://github.com/dropbox/dbxcli/issues/60#issuecomment-497713363)

## ncdu

Create dropbox app and generate access token.

```bash
$ pip install ncdu-dropbox
$ ncdu-dropbox --token $TOKEN -o dropbox.json
$ ncdu -f dropbox.json
```

- https://pypi.org/project/ncdu-dropbox/
- https://preventdirectaccess.com/docs/create-app-key-access-token-for-dropbox-account/
- https://www.dropbox.com/developers/apps

## rclone

install

```bash
$ curl -OJN https://downloads.rclone.org/rclone-current-linux-amd64.zip
$ unzip rclone-current-linux-amd64.zip
$ cp rclone-v1.47.0-linux-amd64/rclone ~/bin/
```

config https://rclone.org/dropbox/

```bash
$ rclone config
2019/05/31 15:00:07 NOTICE: Config file "/home/roman/.config/rclone/rclone.conf" not found - using defaults
No remotes found - make a new one
n) New remote
s) Set configuration password
q) Quit config
n/s/q> n
name> dropbox
Type of storage to configure.
Enter a string value. Press Enter for the default ("").
Choose a number from below, or type in your own value
 1 / A stackable unification remote, which can appear to merge the contents of several remotes
   \ "union"
 2 / Alias for a existing remote
   \ "alias"
 3 / Amazon Drive
   \ "amazon cloud drive"
 4 / Amazon S3 Compliant Storage Provider (AWS, Alibaba, Ceph, Digital Ocean, Dreamhost, IBM COS, Minio, etc)
   \ "s3"
 5 / Backblaze B2
   \ "b2"
 6 / Box
   \ "box"
 7 / Cache a remote
   \ "cache"
 8 / Dropbox
   \ "dropbox"
 9 / Encrypt/Decrypt a remote
   \ "crypt"
10 / FTP Connection
   \ "ftp"
11 / Google Cloud Storage (this is not Google Drive)
   \ "google cloud storage"
12 / Google Drive
   \ "drive"
13 / Hubic
   \ "hubic"
14 / JottaCloud
   \ "jottacloud"
15 / Koofr
   \ "koofr"
16 / Local Disk
   \ "local"
17 / Mega
   \ "mega"
18 / Microsoft Azure Blob Storage
   \ "azureblob"
19 / Microsoft OneDrive
   \ "onedrive"
20 / OpenDrive
   \ "opendrive"
21 / Openstack Swift (Rackspace Cloud Files, Memset Memstore, OVH)
   \ "swift"
22 / Pcloud
   \ "pcloud"
23 / QingCloud Object Storage
   \ "qingstor"
24 / SSH/SFTP Connection
   \ "sftp"
25 / Webdav
   \ "webdav"
26 / Yandex Disk
   \ "yandex"
27 / http Connection
   \ "http"
Storage> 8
** See help for dropbox backend at: https://rclone.org/dropbox/ **

Dropbox App Client Id
Leave blank normally.
Enter a string value. Press Enter for the default ("").
client_id>
Dropbox App Client Secret
Leave blank normally.
Enter a string value. Press Enter for the default ("").
client_secret>
Edit advanced config? (y/n)
y) Yes
n) No
y/n> n
Remote config
Use auto config?
 * Say Y if not sure
 * Say N if you are working on a remote or headless machine
y) Yes
n) No
y/n>
y/n> y
If your browser doesn't open automatically go to the following link: http://127.0.0.1:53682/auth
Log in and authorize rclone for access
Waiting for code...
Got code
--------------------
[dropbox]
type = dropbox
token = {"access_token":"<token>","token_type":"bearer","expiry":"0001-01-01T00:00:00Z"}
--------------------
y) Yes this is OK
e) Edit this remote
d) Delete this remote
y/e/d> y
Current remotes:

Name                 Type
====                 ====
dropbox              dropbox

e) Edit existing remote
n) New remote
d) Delete remote
r) Rename remote
c) Copy remote
s) Set configuration password
q) Quit config
e/n/d/r/c/s/q> q
```

copy all files from dropbox https://rclone.org/docs/

```bash
$ rclone copy --dry-run dropbox:/ .
$ rclone copy dropbox:/ .
```
