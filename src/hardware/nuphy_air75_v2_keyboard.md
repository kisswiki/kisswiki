## Description in Polish

NuPhy Air75 to innowacyjna w 75% ultracienka bezprzewodowa klawiatura mechaniczna. Dzięki najcieńszej na świecie kulistej nasadce klawiszy PBT, połączeniu bezprzewodowemu 2.4G o niskim opóźnieniu i funkcji hot-swap, Air75 ma stać się nowym standardem dla smukłych klawiatur mechanicznych. Kompaktowy 75% układ Air75 jest kompatybilny zarówno z komputerami Mac, jak i Windows. Możesz podłączyć do 4 urządzeń z niskimi opóźnieniami 2.4G i Bluetooth 5.0, aby jak najlepiej obsługiwać wszystkie Twoje potrzeby w zakresie wielozadaniowości.

Dzięki ultracienkiej aluminiowej ramie i nasadkom klawiszy PBT oraz najnowszym niskoprofilowym przełącznikom mechanicznym Gateron, najcieńsza część Air75 ma tylko 16 mm. Ponadto wbudowana bateria 2500 mAh ma o 39% więcej mocy niż NuType F1, co zapewnia do 48 godzin (dane laboratoryjne) pracy na baterii, umożliwiając cały tydzień użytkowania. Dzięki ewolucyjnemu procesowi tłoczenia stopu aluminium Nuphy był w stanie całkowicie ukryć mechaniczne przełączniki pod aluminiową ramą i nasadkami klawiszy, zachowując jednocześnie prostą konstrukcję. Ta elegancka konstrukcja sprawia, że Nuphy Air75 wyróżnia się wyjątkową obecnością na rynku cienkich klawiatur mechanicznych.

Air75 od samego początku został zaprojektowany tak, aby był idealnie kompatybilny z macOS i Windows. Dostarczyliśmy układ klawiszy multimedialnych Mac dla użytkowników komputerów Mac i klawisze skrótów, w tym zrzuty ekranu sekcji, zrzuty ekranu pełnoekranowego i Siri/Cortana. Każdą klawiaturę Air75 posiada również opcję Hot-Swappable, co pozwala na łatwą wymianę lub modernizację przełączników bez lutowania i korzystanie z innego sposobu pisania bez ograniczeń.

https://shelter.pl/produkt/nuphy-air75-wireless-mechanical-keyboard-bezprzewodowa-klawiatura-mechaniczna-slim/

## Connect

`FN+1`, `FN+2`, `FN+3`.

Short press to switch between device.

Long press 3 seconds enter pairing mode.

Plug the 2.40hz receiver Into your computer before pressing `FN+4`.

https://manuals.plus/nuphy/air75-wireless-mechanical-keyboard-manual

## Connecting to Android Xiaomi - Polish layout

`Settings > Additional settings > Languages & input > Keyboard, mouse and track pad > Physical keyboard > NuPhy Air75 V2-2 Keyboard > Set up keyboard layout > Polish`.

- https://support.google.com/android/answer/14114879?hl=en
- https://android.stackexchange.com/questions/77538/cannot-change-language-on-external-keyboard/103494#103494
- https://stackoverflow.com/questions/36675546/how-to-change-the-physical-keyboard-language-in-androidbesides-shift-space

## LED

`FN+up/down` - Backlight

`FN+m+up/down` - Side indicators

`FN+\` - Battery indicator

`FN+]` - Flashes the current battery level color

https://manuals.plus/nuphy/air75-wireless-mechanical-keyboard-manual

## Disable Apple Internal Keyboard when connected

`~/bin/karabiner_toggle_internal_keyboard_when_nuphy_air75_v2_is_connected.js`.

I have also created system keyboard shortcut.

## Karabiner-Elements

Karabiner-Elements does not see keyboard as Nuphy but as Apple Internal Keyboard, when connected via bluetooth.

> In Karabiner Elements window, on left column tabs, select 'Devices' menu. From there you have to enable 'Modify events' for the Nuphy keyboard, which is off by default. After that, modifications 'For all devices should include the Nuphy keyboard. https://www.reddit.com/r/NuPhy/comments/18oludk/comment/l5d95zt/

## Change key mapping with VIA

> I also found that sometimes when using https://usevia.app the keyboard wouldn't connect. I fixed this by re-uploading the .json file to the design tab and making sure the keyboard was unplugged when doing this. When the popup in Google Chrome comes up to select a keyboard I would then plug in the usb cable (That came with my keyboard) into the keyboard itself (Making sure it was in wired mode before hand.). https://github.com/the-via/releases/issues/290#issuecomment-2116442716

Separate VIA app from homebrew didn't work.

- https://www.keychron.com/blogs/archived/how-to-use-via-to-program-your-keyboard
  - How to connect (animation)
  - How to create a macro on VIA?
- https://nuphy.com/pages/via-usage-guide-for-nuphy-keyboards
- Is it good? https://get.vial.today/
- https://www.reddit.com/r/NuPhy/comments/17g64qi/how_to_connect_to_via/
- https://www.reddit.com/r/MechanicalKeyboards/comments/q3wytk/via_configurator_says_searching_for_devices/
- https://www.theverge.com/23591533/mac-remap-keyboard-how-to
- https://docs.keeb.io/via

## Firmware update

`brew install --cask qmk-toolbox`

Follow instruction on https://nuphy.com/pages/qmk-firmwares
