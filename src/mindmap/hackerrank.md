- https://www.hackerrank.com/interview/interview-preparation-kit/arrays/challenges
  - https://www.hackerrank.com/challenges/2d-array
    - zapomniałem + postawić w nowej linii
      - uważniej pisać?
      - jak coś piszę to muszę być tu i teraz
      - uważnie patrzeć na kod który wpisuję
  - https://www.hackerrank.com/challenges/ctci-array-left-rotation
    - zapomniałem zwrócić result
      - od razu zwrócić result
      - uważniej pisać kod
    - nie dodałem nawiasów a + jest silniejszy niż %
      - przeczuwałem, że coś może być nie tak ale zapomniałem o tym
        - zwracać uwagę na takie instyktowne informacje
      - było: a[i + d % a.length]
      - powinno być: a[(i+d) % a.length]
    - nauczyć się operatorów
    - w razie wątpliwości dodawać nawiasy
  - https://www.hackerrank.com/challenges/new-year-chaos
    - nie wziąłem pod uwagę, że shift może być ujemny i wtedy nie brać go pod uwagę
    - nie wziąłem pod uwagę, że too chaotic się pokaże przy warunku if(shift < 3 && shift > 0)
      - zrobiłem early return
        - if(shift > 2)
    - nie wziałem pod uwagę, że 6 tutaj wcześniej przesunęła się 5 1 2 3 7 8 6 4
      - zmieniłem algortym, żeby znalazł ile jest po prawej strony od liczby mniejszej od niej
    - mogłem zrobić early return zanim obliczyłem shift w pętli
      - tak jak to zrobiłem w https://www.hackerrank.com/challenges/new-year-chaos/submissions/code/140096254
        ```typescript
        if (q[i] > i + 3) {
          c = "Too chaotic";
          break;
        }
        ```
    - przekroczenie czasu, zrobić jak w https://www.hackerrank.com/challenges/new-year-chaos/submissions/code/140096254
