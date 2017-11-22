## run single test file

`npx jest path/to/file.test.jsx`

update snapshot

`npx jest path/to/file.test.jsx --update-snapshot`

- https://stackoverflow.com/questions/28725955/how-do-i-test-a-single-file-using-jest
- Also more granular https://stackoverflow.com/questions/42827054/how-do-i-run-a-single-test-using-jest

## run all tests

`CI=true yarn test 2>&1 | grep "FAIL"`

- https://github.com/facebook/jest/issues/1788#issuecomment-249356394
- https://github.com/facebookincubator/create-react-app/blob/master/packages/react-scripts/template/README.md#continuous-integration
