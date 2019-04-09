//https://rarbgmirror.org/torrents.php?category=44;50;51;52&search=&order=seeders&by=DESC
//javascript:
(function(){
    var r = /IMDB: (\d+(\.\d+)?)\/10/;
    var list = document.querySelectorAll('.lista2t .lista2 .lista:nth-of-type(2)');
    for (var el of list) {
        var num = parseFloat(r.exec(el.innerText)[1]);
        if(num < 7) {
            var row = el.closest('.lista2');
            row.parentNode.removeChild(row);
        }
    }
})();
