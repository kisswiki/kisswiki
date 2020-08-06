## How to open live debug of firefox interface

- https://www.reddit.com/r/FirefoxCSS/comments/73dvty/tutorial_how_to_create_and_livedebug_userchromecss/
- https://developer.mozilla.org/en-US/docs/Tools/Browser_Toolbox

Remember that browser toolbox is active for particular window.

## Cannot open browser toolbox

Open your root profile folder (about:profiles has a button for this) in file manager. Then delete the folder called "chrome debugger profile". Then try again. You don't need to even close Firefox because the problem is that the debugger cannot load it's profile which is different to normal Firefox profile.

- https://www.reddit.com/r/firefox/comments/e2fn20/browse_toolbox_not_opening/f8w1s0w/
- https://www.reddit.com/r/firefox/comments/7c7qe9/browser_toolbox_wont_open_sometimes/