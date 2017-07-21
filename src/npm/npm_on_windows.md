## Can't find Python executable or MSBUILD : error MSB3428: Could not load the Visual C++ component "VCBuild.exe"

install all node-gyp dependencies with single command (NOTE: Run As Admin in Windows PowerShell):

`$ npm install --global --production windows-build-tools`

and then install the package (Nie było potrzbne zdaje się)

`$ npm install --global node-gyp`

https://stackoverflow.com/questions/21365714/nodejs-error-installing-with-npm
