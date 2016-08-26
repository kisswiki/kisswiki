- https://www.owasp.org/index.php/XSS_(Cross_Site_Scripting)_Prevention_Cheat_Sheet
- http://security.stackexchange.com/questions/32394/when-to-escape-user-input
- http://stackoverflow.com/questions/129677/whats-the-best-method-for-sanitizing-user-input-with-php

> Whenever you embed a string within foreign code, you must escape it, according to the rules of that language
> Do not try to prevent SQL injection by sanitizing input data.
> Instead, do not allow data to be used in creating your SQL code. Use Prepared Statements
> You can't generically filter data without any context of what it's for. Sometimes you'd want to take a SQL query as input and sometimes you'd want to take HTML as input
> http://stackoverflow.com/questions/129677/whats-the-best-method-for-sanitizing-user-input-with-php
