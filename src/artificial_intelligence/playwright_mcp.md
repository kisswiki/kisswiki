# Playwright MCP from any agent

Two ways to let an agent drive a real browser, whichever agent it is:

- attach to the Chrome profile you already use, through the Playwright MCP
  extension bridge — existing logins, cookies and tabs, no second browser;
- run a separate automated browser (Chrome for Testing) through a CLI, such as
  `agent-browser`, with no Chrome extension and no inheritance of your logins.

## Playwright MCP extension bridge

The bridge is a Chrome extension plus an MCP server. The server is an ordinary
stdio MCP server, so it works with any MCP client; only the syntax for adding it
differs per client. Nothing here is specific to one agent.

1. Install [Playwright Extension](https://chromewebstore.google.com/detail/playwright-extension/mmlmfjhmonkocbjadbfplnigmagldckm)
   in the Chrome profile you already use.
2. With Node.js and npm available, add the server to your client. Pi's syntax is
   the only one verified here:

   ```sh
   pi mcp add playwright-extension --exposure codemode -- npx -y @playwright/mcp@0.0.83 --extension --executable-path "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --profile-dir-name Default
   pi mcp list
   ```

   This adds the server to `~/.pi/agent/mcp.json`, preserving other servers.
   Other clients take the same server command (`npx … --extension
   --executable-path … --profile-dir-name Default`) in their own MCP
   configuration; check that client's documentation for the exact shape.
   `npx` installs the pinned package on first use. A connected server with tools
   confirms MCP startup, not yet access to a Chrome tab.
3. Reload the client, or start a new session.
4. Ask the agent to inspect a neutral Chrome tab. On the first browser
   interaction, approve the extension's connection request and choose the tab to
   share. Keep manual connection approval; do not configure a token to bypass it.
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

### Troubleshoot extension discovery on macOS

If Chrome shows the extension enabled but the MCP server says it is missing,
macOS may be blocking reads of the profile directory. The explicit
`--executable-path` in the command above avoids that discovery step;
`--profile-dir-name` alone does not. Use the executable and profile from
`chrome://version`. This configuration was verified with an existing logged-in
Chrome `Default` profile, without copying its data, changing disk permissions or
enabling remote debugging.

A browser call can time out while the owner reviews the connection dialog.
Finish the approval before making one new call; do not retry in a loop. If a
screenshot exposes the extension token, regenerate it and restart Chrome; never
paste it into the agent conversation or the MCP configuration.

Reference: [official extension setup](https://github.com/microsoft/playwright/tree/main/packages/extension#readme).

### Gaps versus Claude in Chrome (2026-09-30)

Use this bridge instead of Claude in Chrome whenever the work happens in another
agent: it drives the same running Chrome profile, so the existing logins, cookies
and tabs are there, and it exposes more tools. The Claude extension keeps no
inherent advantage beyond the permissions it has already been granted, and its
working file uploads are the visible symptom of that.

Verified while filling a real ATS form. The main limitation of the Playwright
bridge against Claude's Chrome extension is the Playwright extension's own
permissions, not the tool set.

- **File uploads need a permission the Claude extension already has.**
  `browser_file_upload` fails with
  `Protocol error (DOM.setFileInputFiles): Not allowed`. Chromium emits that
  error when the devtools session may not read local files, which for an
  extension-backed session comes from the extension's `AllowFileAccess`
  permission. Fix: `chrome://extensions` → the Playwright extension →
  Details → **Allow access to file URLs**. It is an explicit permission grant,
  so the owner decides, and it needs a reconnect: right after the change the
  bridge timed out until it reconnected. Verified end to end on 2026-09-30 —
  with the permission on, the upload attached the PDF (`input.files` showed the
  expected name and size) and the application submitted successfully. So file
  inputs work in extension mode; the earlier "Not allowed" was only this
  permission.
- **Uploads only from allowed roots.** The MCP server refuses paths outside the
  workspace with a clear message (`Allowed roots: <workspace>/.playwright-mcp,
  <workspace>`), so a `/tmp` copy of a CV was rejected. That means personal
  documents have to sit inside the project directory to be uploaded; keep them
  out of commits, and ignore `.playwright-mcp/` in that repository.
- **Drag-and-drop is not a workaround.** `browser_drop` fails with
  `Drop target did not accept the drop - its dragover handler did not call
  preventDefault()` on every element tried, and most widgets have no drop
  handler. Page JavaScript cannot read a file from disk either.
- **The first request can time out while the connection dialog is open.** The
  initial `browser_tabs` call failed after 60 s because approval had not
  happened yet. Ask the owner, then make one fresh call; do not loop.
- **Styled inputs can time out on actionability.** Clicking a hidden
  `input[type=checkbox]` by ref timed out (`locator resolved to …` then no
  click); clicking the visible `label[for=…]` worked and toggled the input,
  which was verified by reading `.checked`.
- **A pending file chooser blocks other tools.** Only
  `browser_file_upload` handles that modal state; `browser_press_key` is
  refused. Cancel it with `browser_file_upload` and no paths.
- **Snapshots are large.** Use `browser_snapshot` with `target` and `depth`,
  or read one region, instead of dumping the page; full snapshots get truncated.
- **Custom widgets.** Selectize dropdowns worked by clicking the option with a
  real mouse click (`div.selectize-dropdown:visible .option:nth-child(n)`) and
  then verifying the committed value; mousedown-driven widgets may ignore a
  synthetic JS `click()`.
- **Richer tool set than Claude in Chrome.** `browser_fill_form`,
  `browser_find`, `browser_select_option`, `browser_take_screenshot`,
  `browser_console_messages`, `browser_network_request(s)`,
  `browser_emulate_media` and `browser_run_code_unsafe` have no equivalent
  there. Treat `browser_run_code_unsafe` as privileged: it runs arbitrary
  Playwright code in the MCP server.

The operational recipes live in the `browser-forms` skill of the job-seeker
repository (`~/personal_projects/job-seeker/skills/browser-forms/`, symlinked
into each agent's skills directory); its `playwright-mcp.md` covers the
tool-level workflow. This note records only the mechanism and the differences.

## Alternative: browser automation via CLI

[agent-browser](https://github.com/vercel-labs/agent-browser) is a standalone
browser automation CLI. Any agent with a shell tool can invoke it; no MCP server
and no browser extension are required. It runs its own browser instead of
attaching to the one you use.

### Installation

With Node.js 24 or newer and npm installed:

```sh
npm install -g agent-browser@0.38.1
agent-browser install
agent-browser --version
```

The pinned version above was tested on macOS Apple Silicon. The second command
downloads Chrome for Testing; it does not install a browser extension or modify
any agent's configuration. Installation is global, outside project
dependencies. If the agent cannot find the command afterwards, check its `PATH`
or restart it from the terminal where `agent-browser --version` works.

### Verify browser control

Use a separate session and a neutral page:

```sh
agent-browser --session browser-check open https://example.com
agent-browser --session browser-check get title
agent-browser --session browser-check snapshot
agent-browser --session browser-check close
```

The title should be `Example Domain`. `snapshot` returns the page's accessibility
tree and references such as `@e1`, which the agent then uses with `click` or
`fill`. Take a fresh snapshot after navigation or page changes; references may
become stale. Keep the same `--session` value for commands in one workflow.

Ask the agent, for example:

> Use agent-browser through your shell to open example.com in a separate session,
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
Avoid printing or saving snapshots of pages that expose secrets. An agent's
working directory and project trust do not sandbox its tools.

References: [agent-browser documentation](https://agent-browser.dev/),
Pi 0.99.1 `docs/how-pi-works.md` and `docs/security.md`.
