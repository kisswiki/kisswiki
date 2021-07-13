## Don't use windows-build-tools

This worked for me:

1. Python 3.9 from Windows Store.
2. Visual Studio C++ build tools (only this element needed).
3. `npm config set msvs_version 2017`
4. `rm -rf node_modules && npm i` - `rm` was needed.
5. Didn't work with build tools 2019 and `npm config set msvs_version 2019`.

https://github.com/nodejs/node-gyp#on-windows

## Can't find Python executable or MSBUILD : error MSB3428: Could not load the Visual C++ component "VCBuild.exe"

install all node-gyp dependencies with single command (NOTE: Run As Admin in Windows PowerShell):

`$ npm install --global --production windows-build-tools`

and then install the package (Nie było potrzbne zdaje się)

`$ npm install --global node-gyp`

https://stackoverflow.com/questions/21365714/nodejs-error-installing-with-npm
