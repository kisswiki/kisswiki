save as post-rewrite

```bash
#!/usr/bin/env bash

echo "[post-rewrite hook]"

changedfiles=( `git diff-tree --no-commit-id --name-only HEAD@{1} HEAD` )

if [[ "${changedfiles[*]}" =~ "package.json" ]]; then
    yarn
fi
```