// https://www.squarefree.com/bookmarklets/zap.html
// https://stackoverflow.com/questions/11178673/how-to-override-important/75417604#75417604
// javascript:
(function () {
  var newSS,
    styles = `
@layer {
  * {
    background: white !important; color: black !important;  text-shadow: unset !important; font-weight: normal !important;
  }
  :not(code) { font-family: sans-serif !important; }
  a, :link, :link * { color: #0000EE !important; }
  :visited, :visited * { color: #551A8B !important; }
}
`;
  if (document.createStyleSheet) {
    document.createStyleSheet("javascript:'" + styles + "'");
  } else {
    newSS = document.createElement("link");
    newSS.rel = "stylesheet";
    newSS.href = "data:text/css," + encodeURIComponent(styles);
    document.getElementsByTagName("head")[0].appendChild(newSS);
  }
})();
