- https://www.facebook.com/groups/257881290932879/permalink/1613067698747558/

Jakiego formatu używasz do przesyłania daty (nie czasu) w jsonie?
Czyli trzeba wyświetlić w UI samą datę bez czasu. np. 16 stycznia 2018 to 2018-01-16T00:00:00Z
- https://stackoverflow.com/…/1028…/the-right-json-date-format
- https://xkcd.com/1179/
- https://en.wikipedia.org/wiki/Year_2038_problem

Jak zawsze to zależy -- jak na przykład chcesz mieć datę urodzenia, to nie interesuje cię konkretny punkt w czasie, tylko konkretny dzień. Jak ktoś się urodził 12 stycznia, to się nie pyta "a w której strefie".

Also fun fact (znaczy bardzo nie fajny fakt jeśli dowiadujesz się o tym nagle) -- JavaScript by-design ŹLE LICZY STREFY dla starych dat... Więc jeśli chcecie dodać strefę czasową dla roku 1995 i wcześniej... good luck with that ;-P 

Polecam każdemu przetestować w swojej aplikacji co się dzieje z datą `1995-10-01`. To jest data, która powinna mieć czas zimowy, ale w JS by-design (zgodnie ze standardem) jest czasem letnim. Czyli po konwersji przez `new Date` w JS i potem przez Javę na jej Date cofnie się do poprzedniego miesiąca.


Tylko i wyłącznie YYYY-MM-DD (czy podobny) w UTC. Data musi być czytelna bez obróbki na pierwszy rzut oka.

Kwestia konwersji między strefami czasowymi to inny temat i po dobrych paru latach zabawy z tym zagadnieniem konwertowałbym na serwerze przy podaniu żądanej strefy czasowej z frontendu. Dlatego, że:

- moment ssie, ale ciągle nie ma nic innego sensownego,
- moment-timezone zajmuje dużo miejsca,
- zrozumienie pełni zagadnienia jest po prostu trudne, a na frontendzie dodatkowa komplikacja to lokalny czas przeglądarki i konieczność używania kichowatego wrappera (moment właśnie)

Jeśli już jednak koniecznie to trzeba robić client side z jakiegoś dziwnego powodu, to żeby nie ocipieć do reszty przy szalenie trudnym testowaniu (unit testy jedno, logika biznesowa drugie), data na której się pracuje musi być jedna, niezmienna i zrozumiała. W dodatku client side jedyny sposób to przechodzenie przez UTC, więc tym bardziej.


Myślę, że jest więcej przypadków gdzie to ma sens, zwłaszcza jeśli nie mamy dodatkowo lokalizacji użytkownika. Np. do celów statystycznych bardziej istotny jest fakt, że coś się działo "po piątej" niż jaki był absolutny czas. Tak tylko sobie filozofuję


nawet aplikacja dostępna w zakresie stref czasowych (USA) może nie potrzebować timestampów jeśli domena zakłada tylko abstrakcję "dzień"

Przykład: gdy na siłę próbowaliśmy (zapewne bez dostatecznej wiedzy) wyrazić "dni", tak jak rozumiał je biznes, w kategorii przedziału czasowego pojawiły się dodatkowe problemy takie jak obsługa czasu letniego.

Są aplikacje w których taka rozdzielczość jest potrzebna, ale to nie każda aplikacja


- jak rozumiesz dzień (00:00 - 24:00? a może 00:00:01 a 23:59:59)


RFC 3339 deviates from ISO 8601 in allowing a zero time zone offset to be specified as "-00:00", which ISO 8601 forbids. RFC 3339 intends "-00:00" to carry the connotation that it is not stating a preferred time zone, whereas the conforming "+00:00" or any non-zero offset connotes that the offset being used is preferred. This convention regarding "-00:00" is derived from earlier RFCs, such as RFC 2822 which uses it for timestamps in email headers. RFC 2822 made no claim that any part of its timestamp format conforms to ISO 8601, and so was free to use this convention without conflict.

- https://en.wikipedia.org/wiki/ISO_8601
- https://stackoverflow.com/questions/522251/whats-the-difference-between-iso-8601-and-rfc-3339-date-formats


- https://en.wikipedia.org/wiki/Year_2038_problem#Possible_solutions

Tym już dawno nikt się nie przejmuje, bo milcząco wszyscy zakładają, że do tego czasu integery powyżej 32 bitów będą wszędzie obsługiwane