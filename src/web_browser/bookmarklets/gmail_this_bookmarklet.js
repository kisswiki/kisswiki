// https://www.lifewire.com/how-to-add-a-gmail-this-bookmarklet-to-your-browser-1172047
// https://stackoverflow.com/questions/5531434/how-to-write-text-into-gmail-message-body-by-other-browser/5533133#5533133
// https://github.com/KartikTalwar/gmail.js
//javascript:
(function(){
    popw='';
    Q='';
    d=document;
    w=window;
    if(d.selection){
	Q=d.selection.createRange().text;
    } else if(w.getSelection){
	Q=w.getSelection();
    } else if(d.getSelection){
	Q=d.getSelection();
    }
    var email = '';

    popw=w.open('http://mail.google.com/mail/s?view=cm&fs=1&tf=1&to='+email+'&su='+encodeURIComponent(d.title)+'&body='+encodeURIComponent(Q)+escape('%5Cn%5Cn')+encodeURIComponent(d.location)+'&zx=RANDOMCRAP&shva=1&disablechatbrowsercheck=1&ui=1','_blank');

})();
