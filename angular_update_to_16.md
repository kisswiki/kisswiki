`npm install typescript@4.9.3`

```shell
% ng update @angular/cli @angular/core
The installed Angular CLI version is outdated.
Installing a temporary Angular CLI versioned 16.0.0 to perform the update.
✔ Packages successfully installed.
Using package manager: npm
Collecting installed dependencies...
Found 44 dependencies.
Fetching dependency metadata from registry...
    Updating package.json with dependency @angular-devkit/build-angular @ "16.0.0" (was "15.2.4")...
    Updating package.json with dependency @angular-devkit/core @ "16.0.0" (was "15.2.4")...
    Updating package.json with dependency @angular/cli @ "16.0.0" (was "15.2.4")...
    Updating package.json with dependency @angular/compiler-cli @ "16.0.0" (was "15.2.3")...
    Updating package.json with dependency @angular/animations @ "16.0.0" (was "15.2.3")...
    Updating package.json with dependency @angular/common @ "16.0.0" (was "15.2.3")...
    Updating package.json with dependency @angular/compiler @ "16.0.0" (was "15.2.3")...
    Updating package.json with dependency @angular/core @ "16.0.0" (was "15.2.3")...
    Updating package.json with dependency @angular/forms @ "16.0.0" (was "15.2.3")...
    Updating package.json with dependency @angular/localize @ "16.0.0" (was "15.2.3")...
    Updating package.json with dependency @angular/platform-browser @ "16.0.0" (was "15.2.3")...
    Updating package.json with dependency @angular/platform-browser-dynamic @ "16.0.0" (was "15.2.3")...
    Updating package.json with dependency @angular/router @ "16.0.0" (was "15.2.3")...
UPDATE package.json (2080 bytes)
✔ Packages successfully installed.
** Executing migrations of package '@angular/cli' **

❯ Remove 'defaultProject' option from workspace configuration.
  The project to use will be determined from the current working directory.
  Migration completed (No changes made).

❯ Replace removed 'defaultCollection' option in workspace configuration with 'schematicCollections'.
  Migration completed (No changes made).

❯ Update the '@angular-devkit/build-angular:server' builder configuration to disable 'buildOptimizer' for non optimized builds.
  Migration completed (No changes made).

** Executing migrations of package '@angular/core' **

❯ In Angular version 15.2, the guard and resolver interfaces (CanActivate, Resolve, etc) were deprecated.
  This migration removes imports and 'implements' clauses that contain them.
  Migration completed (No changes made).

❯ As of Angular v16, the `moduleId` property of `@Component` is deprecated as it no longer has any effect.
  Migration completed (No changes made).
```

- https://angular.io/cli/update
- https://update.angular.io/?v=15.0-16.0

For eslint codelyzer recomends https://github.com/angular-eslint/angular-eslint. Used this guide for migrate https://code.visualstudio.com/api/advanced-topics/tslint-eslint-migration.

tslint-to-eslint-config.log

```
8 ESLint rules behave differently from their TSLint counterparts:
  * arrow-body-style:
    - ESLint will throw an error if the function body is multiline yet has a one-line return on it.
  * no-console:
    - Custom console methods, if they exist, will no longer be allowed.
  * space-before-function-paren:
    - Option "constructor" is not supported by ESLint.
    - Option "method" is not supported by ESLint.
  * no-underscore-dangle:
    - Leading or trailing underscores (_) on identifiers will now be forbidden.
  * no-invalid-this:
    - Functions in methods will no longer be ignored.
  * @typescript-eslint/no-unused-expressions:
    - The TSLint optional config "allow-new" is the default ESLint behavior and will no longer be ignored.
  * prefer-arrow/prefer-arrow-functions:
    - ESLint does not support allowing standalone function declarations.
    - ESLint does not support allowing named functions defined with the function keyword.
  * eqeqeq:
    - Option "smart" allows for comparing two literal values, evaluating the value of typeof and null comparisons.

2 rules are not known by tslint-to-eslint-config to have ESLint equivalents:
  * tslint-to-eslint-config does not know the ESLint equivalent for TSLint's "import-spacing".
  * tslint-to-eslint-config does not know the ESLint equivalent for TSLint's "whitespace".
```
