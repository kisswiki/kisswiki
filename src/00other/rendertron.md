- https://www.youtube.com/watch?v=QIXSBwawqsQ
- https://itnext.io/using-rendertron-in-kubernetes-for-spa-seo-39055567c745
- http://www.silverink.nl/deploy-rendertron-container-docker-cloud/
- alternative https://github.com/sanfrancesco/prerendercloud-server
- to trigger express middleware to pass to rendertron, add header `User-Agent: facebookexternalhit` and this extension https://addons.mozilla.org/en-US/firefox/addon/modheader-firefox/
  - more user agents https://github.com/GoogleChrome/rendertron/blob/master/middleware/src/middleware.ts#L25
- Facebook's Scrapper https://developers.facebook.com/tools/debug/og/object/

## Puppeteer

- https://developers.google.com/web/tools/puppeteer/articles/ssr
- https://medium.com/@e_mad_ehsan/getting-started-with-puppeteer-and-chrome-headless-for-web-scrapping-6bf5979dee3e

## WebGL

- Support WebGL in headless https://bugs.chromium.org/p/chromium/issues/detail?id=617551
  - Use a software GL backend is already supported https://codereview.chromium.org/1548893004/
- https://render-tron.appspot.com/render/http://webglsamples.org/book/book.html
- WebGL disabled in browsers for specific gpus and platforms https://www.khronos.org/webgl/wiki/BlacklistsAndWhitelists<Paste>
  - https://news.ycombinator.com/item?id=12003762

## Inform rendertron that some page is 404

Include this meta tag:

`<meta name="render:status_code" content="404" />`
