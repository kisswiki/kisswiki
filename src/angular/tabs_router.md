app.component.html

```html
<main>
  <nav mat-tab-nav-bar [tabPanel]="tabPanel">
    @for (link of links; track link) {
    <a mat-tab-link [routerLink]="link.path" routerLinkActive #rla="routerLinkActive" [active]="rla.isActive"> {{link.label}} </a>
    }
  </nav>
  <mat-tab-nav-panel #tabPanel>
    <router-outlet  />
  </mat-tab-nav-panel>
</main>
```

app.component.ts

```typescript
import { Component } from '@angular/core';
import { RouterLink, RouterOutlet, RouterLinkActive } from '@angular/router';
import { MatButtonModule } from '@angular/material/button';
import { MatTabsModule } from '@angular/material/tabs';

@Component({
  selector: 'app-root',
  imports: [
    RouterOutlet,
    MatTabsModule,
    MatButtonModule,
    RouterLink,
    RouterLinkActive,
  ],
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
})
export class AppComponent {
  links = [
    { path: 'first', label: 'First' },
    { path: 'dqi', label: 'DQI' },
  ];
  activePath = this.links[0].path;

  onActivate(path: string) {
    this.activePath = path;
  }
}
```

app.routes.ts

```typescript
import { Routes } from '@angular/router';
import { TableComponent } from './table/table.component';
import { DqiComponent } from './dqi/dqi.component';

export const routes: Routes = [
  {
    path: '',
    redirectTo: 'first',
    pathMatch: 'full',
  },
  { path: 'first', title: 'First', component: TableComponent },
  { path: 'dqi', title: 'DQI', component: DqiComponent },
];
```

- <https://www.geeksforgeeks.org/angular-js/how-to-use-angular-mattabsmodule-with-routing-in-angular-17/>
- routerLinkActive <https://github.com/angular/components/issues/23801#issuecomment-948119901>
