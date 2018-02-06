mamy różne źródła eventów

`Observable` ma różne adaptery do różnych rodzajów eventów, np.:

```const node = document.querySelector('input[type=text]');
const input$ = Rx.Observable.fromEvent(node, 'input');
```

Dzięki czemu może takie źródło wystawić pod standardowym interfejsem: `next`, `error`, `complete`.

Robi się z tego jakby nieskończona tablica z takimi handlerami w zależności co się dzieje w tej tablicy.

Tak jak mamy zmienną i sewkencję. Jako struktura danych to sobie mogę observable tak wyobrazić jako tablica z eventami, które się odpalają na zdarzenia `next`, `error`, `complete`.

Od razu możemy określić różne operacje na tej tablicy chainując je: `scan`, `reduce`, `filter`, `map` itp.

https://github.com/ReactiveX/rxjs/blob/master/doc/operators.md

Dopiero jak wykonujemy subscribe, to trzy rzeczy się dzieją:

- określamy co chcemy robić na te handlery `next`, `error`, `complete`,
- oraz dane z emitera są wpuszczane w nasz chain operacji.
- zwraca jest funkcja, którą wykonanie zrobi unsubscribe

Oprócz takich operacji jak na tablicy dochodzą nowe typu:

- złączenie strumieni,
- zamiana jednego strumienia w drugi.