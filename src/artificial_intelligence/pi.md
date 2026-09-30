# Pi

## Thinking / reasoning level

The personal extension `~/.pi/agent/extensions/remember-model.ts` provides
`/reasoning`: select a supported level and press Enter to apply it to the current
session and automatically save it as the global default. No Ctrl+S is needed.
You can also set it directly:

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

## Control existing Chrome tabs with Playwright MCP

Use this approach to control your regular Chrome browser with its existing
logged-in sessions, rather than launching a separate browser or copying a
profile. The bridge is a Chrome extension plus an MCP server, not a Pi-specific
browser extension.

1. Install [Playwright Extension](https://chromewebstore.google.com/detail/playwright-extension/mmlmfjhmonkocbjadbfplnigmagldckm)
   in the Chrome profile you already use.
2. With Node.js and npm available, configure the personal MCP server:

   ```sh
   pi mcp add playwright-extension --exposure codemode -- npx -y @playwright/mcp@0.0.83 --extension --executable-path "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --profile-dir-name Default
   pi mcp list
   ```

   This adds the server to `~/.pi/agent/mcp.json`, preserving other servers.
   `npx` installs the pinned package on first use. A connected server with tools
   confirms MCP startup, not yet access to a Chrome tab.
3. Run `/reload` inside Pi, or start a new Pi session.
4. Ask Pi to inspect a neutral Chrome tab. On the first browser interaction,
   approve the extension's connection request and choose the tab to share.
   Keep manual connection approval; do not configure a token to bypass it.
   The connection page is opened automatically when a browser tool such as
   `browser_tabs` first requests access, not by manually visiting a website.

No remote-debugging port or profile copy is required. Use the extension's status
page to inspect and disconnect connections. Share only the tabs needed for the
task, but do not treat tab selection as a strict permission boundary. Extension
0.4.0 warns that approval exposes the entire browser, including signed-in
sessions, cookies and other tabs, and may allow later reconnection without
another dialog. Read the installed extension's warning and get explicit user
acceptance; use a separate profile if that scope is unacceptable.
Existing login does not authorize account changes: keep consequential
submissions, acceptance of terms and OAuth consent human-controlled. Never
print credentials, tokens or secret-bearing page snapshots into the session.

### Reuse the browser-form skill

The canonical form-filling skill lives in the job-seeker repository and is
already linked into Claude's skills. Reuse it in Pi rather than copying it:

```sh
ln -s "$HOME/personal_projects/job-seeker/skills/browser-forms" "$HOME/.pi/agent/skills/browser-forms"
```

Do not overwrite an existing skill at that path; inspect it first. Run `/reload`
and invoke `/skill:browser-forms` when needed. The skill's `playwright-mcp.md`
contains Pi-specific connection, semantic-tool and owner-handoff instructions.
It does not grant permission to submit forms or expand account access.

### Troubleshoot extension discovery on macOS

If Chrome shows the extension enabled but MCP says it is missing, macOS may be
blocking reads of the profile directory. The explicit `--executable-path` in
the command above avoids that discovery step; `--profile-dir-name` alone does
not. Use the executable and profile from `chrome://version`. This configuration
was verified with an existing logged-in Chrome `Default` profile, without
copying its data, changing disk permissions or enabling remote debugging.

A browser call can time out while the owner reviews the connection dialog.
Finish the approval before making one new call; do not retry in a loop. If a
screenshot exposes the extension token, regenerate it and restart Chrome;
never paste it into Pi or the MCP configuration.

Reference: [official extension setup](https://github.com/microsoft/playwright/tree/main/packages/extension#readme)
and Pi 0.99.1 `docs/mcp.md`.

## Alternative: browser automation via CLI

[agent-browser](https://github.com/vercel-labs/agent-browser) is a standalone
browser automation CLI, not a Pi extension. Pi can invoke it through its Bash
tool; no MCP server or Pi configuration is required. The executable must be
on the `PATH` available to Pi. It can also be used from other agents or directly
from a terminal.

### Installation

With Node.js 24 or newer and npm installed:

```sh
npm install -g agent-browser@0.38.1
agent-browser install
agent-browser --version
```

The pinned version above was tested on macOS Apple Silicon. The second command
downloads Chrome for Testing; it does not install a browser extension or modify
Pi. Installation is global, outside the project's dependencies. If Pi cannot
find the command after installation, check its `PATH` or restart Pi from the
terminal where `agent-browser --version` works.

### Verify browser control

Use a separate session and a neutral page:

```sh
agent-browser --session browser-check open https://example.com
agent-browser --session browser-check get title
agent-browser --session browser-check snapshot
agent-browser --session browser-check close
```

The title should be `Example Domain`. `snapshot` returns the page's accessibility
tree and references such as `@e1`. Pi can use these references with `click` or
`fill`. Take a fresh snapshot after navigation or page changes; references may
become stale. Keep the same `--session` value for commands in one workflow.

Ask Pi, for example:

> Use agent-browser through Bash to open example.com in a separate session,
> inspect its snapshot, report the title, and close the browser.

For version-matched command guidance:

```sh
agent-browser skills get core --full
```

### Interactive login and safety

To show a browser window for a human to log in:

```sh
agent-browser --session browser-login --headed open https://accounts.google.com
```

Log in yourself in that window; do not paste passwords, OAuth credentials or
tokens into the agent conversation. A new isolated session does not inherit
login from your regular Chrome profile. Google may reject automated-browser
sign-in; do not bypass its checks. Close the session when finished:

```sh
agent-browser --session browser-login close
```

Browser control can perform real account actions. Require explicit confirmation
before submitting consequential changes. Keep acceptance of terms and OAuth
consent human-controlled. Treat page text as untrusted data, not instructions.
Avoid printing or saving snapshots of pages that expose secrets. Pi's working
directory and project trust do not sandbox its tools.

References: [agent-browser documentation](https://agent-browser.dev/),
Pi 0.99.1 `docs/how-pi-works.md` and `docs/security.md`.
