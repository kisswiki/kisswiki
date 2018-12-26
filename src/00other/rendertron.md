## WebGL

- Support WebGL in headless https://bugs.chromium.org/p/chromium/issues/detail?id=617551
  - Use a software GL backend is already supported https://codereview.chromium.org/1548893004/
- https://render-tron.appspot.com/render/http://webglsamples.org/book/book.html
- WebGL disabled in browsers for specific gpus and platforms https://www.khronos.org/webgl/wiki/BlacklistsAndWhitelists<Paste>
  - https://news.ycombinator.com/item?id=12003762

## Inform rendertron that some page is 404

Include this meta tag:

`<meta name="render:status_code" content="404" />`
