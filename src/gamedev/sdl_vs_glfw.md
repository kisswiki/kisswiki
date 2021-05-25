glew != GLFW, they serve different purposes. glew is for handling opengl cross platform, wrangling opengl extensions, and generally you need something like that to use modern opengl on windows.

SDL2 is what I went with instead of GLFW. I went with it because in the past I'd had better experiences with it than GLFW. I think in general it tends to have a nicer API, plus it can handle some things GLFW doesn't

SDL in general is pretty well proven in terms of being used by commercial games.

https://www.reddit.com/r/Zig/comments/exa1vr/for_global_game_jam_2020_i_decided_to_do_a/fhgux93/?utm_source=reddit&utm_medium=web2x&context=3
