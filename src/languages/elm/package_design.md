- https://becoming-functional.com/publishing-your-first-elm-package-13d984a1200a
- https://package.elm-lang.org/help/documentation-format
- https://package.elm-lang.org/help/design-guidelines
- https://www.reddit.com/r/elm/comments/5hk8i9/keep_tags_and_record_constructors_secret/
- In elm-0.18 https://github.com/elm-lang/elm-package/blob/72c69fcdc5b21cb9035f081dbbc79db4401fe817/README.md 
- https://github.com/dillonkearns/idiomatic-elm-package-guide
- In elm-0.19 https://medium.com/@Max_Goldstein/how-to-publish-an-elm-package-3053b771e545
- elm-package.json overview https://dev.to/zwilias/the-elm-packagejson-file-119e

## Test package locally in elm-0.18

You can reference any elm project locally by adding it to source-directories like this:

```json
"source-directories": [
    ".",
    "src",
    "../elm-css/src"
],
```

Add the locally referenced package's dependencies to your elm-package.json
elm-css has these dependencies:

```json
    "rtfeldman/elm-css-util": "1.0.2 <= v < 2.0.0",
    "rtfeldman/hex": "1.0.0 <= v < 2.0.0"
```

So add these to your `elm-package.json` as well.

- https://stackoverflow.com/questions/28110810/using-local-packages

## Publish

You cannot remove package from http://package.elm-lang.org at this moment.

Is there `elm-package publish --dry`?

https://github.com/elm-lang/elm-package/blob/72c69fcdc5b21cb9035f081dbbc79db4401fe817/README.md#publishing-packages

This is 404 https://package.elm-lang.org/help/docs-preview
