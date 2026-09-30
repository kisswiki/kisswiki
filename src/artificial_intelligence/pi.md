# Pi

## Model and reasoning: `/m`

`/m` opens the model picker, then the reasoning picker for the chosen model, both
with type-to-filter search. Enter in the second step applies the pair to the
session and remembers it: the model becomes the default for new sessions, and the
reasoning level is stored per model under `modelThinkingLevels` in `settings.json`
(like `provider/model:high`), so switching back later restores it. Esc in either
step cancels without changing anything. Models without reasoning skip the second
step. When model scoping is configured, `/m` lists the scoped models.

The picker comes from the personal extension
`~/.pi/agent/extensions/remember-model.ts`; run `/reload` after changing it.

## Thinking / reasoning level

The same extension provides `/reasoning`: select a supported level and press Enter
to apply it to the current session and save it as the global default. No Ctrl+S is
needed. You can also set it directly:

```text
/reasoning medium
```

Run `/reload` after installing or changing the extension. Cancelling the picker
or entering an unsupported level leaves the session and defaults unchanged.
The global default applies to new sessions unless overridden by project settings,
per-model settings, or startup options; resumed sessions retain their saved level.

For temporary changes, use `/thinking` or **Shift+Tab**. In the built-in
`/thinking` picker, **Ctrl+S** explicitly saves the default. Shift+Tab alone does
not save it. Model changes do not cause this extension to save a reasoning default.

The same extension automatically saves interactive model choices as the default.
Run `/hotkeys` to check the active shortcuts if the defaults were customized.

Reference: Pi 0.99.1, `docs/models.md` and `docs/settings.md`.

## Browser automation

Anything that is not Pi-specific — the Playwright MCP extension bridge that
drives your existing Chrome profile, its gaps versus Claude in Chrome, and the
`agent-browser` CLI alternative — lives in
[playwright_mcp.md](playwright_mcp.md), because it applies to every
agent.

Pi wiring only:

```sh
pi mcp add playwright-extension --exposure codemode -- npx -y @playwright/mcp@0.0.83 --extension --executable-path "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --profile-dir-name Default
pi mcp list
```

Run `/reload` inside Pi, or start a new session, after changing MCP configuration.

The canonical form-filling skill lives in the job-seeker repository and is
already linked into Claude's skills. Symlink it for Pi rather than copying it:

```sh
ln -s "$HOME/personal_projects/job-seeker/skills/browser-forms" "$HOME/.pi/agent/skills/browser-forms"
```

Do not overwrite an existing skill at that path; inspect it first. Run `/reload`
and invoke `/skill:browser-forms` when needed.
