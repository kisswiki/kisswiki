```typescript
import { Component, ViewEncapsulation } from "@angular/core";
import { TestApp } from "testapp.component.ts";
@Component({
  selector: "test-component",
  styleUrls: ["test.component.css"],
  templateUrl: "./test.component.html",
  directives: [TestApp],
  encapsulation: ViewEncapsulation.None, // <------
})
export class TestComponent {}
```

https://stackoverflow.com/questions/38798002/styling-not-applying-to-child-component/38798097#38798097
