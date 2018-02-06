it was due to the browser attempting to validate hidden fields. It was finding empty fields in the form and trying to focus on them, but because they were set to display:none;, it couldn't.

https://stackoverflow.com/questions/22148080/an-invalid-form-control-with-name-is-not-focusable/22753533#22753533
