## Right now

Right now I use

- https://addons.mozilla.org/en-US/firefox/addon/containers-with-transitions/
- https://addons.mozilla.org/en-US/firefox/addon/containerise/
- http://addons.mozilla.org/en-US/firefox/addon/temporary-containers/ 
  - Not needed much because I open links in tmp container with the help of Containers with Transitions addon

## constant switch between containers

I have problem with Containerise addon and Containers with Transitions addon and also have Temporary Containers addon set to isolate external link. For example when I set in Containerise that github.com should be opened in `microsoft` container, and in Containers with Transitions I set that external links should be opened in `tmp` containers, there is infinite loop switching between `microsoft` and `tmp` containers.

## Cannot add subdomain

In Firefox Multi-Account Containers addon, I have set that facebook.com should be opened in `facebook` container, but `www.facebook.com` was added. So now link to subdomain like pl-pl.facebook.com is not opened in `facebook` container.


Solutions:

1. I did it by turning off my internet connection temporarily. This way the URL youtu.be showed an error page and from there I could add it to my container. Now clicking on Youtu.be links no longer results in duplicated tabs opening. https://github.com/mozilla/multi-account-containers/issues/1227#issuecomment-437760365
2. https://addons.mozilla.org/sv-SE/firefox/addon/containerise/
  - https://github.com/mozilla/multi-account-containers/issues/1227#issuecomment-401255011

## Links

- https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers/
- https://addons.mozilla.org/en-US/firefox/addon/containers-with-transitions/
  - https://www.ghacks.net/2019/01/02/containers-with-transitions-makes-firefox-containers-more-useful/
  - https://www.reddit.com/r/firefox/comments/abpssw/containers_with_transitions_choose_container_to/
- https://addons.mozilla.org/en-US/firefox/addon/containerise/
  - https://github.com/mozilla/multi-account-containers/issues/1227#issuecomment-401255011
