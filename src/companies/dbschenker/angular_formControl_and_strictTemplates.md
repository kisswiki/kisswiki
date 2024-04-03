```typescript
import { Pipe, PipeTransform } from '@angular/core';
import { AbstractControl, FormControl } from '@angular/forms';

/**
 * https://stackoverflow.com/a/72517767/588759
 * https://stackoverflow.com/a/67059770/588759
 */

@Pipe({
  name: 'formControl',
})
export class FormControlPipe implements PipeTransform {
  transform(value: AbstractControl): FormControl<typeof value['value']> {
    return value as FormControl<typeof value['value']>;
  }
}
```

I needed to add this pipe `src/app/modules/ui-common/ui-common.module.ts`. Didn't work when added to `src/app/app.module.ts`.

I was getting error: https://stackoverflow.com/questions/62161219/angular-no-pipe-found-with-name