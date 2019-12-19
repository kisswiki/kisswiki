For mapdid:

```javascript
module.exports = {
    setup :
        function(app) {
            var containsObserver = app.ports.containsObserver_701aae30_0dc8_4bbf_9943_c5d1e28e6b07;
            var onContains = app.ports.onContains_3feaf185_0702_4f48_a011_ff932defa8df;
            var onObserverReady = app.ports.onObserverReady_052febed_7162_480c_96c9_720fd9625d05;
	    var id;
            if (containsObserver) {
                var portCallback = function() {
                    var observer = new MutationObserver(function(mutations) {
                        if (onContains && id && document.body.contains(document.getElementById(id))) {
                            console.log(id + " is in the DOM!");
                            onContains.send(id);
                            // observer.disconnect();
			    // containsObserver.unsubscribe(portCallback);
                        }
                    });

                    observer.observe(document, {attributes: false, childList: true, characterData: false, subtree:true});

                    var canaryId = "canary-01303256-7d35-4f7f-b887-06ce5b175ebd";
                    var newDiv = document.createElement("div");
                    newDiv.id = canaryId
                    document.body.appendChild(newDiv);

                    function observerReady() {
                        var el = document.getElementById(canaryId);
                        if (onObserverReady && document.body.contains(el)) {
                            console.log("Canary is in the DOM!");
                            onObserverReady.send(null);
                            clearInterval(intervalID);
                            el.remove();
                        }
                    }

                    var intervalID = window.setInterval(observerReady, 500);
                };
                containsObserver.subscribe(portCallback);
            }
        }
};
```

https://stackoverflow.com/questions/11455515/how-to-check-whether-dynamically-attached-event-listener-exists-or-not/11455849#11455849
