```javascript
var targetNode = document.querySelector ("a[href*='stackoverflow']");
if (targetNode) {
    //--- Simulate a natural mouse-click sequence.
    triggerMouseEvent (targetNode, "mouseover");
    triggerMouseEvent (targetNode, "mousedown");
    triggerMouseEvent (targetNode, "mouseup");
    triggerMouseEvent (targetNode, "click");
}
else
    console.log ("*** Target node not found!");

function triggerMouseEvent (node, eventType) {
    var clickEvent = document.createEvent ('MouseEvents');
    clickEvent.initEvent (eventType, true, true);
    node.dispatchEvent (clickEvent);
}
```

https://stackoverflow.com/questions/24025165/simulating-a-mousedown-click-mouseup-sequence-in-tampermonkey/24026594#24026594
