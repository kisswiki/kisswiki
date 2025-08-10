# Read me

to open help press `alt+m`

```
1│Press space to toggle alt/shift keys.
2│╭──────────┬─────────┬────────┬──────────────┬──────────┬───┬───────────────┬──────────┬───────┬──────────┬────────╮
3││ Search → ┆   Word  ┆  This  ┆ Multi-cursor ┆   Swap   ┆ ∅ ┆    Previous   ┆ ← Insert ┆   ▲   ┆ Insert → ┆  Next  │
4│├╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌┼╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌┤
5││   Line   ┆  Token  ┆ Syntax ┆    Extend    ┆  Open →  ┆ ∅ ┆    Delete →   ┆     ◀    ┆   ▼   ┆     ▶    ┆  Jump  │
6│├╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌┼╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌┤
7││   Undo   ┆ Replace ┆  Copy  ┆    Paste →   ┆ Mark Sel ┆ ∅ ┆ Last Search → ┆  Change  ┆ First ┆   Last   ┆ ⇋ Curs │
8│╰──────────┴─────────┴────────┴──────────────┴──────────┴───┴───────────────┴──────────┴───────┴──────────┴────────╯
```

in QWERTY this maps to:

`q Search | w word | e This | r Multi-cursor | t Swap |`

etc.

Press `space` to see additional bindings. You may need to decrease font size to see bottom of help.

from top to bottom it is alt+key, shift+key, single key. So for `w`, it is

```
alt+w Config
shift+w Char
w Word
```

```
 1│Press space to toggle alt/shift keys.
 2│╭──────────┬───────────┬───────────┬──────────────┬───────────┬───┬───────────────┬───────────┬──────────┬───────────┬──────────╮
 3││          ┆   Config  ┆           ┆              ┆           ┆ ⌥ ┆     ← Nav     ┆           ┆ Scroll ↑ ┆           ┆   Nav →  │
 4││ ← Search ┆    Char   ┆           ┆              ┆   Raise   ┆ ⇧ ┆     ← Curs    ┆ ← Replace ┆   Join   ┆ Replace → ┆  Curs →  │
 5││ Search → ┆    Word   ┆    This   ┆ Multi-cursor ┆    Swap   ┆ ∅ ┆    Previous   ┆  ← Insert ┆     ▲    ┆  Insert → ┆   Next   │
 6│├╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌┤
 7││          ┆           ┆           ┆              ┆           ┆ ⌥ ┆               ┆  ← Marked ┆ Scroll ↓ ┆  Marked → ┆  ⇋ Align │
 8││   Line*  ┆           ┆  Syntax*  ┆   Transform  ┆   ← Open  ┆ ⇧ ┆    ← Delete   ┆   Dedent  ┆   Break  ┆   Indent  ┆   Index  │
 9││   Line   ┆   Token   ┆   Syntax  ┆    Extend    ┆   Open →  ┆ ∅ ┆    Delete →   ┆     ◀     ┆     ▼    ┆     ▶     ┆   Jump   │
10│├╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌┤
11││          ┆           ┆   Close   ┆    Paste →   ┆           ┆ ⌥ ┆               ┆    Help   ┆          ┆           ┆ ⇋ Window │
12││   Redo   ┆ Replace # ┆ Replace X ┆    ← Paste   ┆ Mark File ┆ ⇧ ┆ ← Last Search ┆  Change X ┆          ┆           ┆ ⇋ Anchor │
13││   Undo   ┆  Replace  ┆    Copy   ┆    Paste →   ┆  Mark Sel ┆ ∅ ┆ Last Search → ┆   Change  ┆   First  ┆    Last   ┆  ⇋ Curs  │
14│╰──────────┴───────────┴───────────┴──────────────┴───────────┴───┴───────────────┴───────────┴──────────┴───────────┴──────────╯
```

to select character press `shift+w` <https://github.com/ki-editor/ki-editor/issues/649>

to open file press `Space e` and search with `q`. Or `Space f` which has completion.

to quit press `Space q`

to collapse selections press `$`

to collapse cursors press `alt+i` (scroll)

to save file press `Enter` in normal mode or `Space s`

to undo press `z`, to redo press `shift+z`

## Tutorial <https://ki-editor.github.io/ki-editor/docs/tutorial/>

### Change the first two word

`m` is same as `h` followed by `u` or `i`?

### Raise / Replace parent node with current node

`Shit+t` can also be done with `t` followed by `i`

### Remove all sibling nodes except the current node

`x` replaces

### Invert nesting (JSX)

`Shift+c` pastes over selected text, and copies what was replaced.

Like normal pasting in vim <https://stackoverflow.com/questions/25267062/after-pasting-a-yanked-line-in-vim-why-cant-i-paste-it-again>

### Select from current selection until end of line

$ is collapse direction end.

```rust
            Keymap::new(
                "$",
                Direction::End.format_action("Collapse selection"),
                Dispatch::ToEditor(DispatchEditor::CollapseSelection(Direction::End)),
            ),
```

so in this example, `f a $` will leave selection at `bar spam`. Because it was `f` (extend)?
