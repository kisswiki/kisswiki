```javascript
function assert(condition, message) {
    if (!condition) {
        message = message || "Assertion failed";
        if (typeof Error !== "undefined") {
            throw new Error(message);
        }
        throw message; // Fallback
    }
}
```

http://stackoverflow.com/questions/15313418/javascript-assert/15313435#15313435
