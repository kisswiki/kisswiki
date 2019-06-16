//https://rarbgmirror.org/torrents.php?category=44;50;51;52&search=&order=seeders&by=DESC
//javascript:
(function(){
    var r = /IMDB: (\d+(\.\d+)?)\/10/;
    var list = document.querySelectorAll('.lista2t .lista2 .lista:nth-of-type(2)');
    for (var el of list) {
	var row = el.closest('.lista2');
	var result = r.exec(el.innerText);
	if(result) {
	    var num = parseFloat(r.exec(el.innerText)[1]);
	    if(num < 7) {
		row.remove();
	    }
	} else {
	    row.remove();
	}
    }
})();
