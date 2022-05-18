throttleTime - emits first value then restarts timer

debounceTime - restarts timer

debounce - can have conditional/variable timer

```typescript
fromEvent(this.elInput.nativeElement, "input")
  .pipe(debounce((ev) => (ev.hasSomeValue ? timer(2000) : of({}))))
  .subscribe((event) => this.onInput(event));
```

- https://stackoverflow.com/questions/53044981/how-to-make-observable-debouncetime-conditional/53045259#53045259

auditTime - always emits after time

https://medium.com/@jvdheijden/rxjs-throttletime-debouncetime-and-audittime-explained-in-examples-c393178458f3
