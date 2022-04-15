```typescript
function strEnum<T extends string>(o: Array<T>): { [K in T]: K } {
  return o.reduce((res, key) => {
    res[key] = key;
    return res;
  }, Object.create(null));
}
let dynamicArrayJSON = ["RED", "BLUE", "GREEN"];
const Colors = strEnum(dynamicArrayJSON);
```

https://stackoverflow.com/questions/48483534/converting-string-array-to-enum-in-typescript/48483967#48483967
