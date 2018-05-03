```elm
isLeapYear : Int -> Bool
isLeapYear year =
    year % 4 == 0 && year % 100 /= 0 || year % 400 == 0
```

- https://stackoverflow.com/questions/725098/leap-year-calculation/725111#725111
- https://sites.google.com/a/jcu.edu/cs128fall2012/daily-lessons/10-26/boolean-logic-example-leap-year