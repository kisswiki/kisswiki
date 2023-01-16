```html
<!DOCUMENT html>
<script type="text/javascript">
  // use when window.location.href is blocked
  // https://stackoverflow.com/questions/807878/how-to-make-javascript-execute-after-page-load/36096571#36096571
  // https://stackoverflow.com/questions/44221250/redirecting-to-a-page-after-submitting-form-in-html/73899969#73899969
  document.addEventListener("DOMContentLoaded", function () {
    document.forms["FormId"].submit();
  });
</script>
<form action="https://google.com" method="get" id="FormId"></form>
```
