Checking official example https://embed.plnkr.co/?show=preview

file app.component.ts

template in a string, seriously?

```import { Component }          from '@angular/core';

@Component({
  selector: 'my-app',
    template: `
      <h1>{{title}}</h1>
      <nav>
        <a routerLink="/dashboard" routerLinkActive="active">Dashboard</a>
        <a routerLink="/heroes" routerLinkActive="active">Heroes</a>
      </nav>
      <router-outlet></router-outlet>
    `,
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'Tour of Heroes';
}
```

`class MyApp extends Component {}`  is so much better imo

than `@Component({  selector: 'my-app' })`

Seriously this is better than `map`?

```<div *ngFor = "let whiskey of whiskeyCat" (click) = "setSelectedWhiskey(whiskey)" class="product">
    <img (click)="onClick($event)" id="{{ whiskey.imgsrc }}" src="{{ whiskey.imgsrc }}">
    <h1> {{whiskey.whiskeyName}} </h1>
    <h1> ${{whiskey.price}} </h1>
     {{whiskey.description}}  
     {{whiskey.rating}} 
    <span> <a (click) ="selectWhiskey(whiskey)" class ="ion-edit">  </a> </span>
</div>
```

my eyes are bleeding

example from http://jsdiaries.com/2017/04/12/angular-4-directives-overview/

react equivalent:

```
{ whiskeyCat.map(whiskey => (
  <div onClick={setSelectedWhiskey(whiskey)} className="product">
    <img id={whiskey.imgsrc} src={whiskey.imgsrc}>
    <h1> {whiskey.whiskeyName} </h1>
    <h1> {whiskey.price} </h1>
     {whiskey.description}
     {whiskey.rating}
   <span> <a onClick={setSelectedWhiskey(whiskey)} className="ion-edit">  </a> </span>
</div>)
)}
```