# Pi

## Model and reasoning: `/m`

`/m` opens the model picker, then the reasoning picker for the chosen model, both
with type-to-filter search. Enter in the second step applies the pair to the
session and remembers it: the model becomes the default for new sessions, and the
reasoning level is stored per model under `modelThinkingLevels` in `settings.json`
(like `provider/model:high`), so switching back later restores it. Esc in either
step cancels without changing anything. Models without reasoning skip the second
step. When model scoping is configured, `/m` lists the scoped models.

`/m` is the only command here that remembers a reasoning level, and it always
ties that level to one model. The same extension also saves an interactive
`/model` choice as the default model.

The picker comes from the personal extension
`~/.pi/agent/extensions/remember-model.ts`; run `/reload` after changing it.
The index of that directory is `~/.pi/agent/extensions/README.md`, which keeps
one line per extension and points here for usage details.

## Thinking / reasoning level

Use `/thinking` or **Shift+Tab** to change the level for the current session only.
In the built-in `/thinking` picker, **Ctrl+S** saves the level as the global
default for new sessions. That default applies to models without a level saved by
`/m`, unless overridden by project settings, per-model settings or startup
options; resumed sessions retain their saved level.

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
