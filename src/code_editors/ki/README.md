## 2026-02-25 19:23

Select inside quotes: `Extend (g) > Inside (h) > " (i)` or if it works (works in ts, rs. does [not in sql](https://github.com/ki-editor/ki-editor/issues/1371) atm) with node selection: `Node (d) > v (k)` [link](https://ki-editor.zulipchat.com/#narrow/channel/538719-.E2.84.B9.EF.B8.8F-Help/topic/.E2.9C.94.20How.20to.20select.20text.20inside.20quotes.20like.20.22user2.40example.2Ecom.22.3F/with/575777175)

Search and replace: `Local → (n)` then `Search This (f)` then `hold Multi-cursor≡ (r)` then `Multi-cursor Menu (Space)` then `Curs All (j)` then `Insert≡ (f)` [link](https://ki-editor.zulipchat.com/#narrow/channel/538719-.E2.84.B9.EF.B8.8F-Help/topic/Search.20and.20replace.20selection.20.28word.29.20in.20current.20buffer.3F/with/575776024)

## 2026-02-10 14:55

Select two lines, cut and do not leave empty line afterwards: `LINE (a) → Extend (g) → >> (l) → hold Cut (x) → >> (l) → release Cut (x)` [link](https://ki-editor.zulipchat.com/#narrow/channel/538719-.E2.84.B9.EF.B8.8F-Help/topic/.E2.9C.94.20line.20.3E.20extend.20.3E.20cut.20should.20not.20leave.20empty.20line/with/573074129)
Close buffer: `Buffer (hold-e) > Close (n) > release-e`

go to line: `Line (a) > Index (M) > <number>`

From multiple cursors to one cursor: `hold Multi-cursor (r) > Multi-cursor Menu (Space) > release Multi-cursor (r) > Keep Primary Curs (l)` [link](https://ki-editor.zulipchat.com/#narrow/channel/538719-.E2.84.B9.EF.B8.8F-Help/topic/How.20to.20collapse.20cursors.20to.20one.20cursor.3F/with/572275825)

create new file: `Space > Explorer (;) > Add Path (;) > file name > Enter` [link](https://ki-editor.zulipchat.com/#narrow/channel/538719-.E2.84.B9.EF.B8.8F-Help/topic/.E2.9C.94.20how.20to.20create.20an.20empty.20file.3F/with/574507273)

## 2026-01-20 19:58

comment line: Transform (shift+g) > Comment line (k)

new line below: `Open (,)`

new line above: change direction with `⇋ Curs (/)` then `Open (,)`

## 2025-11-24

help: `space > /`

```

╭──────────┬───────────┬──────────────────┬──────────────┬───────────┬───┬──────────┬───────────┬──────────┬─────────────┬──────────╮
│          ┆           ┆                  ┆              ┆           ┆ ⌥ ┆   ← Nav  ┆           ┆ Scroll ↑ ┆             ┆   Nav →  │
│   With   ┆    Char   ┆ Search Clipboard ┆              ┆   Raise   ┆ ⇧ ┆          ┆ ← Replace ┆   Join   ┆  Replace →  ┆          │
│ ← Search ┆  Subword  ┆    Search This   ┆ Multi-cursor ┆    Swap   ┆ ∅ ┆   First  ┆  ← Insert ┆     ▲    ┆   Insert →  ┆   Last   │
├╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌┼╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌┤
│          ┆           ┆                  ┆              ┆           ┆ ⌥ ┆          ┆  ← Marked ┆ Scroll ↓ ┆   Marked →  ┆  ⇋ Align │
│   Line*┆           ┆      Syntax*     ┆   Change X   ┆ Transform ┆ ⇧ ┆  ← Curs  ┆   Dedent  ┆   Break  ┆    Indent   ┆  Curs →  │
│   Line   ┆    Word   ┆      Syntax      ┆    Change    ┆   Extend  ┆ ∅ ┆ Previous ┆     ◀     ┆     ▼    ┆      ▶      ┆   Next   │
├╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌┼╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌┤
│          ┆           ┆                  ┆     Close    ┆ Mark File ┆ ⌥ ┆          ┆           ┆          ┆             ┆ ⇋ Window │
│   Redo   ┆ Replace # ┆     Replace X    ┆ Delete 0 Gap ┆           ┆ ⇧ ┆          ┆   Index   ┆          ┆ Paste 0 Gap ┆ ⇋ Anchor │
│   Undo   ┆  Replace  ┆       Copy       ┆   Delete →   ┆  Mark Sel ┆ ∅ ┆  Local → ┆    Jump   ┆  Open →  ┆   Paste →   ┆  ⇋ Curs  │
╰──────────┴───────────┴──────────────────┴──────────────┴───────────┴───┴──────────┴───────────┴──────────┴─────────────┴──────────╯

* Pick Keyboard

```

`space` - bindings shown at the bottom

```

╭────────┬───────┬──────────────────┬───────────────┬──────────┬───┬────────┬─────────────┬──────────┬─────────┬──────────╮
│  With  ┆       ┆ Search Clipboard ┆               ┆          ┆ ⇧ ┆        ┆             ┆          ┆         ┆          │
│ Search ┆       ┆    Search This   ┆ Repeat Search ┆ Quickfix ┆ ∅ ┆        ┆ ÷ Selection ┆ ÷ Cursor ┆  ÷ Mark ┆          │
├╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌┼╌╌╌┼╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌┤
│        ┆       ┆                  ┆      Info     ┆   Hunk^  ┆ ⇧ ┆        ┆             ┆          ┆         ┆          │
│   All  ┆ Error ┆       Warn       ┆      Hint     ┆   Hunk@  ┆ ∅ ┆        ┆    Editor   ┆   Pick   ┆ Context ┆ Explorer │
├╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌┼╌╌╌┼╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌┤
│        ┆  Decl ┆                  ┆      Ref+     ┆          ┆ ⇧ ┆        ┆             ┆          ┆         ┆          │
│  Impl  ┆  Def  ┆       Type       ┆      Ref-     ┆   Mark   ┆ ∅ ┆ Repeat ┆             ┆          ┆         ┆   Help   │
╰────────┴───────┴──────────────────┴───────────────┴──────────┴───┴────────┴─────────────┴──────────┴─────────┴──────────╯

* Pick Keyboard

```

Editor: `space > j`

```

╭───┬─────────────┬─────────────┬──────────────┬──────────────┬───┬───┬───┬───┬───┬───╮
│   ┆             ┆             ┆              ┆ TS Node Sexp ┆ ∅ ┆   ┆   ┆   ┆   ┆   │
├╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌┼╌╌╌┼╌╌╌┼╌╌╌┼╌╌╌┼╌╌╌┤
│   ┆             ┆ Reload File ┆     Pipe     ┆              ┆ ∅ ┆   ┆   ┆   ┆   ┆   │
├╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌╌╌╌╌╌╌╌╌╌╌╌┼╌╌╌┼╌╌╌┼╌╌╌┼╌╌╌┼╌╌╌┼╌╌╌┤
│   ┆ Replace all ┆   Save All  ┆ Quit No Save ┆              ┆ ∅ ┆   ┆   ┆   ┆   ┆   │
╰───┴─────────────┴─────────────┴──────────────┴──────────────┴───┴───┴───┴───┴───┴───╯

```

Movement is here https://ki-editor.github.io/ki-editor/docs/normal-mode/core-movements

Actions like undo is here https://ki-editor.github.io/ki-editor/docs/normal-mode/actions/

to quit: `space > Editor (j) > Quit No Save (v)`

to undo: `z`

new line below: `Open (,)`

new line above: change direction with `⇋ Curs (/)` then `Open (,)`

search: `Search (q)`

exit search: `$` - collapse selections

save: `Enter` or `space > Editor (j) > Save all (c)`

character selection: `shift+w`

delete (cut): `shift+v` or `v`

paste: `.` or `shift+.` for zero gap

extend selection: `g`

collapse cursors: `alt+i` (scroll)

tabs:

1. mark file with `alt+b` https://ki-editor.github.io/ki-editor/docs/normal-mode/actions/#mark-file
2. mark another file
3. switch between files with `alt+j` and `alt+l`

## Odin nightly and ols

Download nightly odin https://odin-lang.org/docs/nightly/ to ~/bin/odin

May need to remove security protection with commands like `xattr -d com.apple.quarantine ~/bin/odin/libs/libzstd.1.5.7.dylib`

Nightly odin needed to compile ols from source. For example this commit https://github.com/DanielGavin/ols/commit/8d189a07 introduced `all_or_none` which is not in currently released odin 2025-11 released in homebrew https://github.com/Homebrew/homebrew-core/blob/d16c0c8ef91b088a2c33f719b93fa1b520022198/Formula/o/odin.rb

## 2025-05-20

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
 8││   Line*┆           ┆  Syntax*  ┆   Transform  ┆   ← Open  ┆ ⇧ ┆    ← Delete   ┆   Dedent  ┆   Break  ┆   Indent  ┆   Index  │
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

### Tutorial <https://ki-editor.github.io/ki-editor/docs/tutorial/>

#### Change the first two words

`m` is same as `h` followed by `u` or `i`?

#### Raise / Replace parent node with current node

`Shit+t` can also be done with `t` followed by `i`

#### Remove all sibling nodes except the current node

`x` replaces

#### Invert nesting (JSX)

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
