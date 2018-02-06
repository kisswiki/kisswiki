- http://www.arewewebyet.org/topics/templating/
- https://crates.io/search?q=template&sort=downloads
- https://github.com/kud1ing/awesome-rust#template-engine
- https://github.com/lfairy/maud
  - My recommendation at this point is to pin to nightly-2017-03-04 https://github.com/lfairy/maud/issues/80#issuecomment-287301838
- https://github.com/sunng87/handlebars-rust
- https://github.com/nickel-org/rust-mustache
- https://rocket.rs/guide/responses/#templates
  - https://api.rocket.rs/rocket_contrib/struct.Template.html
  - https://github.com/SergioBenitez/Rocket/tree/v0.2.6/examples/handlebars_templates/templates
- https://github.com/Keats/tera
- https://doc.rust-lang.org/nightly/std/fmt/

## handlebars-rust

Include file `templates/body-static.html.hbs`

`{{> body-static}}`

- https://github.com/sunng87/handlebars-rust/tree/master/examples/partials
- https://futurestud.io/tutorials/how-to-create-and-use-handlebars-partial-views-with-hapi
- http://sunng87.github.io/handlebars-rust/handlebars/index.html
- http://handlebarsjs.com/


No escape:

`{{{ content }}}`

- https://github.com/SergioBenitez/Rocket/issues/51#issuecomment-269108429
- https://github.com/jryans/cargo/blob/47221e98189daa34e47934d44223db12db84c7b9/src/cargo/ops/cargo_new.rs#L11
