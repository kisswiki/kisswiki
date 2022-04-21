ES6 Template literals (Template strings) cannot be used inside an Angular component input, because the [Angular compiler](https://www.npmjs.com/package/@angular/compiler) doesn't know this grammar.

Use angular's interpolation syntax in attribute values

```html
<app-my-component myInput="My name is {{ name }}!"></app-my-component>
```

or string concatenation:

```html
<app-my-component [myInput]="'My name is ' + name + '!'"></app-my-component>
```

https://stackoverflow.com/questions/47057696/how-to-use-es6-template-literal-as-angular-component-input/47057846#47057846
