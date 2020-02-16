https://docs.rs/kuchiki/0.7.2/kuchiki/

Ok, let's trace through the docs. Or just skip to the part below the line, since this part is just digging through to find where the RefCell is coming from.

parse_html() returns a Parser<Sink> ([page](https://docs.rs/kuchiki/0.7.2/kuchiki/fn.parse_html.html)).

Parser<Sink> implements the trait TendrilSink<UTF8>([page](https://docs.rs/html5ever/0.22.3/html5ever/driver/struct.Parser.html)).

TendrilSink has the method one, which returns whatever type Sink::Output is ([page](https://docs.rs/kuchiki/0.7.2/kuchiki/traits/trait.TendrilSink.html#method.one)).

For some reason the struct Sink doesn't show up in the documentation, so I had to go to the source code to find it. Sink::Output is a NodeRef ([src](https://docs.rs/kuchiki/0.7.2/src/kuchiki/parser.rs.html#45)).

select on a NodeRef returns a Result<Select<Elements<Descendants>>, ()>, so when you unwrap it you get a Select<Elements<Descendants>>. ([page](https://docs.rs/kuchiki/0.7.2/kuchiki/struct.NodeRef.html#method.select)).

Select<Elements<Descendants>> is iterable, and the item it returns is a NodeDataRef<ElementData> ([page](https://docs.rs/kuchiki/0.7.2/kuchiki/iter/struct.Select.html#implementations)), which is automatically dereferenced into an ElementData ([page](https://docs.rs/kuchiki/0.7.2/kuchiki/struct.NodeDataRef.html#implementations), through the Deref trait).

ElementData.attributes is a RefCell<Attributes> ([page](https://docs.rs/kuchiki/0.7.2/kuchiki/struct.ElementData.html#structfield.attributes)). That's what you already found from the printout.

With a RefCell, you need to call borrow or borrow_mut to get a thing that acts like a reference. It isn't a plain reference, since the RefCell needs to know when you lose the reference so that it knows it's safe to give out another one. Here you can treat the return value of borrow as a &Attributes reference.

Attributes has the get method to get an attribute's value from a LocalName (or something implementing Into<LocalName>), ([page](https://docs.rs/kuchiki/0.7.2/kuchiki/struct.Attributes.html)).

There's no link to say what a LocalName is, but I'm guessing you can just put "href" there. See if it works.

So the full thing is link.attributes.borrow().get("href").unwrap() if that last guess is right.

https://www.reddit.com/r/rust/comments/af4ns6/how_to_work_with_refcell/edvht01/

##

- https://stackoverflow.com/questions/56329121/how-to-get-only-text-node-with-kuchiki/59471273#59471273
- https://users.rust-lang.org/t/get-tag-name-with-kuchiki-html5ever
