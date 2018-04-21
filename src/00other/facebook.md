## Invisible space for comments

` ‍‍`

- https://www.facebook.com/help/community/question/?id=10205216493674351

## search

https://searchisback.com/

##	No boundaries for Facebook data: third-party trackers abuse Facebook Login

The linked article https://freedom-to-tinker.com/2018/04/18/no-boundaries-for-facebook-data-third-party-trackers-abuse-facebook-login/ provides much more detail and links to source code, such as https://gist.github.com/englehardt/db3ecea255ccd6aa2b0cb73ca76257d6#file-be-init-js-L1229
It's important to recognize that this is not an exploit or high-tech exfiltration: it's extremely well-documented in https://developers.facebook.com/docs/reference/javascript/FB.getLoginStatus and https://developers.facebook.com/docs/javascript/reference/FB.api - the Facebook library even assumes that potentially multiple scripts may be checking repeatedly, and caches accordingly. Facebook is incentivized to make it as easy as possible to integrate their login across the internet, and that entails removing any requirements such as server-side processing that would discourage every tag from including this code.

Seeing this and being surprised is like watching a teen movie where the gossiper invites the entire school to listen in on the phone line while the protagonist is (unwisely) sharing a secret with them, and thinking as you watch, "that's totally out of character for the gossiper - even though they want to collect people's information themselves, there's no way they would invite other people to listen in as they're in the process of receiving that information."

https://news.ycombinator.com/item?id=16871397