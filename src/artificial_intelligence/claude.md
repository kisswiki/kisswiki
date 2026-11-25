# Claude

## Claude Code CLI

### Tab completion of paths

Tab does not complete paths in plain prompt text, so `~/Downlo<Tab>` does nothing.
It only works in two places:

1. After `@` (file/directory mention): `@~/Downlo<Tab>`.
   If `~` is not expanded, use the full path (`@/Users/me/Downlo<Tab>`)
   or a path relative to the working directory (`@Downlo<Tab>`).
2. In bash mode (line starting with `!`): `! ls ~/Downlo<Tab>`.

## Rozmowy

- [Rozmowa o świadomości, bólu i prawdzie (2026-11-25)](claude_rozmowa_o_swiadomosci.md)
