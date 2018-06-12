## Without a server

### a[download]

- only same-origin
- not supported in IE11 and iOS Safari https://caniuse.com/#feat=download
  - but you can't save PPTX/CSV directly on iOS. You can save PDF to iBooks. Image to photos.

### blob

- https://stackoverflow.com/questions/20830309/download-file-using-an-ajax-request/42815974#42815974

#### createObjectURL

This works for me, but in firefox, I needed to first put an <a> tag in the DOM, and reference it as my link rather than create one on the fly in order for the file to download automatically. – Erik Donohoo May 31 '17 at 20:49
upvote

works but what happens if the file is creating during execution? it doesnt work like when the file is created already. – Diego Jun 13 '17 at 2:16

- https://stackoverflow.com/questions/20830309/download-file-using-an-ajax-request/42815974#42815974
- https://developer.mozilla.org/en-US/docs/Web/API/URL/createObjectURL

#### msSaveOrOpenBlob

IE does not allow us to open Data URL in new tab (possibly security reason) and there no workaround - faced same issue earlier.

We use msSaveOrOpenBlob - found no alternative.

- https://stackoverflow.com/questions/39586024/open-pdf-in-ie11-on-new-tab-without-prompting-mssaveoropenblob/45756907#45756907
- https://stackoverflow.com/questions/20830309/download-file-using-an-ajax-request/49674385#49674385

## Using server

### Content-Disposition: attachment

You need proxy server to set HTTP headers:

```
Content-Disposition: attachment
Content-Type: text/plain // optional
```

- https://stackoverflow.com/questions/21088376/how-to-force-fully-download-txt-file-on-link

### window.location

We can use `window.location` to programatically start download.

```javascript
window.location="download.php?filename=export.csv";
```

```php
<?php
    $file = $_GET['filename'];
    header("Cache-Control: public");
    header("Content-Description: File Transfer");
    header("Content-Disposition: attachment; filename=".$file."");
    header("Content-Transfer-Encoding: binary");
    header("Content-Type: binary/octet-stream");
    readfile($file);
?>
```

- https://stackoverflow.com/questions/20830309/download-file-using-an-ajax-request/25866873#25866873
- `assign` adds, `replace` replaces entry in browser history https://stackoverflow.com/questions/4505798/difference-between-window-location-assign-and-window-location-replace
