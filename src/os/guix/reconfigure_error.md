Wniosek

reconfigure nie doszedł do przełączenia generacji systemu. Nie zawiodły config.scm, 9p, nginx ani --skip-checks; zawiodła lokalna kompilacja samego Guiksa
w fazie make check.

Historia powłoki pokazuje poprawne polecenie:

```sh
  time guix system reconfigure --skip-checks /mnt/share/config.scm
```

reconfigurereconfigure jest tylko literówką w pytaniu. Gdyby została wykonana dosłownie, Guix odrzuciłby akcję przed rozpoczęciem jakiejkolwiek
kompilacji.

Co dokładnie się nie udało

Podsumowanie testów Guiksa:

```text
  TOTAL: 2718
  PASS:  2598
  SKIP:  112
  XFAIL: 6
  FAIL:  2
```

### 1. tests/guix-shell.sh

Test oczekiwał, że:

```sh
  guix shell -D -f some-package.scm -n
```

zwróci błąd dla zależności z pustym supported-systems. W testowanym środowisku polecenie zwróciło 0, więc skrypt wykonał celowe false i upadł.

Minimalna reprodukcja na obecnym profilu Guiksa 47b41dc zachowuje się już poprawnie — zwraca exit code 1:

```text
  guix shell: error: package unsupported-dependency@3.11 does not support aarch64-linux
```

Ten pierwszy błąd jest więc związany z izolowanym środowiskiem budowy/testowaną wersją e343ff0, a nie z samym config.scm.

### 2. tests/guix-shell-export-manifest.sh

Ten błąd jest deterministyczny i nadal występuje na aktualnym profilu. Test uruchamia:

```sh
  guix shell --export-manifest gsl openblas gcc-toolchain --tune
```

Maszyna QEMU raportuje:

```text
  CPU implementer : 0x61
  CPU part        : 0x000
```

0x61 oznacza Apple, ale guix/cpu.scm rozpoznaje tylko wybrane Apple CPU part, np. 0x20, 0x21, 0x30 itd. W wewnętrznym match nie ma przypadku domyślnego
dla 0, więc kończy się to:

```text
  Throw to key `match-error' with args `("match" "no matching pattern" 0)'
```

Odtworzyłem dokładnie ten sam backtrace poza testami. Samo kolejne guix pull tego jeszcze nie naprawiło — kod w rewizji 47b41dc nadal nie ma fallbacku.

--skip-checks tu nie pomaga. Zgodnie z guix system --help pomija wyłącznie kontrole bezpieczeństwa systemów plików i modułów initrd, nie fazę testów
pakietów.

Ważna zmiana obecnego stanu VM

Podczas diagnozy polecenie guix build guix -d pobrało z Bordeaux gotowy substytut:

```text
  /gnu/store/cgqym62fc18n096c0cmksiqdw5k4iw2k-guix-1.5.0-5.e343ff0
```

To dokładnie wynik nieudanej derywacji:

```text
  /gnu/store/9qp9pwiadhl0220x6qllbmwllfgm96yy-guix-1.5.0-5.e343ff0.drv
```

Potwierdzone przez guix gc --derivers. Obecnie:

- guix weather guix pokazuje 100% dostępności na Bordeaux i hydra-guix-129;
- dry-run konfiguracji nie wymienia już nieudanej derywacji Guiksa;
- pozostaje 16 innych derywacji do lokalnego zbudowania;
- dla samego guix pozostaje tylko tani graft, nie ponowne make check.

Zalecany plan teraz

Najpierw dokończyć pobranie/graft Guiksa, potem oddzielić budowę systemu od aktywacji:

```sh
  guix build guix

  time guix system build \
    --skip-checks \
    /mnt/share/config.scm
```

Dopiero gdy system build zakończy się sukcesem:

```sh
  time guix system reconfigure \
    --skip-checks \
    /mnt/share/config.scm
```

[INFERENCE] Ponieważ dokładny wynik nieudanej derywacji jest już w store, następna próba nie powinna ponownie uruchamiać tych 2718 testów. Może natomiast
ujawnić problem w jednej z pozostałych 16 derywacji.

Co robić przy następnych guix pull

Po guix pull nie przechodzić od razu do reconfigure:

```sh
  guix weather guix
  guix build guix
  guix system build --skip-checks /mnt/share/config.scm
  guix system reconfigure --skip-checks /mnt/share/config.scm
```

To pozwala:

1.  sprawdzić, czy CI opublikowało już substytut AArch64;
2.  pobrać go osobno;
3.  uniknąć lokalnej budowy Guiksa na QEMU z wadliwym identyfikatorem CPU;
4.  oddzielić błędy kompilacji od przełączenia konfiguracji systemu.

Log derywacji nie zawiera decyzji substitutera. [INFERENCE] W chwili pierwotnego reconfigure substytut albo nie był jeszcze dostępny, albo jego pobieranie
zakończyło się problemem NAR opisanym w Twoim zgłoszeniu; dlatego Guix przeszedł do kompilacji lokalnej.

Utwardzenie konfiguracji

W config.scm:88 masz:

```scheme
  (guix (current-guix))
```

Rozważyłbym usunięcie tej linii i pozostawienie domyślnego pakietu usługi guix-service-type. guix pull nadal zapewnia aktualny klient w profilu roota,
natomiast systemowy daemon nie musi podążać za każdą bieżącą rewizją kanału.

Docelowy fragment:

```scheme
  (guix-configuration
    (inherit config)
    (substitute-urls
     '("https://bordeaux.guix.gnu.org"
       "https://hydra-guix-129.guix.gnu.org")))
```

To nie jest konieczne do obecnej próby, bo substytut już pobrano, ale zmniejsza ryzyko ponownego wciągnięcia budowy bieżącego Guiksa do zwykłego system
reconfigure.

Nie polecam:

- --no-substitutes — wymusi właśnie wadliwą kompilację lokalną;
- globalnego wyłączania testów Guiksa;
- przechodzenia na wolne TCG tylko po to, żeby zmienić CPU ID.

Jeżeli Guix musi być budowany lokalnie, właściwa naprawa upstream to fallback dla nierozpoznanego Apple CPU part, np. (\_ "armv8-a") wewnątrz przypadku
"0x61". To naprawi drugi test; pierwszy wymaga osobnego zbadania.

Źródła:

- Bieżące guix/cpu.scm — brak fallbacku dla Apple CPU part 0
  (https://codeberg.org/guix/guix/raw/commit/47b41dced835020f803dc56f52e949c94d2f7061/guix/cpu.scm)
- Zgłoszenie #9996 dotyczące błędu NAR/substytutów (https://codeberg.org/guix/guix/issues/9996)

※ recap: Zdiagnozowaliśmy błąd rekonfiguracji Guix i pobraliśmy gotowy substytut nieudanej derywacji. Teraz uruchom guix system build --skip-checks
/mnt/share/config.scm.
