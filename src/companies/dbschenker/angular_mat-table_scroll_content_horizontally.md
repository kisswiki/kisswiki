```css
.table-responsive {
  overflow-x: auto;
}
.table-responsive table {
  white-space: nowrap;
}
```

From https://stackoverflow.com/questions/19794211/horizontal-scroll-on-overflow-of-table/48930521#48930521

This also worked, but columns were squashed together:

```css
.mat-mdc-table {
  display: block;
  width: 100%;
  overflow-x: auto;
}
```

- https://stackblitz.com/edit/angular-mat-table-scroll-m9bjdg
  - forked from https://stackblitz.com/edit/angular-mat-table-scroll
- https://stackoverflow.com/questions/50824617/angular-material-table-sizing-scroll/76099954#76099954
