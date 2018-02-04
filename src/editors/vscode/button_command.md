install https://github.com/ppatotski/vscode-commandbar

.vscode/commandbar.json:

```json
{
	"skipTerminateQuickPick": true,
	"skipSwitchToOutput": false,
	"skipErrorMessage": true,
	"commands": [
		{
			"text": "☯ commit, build and deploy",
			"tooltip": "Serve UI",
			"color": "yellow",
			"command": "git add -A && git commit -a -m wip; bash build_and_deploy.sh",
			"alignment": "left",
			"skipTerminateQuickPick": false,
			"priority": 0
		}
	]
}
```