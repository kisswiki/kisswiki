## roblox.fandom.com

Natrafiłem na tą stronę https://roblox.fandom.com/pl/wiki/Lua_dla_pocz%C4%85tkuj%C4%85cych

Pewna nieaktualność już w tym kursie bo zamiast w `Insert > Advanced Objects` robi się `Model > Script`. Tutaj też tak napisane https://devforum.roblox.com/t/lua-scripting-starter-guide/394618.

Zadanie końcowe wygląda tak:

```lua
function nazwa_funkcji(tablica)
    i = 1
    while i < #tablica + 1 do
        if tablica[i] ~= nil then
            print(tablica[i])
        end
        i = i + 1;
    end

    return #tablica % 2 == 0;
end
tablica = {2, nil, 3};
x = nazwa_funkcji(tablica);
print(x);
```

Następnie przeszedłem do https://roblox.fandom.com/pl/wiki/Lua_w_praktyce

Kod na stronie zmieniłem na

```lua
function cout(dzieciak)
    print("Mam nowego dzieciaka!");
    print(dzieciak.ClassName);
end
game.ChildAdded:connect(cout)
Instance.new("Part", game.Workspace)
```

Dzięki temu mogłem zaobserwować działanie eventu `ChildAdded`.

Następnie przeszedłe przez https://roblox.fandom.com/pl/wiki/Tworzenie_drzwi_dla_VIP%27%C3%B3w. Na końcu jest kompletny kod programu więc to trochę ułatwiło.

## developer.roblox.com

W Roblox Studio jest okno Tutorial z linkiem Learn now. Po kliknięciu otwiera nam się https://developer.roblox.com/en-us/learn-roblox/studio-basics. Na górze jest link [Quick Start](https://developer.roblox.com/en-us/articles/Creating-Your-First-Game). Tu powinna być aktualna dokumentacja.

## vscode

Poradnik wideo jest też tutaj [Roblox Dev: How I set up new game projects - YouTube](https://www.youtube.com/watch?v=aUW2XCJlr9E).

Znalazłem też takiego tweeta https://twitter.com/cm32roblox/status/1171535508310069249 w którym developer zachwala pracę w vscode zamiast w Roblox Studio.

### Rojo

Pisząc kod w Roblox Studio, przeszkadzało mi że nie ma tam autoformatowania kodu. Okazuje się jednak, że można używać vscode oraz rojo, aby synchronizował kod do Roblox Studio.

Najlepiej zainstalować [Rojo](https://github.com/rojo-rbx/vscode-rojo) jako rozszerzenie wewnątrz vscode. Otworzy nam się strona konfiguracji rozszerzenia gdzie nas pyta czy chcemy aby rozszerzenie samo aktualizowało plugin dla Roblox Studio. Zgodziłem się.

Po restarcie Roblox Studio mogłem zobaczyć, że zainstalowana jest wtyczka Rojo w zakładce Plugins.

Żeby przeportować projekt Roblox do formatu Rojo potrzebujemy jeszcze https://github.com/rojo-rbx/rbxlx-to-rojo.

Otworzyłem tak przeportowany projekt.

Uruchomiłem Rojo server w vscode klikając na dole w pasku statusu.

Otworzyłem projekt Baseplate.rbxl w Roblox Studio.

Potem w wybrałem `Roblox Studio > Plugins > Rojo`. Otworzyło się okno Rojo i wybrałem Connect.

Synchronizacja pliku do Roblox Studio w ułamku sekundy.

Opierałem się na tym poradniku https://medium.com/@OverHash/roblox-development-in-visual-studio-code-b3010c3d0181.

Tu więcej o Roho https://rojo.space/docs/.

### Lua

Jako formatera użyłem https://github.com/Koihik/vscode-lua-format.

Do [sformatowania kodu lua](https://stackoverflow.com/questions/29973357/how-do-you-format-code-in-visual-studio-code-vscode) używam skrótu `Shift+Alt+f`.

Można też wybrać włączyć w opcjach `editor.formatOnSave`.

Jednak domyślne ustawienia formatowania mie nie odpowiadały. Za dużo było inlineowania.

To są domyślne opcje https://github.com/Koihik/LuaFormatter#default-configuration. Tu dokładniejszy opis https://github.com/Koihik/LuaFormatter/blob/master/docs/Style-Config.md.

Okazało się, że trzeba stworzyć plik konfiguracyjny z linią `keep_simple_control_block_one_line: false`. Następnie otwieramy opcję rozszerzenia i wskazujemy gdzie jest nasz konfig. Możemy podać ścieżkę relatywną w projekcie `config.txt` lub absolutną `C:\Users\roman\.config\lua_formatter\config.txt`. Wybrałem wersję absolutną. Tu jest kod który zarządza wyborem konfigu https://github.com/Koihik/vscode-lua-format/blob/75e457286e1de060c1176a9e74d0b9c7e9930a1b/src/extension.ts#L61.

## typescript

Okazuje się także, że kod można pisać w Typescript https://github.com/roblox-ts/roblox-ts.

Wideo: [I tried roblox-ts and loved it - YouTube](https://www.youtube.com/watch?v=-VUgFaFPZk8)

- https://roblox-ts.github.io/
- https://github.com/roblox-ts/roblox-ts

## AeroGameFramework

Jest jeszcze taki framework AeroGameFramework, który ma ułatwiać tworzenie kodu remote czy coś.

Aby zainstalować musiałem wejśc do `Roblox > Home > Toolbox > Plugins` i musiałem wpisać pełną nazwę AeroGameFramework. Można też zainstalować z tego linku https://www.roblox.com/library/1882232354/AeroGameFramework-Plugin. Znalazłem go przez google bo normalnie na stronie to nie wiem jak do niego przejść z głównej strony. Jest też lista taka https://www.roblox.com/develop/library ale też nie wiem jak od niej przejść z głównej strony.

Tu playlista jak go używać [1 | AeroGameFramework | Introduction - YouTube](https://www.youtube.com/watch?v=8ta0cHX1ceE&index=1&list=PLk3R4TM3pnqv7doCTUHtn-wkydaA08npc).

Tu też o ustawieniu go: [Roblox Dev: How I set up new game projects - YouTube](https://www.youtube.com/watch?v=aUW2XCJlr9E).

- https://sleitnick.github.io/AeroGameFramework/
- https://github.com/Sleitnick/AeroGameFramework

## Nauka

- https://www.roblox.com/create
- https://developer.roblox.com/en-us/
- https://codakid.com/hour-of-code/
  - https://www.youtube.com/watch?v=5JHK0twzCGo&list=PLOACjWvwdb47JPGVKNEOA05kTeMbbC_Ck
- https://www.youtube.com/user/ROBLOXcrazyman32/playlists
- https://www.udemy.com/courses/search/?src=ukw&q=roblox
- https://medium.com/tag/roblox/archive
- https://stackoverflow.com/questions/tagged/roblox