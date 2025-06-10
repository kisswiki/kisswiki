# Read me

to open help press `alt+m`

to select character press E <https://github.com/ki-editor/ki-editor/issues/649>

to open file press `Space e` or `Space f`, you can search with `q`.

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
