## Run example

```
$ git clone https://github.com/graphql-rust/juniper
$ cd https://github.com/graphql-rust/juniper/blob/master/juniper_rocket
# version that I tested
$ git checkout d9677b38df14796b6c01d42c0e45c69c0739a1d8
# Minimum required: 1.25.0-nightly (2018-01-12)
$ rustup install nightly-2018-01-13
$ rustup override set nightly-2018-01-13
$ cargo run --example rocket_server
```

Open http://localhost:8000 and run query:

```graphql
{
    human(id:"1000") {
    	id
      name
    }
}
```

- Model juniper/src/tests/model.rs
- Query tests juniper/src/tests/query_tests.rs

## Doc

- http://juniper.graphql.rs/quickstart.html