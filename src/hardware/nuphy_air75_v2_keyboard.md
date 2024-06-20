## Description in Polish

„Mniej znaczy więcej” to nasza mantra, jeśli chodzi o projektowanie, ale wymaga od nas, aby każda zmiana wprowadzona w celu ewolucji naszych projektów miała znaczenie. Podczas gdy górna ramka Nuphy Air75 V2 zachowuje swój minimalistyczny wygląd (z wyjątkiem jednego dodatkowego koloru – Basalt Black), dolna obudowa przeszła fundamentalne, ale subtelne zmiany. Dzięki ulepszonemu procesowi teksturowania laserowego, dolna obudowa jest teraz zarówno bardziej przezroczysta, jak i drobniej teksturowana, dzięki czemu wnętrze Air75 jest wyraźnie widoczne i wpływa na jego ogólną estetykę.

Czy smukłość i lekkość mogą iść w parze z ekstremalną wydajnością bezprzewodowej klawiatury i niskimi opóźnieniami? Tradycja mówi, że nie, ale w przypadku Nuphy Air75 V2 naszą tradycją jest kwestionowanie granic przestrzeni „tak”. Po raz pierwszy obsługując 4 urządzenia jednocześnie, dokonaliśmy ogromnego skoku w wydajności bezprzewodowej, odblokowując połączenie 2.4G o częstotliwości próbkowania 1000 Hz. Dzięki najnowocześniejszym chipom i dbałości o szczegóły, które ułatwiają propagację fal radiowych, umieściliśmy nową klawiaturę Air75 V2 w szeregach pro-gamingowych klawiatur 1000 Hz w szybkości 2.4G, a także wytrzymałości z 60% większą baterią 4000 mAh. Bezprzewodowe doświadczenie Air75 zostało podniesione tak bardzo, że trudno odróżnić je od przewodowego.

Choć jesteśmy dumni z wprowadzania innowacji i własnych pomysłów do naszych produktów, będziemy musieli zrobić wyjątek dla oprogramowania układowego: począwszy od Air75 V2, wszystkie Airy będą dostarczane z QMK/VIA. Wierzymy, że wraz z pełną realizacją potencjału naszego oprogramowania układowego w ramach nowego oprogramowania układowego, jego otwartego kodu źródłowego, niekończącego się remapowania klawiszy, dostosowywania oświetlenia i innych kreatywnych możliwości, które VIA oferuje naszym użytkownikom, zabawa naprawdę się rozpoczęła!

Nasza roślinna linia niskoprofilowych przełączników spotkała się z rosnącym entuzjazmem od czasu ich premiery z Air96, a my byliśmy zajęci eksperymentowaniem z tajną recepturą ultra-długiego skoku, precyzyjnego formowania i wstępnego smarowania, szukając sposobów na jej udoskonalenie i zapewnienie większej liczby smaków. Wzorując się na Baby Kangaroo firmy Gateron, Moss jest pierwszym przełącznikiem dotykowym typu early bump dla klawiatur niskoprofilowych. Jeśli lubisz ostrzejsze wrażenia podczas pisania, nie możesz przegapić Moss z 16,5 mm sprężyną i tylko 0,6 mm odstępem między uderzeniami. Kolejną zmianą w ofercie jest odświeżona Daisy, teraz nazywana Cowberry, której skok wstępny został skrócony do 1,1 mm, aby umożliwić szybkie odpalanie w grach i wszystkich innych celach, które tego wymagają.

https://shelter.pl/produkt/nuphy-air75-v2-wireless-mechanical-keyboard-bezprzewodowa-klawiatura-mechaniczna-slim/

699 zł, allegro 769 zł.

https://www.tomshardware.com/reviews/nuphy-air75-v2

Halo75 is normal profile, Air75 is low profile.

## Pokrowiec

Nuphy NuFolio V3 do Air75 V2 może nie tylko chronić klawiaturę, ale po rozpięciu i złożeniu może również stać się stojakiem, wspierając zarówno tablet, jak i telefon. W dolnej części NuFolio Nuphy umieściło również magnes, dzięki czemu będzie on pewnie przymocowany do metalowej płytki z tyłu klawiatury.

159 zł

https://shelter.pl/produkt/nuphy-nufolio-v3-do-air75-v2-pokrowiec-na-klawiature-i-stojak-2w1/

## Switches

Brown and wisteria are similar but most people seem to think wisteria feel lighter and quieter, but it's close. I have both and prefer wisteria slightly.

From what I've gathered from YouTube videos, Wisteria switches appear to be a smoother and slightly quieter alternative to brown switches.

https://www.reddit.com/r/NuPhy/comments/16isi4i/how_do_i_know_which_switch_to_pick/

## Connect

Switch your keyboard to Bluetooth

Press `Fn+1`

Look for it on the MacOS Bluetooth devices.

`Fn+1`, `Fn+2`, `Fn+3` are reserved for Bluetooth. `Fn+4` is for the dongle.

Short press to switch between device.

Long press 3 seconds enter pairing mode.

Plug the 2.40hz receiver Into your computer before pressing `Fn+4`.

- https://www.reddit.com/r/NuPhy/comments/18jsjd5/nuphy_air_75_bluetooth_mac_connection_without/
- https://manuals.plus/nuphy/air75-wireless-mechanical-keyboard-manual

## Connecting to Android Xiaomi - Polish layout

`Settings > Additional settings > Languages & input > Keyboard, mouse and track pad > Physical keyboard > NuPhy Air75 V2-2 Keyboard > Set up keyboard layout > Polish`.

- https://support.google.com/android/answer/14114879?hl=en
- https://android.stackexchange.com/questions/77538/cannot-change-language-on-external-keyboard/103494#103494
- https://stackoverflow.com/questions/36675546/how-to-change-the-physical-keyboard-language-in-androidbesides-shift-space

## LED

`Fn+up/down` - Backlight

`Fn+m+up/down` - Side indicators

`Fn+\` - Battery indicator

`Fn+]` - Flashes the current battery level color

https://manuals.plus/nuphy/air75-wireless-mechanical-keyboard-manual

## Disable Apple Internal Keyboard when connected with Karabiner-Elements

`~/bin/karabiner_toggle_internal_keyboard_when_nuphy_air75_v2_is_connected.js`.

I have also created system keyboard shortcut.

https://karabiner-elements.pqrs.org/docs/manual/configuration/disable-built-in-keyboard/

## Karabiner-Elements not seeing bluetooth keyboard

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
