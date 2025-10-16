## Minimal example

```odin
package game

import rl "vendor:raylib"


main :: proc() {
    rl.InitWindow(1280, 720, "My First Game")
    for !rl.WindowShouldClose() {
        rl.BeginDrawing()
        rl.ClearBackground(rl.BLUE)
        rl.EndDrawing()
    }
    rl.CloseWindow()
}
```

<https://www.youtube.com/watch?v=tIoQ5jMo4bE>
