# 2016-12-07

Polygon

Kostka + Melchior - Jak przygotować assety 2d do gry

Nazywanie warstw w Photoshop - można wygenerować obrazki o konkretnym rozmiarze itp.

Program do podglądu jak grafika będzie wyglądała po kompresji.

Melchior Mozor

sprite kiedyś to był obrazek załadowany do pamięci. Teraz jest to emulwoane.

Główna różnica między teksturą i spritem, to że sprite jest rysowany warstwa po warstwie.

Cecha tekstur aby pojawiły się w świecie gry - potrzebują mesha.

## Wymiary Grafik

- Niektóre urządzenia mają wspomaganie kompresji przez hadware
- Dobry nawyk - optymalizacja operacji na potęgach.

## Batching

Głównym problemem w operacjach graficznych jest niedbalstwo w zarządzaniu zasobami. Np. animacja poklatkowa i wypychamy klatkę po jednej.

Unity - Podczas importowania spriteu uzupełnić wartość batching. Używać Packing Tag to Unity załaduje razem.

W atlasie w Unity obrazki mogą być różnych rozmiarów.

## Oczywiste oczywistości

- Niewykorzystana głębia koloru zostanie niewykorzystana
- Puste pixele obecne w teksturach są puste i są obecne - sporo miejsca jest marnowane
-
- Obiekty rysowanie z zasadmi Z-buffera będą rysowane w kolejności zgodnej z zasadami Z-buffera


Ile tekstur na mobilnych?

Trzeba się dowiedzieć
