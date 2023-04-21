If you add `subscriptSizing="dynamic"` to `mat-form-field`, it'll remove the space until an error or hint actually needs to get displayed and only then expands. This causes a layout shift, but depending on your use case it is probably the better option than manually adding a margin as suggested before.

- https://stackoverflow.com/questions/53684763/how-to-remove-space-bottom-mat-form-field/75107066#75107066
- https://stackoverflow.com/questions/60442319/angular-material-styling-mat-form-field-inside-mat-toolbar/75200303#75200303
