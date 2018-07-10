`yarn add webpack webpack-cli --dev`

In case you are wondering why webpack-cli package is required, v3 adds this package automatically. With version 4, the cli is a separate package which you can install manually. It is responsible for adding the command line support for webpack.

- https://codeburst.io/migrating-to-webpack-4-today-d564b453a3ba
- https://www.valentinog.com/blog/webpack-tutorial/


1. upgrade wszystkiego co zwiazanego z webpackiem do najnowszych wersji
2. ustawienia setupu pod katem webpack 4, tam niektore rzecy sie pozmienialy, chociazby common chunki czy mode
3. sprawdzenie czy dziala, jesli nie to szukanie w issues paczki
jak macie yarna, to `yarn upgrade-interactive --latest`
i wybierasz z listy co chcesz zaktualizowac
na pewno extract-text-webpack-plugin nie dziala w webpack 4, jest na to inny plugin + loader

https://github.com/webpack-contrib/mini-css-extract-plugin



skad wiedziec co jest zwiazane z webpackiem do upgradu?

szukaj po nazwie po prostu, wiekszosc rzeczy z wbepackiem na w nazwie loader albo webpack-plugin
taka konwencja jest typu `babel-loader`, `css-loader`. `-loader` i `-webpack-plugin`

webpacka zaktualizuj tez

upgrade-interactive to ogarnie
po prostu klikasz enter bodajze
i strzalkami nawigujesz
spacja wybierasz paczke ktora chesz zaktulizowac
a strzalkami nawigujesz
jak wybierzesz wszystko, klikasz enter i okniec


with @next it does not work for me in lazily loaded chunks
https://github.com/webpack-contrib/extract-text-webpack-plugin/issues/701#issuecomment-378942882


## Warning

```
warning " > @babel/plugin-transform-runtime@7.0.0-beta.51" has incorrect peer dependency "@babel/core@>=7.0.0-beta.50 <7.0.0-rc.0".
warning " > babel-loader@7.1.5" has incorrect peer dependency "babel-core@6".
```

For first warning, upgrade babel packages that has new version `7.0.0-beta.52`.

For second:
- https://github.com/storybooks/storybook/issues/3839#issuecomment-403977837
- This issue is only when using yarn install, npm install does not show any warning https://github.com/babel/babel-loader/issues/517#issuecomment-333166200
- https://github.com/babel/babel-loader/issues/596
- https://github.com/babel/babel-bridge
- https://github.com/meteor/meteor/pull/9396#issuecomment-345708811
- >Babel published a babel@7.0.0-bridge.0 package, which takes npm version precedence over the babel@7.0.0-beta.0 we're relying on (yes, as in, "beta" < "bridge", alphabetically) https://github.com/meteor/meteor/pull/9396#issuecomment-345708811

This `yarn add --dev babel-core@^7.0.0-0` haven't solved the warning:

```bash
$ yarn check
yarn check v1.7.0
info fsevents@1.2.4: The platform "win32" is incompatible with this module.
info "fsevents@1.2.4" is an optional dependency and failed compatibility check. Excluding it from installation.
error "babel-loader#babel-core@6" doesn't satisfy found match of "babel-core@7.0.0-bridge.0"
...
```

## Production

`NODE_ENV=production webpack -p`

- >Contrary to expectations, process.env.NODE_ENV is not set to "production" within the build script webpack.config.js https://webpack.js.org/guides/production/
- https://github.com/webpack/webpack/issues/2537#issuecomment-280447557
- https://github.com/webpack/webpack/issues/2537#issuecomment-298666046
