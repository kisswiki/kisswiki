## xi-term

`:t InspiredGitHub`

Does not read config from ~/.config/xi/preferences.xiconfig https://github.com/xi-frontend/xi-term/issues/113

Should be

```toml
theme = "InspiredGitHub"
```

List of available themes you will get when you run

`xi-term -l logfile`

Then in `logfile` you will find `available_themes`.

Default configs https://github.com/xi-editor/xi-editor/tree/fde226b9ff1ead2f408ff4c9336581050d637958/rust/core-lib/assets
