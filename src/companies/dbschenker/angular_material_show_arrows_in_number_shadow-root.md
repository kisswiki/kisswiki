```css
:host ::ng-deep .mdc-text-field__input::-webkit-inner-spin-button {
  /* https://stackoverflow.com/questions/75066261/angular-material-15-does-not-have-time-or-datetime-picker-icon-for-selection-of/75067056#75067056 */
  -webkit-appearance: auto;
  appearance: auto;
  /* https://stackoverflow.com/questions/25194631/is-it-possible-to-always-show-up-down-arrows-for-input-number/59555901#59555901 */
  opacity: 1;
}
```

- https://stackoverflow.com/questions/45487647/input-number-in-angular-material-design/76057341#76057341
- https://blog.consdata.tech/2019/08/22/view-encapsulation-w-angularze.html
- https://stackoverflow.com/questions/71680436/how-to-apply-styling-to-shadow-root-element-in-angular
- https://github.com/angular/components/issues?q=is%3Aissue+is%3Aopen+input+number+in%3Atitle
  - https://github.com/angular/components/issues/14050
  - https://github.com/angular/components/issues/14057
  - https://github.com/angular/components/issues/23894
- https://stackoverflow.blog/2022/12/26/why-the-number-input-is-the-worst-input/
