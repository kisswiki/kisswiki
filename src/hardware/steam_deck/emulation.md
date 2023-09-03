- https://github.com/dragoonDorise/EmuDeck/wiki/
- https://greatondeck.net/emulation-on-steam-deck-with-emudeck-complete-guide/
- [Games - yuzu](https://yuzu-emu.org/game/#)
- [The PERFECT Breath of the Wild Experience on Steam Deck | Deck Dive - YouTube](https://www.youtube.com/watch?v=Iq-pgYlK7Ow)
- https://www.reddit.com/r/EmuDeck/
- [YUZU Zelda BOTW : SteamDeck](https://www.reddit.com/r/SteamDeck/comments/xq9yn6/yuzu_zelda_botw/)
  - Steam Deck just doesn’t have the horsepower for the Switch version of BOTW. It’s why we all use CEMU to play it.
- [Which is better for BOTW? Yuzu or Cemu? : cemu](https://www.reddit.com/r/cemu/comments/wvl9qa/which_is_better_for_botw_yuzu_or_cemu/)
  - Cemu had more developement time is thus a bit more mature than Yuzu, and BotW specifically has been optimized to death on Cemu because it's arguably one of the only three or four Wii U games that anyone is actually interested in playing.
- [Cemu or yuzu for steam deck? Which one is the go to or the best one atm? : EmuDeck](https://www.reddit.com/r/EmuDeck/comments/ygrsnx/cemu_or_yuzu_for_steam_deck_which_one_is_the_go/)
  - Cemu is wiiu, yuzu is switch
  - Cemu for games that are on both switch and Wii U
- [Steam Deck Emulation – Steam Deck Life](https://steamdecklife.com/category/steam-deck-emulation/)
- https://www.reddit.com/r/SteamDeck/comments/uv0us5/updated_guide_to_get_legend_of_zelda_breath_of/
- https://www.reddit.com/r/SteamDeck/comments/11fj6kj/for_you_in_the_future_cemu_breath_of_the_wild/
- [ULTIMATE Steam Deck Emulation Guide (EmuDeck 2.1) - YouTube](https://www.youtube.com/watch?v=Mfef3ZH2IgE)
- https://github.com/Abd-007/Switch-Emulators-Guide

## SMT bug

The problem mostly reared its head in older games and affected emulators that weren't built for modern multithreading; if you've seen major stutters or strangely low framerates on old games, SMT was the likely culprit. Depending on what you play on the Deck, you may not even notice a change.

Some Steam Deck owners did notice the problem, though, and started using a plugin called PowerTools to disable SMT. Griffais mentioned that there were calls for Valve to integrate that feature into SteamOS, but that wasn't the route they wanted to take.

https://www.pcgamer.com/steamos-35-is-almost-here-includes-a-fix-for-the-steam-decks-sneakiest-performance-bug/

- [[Feature Request] Steam Deck - Toggle to enable/disable Simultaneous Multithreading (SMT) in Quick Menu or game properties · Issue #864 · ValveSoftware/SteamOS](https://github.com/ValveSoftware/SteamOS/issues/864#issuecomment-1287855431)
  - these Emulators give way more Performance with SMT off: Dolphin, PCSX2, RPCS3, YUZU, Ryujinx
    - https://www.reddit.com/r/SteamDeck/comments/xm2yeh/a_tip_for_anyone_emulating_on_the_deck_disabling/
      - Turning it to 3 threads is good enough fyi
  - game mode has a tweak to expose the CPU as 8c/8t instead of 4c/8t. This lets several games pick 6 or 8 threads instead of 4, yielding big gains from SMT scaling. Helps performance in HZD, Cyberpunk https://www.gamingonlinux.com/2022/04/steam-deck-client-update-out-plus-valve-dev-clarifies-a-tweak-for-gaming-mode/
  - There are performance improvements in the pipe on workloads that need SMT disabled to perform well. Those are being tested now and will release as part of the updated kernel we are working on for SteamOS 3.5. https://twitter.com/Plagman2/status/1626041563737645056
    - https://steamdeckhq.com/news/steamos-3-5-will-have-smt-disabled-performance-improvements/

## Cemu

To remove game: `Tools > Title Manager > right-click position on list`

https://www.reddit.com/r/cemu/comments/ktxhy0/comment/giotzu4/
