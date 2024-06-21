- [zig is the future of programming. here's why. | Low Level Learning](https://youtu.be/pnnx1bkFXng)

##

I have been using Zig in earnest for about 8 months now. At that time my default choice for new projects was Rust, so I picked up the biggest Rust project I had ([comrak](https://github.com/kivikakk/comrak), perhaps the 2nd most popular CommonMark/GFM formatter in the ecosystem) and [converted it to Zig](https://github.com/kivikakk/koino). It was quite refreshing.

Since then I’ve built a number of tools with Zig, and I have honestly not had to deal with memory leaks, use-after-free, double-free, etc. almost ever. The general purpose allocator does what you would otherwise have to reach for Valgrind for, but better. The careful design of defer, errdefer and control flow around error handling make it quite a joy to use.

If you already grok manual memory management as a concept (say, you’ve used C quite a bit before), then Zig feels like it gives you all the tools you need to do it sanely without much overhead, like what you always wanted. A lot of people are repelled by the idea of doing it ‘manually’, but my experience is that it is the poor affordances C gives that generates that repulsion. I do recommend it.

https://lobste.rs/s/f98dpj/pin_suffering#c_2z4fal

##

Zig is dramatically simpler than rust. It took a few days before I felt proficient vs a month or more for rust.

Most of this difference is not related to lifetimes. Rust has patterns, traits, dyn, modules, declarative macros, procedural macros, derive, associated types, annotations, cfg, cargo features, turbofish, autoderefencing, deref coercion etc. I encountered most of these in the first week. Just understanding how they all work is a significant time investment, let alone learning when to use each and how they affect the available design space.

I still haven't internalized the full rule-set of rust enough to be able predict whether a design in my head will successfully compile. I don't remember the order in which methods are resolved during autoderefencing, or how module visibility works, or how the type system determines if one impl might overlap another or be an orphan. There are frequent moments where I know what I want the machine to do but struggle to encode it into traits and lifetimes.

Zig manages to provide many of the same features with a single mechanism - compile-time execution of regular zig code. This comes will all kinds of pros and cons, but one large and important pro is that I already know how to write regular code so it's easy for me to just write down the thing that I want to happen.

https://scattered-thoughts.net/writing/assorted-thoughts-on-zig-and-rust/

##

Despite all this, I still don’t feel comfortable with Rust. It feels fractally complex — seemingly every time I use Rust on a new project, I run into some issue that forces me to confront a new corner of the language/ecosystem. Developing my keyboard firmware was no exception: I ran into two problems, and each required learning a completely new language feature.

These problems aren’t really specific to embedded, but they’re representative of the sorts of challenges I’ve run into using Rust over the past three years.

Using Zig for just a few hours has highlighted to me aspects of Rust that I’d never before considered. In particular, that much of the complexity I’d unconsciously attributed to the domain — “this is what systems programming is like” — was in fact a consequence of deliberate Rust design decisions.

For example, it’s now quite clear to me that Rust is a language which has a dedicated feature for everything. In addition to its famous borrow checker, Rust has modules, packages, generics, traits, two kinds of macros, attribute annotations, and a dozen other things.

Heck, even defining immutable variables is done with different language features depending on whether it’s in a function context or module context

> a particular form of guessability: when a person knows some of the language structure, how much of the rest can be guessed successfully?

Rust has many language features and they’re all largely disjoint from each other, so knowing some doesn’t help me guess the others.

Nothing I knew about if expressions helped me predict or understand the attribute annotation / feature system, even though they’re both fulfilling a conceptually similar need (conditional logic). Nothing I knew about functions helped me understand syntax macros.

Conversely, this “consistency” principle also explains why I had such an easy time picking up Zig — it absolutely excels in this department. Not only are there many fewer features to learn in the first place, they seem to all fit together nicely: The comptime and inline for keywords, for example, allowed me to leverage at compile-time all the looping, conditions, arithmetic, and control flow I wanted using the syntax and semantics I’d already learned — Zig!

Even though I’m only a dozen hours in, I feel like I can already be productive with Zig without an Internet connection. It feels like Zig is a language that I’d be able to master; to fully internalize such that I can use it without thinking about it. This feels super exciting and empowering.

https://kevinlynagh.com/rust-zig/

##

Zig is one of the most interesting languages I've seen in a very long time, and possibly the first radical breakthrough in low-level programming design in decades. Maybe it will become a big success and maybe it will tank, but after having two visions for low-level programming -- that of C's "syntax-sugared Assembly", or that of C++'s "zero-cost abstractions" whose low-level, low-abstraction code appears high level on the page, once you get all the pieces to fit (Rust, while introducing the ingenious borrow checking, still firmly follows C++'s design philosophy and can be seen as a C++ that checks your work) -- Zig shows a third way by rethinking, from the ground up, how low-level programming could and should be done.
It manages to address all of C++'s biggest shortcomings, which, in my view, are 1. language complexity, 2. compilation time, 3. safety -- in this order -- and it does so in a language that is arguably simpler than C, can be fully learned in a day or two (although the full implications of the design might take longer to sink in), and also inspires a new approach to partial evaluation, replacing generics and value templates, concepts/traits/typeclasses, constexprs/procedural macros, macros (or, at least, the "good parts" of macros) and conditional compilation with a single, simple feature.

- https://news.ycombinator.com/item?id=24616672
  - https://twitter.com/MichalZiulek/status/1502983958233034753

##

As someone who knows C and not Zig, Zig is very interesting. It has incremental compilation, in-place binary patching, the ability to use code before declaration in a file, compile-time code execution, and extremely low compile times. Rust itself doesn't have most of those.

https://news.ycombinator.com/item?id=26651603

## Zig vs Rust vs C vs C++

Od dłuższego czasu planuję bardzo duży projekt. Jest to projekt symulacyjny, który wymaga niskopoziomowego kodu dla wydajności. Przez wiele lat byłem wielkim fanem Rusta i pisałem w nim duże projekty. Ale w zeszłym roku zacząłem mieć wrażenie, że Rust wpada w pułapkę C++, polegającą na dodawaniu funkcji za funkcją bez wyraźnego powodu. Staje się coraz bardziej złożony, ale niekoniecznie łatwiejszy w użyciu. I mają obietnicę kompatybilności wstecznej, więc utknęli z tym, co dodali.

Wiele projektów, które napisałem w Rust, wymaga również zaprojektowania architektury z myślą o borrow checkerze, czasami trzeba zaprojektować abstrakcje w oparciu o to, co właścicielem pamięci, a nie o to, co ma największy sens. Zwłaszcza do celów cache'owania nie można wskazywać pamięci należącej do pola w tej samej strukturze, więc trzeba utworzyć kolejny poziom, aby to obejść.

Z tych powodów szukałem innych języków do wykorzystania w moim następnym dużym projekcie. Nie przepadam za C++ ze względu na jego rozdęcie i spuściznę, nowy system modułów rozwiązuje niektóre z moich problemów z C++, ale nie ma dla niego jeszcze nawet wsparcia LSP. C był językiem, na który się zdecydowałem, ale to trochę wytrąciło mnie z nastroju do kontynuowania. Moim głównym problemem z C jest to, że nie ma przestrzeni nazw, więc zaczynasz się zderzać, jeśli nie wymyślisz i nie zastosujesz strategii nazewnictwa. Brakuje mu również dobrego metaprogramowania, co utrudnia budowanie i szlifowanie pracy.

Rozważałem również Adę i spróbowałem, ale wydawała mi się zbyt sztywna i rozwlekła. Jedną z cech, które uwielbiałem w Adzie, był sposób, w jaki radziła sobie z generycznymi typami poprzez generowanie typów z danych wejściowych w czasie kompilacji, coś w rodzaju szablonów w C++, ale wydaje się bardziej typu runtime.

Kilka dni temu słuchałem podcastu z Andrew Kelleyem, w którym mówił, że celem Zig jest bycie prostym językiem, a kiedy zostanie wydana wersja v1.0, planują ledwo go dotknąć. Wyjaśnił, że martwi się, jak to zrobić na dłuższą metę.

To naprawdę mnie poruszyło, wydaje mi się, że właśnie tego potrzebujemy. Zasadniczo nowy C, ale z funkcjami metaprogramowania i dobrymi odstępami między nazwami.

Spędziłem cały weekend pisząc w Zigu dla mojej symulacji, aby spróbować. I jestem całkowicie przekonany. Nie utknąłem ani razu, za każdym razem, gdy napotykałem problemy, udało mi się je rozwiązać w ciągu kilku minut za pomocą logicznego myślenia. Jedyną nauką, jaką przeprowadziłem, było przeczytanie samouczka na stronie zig.guide, zanim zacząłem.

Podoba mi się to, że wszystkie importy są obsługiwane jako struct i można ich używać tak jak zwykłych stałych. Uwielbiam czas kompilacji, który pozwala uzyskać funkcjonalność szablonu z C++ lub funkcję generyczną z Ady i makra z Rusta bez konieczności myślenia o tym. Uwielbiam to, jak łatwo jest połączyć się z C bez żadnego boilerplate. Obsługa błędów jest bardzo podobna do tej w Rust, co bardzo mi się podoba.

Jedyną rzeczą, za którą myślę, że będę tęsknić, są klasy typów/cechy/interfejsy. Jeszcze za tym nie tęskniłem, ale podoba mi się ten rodzaj projektu, w którym można rozszerzyć dowolny typ, aby był zgodny z nowymi kontraktami. Można to jednak obejść (C tego nie ma i można w nim zrobić wszystko), więc myślę, że nie mam nic przeciwko brakowi tych funkcji, jeśli Andrew sprawi, że projekt będzie trzymał się filozofii prostego języka.

Naprawdę mam nadzieję, że Zig przetrwa i stanie się nowym C za około 10 lat. Myślę, że branża oprogramowania przechodzi na coraz bardziej złożone systemy bez powodu, Zig jest jak powiew świeżego powietrza.

https://www.reddit.com/r/Zig/comments/1ckstjv/im_sold_on_zigs_simplicity/
