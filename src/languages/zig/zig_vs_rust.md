## the drop trait

The drop trait has its warts too. Zig's version sets up a point in time where the given cleanup code _will_ run (ignoring power outages and the like), and Rust's sets up a point in time where the given cleanup code is _allowed_ to run. It solves UAF, but it makes performance harder to reason about and makes leaks easier to write (a common theme in my complaints about Rust -- it's mostly a nice language, but many of the design choices slightly encourage leaky code, so most projects of any size and complexity have leaks). Having drops be that easy to write also encourages programmers to think in terms of small units of data rather than collections and common lifetimes, typically resulting in increased execution times.

Safe Rust prevents use-after-free, double-free, accessing uninitialized memory, (an extremely constrained form of) data races, and a number of other things. It doesn't give a rip about leaks beyond a best effort. Leaks do not violate memory safety.

Part of the reason it doesn't care is because it's hard to infer your intent. A common class of bug is accidentally boxing a reference to something you'd like to drop (this and similar flaws afflicted Actix till at least the 3.0 release). Rust confirms you don't have UAF and that you don't drop the data before you're done with it, but by accidentally writing it so that it lives nearly forever that drop is never executed.

Rust, similarly, makes no guarantees about drop's behavior at any point in time (other than that it won't be executed to soon and should usually attempt to be executed eventually), but definitely not near program shutdown or similar. It's especially dangerous because a huge fraction of programs run correctly regardless most of the time.

https://news.ycombinator.com/item?id=42549072

##

https://old.reddit.com/r/Zig/comments/1cu3bj7/advantagedisadvantages_to_rust/

## Primeagen: Zig vs Rust

Summary cons/pros

- return in Zig is always ending with semicolon. In Rust it is an expression if it doesn't have semicolon. So it is harder to grasp what is going on in Rust.
- performant Rust is 100% harder to understand than performant C++
- In Rust you don't know if something is on heap or on stack. You have to learn it. In Zig you know it.
- In Rust you feel like you program in high-level language. But you actually program in low-level language. And that mentally is a bit of a foot gun.
- Zig is like almost Rust but nicer.
- comptime in Zig is like macros in Rust but you don't have to have doctorate to use it. And you write comptime in Zig. And macros in Rust are like a different language. Level one is syntax. Level two is async and lifetimes. And procedural macros are very hard and like level 3. And you have to dye your hair blue when you reach level 3.
- When you start learning Rust, it is hard. It gets easy and then it gets significantly harder when you jump into async and stuff. When you use some web framework all that complexity is hidden from you. You don't even know what thread you're running on. But the moment you try to write those things, it's excessively difficult and generics can get really, really, really hard. Working with trait objects and generics is non-trivial. And people think it's trivial. And then you go to fourth level. The difficulty of Rust is a lifelong learning process and it is kind of a big issue. It gets exponentially harder. It is deceivingly easy at the beginning and then it very quickly ramps up.
- Using mutex, locking/unlocking it is cumbersome.
- In Rust memory will be freed and you don't know when. In Zig you know when memory is freed.

### Polish translation

- return w Zig zawsze kończy się średnikiem. W Rust jest to wyrażenie, jeśli nie ma średnika. Dlatego trudniej jest zrozumieć, co się dzieje w Rust.
- Wydajny Rust jest o 100% trudniejszy do zrozumienia niż wydajny C++
- W Rust nie wiesz czy coś jest na stercie czy na stosie. Musisz się tego nauczyć. W Zig to wiesz.
- W Rust masz wrażenie, że programujesz w języku wysokiego poziomu. Ale tak naprawdę programujesz w języku niskopoziomowym. I to mentalnie jest trochę jak pistolet na kulki.
- Zig jest jak prawie Rust, ale ładniejszy.
- Comptime w Zig jest jak makra w Rust, ale nie musisz mieć doktoratu, żeby go używać. Ale piszesz je w Zigu. A makra w Rust są jak inny język. Poziom pierwszy to składnia. Poziom drugi to async i lifetimes. A makra proceduralne są bardzo trudne i są na poziomie 3. I musisz przefarbować włosy na niebiesko, kiedy osiągniesz poziom 3.
- Kiedy zaczynasz uczyć się Rusta, jest to trudne. Robi się łatwo, a potem robi się znacznie trudniej, gdy wskoczysz w asynchroniczność i inne rzeczy. Kiedy używasz jakiegoś frameworka webowego, cała ta złożoność jest przed tobą ukryta. Nie wiesz nawet, w którym wątku działasz. Ale w momencie, gdy próbujesz napisać te rzeczy, staje się to zbyt trudne, a generics mogą stać się naprawdę, naprawdę, naprawdę trudne. Praca z obiektami cech i generycznymi jest nietrywialna. A ludzie myślą, że jest trywialna. A potem przechodzimy do czwartego poziomu. Trudność Rusta to proces uczenia się przez całe życie i jest to dość duży problem. Staje się wykładniczo trudniejszy. Na początku jest zwodniczo łatwy, a potem bardzo szybko rośnie.
- Używanie muteksów, blokowanie/odblokowywanie ich jest uciążliwe.
- W Rust pamięć zostanie zwolniona i nie wiadomo kiedy. W Zig wiesz, kiedy pamięć zostanie zwolniona.

[Is 2024 The Year Of Zig ? | ThePrimeTime](https://youtu.be/DucriSA8ukw)
