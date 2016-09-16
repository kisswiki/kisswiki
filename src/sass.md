- inline with node-sass https://github.com/sass/node-sass/issues/372#issuecomment-61536001
  - node-sass input.scss --source-map-embed --source-map-contents > output.css

## @import

- sass will include file content when you provide extension `scss` or no extension. If you use `css` extension, the file will be external.

http://stackoverflow.com/questions/7111610/import-regular-css-file-in-scss-file
