## is struct copied like a pass by value parameter?

It automatically passes by immutable reference if the parameter is larger than 16 bytes. The immutability makes sure you don't change it by accident.

<https://www.youtube.com/watch?v=KSy6EA7VBC4&lc=UgyXdyP6-XxDewrXcPh4AaABAg>

## configure odinfmt to use spaces

It needs `odinfmt.json` in project directory <https://github.com/DanielGavin/ols?tab=readme-ov-file#odinfmt-configurations>

```json
{
 "$schema": "https://raw.githubusercontent.com/DanielGavin/ols/master/misc/odinfmt.schema.json",
 "character_width": 120,
 "tabs": false,
 "tabs_width": 4
}
```
