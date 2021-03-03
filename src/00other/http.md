- https://nodejs.org/en/docs/guides/anatomy-of-an-http-transaction/
- https://github.com/for-GET/know-your-http-well

## http/1 vs http/2 vs http/3

tcp to taki pas transmisyjny

http to taka kolejka w fastfoodzie

przeglądarka www może otworzyć max 6 połączeń tcp dla danego hosta

jak więc zrobić żeby więcej rzeczy móc przesyłać?

wymyślono pipelining w http/1

czyli możesz powiedzieć że teraz kilka osób może na raz zamówić jedzenie, ale następni w kolejce dostaną tylko jak te osoby dostaną coś jakby na jeden rachunek kupowanie, więc mało kto z tego korzystał bo i tak taka grupa zablokuje kolejkę

więc wymyślono http/2 i multiplexing

ten pas transmisyjny (tcp) nadal jest, ale już osoba może zamówić i pójść do stolika i będzie wywołana jak przyjdzie jej żarcie

jednak jak dla jakiegoś rachunku coś się spieprzy, na przykład frytki się przypalą, to cały pas transmisyjny staje i czeka na dorobienie tych frytek
więc poszli w kierunku udp

nie ma pasa transmisyjnego który może wszystko zablokować

ale ten pas transmisyjny dawał taką funkcję, że miałeś pewność że wszystko z rachunku zostanie dostarczone

a w udp kucharze kładą na blacie te potrawy i odchodzą

nie sprawdzają czy wszystko doszło

więc za ladą są tacy sprawdzacze którzy pilnują żeby dany rachunek został dobrze skompletowany

i to jest ten QUIC

to takie małe pasy transmisyjne które można szybko tworzyć per rachunek
