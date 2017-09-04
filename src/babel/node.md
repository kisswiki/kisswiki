
This won't work, won't change `import` to `require`:

`npx babel file.js --presets es2015,stage-2 --out-file transpiled.js`

This is a little bit better:

`npx babel file.js dir1 --presets es2015,stage-2 --out-file transpiled.js`

Just use webpack https://stackoverflow.com/questions/35219231/babel-compiled-js-fails-to-import-relative-paths/35237163#35237163

Look at `webpack/node.md`
