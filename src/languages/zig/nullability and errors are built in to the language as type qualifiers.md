I like the fact that the type system is so plain and simple like C, and yet nullability and errors are built in to the language as type qualifiers (I've never seen this before). I normally like a language with a powerful type system, but usually people abuse the type system in library code and you end up digging through 5 layers of abstraction to figure out how to get the 32-bit RGBA pixels of a PNG (had to do this with some bitch ass rust library written by a dude high on his own farts). I think these days I'm more attracted to a language with a simple type system and just enough features to get the job done.

https://www.youtube.com/watch?v=SBe8DgBCjTc&lc=UgzkEi1b1bxn_aP60HV4AaABAg

o co chodzi z tym nullability i errors jako wbudowane w język kwalifikatory typu?

np. zmienna my_var może być nullem lub mieć wartość

```zig
var my_var: ?bool = null;
```

a potem można przypisać wartość

```zig
my_var = false;
```

a jeśli chodzi o errors to funkcja może zwracać wartość albo wyrzucić error

```zig
fn my_func() !bool {
  if(sth) error.InvalidChar;
  return true;
}
```

czyli zwracasz normalnie wartość bool, ale funkcja może też zwrócić error

`!bool` oznacza jakikolwiek error lub bool

można też zawęzić do jednego errora `error{InvalidChar}!bool`

Ale w js też zwracasz error.... Rzucając i łapiąc poza 😃 Semantyka

to że jest to częścią typu, daje to że kompilator może ci sprawdzić czy stosujesz się do tego typu

oprócz tego, że programista widzi co może być zwrócone

jak nie zrobisz `!bool` to funkcja nie ma prawa wyrzucić errora

I tu cię kompilator przypilnuje
