> GLIF files are commonly found in .UFO files to store information about each glyph within the UFO font set. The files are located inside the "glyphs" folder in the UFO file. https://fileinfo.com/extension/glif

`scoop install fontforge`

`git clone https://github.com/daltonmaag/ubuntu`

FontForge > Open > ubuntu/source/UbuntuMono-R.ufo`

There is also https://github.com/MFEK/glif but failed to compile on Windows 10:

```
glif> cargo run -- ..\ubuntu\source\UbuntuMono-R.ufo\glyphs\R_.glif
   Compiling rafx-api v0.0.13
error: failed to run custom build command for `sdl2-sys v0.34.5`
```

- https://unifiedfontobject.org/versions/ufo3/glyphs/glif/
- https://fontforge.org/
