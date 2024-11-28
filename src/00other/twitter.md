- search in your twitter favourites http://favourites.io/ https://www.quora.com/What-are-the-best-ways-to-search-my-Twitter-favorites
- larger graphic
  - https://pbs.twimg.com/media/DDf7ef1XkAMh3Gp.jpg:large
  - https://pbs.twimg.com/media/DDf7ef1XkAMh3Gp.jpg:orig
  - https://github.com/mike-modoru/twitter-large-images/blob/master/background.js

## disable discover more

```
! https://www.reddit.com/r/uBlockOrigin/comments/13twvuu/comment/jmg78ak/
! Discover more / More Tweets - Conversation view suggestions
x.com##[aria-label="Timeline: Conversation"] [data-testid="cellInnerDiv"] h2:has-text(/^(Discover more|More Tweets)$/):upward([data-testid="cellInnerDiv"])
x.com##[aria-label="Timeline: Conversation"] [data-testid="cellInnerDiv"] h2:has-text(/^(Discover more|More Tweets)$/):upward([data-testid="cellInnerDiv"])~di
```
