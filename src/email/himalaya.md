# himalaya (CLI mail client)

- Read-only search across all Gmail: `himalaya envelope search -m "[Gmail]/All Mail" 'after 2026-01-01 and subject foo'`
  (DSL: `from`, `to`, `subject`, `body`, `date`, `after`, `and/or/not`, `order by date desc`).
- `himalaya imap search` has no Gmail `X-GM-RAW`; use `himalaya imap raw` for Gmail search syntax such as `filename:`.
- `himalaya imap raw` (2.1.0) sends a bare LF unless the command itself ends with a literal `\r\n`, and Gmail
  ignores bare-LF commands, so it hangs ("stream stopped responding after 60s"). Workaround:

  ```
  himalaya imap raw -- 'a1 EXAMINE "[Gmail]/All Mail"\r\na2 UID SEARCH X-GM-RAW "filename:music.txt"\r\n'
  ```

  `EXAMINE` opens the mailbox read-only. Bug: https://github.com/pimalaya/himalaya/issues/764
- `himalaya gmail …` (REST API) needs a separate Gmail backend config; IMAP alone does not enable it.
