- https://store.steampowered.com/steamdeck/mygames
- https://store.steampowered.com/greatondeck/
- https://www.emudeck.com/
- https://www.reddit.com/r/SteamDeck/comments/10nq2g6/what_are_some_must_play_games_on_the_steam_deck/
- https://www.reddit.com/r/SteamDeck/comments/10musuh/best_games_to_own_on_steam_deck_currently/
- https://store.steampowered.com/account/registerkey
- playable https://steamdb.info/instantsearch/?range%5BuserScore%5D=93%3A&refinementList%5Boslist%5D%5B0%5D=Steam%20Deck%20Playable
- https://www.gamingonlinux.com/articles/category/Steam_Deck
- [GameBanana on Twitter: "t3nka's Clarity Graphics Pack for #TheLegendofZeldaBreathoftheWildWiiU by t3nka https://t.co/3bsnm1nKLo #Mods #BotW https://t.co/L1JUSwRLEA" / Twitter](https://twitter.com/GameBanana/status/1239687904475131907)
- [Steam Deck - ULTIMATE Starter Guide - YouTube](https://www.youtube.com/watch?v=MbpGPqacCos)
- https://www.reddit.com/r/SteamDeckTricks/
- https://www.reddit.com/r/SteamDeck/
- https://www.reddit.com/r/SteamDeckTricks/comments/twulqf/tips_and_tricks_megathread/
- https://www.reddit.com/r/SteamDeck/comments/w16nio/a_kickstart_guide_of_nonsteam_games_prefixes/
- https://wagnerstechtalk.com/steamdeck/
- docks compared https://wagnerstechtalk.com/steamdeck/#Official_Steam_Deck_Docking_Station

## Proton GE

Some games are supported only by https://github.com/GloriousEggroll/proton-ge-custom.

`Desktop mode > Discover > ProtonUp-Qt > install Proton GE beta`

There is button game list, but setting it here does nothing. You need to choose proton ge in game settings in steam.

## Clear binding for left touchpad click

Press x.

## Hard restart of steam deck

Press power button for 20s, wait 5 minutes.

## Battery life and performance

Limit refresh rate to 40Hz and fps to 40. Limit TDP.

Use Decky Settings https://steamdecklife.com/2023/01/10/decksettings-steam-deck-game-settings/ to see optimal settings for you, either for battery or performance.

Look at remaining time in 3rd level of Performance Overlay https://www.partitionwizard.com/partitionmanager/steam-deck-fps.html

- [Steam Deck - 40 FPS is the new 60 - YouTube](https://www.youtube.com/watch?v=ZWZI3CKlByc)
- [CryoUtilities 2.0 - MASSIVE Performance Boosts & Space Savings! | Steam Deck - YouTube](https://www.youtube.com/watch?v=C9EjXYZUqUs)

## FSR

To get it to work, you have to LOWER the native resolution. It’s 1280x800 I’m pretty sure at standard, so lower that by like two notches to like 1120 x something or lower, hit the 3 dots button, go to performance and scroll to the bottom until You see the option for fsr. It’ll be this bar that has a couple of options, one of them saying “integer” You will know it’s activated when the actual resolution of your screen changes, since FSR is an upscaler. With FSR, I’m able to play way more AAA games like the Witcher 3 at a almost rock solid 60fps. Really awesome shit that people should utilize.

https://www.youtube.com/watch?v=5uQcEyPzia4&lc=UgyLJr11zGd6ufCEHNR4AaABAg

## 4GB VRAM smoother fps

- [Steam Deck - Better Non-Steam Game and Windows Performance with One Setting Change - YouTube](https://www.youtube.com/watch?v=qt7l2_SmGnc&t=62s)
  - game tested https://store.steampowered.com/app/1954200/Kena_Bridge_of_Spirits/

AyuNeko
2 months ago
Hi, i am a programmer, i think i can help you understand some things better
What you are right about: Allocating VRAM in BIOS reserves that memory for GPU only. If you set 1GB, GPU only has 1GB for textures. If you load more than 1GB of textures, the system will swap in and out textures between memory and swapfile.
So for example if you set your game settings to high-res textures, and the game loads up to 1.5gb or 2gb of textures, but you only have 1GB reserved for GPU. The system needs to swap in and out textures to the swap file and back to the reserved 1GB GPU VRAM. This swapping in and out causes STUTTER!!

Now about that VRAM number you are seeing on your top left display. I think here your understanding is wrong. The 2.8-3.1gb you saw in your 3 tests, is not how much VRAM is allocated to the GPU, no, that number says how much textures are loaded. But it doesn't say where those textues are, some of it are inside the reserved GPU VRAM, some of it are swapped out into a swap file. For the game to run stutterfree, you want all textures to be loaded into the VRAM.

On your first test, where you had only 256mb reserved for GPU, but 3.1gb of textures loaded. Can you imagine how much the GPU needs to swap in textures between swapfile and that tiny 256mb VRAM? This is why it stutters so much, the framegraph, that green line is very shaky.

On your last test, where you had 4Gb reserved for GPU, and 2.8gb of textures loaded. Here ALL the textures can be put into the GPU VRAM without swaping in and out of swapfile. The result is of not having to swap is a much more linear framegraph, a much more stable framerate. Not as shaky as in first test.

Now, do we always want 4Gb reserved for GPU? No. It depends on the game, how much textures the game loads at the same time. What you want is to always have enough VRAM for the GPU, so it can have all textures without swapping.

- https://www.youtube.com/watch?v=F9jbfZxA6ew&lc=Ugz80I6C1FMcUTDv_YZ4AaABAg
- [Steam Deck: VRAM - 1GB vs 4GB; Put To The Test on SteamOS and Windows - YouTube](https://www.youtube.com/watch?v=MbAK_n1aa2Y)

## 24 hour time

`Settings > General`

## Joystick deadzones

`Steam Deck Gaming Mode > left Steam Menu button > Settings > Controller > Calibration & Advanced Settings`

By default it is set to 8192.

Set to zero? Also set in game settings for dead zone to zero?

- https://www.reddit.com/r/SteamDeck/comments/w2gos4/psa_optimize_your_deadzones/
- [Steam Deck Thumbstick Dead Zone Demonstration UI & In-game. (Valve Customer Support Submission) - YouTube](https://www.youtube.com/watch?v=5Fmwerkb6yo)
- Reduce the dead zones on the analog sticks under settings/controller settings! By default they are about twice as large as they need to be. https://www.youtube.com/watch?v=5uQcEyPzia4&lc=UgyXtf6_zRC6zNx-hgF4AaABAg

## Case for charger

https://www.printables.com/pl/model/162557-new-version-35-with-xl-lid-steamdeck-usb-c-charger
