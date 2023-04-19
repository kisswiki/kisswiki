```typescript
// findIndex returns -1 if not found
// `removeAt` wraps around from the back if given negative
const index = this.images.value.findIndex((image) => image.id === 502);
if (index !== -1) this.images.removeAt(index);
```

https://github.com/angular/angular/issues/16322#issuecomment-356688188
