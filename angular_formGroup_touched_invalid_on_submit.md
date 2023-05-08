```typescript
Object.keys(this.form.controls).forEach((key) => {
  this.form.get(key).markAsTouched();
});
```

- https://stackoverflow.com/questions/54943261/reactive-forms-mark-dirty-all-controls-in-form-group/54943363#54943363
