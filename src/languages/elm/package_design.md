- https://becoming-functional.com/publishing-your-first-elm-package-13d984a1200a
- https://package.elm-lang.org/help/documentation-format
- https://package.elm-lang.org/help/design-guidelines
- https://www.reddit.com/r/elm/comments/5hk8i9/keep_tags_and_record_constructors_secret/
- In elm-0.18 https://github.com/elm-lang/elm-package/blob/72c69fcdc5b21cb9035f081dbbc79db4401fe817/README.md 
- https://github.com/dillonkearns/idiomatic-elm-package-guide
- In elm-0.19 https://medium.com/@Max_Goldstein/how-to-publish-an-elm-package-3053b771e545
- elm-package.json overview https://dev.to/zwilias/the-elm-packagejson-file-119e
- https://github.com/NoRedInk/elm-ops-tooling

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

## Creating package in post elm-0.18.

### Search

for elm-0.18 packages https://dmy.github.io/elm-0.18-packages/

### Documentation on https://package.elm-lang.org

While you cannot search Elm-0.18 packages on http://package.elm-lang.org, you can still look at it when going directly like https://package.elm-lang.org/packages/GlobalWebIndex/class-namespaces/1.0.0/WeakCss. But if you publish right now Elm-0.18, documenation will not be generated on https://package.elm-lang.org.

### Version bump

When package is upgraded to elm-0.19, a major version should be bumped? like 1.0.1 -> 2.0.0?

That might (later) disallow using 0.18 version as you'd overwrite tags

It can be patch version change

Sometimes it glitched on me and forced me to start from 1 though

## Generate docs.json locally

`elm make --docs=docs.json`

Preview documentation for elm-0.19 at https://elm-doc-preview.netlify.com or using https://github.com/ChristophP/elm-docs-preview

https://discourse.elm-lang.org/t/elm-doc-preview-a-new-online-documentation-previewer/2001/4

## Updgrade

- https://github.com/avh4/elm-upgrade
- https://github.com/elm/compiler/blob/master/upgrade-docs/0.19.md
- https://korban.net/posts/elm/2018-08-22-elm-019-whats-new-install-upgrade/
- [kraklin/elm-readiness: Keep track of transition state of your dependencies in your own Elm app to Elm 0.19](https://github.com/kraklin/elm-readiness)

## Publish

You cannot remove package from http://package.elm-lang.org at this moment.

https://github.com/elm-lang/elm-package/blob/72c69fcdc5b21cb9035f081dbbc79db4401fe817/README.md#publishing-packages

This is 404 https://package.elm-lang.org/help/docs-preview

## Unpublish

Create issue. For example:

- [Delete Request: BuraBure/elm-collision · Issue #130 · elm/package.elm-lang.org](https://github.com/elm/package.elm-lang.org/issues/130)
- [Delete Request: Elm-Test · Issue #117 · elm/package.elm-lang.org](https://github.com/elm/package.elm-lang.org/issues/117)
- [Delete Request: vilterp/start-app · Issue #114 · elm/package.elm-lang.org](https://github.com/elm/package.elm-lang.org/issues/114)
- [Delete Request: vilterp/fancy-start-app · Issue #115 · elm/package.elm-lang.org](https://github.com/elm/package.elm-lang.org/issues/115)
