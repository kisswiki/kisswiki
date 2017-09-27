## Prettier

- https://github.com/prettier/prettier
- http://jlongster.com/A-Prettier-Formatter
- https://news.ycombinator.com/item?id=13365470

## prettier-eslint-cli

`--list-different`

Instead of printing the formatted version of the files to the terminal, prettier-eslint will log the name of the files that are different from the expected formatting. This can be usefull when using prettier-eslint in a version control system hook to inform the committer which files need to be formatted.

- https://github.com/prettier/prettier-eslint-cli

### Problem 1

this

```
      <div className="navigation">
        { !account && (
          <img
            src={SignInImage}
            alt="Sign in"
            onClick={openSignInModal}
            className="navigation__sign-in"
          />
        )}
        { account && (
          <div>
            <span>Welcome {account.firstName} {account.lastName}</span>
            <button onClick={signOut}>Log out</button>
          </div>
        )}
      </div>
```

changes to

```
      <div className="navigation">
        {!account && <img src={SignInImage} alt="Sign in" onClick={openSignInModal} className="navigation__sign-in" />}
        {account &&
          <div>
            <span>
              Welcome {account.firstName} {account.lastName}
            </span>
            <button onClick={signOut}>Log out</button>
          </div>}
      </div>
```

### Problem 2

- usuwa nawiasy z jednoargumentowych arrow functions https://github.com/prettier/ prettier/issues/812

Consistent with airbnb style guide https://github.com/airbnb/javascript#arrows--one-arg-parens

.eslintrc

`    "arrow-parens": ["error", "as-needed", { "requireForBlockBody": true }],`

### Problem 3

usuwa nawiasy z jsx:

In order to format your code, prettier parses your code into an AST, then removes everything in the file and reprints it by hand. Unfortunately, parens are not included in the AST, because they don't have semantic significance to the language (as far as the engine is concerned; ASTs are traditionally created so that the engine can understand what you wrote). But that means that when we go through the AST to reprint everything, we have to decide to put parens or not, since that original information isn't there.

We could add in some hacks to look at what the code was like before we parsed it, and then decide to put parens in based on that (which is what we did for deciding if we should print an object on one line or multiple), but that's generally against the philosophy of prettier, because we are trying to normalize format as much as possible; the goal of this tool is to remove wiggle room so that teams who want a consistent format style can get one and stop arguing about stylistic preferences.

Parens kinda don't get as much attention as they deserve because they're harder to work with due to how the AST treats them, which is unfortunate. I think that if parens were in the AST, we would try to preserve what the user wrote; it's an arbitrary distinction.

https://github.com/prettier/prettier/pull/2398#issuecomment-329851723

### Editor needs it's own formatter

>WebStorm has code style options that are applied when generating the code, autocompleting it or on typing. I understand that you can reformat all this new code later with Prettier (in the IDE or outside of it), but it seems that it would be better if the IDE produces the code that is valid or almost valid in the first place. Unlike an editor, WebStorm has a rather wide set of code style options, including many options for wrapping the code.
This is the approach WebStorm is following with the tools like ESLint and Standard: the IDE matches the rules defined by the linters to its own code style settings, all the other errors are fixed by the tool itself (if fixable) or manually.

https://github.com/prettier/prettier/issues/2380#issuecomment-312741247
