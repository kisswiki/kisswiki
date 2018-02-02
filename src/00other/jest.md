## Run tests with watcher

`yarn test`

## Coverage

`yarn test -- --noStackTrace --coverage`

## Run single test

`CI=true yarn test -- src/components/CompanyProfile/CompanyProfile.test.jsx`

You can also run jest directly:

`npx jest --env=jsdom src/components/CompanyProfile/CompanyProfile.test.jsx`

## Run tests without watcher

`CI=true yarn test`

## Get list of failing tests

`CI=true yarn test 2>&1 | grep "FAIL" | sort | uniq`

## Remove test from coverage

Add entry to `package.json` like this:

```json
  "jest": {
    "collectCoverageFrom": [
      "!src/components/core/App/**/*"
    ]
  }
```

## git pre-commit hook

```shell
jest --bail --findRelatedTests $STAGED_FILES
if [[ "$?" == 0 ]]; then
    echo "\t\033[32mJest Tests Passed\033[0m"
else
    echo "\t\033[41mJest Tests Failed\033[0m"
    PASS=false
fi
```

https://benmccormick.org/2017/02/26/running-jest-tests-before-each-git-commit/

## Error watching file for changes: EMFILE

`brew install watchman`

https://github.com/facebook/react-native/issues/910#issuecomment-335225430