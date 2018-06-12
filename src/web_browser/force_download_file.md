## A problem

In a general case a file downloads occur after a user clicks an `<a href="location">` link. The href in the instructs the browser to browse to the location indicated. This is equivalent to setting the `window.location` of a page using JavaScript.

The response from a file download error is generally no different from a normal HTML response, the only difference here is that is has an error message as HTML content. The browser will now happily replace your existing page and address with the new error message.

Also:

An average user might expect some sort of indication of what is going on.

http://johnculviner.com/jquery-file-download-plugin-for-ajax-like-feature-rich-file-downloads/


The problem is, if you do window.location.href = 'GenerateFile', and there is an error server-side, there is no way to handle the error and not break the SPA. When you generate a temp file, you can return something like { success: true, filepath: '...' } and { success: false, message: '...' }, and it can be handled properly. https://stackoverflow.com/questions/21331880/downloading-files-in-a-spa#comment32681003_21332100

## Without a server

### a[download]

- only same-origin
- not supported in IE11 and iOS Safari https://caniuse.com/#feat=download
  - but you can't save PPTX/CSV directly on iOS. You can save PDF to iBooks. Image to photos.

- https://github.com/PixelsCommander/Download-File-JS

### blob

- https://stackoverflow.com/questions/20830309/download-file-using-an-ajax-request/42815974#42815974
- https://github.com/eligrey/FileSaver.js/

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

### cookie + iframe + same-origin

- https://github.com/johnculviner/jquery.fileDownload
  - http://johnculviner.com/jquery-file-download-plugin-for-ajax-like-feature-rich-file-downloads/
  - https://stackoverflow.com/questions/365777/starting-file-download-with-javascript/11065324#11065324

### create a ZIP file with the PDF inside

https://stackoverflow.com/questions/3802510/force-to-open-save-as-popup-open-at-text-link-click-for-pdf-in-html/4161480#4161480

## Using server

- https://stackoverflow.com/questions/3802510/force-to-open-save-as-popup-open-at-text-link-click-for-pdf-in-html
- https://stackoverflow.com/questions/2598658/how-to-force-a-pdf-download-automatically

### Content-Disposition: attachment

You need proxy server to set HTTP headers:

```
Content-Disposition: attachment
Content-Type: text/plain // optional
```

- https://stackoverflow.com/questions/21088376/how-to-force-fully-download-txt-file-on-link

### application/octet-stream

Using "Content-disposition: attachment" has worked consistently for us in all FF versions, IE6 and IE7 https://stackoverflow.com/questions/1465573/forcing-to-download-a-file-using-php#comment1314441_1465631


Most browsers allow users to download to disk if they want to. If the file must be saved to disk, if there is absolutely no other way to handle it, then the MIME type could be "application/octet-stream". However, this essentially says, "I can't or won't tell you what this is." Furthermore, the MIME type "application/octet-stream" provokes incorrect behavior in MSIE's HTTP implementation. A better alternative would be a custom MIME type like "application/x-some-explanation", which avoids these problems.

http://www.htmlhelp.com/faq/html/links.html#force-download
- possible solution https://stackoverflow.com/questions/1465573/forcing-to-download-a-file-using-php/1667651#1667651

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
