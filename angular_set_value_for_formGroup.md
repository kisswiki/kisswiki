````typescript
To set all FormGroup values use, setValue:

```typescript
this.myFormGroup.setValue({
  formControlName1: myValue1,
  formControlName2: myValue2
});
````

To set only some values, use patchValue:

```typescript
this.myFormGroup.patchValue({
  formControlName1: myValue1,
  // formControlName2: myValue2 (can be omitted)
});
```

https://stackoverflow.com/questions/38655613/angular2-set-value-for-formgroup/39752561#39752561
