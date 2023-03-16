## ExpressionChangedAfterItHasBeenCheckedError in Angular Material Table

Problem:

There are a couple of lifecycle timing issues at play here, and when you think about it, this is right.The MatSort is part of the view, so it isn't 'ready' during OnInit - it is undefined. So trying to use it throws the error.The MatSort is ready in AfterViewInit, but things are further complicated by the fact that you need to 'apply' the sort to the datasource after performing the sort, and this triggers changes to the view by way of the renderedData that is 'connected' to the datasource. You therefore end up with an ExpressionChangedAfterItHasBeenCheckedError because the view initialization lifecycle hasn't completed but you are already trying to change it.So you can't sort until the view is ready, and you can't apply the sort when you are notified that the view is ready. The only thing you can do is wait until the end of the component initialization lifecycle. https://stackoverflow.com/questions/53013602/matsort-and-matpaginator-does-not-work-without-settimeout/53015635#53015635

Solution:

https://github.com/angular/components/issues/10205#issuecomment-517764676

- [Angular - NG0100: Expression has changed after it was checked](https://angular.io/errors/NG0100)
- [angular - ExpressionChangedAfterItHasBeenCheckedError in mat-table when there is \*ngIf in column - Stack Overflow](https://stackoverflow.com/questions/56004993/expressionchangedafterithasbeencheckederror-in-mat-table-when-there-is-ngif-in)
- [javascript - MatSort and MatPaginator does not work without setTimeOut - Stack Overflow](https://stackoverflow.com/questions/53013602/matsort-and-matpaginator-does-not-work-without-settimeout/53015635#53015635)
- [Mat Paginator is not working properly along when used conditional rendering (\*ngIf) on the outer div. · Issue #10205 · angular/components](https://github.com/angular/components/issues/10205)
- [angular - Set MatPaginator and MatSort in MatTableDataSource after getting data using ajax call - Stack Overflow](https://stackoverflow.com/questions/49230127/set-matpaginator-and-matsort-in-mattabledatasource-after-getting-data-using-ajax)
- [angular - After child has been initialised, operation from parent component on child DOM causes ExpressionChangedAfterItHasBeenCheckedError - Stack Overflow](https://stackoverflow.com/questions/54072065/after-child-has-been-initialised-operation-from-parent-component-on-child-dom-c/54072543#54072543)
- [ExpressionChangedAfterItHasBeenCheckedError when matSortActive and MatPaginator are both used · Issue #10394 · angular/components](https://github.com/angular/components/issues/10394)
- does not work https://stackblitz.com/edit/angular-material2-issue-gqmbva
- works https://stackblitz.com/edit/angular-material2-issue-cadz7g
- https://stackoverflow.com/questions/43375532/expressionchangedafterithasbeencheckederror-explained
- https://stackoverflow.com/questions/71978152/how-can-i-fix-this-specific-ng0100-expressionchangedafterithasbeencheckederror
