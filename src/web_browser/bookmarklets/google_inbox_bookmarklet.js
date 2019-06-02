//javascript:
(function(){
    function OpenInNewTabWinBrowser(url) {
        var win = window.open(url, '_blank');
        win.focus();
    }
    const email = '';
    OpenInNewTabWinBrowser(`https://inbox.google.com/u/0/?subject=${encodeURIComponent(document.title)}&body=${window.location.href}&to=${email}`);
})();
