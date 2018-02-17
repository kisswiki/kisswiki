1. https://code.visualstudio.com/docs/getstarted/themes#_creating-your-own-color-theme
  - Run vscode command: `Developer: Generate Color Theme for Current Settings`
  - See the Adding a new Theme topic in our Extension Authoring section to learn more.
3. https://code.visualstudio.com/docs/extensions/themes-snippets-colorizers#_adding-a-new-theme

```bash
npm install -g yo generator-code
yo code
❯ New Color Theme 
❯ Start fresh
...
? What's your publisher name (more info: https://code.visualstudio.com/docs/tools/vscecli#_publishing-extensions)?
```

## Publishing Extensions

https://code.visualstudio.com/docs/tools/vscecli#_publishing-extensions

### Create a Visual Studio Team Services account

First, make sure you have a Visual Studio Team Services account. https://www.visualstudio.com/en-us/get-started/setup/sign-up-for-visual-studio-online

https://docs.microsoft.com/pl-pl/vsts/accounts/create-account-msa-or-work-student#create-your-account-and-sign-up-for-vsts

Go to VSTS https://go.microsoft.com/fwlink/?LinkId=307137

### Get a Personal Access Token

https://code.visualstudio.com/docs/extensions/publish-extension#_get-a-personal-access-token

Give the Personal Access Token a nice description, optionally extend its expiration date to 1 year, make it access every account and set the authorization to all scopes.

One easy mistake to make when creating the PAT (Personal Access Token) is to not select all accessible accounts in the Accounts field dropdown (instead selecting a specific account). You should also set the Authorized Scopes to All scopes for the publish to work. https://github.com/Microsoft/vscode-vsce/issues/11#issuecomment-234862073

### Create a Publisher

Because of this bug:

vsce suddenly broke. Error: Cannot find module 'vso-node-api/HttpClient' https://github.com/Microsoft/vscode-vsce/issues/238

Create some simple npm project, add below lines to package.json:

```json
    "devDependencies": {
        "vsce": "^1.36.1",
        "vso-node-api": "6.1.2-preview"
    }
```

and install with npm - yarn does not work.

```bash
npm i
vsce create-publisher (publisher name)
```

You can verify it by:

```bash
$ cat ~/.vsce
```
