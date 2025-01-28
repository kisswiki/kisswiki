but unknown isn't assignable to anything but itself and any without a type assertion or a control flow based narrowing

unknown można bez koercji do any przypisać

Much like any, any value is assignable to unknown; however, unlike any, you cannot access any properties on values with the type unknown, nor can you call/construct them. Furthermore, values of type unknown can only be assigned to unknown or any.

czyli też nic nie możesz zrobić z unknown bez koercji

any to wyłączenie sprawdzania przez kompilator, a uknown to musisz powiedzieć kompilatorowi co tam jest

koercja to taka konwersja typu. koercja to krótsze słowo, bo się ukrywa. robi się bez naszej wiedzy 😃

parseInt to konwersja, sami to jawnie wywołujemy

https://stackoverflow.com/questions/51439843/unknown-vs-any

any.ts

```typescript
let value: any;

value = 42; // OK
value = "Hello, World!"; // OK
value = [1, 2, 3]; // OK
value = { name: "Alice" }; // OK

// You can call any method or access any property without TypeScript checking
value.toUpperCase(); // No error at compile time, but will throw an error at runtime if value is not a string
value(); // No error at compile time, but will throw an error at runtime if value is not a function
```

No errors.

```shell
tsc any
```

unknown.ts

```typescript
let value: unknown;

value = 42; // OK
value = "Hello, World!"; // OK
value = [1, 2, 3]; // OK
value = { name: "Alice" }; // OK

// The following lines would cause TypeScript errors:
value.toUpperCase(); // Error: Object is of type 'unknown'
value(); // Error: Object is of type 'unknown'

// You need to narrow the type before performing operations
if (typeof value === "string") {
  console.log(value.toUpperCase()); // OK, value is now narrowed to string
}

if (typeof value === "number") {
  console.log(value.toFixed(2)); // OK, value is now narrowed to number
}
```

```shell
$ tsc unknown.ts
unknown.ts:9:7 - error TS2339: Property 'toUpperCase' does not exist on type 'unknown'.

9 value.toUpperCase(); // Error: Object is of type 'unknown'
        ~~~~~~~~~~~

unknown.ts:10:1 - error TS2349: This expression is not callable.
  Type '{}' has no call signatures.

10 value(); // Error: Object is of type 'unknown'
   ~~~~~


Found 2 errors in the same file, starting at: unknown.ts:9
```

Watchout for bun, as it does not type check, only transpile.
