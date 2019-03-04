## calculator tutorial

- http://lalrpop.github.io/lalrpop/tutorial/index.html
- https://github.com/lalrpop/lalrpop/tree/master/doc/calculator

### example

```rust
pub Term: i32 = {
    <n:Num> => n,
    "(" <t:Term> ")" => t,
};
Num: i32 = <s:r"[0-9]" => i32::from_str(s).unwrap();
```


## pub

>First, this nonterminal is declared as pub. That means that LALRPOP will generate a public struct (named, as we will see, TermParser) that you can use to parse strings as Term. Private nonterminals (like Num) can only be used within the grammar itself, not from outside.


## action

Action code is inside `<>`.


### <>

`A => bar(<>)` is shorter alternative to `<a:A> => bar(a)`.

`<>` is a shorthand that says "synthesize names for the matched values and insert a comma-separated list here".

`<A> B => bar(<>)` means, take `A` literal, and return wrapped/run with bar.


### infer type annotation:

```rust
pub Term = { Num, "(" <Term> ")" };
Num: i32 = r"[0-9]+" => i32::from_str(<>).unwrap();
```

In above, type form `Term` will be infered from `Num` as `i32`.

## terminals vs nonterminals

terminal aka token

lexer aka tokenizer

our grammar included two distinct kinds of symbols:
- nonterminals, Term and Num, which we defined by specifying a series of symbols that they must match, along with some action code that should execute once they have matched
- terminals, which consist of the string literals and regular expressions sprinkled throughout the grammar

when LALRPOP generates a parser, it always works in a two-phase process:
1. lexer or tokenizer - figuring out the sequence of terminals: analyzes the raw characters of your text and breaks them into a series of terminals. It does this without having any idea about your grammar or where you are in your grammar.
2. the parser proper is a bit of code that looks at this stream of tokens and figures out which nonterminals apply

### regex

LALRPOP's default lexer is based on regular expressions. By default, it works by extracting all the terminals (e.g., `"("` or `r"\d+"`) from your grammar and compiling them into one big list. At runtime, it will walk over the string and, at each point, find the **longest** match from the literals and regular expressions in your grammar and produces one of those.

When we generate a lexer, it is effectively going to be checking for each of these three terminals in a loop.

LALRPOP gives the fixed string precedence over a regular expression.

if we have two regular expressions that can match the same input LALRPOP helpfully reports an error. In that case change regex or use a match declaration, which lets you control the precedence between regular expressions.

## match

`_` indicates that other string literals and regular expressions that appear elsewhere in the grammar

`match` is added as top-level to `lalrpop` file.

within a match rung, fixed literals get precedence over regular expressions

you can have more `else` sections if you like

we can rename regex to `ID` and reference that in `Term`

```rust
pub Term = {
    Num,
    "(" <Term> ")",
    "22" => format!("Twenty-two!"),
    ID => format!("Id({})", <>), // <-- changed this
};
Num: String = r"[0-9]+" => <>.to_string();
match {
    r"[0-9]+",
    "22"
} else {
    r"\w+" => ID, // <-- give a name here
    _
}
```

reference to `"BEGIN"` will match any capitualization:

```rust
match {
    r"(?i)begin" => "BEGIN",
    ...
}
```


## LALRPOP doesn't have any built-in features for giving precedence to operators

group terminal with what you want to have higher precedence

>the typical pattern for encoding precedence is to have one nonterminal per precedence level, where you begin with the operators of lowest precedence (+, -), add in the next highest precedence level (*, /), and finish with the bare "atomic" expressions like Num. Finally, you add in a parenthesized version of your top-level as an atomic expression, which lets people reset.
