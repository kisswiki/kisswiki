
This won't work, won't change `import` to `require`:

`npx babel file.js --presets es2015,stage-2 --out-file transpiled.js`

This is a little bit better https://stackoverflow.com/questions/33235986/babel-multiple-directores-into-single-output-directory:

`npx babel file.js dir1 --presets es2015,stage-2 --out-file transpiled.js`

Just use webpack https://stackoverflow.com/questions/35219231/babel-compiled-js-fails-to-import-relative-paths/35237163#35237163 or maybe rollup https://github.com/orlade/es2015-babel-rollup-demo

Look at `webpack/node.md`
