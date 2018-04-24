## Error in $: Problem with the "repository" field. The given domain does not start with <https://github.com/>

>Just ran into this myself on a local-only git repo. Kindof annoying. I ended up using https://github.com/local/local.git
>
>-- https://github.com/elm-lang/elm-make/issues/71#issuecomment-239603792

## pin specific version

For applications, it's generally a good idea to limit ranges or even pin them to specific versions (`1.2.3 <= v < 1.2.4` would only allow version `1.2.3`, for example).

https://dev.to/zwilias/the-elm-packagejson-file-119e