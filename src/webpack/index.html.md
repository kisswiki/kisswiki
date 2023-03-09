>Use html-webpack-plugin to avoid having an index.html at all. Simply have webpack generate the file for you.
https://stackoverflow.com/questions/32155154/webpack-config-how-to-just-copy-the-index-html-to-the-dist-folder

no need to add `<script src="bundle.js"></script>` in `index.html`. It will be added automatically.
