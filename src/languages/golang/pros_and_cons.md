## Cons

Bartosz Król https://www.facebook.com/bartosz.krol.79:

Co do braku generyków - po co tak niski level abstrakcji jeżeli dalej rozmawiamy w kontekście weba?

Poza tym brak generyków to nie wszystko -> nil pointery, słaby system typów, obsługa błędów, która mogłaby być lepsza (Either?), brak pattern matchingu.

Plus moje ulubione kwiatki to usuwanie elementu z tablicy -https://github.com/golang/go/wiki/SliceTricks oraz zapisywanie daty http://fuckinggodateformat.com/.

Maciej Co do użycia - ja używam ich codziennie. Map, reduce, find. Wszystko co działa na kolekcjach. W golangu mam do dyspozycji pętlę for i pisanie wszystkiego od nowa z palca.

Bartek Banachewicz https://www.facebook.com/bananu7:

nie trzeba ciągle pisać generycznego kodu, żeby ciągle z niego KORZYSTAĆ. Z definicji kod generyczny jest do eliminacji duplikacji i jako taki ma największe znaczenie w bibliotekach.

Brak generics go nie jest problemem dlatego, że nie da się pisać serwisów, jest problemem dlatego, że nie da się pisać dobrych interfejsów do bibliotek.

Łukasz Biały https://www.facebook.com/Frater.417:

go jest po prostu korpojęzykiem zaprojektowanym nie dla developerów, tylko dla optymalizacji korpoflow. stawia na szybkie iteracje, żeby było widać, że "sprint dowieziony" (ale mniejsza z błędami, których w ramach braku systemu typów jest mnóstwo), ma tooling zarażony not-invented-here, gówniany, przepraszam za wyrażenie, versioning i powstał według autora, Roba Pike'a jako język dla juniorów, którzy nie ogarną "brilliant language":

https://channel9.msdn.com/Events/Lang-NEXT/Lang-NEXT-2014/From-Parallel-to-Concurrent
@20:40

polecam też https://wiki.theory.org/index.php/YourLanguageSucks#Go_sucks_because

https://www.facebook.com/groups/257881290932879/?multi_permalinks=1519595501428112&notif_id=1510780014559096&notif_t=group_highlights&ref=notif