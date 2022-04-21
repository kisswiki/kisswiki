ES6 Template literals (Template strings) cannot be used inside an Angular component input, because the [Angular compiler](https://www.npmjs.com/package/@angular/compiler) doesn't know this grammar.

Use string concatenation:

```html
<app-my-component [myInput]="'My name is ' + name + '!'"></app-my-component>
```

or angular's interpolation syntax in attribute values

```html
<app-my-component myInput="My name is {{ name }}!"></app-my-component>
```
