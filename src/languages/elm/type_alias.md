## Needed?

Alias is pretty important. Consider the following in a world where alias does not exist:

```elm
type Baz = BazC
type Bar a = BarC a
type Foo = Bar Baz
```

Is Foo a new type with a data constructor Bar which takes a Baz, or is Foo a type alias for the type constructor Bar applied to the type Baz?

https://github.com/elm/elm-lang.org/issues/249#issuecomment-74377357

## Contstructor

> the type alias gives you a constructor, arguments ordered by field order in the recorded
> jadams on elmlang slack
