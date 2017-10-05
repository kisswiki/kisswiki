Slightly OT : With Stripe elements, we noticed an error in about 5% of the requests, something like "Stripe is not defined". Some of these errors were traced to older browsers with JS issues that couldn't execute "https://js.stripe.com/v3/".

We used to experience this exactly with stripe.js V2, our conclusion was it was some sort of connection issue and using this code to include stripe.js on both the checkout page but also our basket helped to ensure it has been loaded by the browser before it was needed. It massively reduced the instances of the error.

```html
  <script src="https://js.stripe.com/v3/"></script>
  <script>window.Stripe || document.write('<script src="https://js.stripe.com/v3/"><\/script>')</script>
  <script>window.Stripe || document.write('<script src="https://js.stripe.com/v3/"><\/script>')</script>
```

https://news.ycombinator.com/item?id=15398242
