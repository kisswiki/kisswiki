- [Flexible data tables with CSS Grid | Hacker News](https://news.ycombinator.com/item?id=19947214)

Tomasz Jakut

Ta technika jest zabójcza dla dostępności, bo tabela pozbawiona `display: table` przestaje być tabelą. Trzeba naprawiać to wszystko używając ARIA → http://adrianroselli.com/2018/02/tables-css-display-properties-and-aria.html

Michał Miszczyszyn Tomasz Jakut ale... dlaczego tak jest?
Zakładając, że mam dane tabelaryczne, tylko chciałbym je nieco inaczej ostylować — czemu dostępność się psuje?

Tomasz Jakut AFAIR wszystko rozbija się o implementacje tabel w przeglądarkach, np w lisku zmiana sposobu wyświetlania tabeli sprawia, że layout engine nie uważa już jej za tabelę, co równocześnie sprawia, że drzewko dostępności nie otrzymuje takiej informacji. Możliwe, że w chrome działa to podobnie.

Piotr Nalepa Tomasz Jakut myślałem że wszystko się rozbija o kod HTML i CSS nie ma tu nic do gadania

Tomasz Jakut Piotr Nalepa, to nie takie proste. CSS ma praktycznie od zawsze wpływ na drzewko dostępności. Inaczej przecież np. treści ukryte przy pomocy `display: none` wciąż byłyby dostępne dla czytników ekranowych.

Waldemar Hornatkiewicz Piotr Nalepa gdyby większość stron i aplikacji było właściwie napisanych, to by tak było.

Ale tak nie jest i czytniki zakładają to co jest de facto standardem (czyli gówno).

(Oczywiście jest aria, ale powo z poziomem duplikacji)

Tomasz Jakut Waldemar Hornatkiewicz, czytniki tak po prawdzie nic nie zakładają. To, co dostają, to informacje z drzewka dostępności, a to drzewko tworzy sobie przeglądarka.

Inna rzecz, że np. Safari ma dość dziwne heurystyki (np. lista bez punktora nie jest listą w drzewku a11y).

Maciej Jaros Paweł Burniak ale przecież czytnik ekranu to też jest warstw prezentacji. Po prostu nie wizualnej :-). Jakby display:none nie zmieniało nic dla czytników to by większość stron był nieczytelna (dla czytników).

- https://www.facebook.com/groups/217169631654737/permalink/2331871776851168/
