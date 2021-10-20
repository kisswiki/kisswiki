## asterisk and directive

I have seen it in pug (previously jade) template:

```pug
.dropdown-menu(*dropdownMenu)
```

- https://stackoverflow.com/questions/40078189/angular-2-why-asterisk
- https://angular.io/guide/structural-directives#asterisk
- https://vsavkin.com/angular-2-template-syntax-5f2ee9f13c6a
  - https://github.com/jhusain/observable-spec

## misc

- https://angular.io/api/core/HostListener
- https://angular.io/guide/template-syntax
- https://angular.io/guide/property-binding
- https://angular.io/guide/two-way-binding

## different brackets

- https://stackoverflow.com/questions/55806775/the-angular-brackets-what-they-bind-and-when-to-use-which
- https://stackoverflow.com/questions/35944749/what-is-the-difference-between-parentheses-brackets-and-asterisks-in-angular2
- https://stackoverflow.com/questions/43633452/when-to-use-square-brackets-in-directives-inputs-and-when-not/43633667

## pug iterate over object

```pug
div(*ngFor="let item of colorsNames | keyvalue")
	span Key: b {{item.key}} and Value: b{{item.value}}
```

- https://stackoverflow.com/questions/35534959/access-key-and-value-of-object-using-ngfor

## interpolate in expression

```pug
div([style.grid-template-columns]="'repeat('+colors.length/2+', 1fr)'"
```

or

```pug
div(style="grid-template-columns: repeat({{colors.length/2}}, 1fr)"
```

- https://stackoverflow.com/questions/47057696/how-to-use-es6-template-literal-as-angular-component-input/47057836#47057836

## Angular 2 playground

- A minimal Angular2 playground using TypeScript and SystemJS loader
  - https://github.com/pkozlowski-opensource/ng2-play
  - http://stackoverflow.com/questions/32713534/how-to-config-system-js-when-using-angular2#comment53270349_32713534

## bubbling up event

### Description

`sign-up-box.pug` sends `modeChange` event.

`upgrade-modal.pug` listens to `modeChange` events and emits `modalClass` event.

`modals-box.pug` listens to `modalClass` event and sets `modalClass` to value of `modalClass` event.

class is set to value of `modalClass` using `ngClass`.

### Code

`upgrade-modal.pug`

```pug
sign-up-box((modeChange)="modalClass.emit($event === 'auth'? '': 'modal-lg')")
```

`upgrade-modal.ts`

```typescript
@Component({
  selector: "upgrade-modal",
  templateUrl: "upgrade-modal.pug",
  styleUrls: ["upgrade-modal.scss"],
})
export class UpgradeModal implements OnDestroy {
  @Output() close = new EventEmitter<void>();
}
```

`modals-box.pug`

```pug
	upgrade-modal((close)="closeModal('upgrade')" (modalClass)="modalClass=$event")

		.modal-dialog([ngClass]="modalClass" role="document")
```

`_modal.scss`

```scss
@include media-breakpoint-up(lg) {
  .modal-lg,
  .modal-xl {
    max-width: $modal-lg;
  }
}
```

## ngSwitch with multiple values for case

```typescript
<div [ngSwitch]="true">
    <div *ngSwitchCase="data.type === 'multi-choice' || data.type === 'singe-choice'">FORM 1</div>
    <div *ngSwitchCase="data.type === 'range'">FORM 2</div>
    <div *ngSwitchDefault>FORM 3</div>
</div>
```

https://stackoverflow.com/questions/40176061/two-switch-case-values-in-angular/45950368#45950368
