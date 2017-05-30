- `npm install -g typescript`

>The main reason why I prefer TypeScript at the current point in time is that it encourages the use of type-safety more so than Flow. It has been my experience that when you work with a team on a project, Flow does nothing to enforce the usage of static-typing, meaning that your team members can very easily sidestep Flow’s type-checking. With TypeScript, it is a given that anyone working on the project will be using static typing and you end up with higher quality code as a result.
>
>-- https://medium.com/front-end-hacking/es2015-vs-elm-vs-typescript-a88dbc5d14d9

## typescript vs flow

Michał Miszczyszyn:

Poza tym składniowo i koncepcyjnie Flow i TS niczym się nie różnią, poza kilkoma minimalnymi niuansami. Za to TS ma większe community, więcej paczek .d.ts i (moja opinia) lepiej rozwiązane importowanie typów (typy są importowane razem z paczką, a nie dodatkowo – we Flow trzeba mieć dwa importy, a w TS jeden).

Plików definicji nie pisze się ręcznie, poza sytuacjami gdy chcesz stworzyć .d.ts do już istniejącej biblioteki. Jako programista aplikacji (a nie twórca bibliotek) plików definicji nie musisz dotykać

https://www.facebook.com/groups/257881290932879/permalink/1358876237500040/
