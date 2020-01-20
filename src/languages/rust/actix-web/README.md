## Obsolete

- https://www.reddit.com/r/rust/comments/eqh3sy/new_rust_user_questions_about_the_actix_situation/feryvmx/
- https://www.reddit.com/r/rust/comments/eqh3sy/new_rust_user_questions_about_the_actix_situation/fet21hw/

## Why good

As I said in the comment nearby, other crates have either limited extensibility, poor API or ther are simply based on macros (i.e. goodby IDE support).

Actix is only based on two very simple traits: FromRequest and Responser, the rest is very easy to compose using them. All the advanced stuff like routing, resources etc are based on them.

Other frameworks have way more complicated architecture.

https://www.reddit.com/r/rust/comments/eq0375/what_should_i_choose_in_post_actixweb_era_for_web/femt7sz/
