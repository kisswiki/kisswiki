## watchexec

`watchexec -i zig-cache -e zig -r 'zig build 2>&1 | ziglings_cut_passed.py`

## vscode task

`ctrl+shift+p > Tasks: Configure Task`.

Then I have changed `command` and added `runOptions`.

Also `ctrl+shift+p > Tasks: Manage Automatic Tasks in Folder > Allow...`

```
{
    // See https://go.microsoft.com/fwlink/?LinkId=733558
    // for the documentation about the tasks.json format
    "version": "2.0.0",
    "tasks": [
        {
            "label": "echo",
            "type": "shell",
            "command": "watchexec -w exercises -i zig-cache -e zig 'printf "\n\n\n-----------\n"; zig build'",
            "runOptions": {
                "runOn": "folderOpen"
            }
        }
    ]
}
```

- https://dev.to/robole/how-to-run-webpack-automatically-in-vs-code-when-you-open-a-project-1c19

To update zig

`~/personal_projects/zig/zig-utils/scripts/zupd aarch64-macos`

## Move output to the right

Drag your Outline header over the Terminal header which will then allow you the option of putting it to the left or right of the Terminal

https://stackoverflow.com/questions/36702207/how-to-display-vs-code-output-window-to-side-rather-than-below/62265304#62265304

## pointers

```zig
*u8 // pointer var u8

&foo // reference to foo

*const u8 <- pointer to const u8

var a: u8;

var p1 = &a; // var pointer to var u8
const p2 = &a; // const pointer to var u8
const p3: *const u8 = &a; // const pointer to const u8 <- this pointer does not allow changing value it points to, even though a is var.

p1.* = 'b';
```

43_pointers5.zig

When accessing struct fields, we don't have to dereference pointer:

```zig
fn foo(pv: *Vertex) {
  // p.*.x += 2;
  pv.x += 2;
}
```

## .?

46_optionals2.zig

`.?` is equivalent of `orelse unreachable`

Similar to `someErrorUnion catch unreachable`
