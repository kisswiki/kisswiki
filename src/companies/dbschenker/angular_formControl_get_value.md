```html
<div
  *ngFor="let entry of fg.get('entries').controls; let i = index"
  [formGroupName]="i"
>
  {{ entry.get('name').value }}<br />
  {{ entry.value.id }}
</div>
```
