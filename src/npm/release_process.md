a note on npm’s release process

Those of you who follow me on twitter may have noticed that I’m doing something quirky with npm releases. This is because the npm CLI now has a release process based on a powerful, underused feature of npm: dist-tags. Every week, we publish the new version to the next dist-tag. After smoke-testing the release for a week, during the next week’s release, the release manager (me) promotes that version to the latest tag, which is what gets installed when you run npm install -g. 2

This means that every week, there are at least two versions of npm published – npm@latest, for everybody, and npm@next, for those who enjoy playing around with new things, or who want to help us test npm. (I would love it if more of you were running npm@next and giving me feedback on the next release. Just saying.)

http://blog.npmjs.org/post/98131109725/npm200
