- switch
  - why brak needed?
    - The optional break statement associated with each case label ensures that the program breaks out of switch once the matched statement is executed and continues execution at the statement following switch. If break is omitted, the program continues execution at the next statement in the switch statement. https://stackoverflow.com/questions/39757797/why-is-break-needed-when-using-switch
  - break from loop inside switch
    - use label
      ```javascript
      outerLoop: for (var a in b) {
        switch (something) {
          case "case1":
            //code inside
            break outerLoop;
        }
      }
      ```
      - https://stackoverflow.com/questions/17072605/break-for-loop-from-inside-of-switch-case-in-javascript/17072675#17072675
