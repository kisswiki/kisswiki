- `npm install -g typescript`

>The main reason why I prefer TypeScript at the current point in time is that it encourages the use of type-safety more so than Flow. It has been my experience that when you work with a team on a project, Flow does nothing to enforce the usage of static-typing, meaning that your team members can very easily sidestep Flow’s type-checking. With TypeScript, it is a given that anyone working on the project will be using static typing and you end up with higher quality code as a result.
>
>-- https://medium.com/front-end-hacking/es2015-vs-elm-vs-typescript-a88dbc5d14d9

## flow vs typescript

flow_vs_typescript.md

##

Tak ciekawostka z Typescript 3.7:

Jak użyć `optional chaining` i `null coalescing` do wyświetlenia komponentu, ale nie chcemy, żeby się `foo` pokazało, które jest `falsy`:

`foo?.toString && <Something foo={foo} />`

https://github.com/microsoft/TypeScript/issues/26578#issuecomment-518030857

https://www.typescriptlang.org/docs/handbook/release-notes/typescript-3-7.html#nullish-coalescing

https://www.typescriptlang.org/docs/handbook/release-notes/typescript-3-7.html#optional-chaining

## Javascript

https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing_operator

https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining

## new and classes

I tried to have this:

```typescript
function Interval(startTime: number, endTime: number, price: number) {
    this.startTime = startTime;
    this.endTime = endTime;
    this.price = price;
}
```

But was problem with implicit this https://stackoverflow.com/questions/52431074/how-to-solve-this-implicitly-has-type-any-when-typescript-checking-classic/52432089#52432089

Quickfix fixed with adding `this: any`:

```typescript
function Interval(this: any, startTime: number, endTime: number, price: number) {
    this.startTime = startTime;
    this.endTime = endTime;
    this.price = price;
}
```

But later when I tried to use it with `new Interval(...)` it turned out that I should use `new` only with classes https://stackoverflow.com/questions/42106306/typescript-error-ts7009

So I ended up with:

```typescript
class Interval {
    startTime: number;
    endTime: number;
    price: number;

    constructor(startTime: number, endTime: number, price: number) {
        this.startTime = startTime;
        this.endTime = endTime;
        this.price = price;
    }
}
```
