## flex-layout

- https://github.com/ngbracket/ngx-layout
  -  https://github.com/angular/flex-layout/issues/1426#issuecomment-1436066600

Alternatively:

- https://github.com/angular/flex-layout/issues/1426#issuecomment-1342706122https://github.com/philmtd/css-fx-layouthttps://gist.github.com/emonney/6c635f2916773ec2f0033443fc0338a6
- https://github.com/angular/flex-layout/issues/1426#issuecomment-1375585742https://github.com/angular/flex-layout/issues/1426#issuecomment-1422512784
- instead of BaseDirective2 use https://material.angular.io/cdk/layout/overview#breakpointobserver

I experienced follwing problems while migrating to other libraries:Migrating to Bootstrap grid = bloated class attributeMigrating to Tailwind css = same, bloated class attributeWriting your own classes = difficult to maintain when application grows larger and difficult to understand 'quickly' for other devs who are working on the same project. https://github.com/angular/flex-layout/issues/1426#issuecomment-1313167337

## This helped to convert to Angular 15 and get rid of flex-layout

- https://material.angular.io/components/table/overview
- https://material.angular.io/components/dialog/examples_