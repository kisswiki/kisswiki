## 2016-12-07

Polygon - Rysowanie jest dla lamusów czyli o proceduralnie generowanym content-cie

## OpenAI

https://universe.openai.com - agent AI, który sam ma grać w grę. Dostaje pixele na input, na output klawiatura, myszka.

Wojtek Zaremba - jeden z głównych naukowców w OpenAI.

## Wykład

Proceduralne - generowanie przez algorytm.

Co możemy generować:

- Poziomy
- Grafiki 2D
- Obiekty 3D
- Animacje
- Tekstury
- Muzykę
- SFX
- Fabułę

Animacje szkieletowe to też generowanie proceduralne - kolejne meshe i grafiki są generowane.

## Textury

## Meshe

Morph3D

## Losowość

Prosta sprawa ale kluczowa.

- Liczby pseudolosowe - ciąg liczb który wygląda jakby był losowy
- Ziarno losowania

Za ziarno zwykle bierze się czas.

## Funkcje elementarne

Łącząc dwie, trzy funkcje elementarne uzyskamy ciekawy wykres które może określać np. kolor tekstury.

## Noise functions

Mają wygenerować jakiś szum - coś się nierównomiernie dzieje.

- Value Noise - losujemy kilka punktów na płaszczyźnie, 3d itp. i interpolujemy liniowo.
- Gradient Noise - potrafi wygląd jak Value Noise. Losujemy nie punkty ale gradienty.
- Perlin Noise
