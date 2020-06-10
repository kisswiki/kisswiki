- pull vs push https://github.com/yelouafi/redux-saga/issues/105#issuecomment-182831804
- http://survivejs.com/blog/redux-saga-interview/
- Saga is a failure management pattern https://medium.com/@roman01la/confusion-about-saga-pattern-bbaac56e622
- alternative http://www.christianalfoni.com/articles/2016_09_11_The-case-for-function-tree
- http://jaysoo.ca/2016/01/03/managing-processes-in-redux-using-sagas/

## flow

dispatch -> take

```
dispatch(signIn(data))

export function signIn (data) {
  return { type: SIGN_IN, data };
}

takeEvery(SIGN_IN, authentication.authenticate, apiService),

```

## takeEvery has been cancelled, uncaught

When some action can throw js error, has to be wrapped with `try .. catch`.

## mapped stack error

```javascript
import { takeLatest, call, put } from 'redux-saga/effects';
import { getInteractionsSuccess, getInteractionsFailure } from '../actions/interactions';
import { GET_INTERACTIONS } from '../constants/interactions';
import { getInteractions } from '../services/interactions';
import { mapStackTrace } from 'sourcemapped-stacktrace'

export function* handleGetInteractionsLoad(params) {
    try {
        const interactions = yield call(getInteractions, params);
        var a;
        console.log(a[0])
        yield put(getInteractionsSuccess(interactions))
    } catch (error) {

        const stack = yield call(() => new Promise(resolve => mapStackTrace(error.stack, resolve)));
        error.stack = stack;
        const { name, message } = error;
        yield put(getInteractionsFailure({ name, message, stack }));
    }
};

export default function* watchGetInteractionsLoad() {
    yield takeLatest(GET_INTERACTIONS.LOAD, handleGetInteractionsLoad);
};
```

- https://stackoverflow.com/questions/591857/how-can-i-get-a-javascript-stack-trace-when-i-throw-an-exception
- https://stackoverflow.com/questions/147891/javascript-exception-stack-trace/5743050#5743050
- IE does not put the sourceURL into the stack trace for the exception (whereas Chrome does) https://stackoverflow.com/questions/17945833/source-mapping-in-ie-sourceurl/23134416#comment42813849_23134416
- https://github.com/redux-saga/redux-saga/issues/1406
- https://stackoverflow.com/questions/43031832/how-to-yield-put-in-redux-saga-within-a-callback/44008180#44008180