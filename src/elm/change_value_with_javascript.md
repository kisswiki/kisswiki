>On a webpage however, this is not possible. At least not with Chrome 56. There is an isTrusted read only attribute of the Event object.
>
>The event is "trusted" if invoked by a real user on a keyboard, and is "not trusted" if invoked by a script.
>
>As indicated here, untrusted events do not invoke the default action. This has been present since Chrome 53.

- https://stackoverflow.com/questions/42638172/how-can-i-simulate-keys-entered-in-an-input-web-element-in-chrome-56-with-pure-j
- https://developer.mozilla.org/en-US/docs/Web/Guide/Events/Creating_and_triggering_events
- https://stackoverflow.com/questions/596481/is-it-possible-to-simulate-key-press-events-programmatically
