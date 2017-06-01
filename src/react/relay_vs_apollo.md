Agree that this is overall accurate, especially wrt to Relay Classic. For Relay Modern, however:

> 2. Relay doesn't have as many facilities for updating the store and working with mutation results.

Apollo and Relay Modern are about equal in this regard. Relay supports arbitrary writes to the store (either via an imperative API, via a fragment + payload, or a mix of the two), plus similar APIs for updating the store after a mutation or subscription update. This includes the ability to update client-only state.

> 3. The Apollo Store is a plain JavaScript object,

The Relay Modern store is also a plain object. There aren't currently any convenience functions for serializing/deserializing it, but this is something we're open to adding.

Apollo has focused very much on easier onboarding and covering a wide variety of use cases (many view layer integrations, developer tooling etc), where Relay is more focused on performance and scalability (hence features such as ahead-of-time optimization, garbage collection, etc).

https://news.ycombinator.com/item?id=14143573
