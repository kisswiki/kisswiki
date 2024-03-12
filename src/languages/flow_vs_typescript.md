##

Michał Miszczyszyn:

Poza tym składniowo i koncepcyjnie Flow i TS niczym się nie różnią, poza kilkoma minimalnymi niuansami. Za to TS ma większe community, więcej paczek .d.ts i (moja opinia) lepiej rozwiązane importowanie typów (typy są importowane razem z paczką, a nie dodatkowo – we Flow trzeba mieć dwa importy, a w TS jeden).

Plików definicji nie pisze się ręcznie, poza sytuacjami gdy chcesz stworzyć .d.ts do już istniejącej biblioteki. Jako programista aplikacji (a nie twórca bibliotek) plików definicji nie musisz dotykać

https://www.facebook.com/groups/257881290932879/permalink/1358876237500040/

##

I don't want to start a holy war on this, as it's generally accepted that Flow's type system and inference is superior. I believe TypeScript is a generally better solution despite this, for other reasons. This is just the list I can come up with offhand:
Upsides for TypeScript:

- bigger community
- more definitions (This cannot be overstated; the gap is wide)
- great IDE tooling and support via language service
- great compiler

Downsides for Flow:
- less definitions
- smaller community
- .flowconfig is difficult to get right, and often requires hacks to pass type checking
- dodgy IDE support
- type discovery is more difficult

https://news.ycombinator.com/item?id=15295951
