```javascript
export class Order {
  ProductId: number;
  Quantity: number;
  Price: number;
  get PriceTotal() {
    return this.Quantity * this.Price;
  }
}
```

https://stackoverflow.com/questions/51067329/how-to-update-a-property-on-another-property-change-in-angular-5/51067459#51067459
