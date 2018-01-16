`brew instal duti`

```
$ /usr/libexec/PlistBuddy -c 'Print CFBundleIdentifier' /Applications/Phiewer.app/Contents/Info.plist 
com.ww.imageviewer
$ duti -s com.ww.imageviewer jpg all
```