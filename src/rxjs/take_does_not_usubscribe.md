Just keep in mind that `take(1)` still doesn’t unsubscribe when component is being destroyed. The subscription remains active until first value is emitted no matter if component is active or destroyed. So if we do something more crazy, like accessing the DOM, in our subscription — we might end up with an error in the console.

https://stackoverflow.com/questions/40563065/difference-between-unsubscribe-to-take1/56680309#56680309
