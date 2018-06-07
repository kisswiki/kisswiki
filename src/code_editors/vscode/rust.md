## Cargo.toml must be in the workspace subdirectory

- Tracking issue: multiple targets/workspaces/packages, etc. https://github.com/rust-lang-nursery/rls/issues/132
- Workspaces https://github.com/rust-lang-nursery/rls/pull/409
- Feature - Specify Project Directory https://github.com/editor-rs/vscode-rust/issues/156
- workaround - multi-root workspaces https://code.visualstudio.com/docs/editor/multi-root-workspaces

## formatOnSave

```json
    "[rust]": {
        "editor.formatOnSave": true,
    },
```

## failed to read Cargo.toml

Check if in `Cargo.toml` there is no `workspace = "../"`