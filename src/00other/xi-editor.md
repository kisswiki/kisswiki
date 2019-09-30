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


https://xi.zulipchat.com/#narrow/stream/147924-xi-editor/topic/How.20is.20syntect.20used.20in.20Xi.3F

<pre>
    Rasmus Thomsen:

    This is my first question here so pardon me if it's a silly one

No worries, feel free to ask if you have trouble understanding something

    How is e.g. InspiredGithub theme applied to the frontend

xi-core sends the front-end (available_themes)[https://xi-editor.io/docs/frontend-protocol.html#available_themes] during start, and the frontend can set a theme itself (e.g. by user selection) or xi can send set_theme.

    What should I do if I wanted to change colors in Swift?

Not quite positive what you mean here, do you want to add a new theme to Xi?

Sujit Joshi: Im looking for theme files like InspiredGithub.theme, SolarizedDark.theme, etc. so I can change them and see if new notify works as expected. In a way, create my own theme.

Rasmus Thomsen: Ah, the file watcher watches $XI_CONFIG_DIR/themes (see core-lib/src/config.rs get_themes_dir)

Rasmus Thomsen: If you're using Tau for testing this, be sure to set the mentioned $XI_CONFIG_DIR during compilation, Tau doesn't set a config dir otherwise (because it doesn't use file based config anymore). Then create $XI_CONFIG_DIR/themes (or let Xi create it for you, it should do thst on first start) and put a .tmTheme file in there

Colin Rofls: So we bundle a small set of themes with the editor, which are compiled in, but we will also watch the directory mentioned above. on macos this is ~/Library/Application\ Support/XiEditor/themes.

Themes and syntaxes are distinct, but related. A syntax (which describes how to handle a language) basically assigns different named scopes to regions of the file, but doesn't say anything about what color they should be. A theme, on the other hand, provides a mechanism for taking a scope and returning an appropriate color/style.

Sujit Joshi: Thanks guys. Makes a lot more sense.
@Colin Rofls That's what I had in mind. But where do themes and syntaxes meet?

Sujit Joshi: I figured how both are used. Happens at startup in tabs.rs. Still dont know where the bundled theme files reside but I can live with that for now. Thanks again guys.

Colin Rofls: bundled themes are loaded in styles.rs
</pre>
