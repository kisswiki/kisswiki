# Bugs

Cannot save with `space s` when help mode with `alt+m` displayed.

How to display keymap_actions (from code source)?

When opening file explorer with space+e, and there was query done, how to clear query?

## Bugs in documentation

### Why Ki? <https://ki-editor.github.io/ki-editor/docs/pitch/>

2.1. Deletion <https://ki-editor.github.io/ki-editor/docs/pitch/>

video shows sdddd and should be sdhhh

2.2 Duplication

video shows sypp and should be scvv

2.3 Swap

How to swap with jump?

4. Multi-cursor

Old key bindings

### Core concepts <https://ki-editor.github.io/ki-editor/docs/core-concepts/>

2. Positional Keymaps

D. Travel Distance Optimization

actions will placed ->  actions will be placed

### Tutorial <https://ki-editor.github.io/ki-editor/docs/tutorial/>

#### Token movement

in Vim `WEB` does something different than `sll` in ki

Also why it is Vim `W` Vim `E` Vim `B` and not Vim `WEB`?

Maybe to show how to move in Vim, but maybe there should be only strict equivalent?

#### Word movement

No Vim equivalent

#### Undo & Redo

Why Vim `u` Vim `ctrl+r` and not Vim `u` `ctrl+r`?

#### Repeat last non-contigous selection mode

No Vim equivalent

### Components

#### File Explorer

To add a folder, append / to the file name -> To add a folder, append / to the path

## Navigate named sibling nodes via Next/Previous movement

<https://github.com/ki-editor/ki-editor/issues/658>

<https://ki-editor.github.io/ki-editor/docs/normal-mode/selection-modes/primary/>

When on 2nd line, `private readonly http ...` and selecting node with `d`, then selecting more with `i` until whole line selected.
You cannot go to next right node with `l`, only to beta with `.`. Then you can go with `j` or `l`, but when you reach this same line,
it blocks and you cannot select next node.

I can work around this with switching to fine node select with `shift+d`, then pressing `i` to select line and then going to next node with `l`. But it is worse as it selects `;` and other elements.

Also it strangely jumps when pressing `l` from line starting with `events` to line starting with comment `// Events ...`.
But going back from this line with `j`, goes to all previous nodes.

```typescript
export class TableComponent implements OnInit, AfterViewInit {
  private readonly http = inject(HttpClient);
  dataSource = new MatTableDataSource<Container>();
  shipments: string[] = [];
  events: string[] = []; // all events for reference
  backendData: BackendEventData[] = [];

  // Events available under current carrier/shipment filters (used for iteration)
  filteredEvents = computed(() => {
    const carrier = this.selectedCarrier();
    const shipment = this.selectedShipment();

    const relevant = this.dataSource.data.filter((c: Container) => {
      const matchCarrier = !carrier || c.carrier === carrier;
      const matchShipment = !shipment || c.shipment === shipment;
      return matchCarrier && matchShipment;
    });
    return [...new Set(relevant.map((c: Container) => c.event))];
  });
}
```

## Syntax*

<https://github.com/ki-editor/ki-editor/issues/659>

but d does not select whole expression. It selects hello.world().foo().bar().spam().

Also after that, i does not shrinks the selections but enlarges it.
