async/await allows to flatten the nesting.

Unless you use try/catch with await, it looks worse then `then`.

```javascript
myPromise
    .then(handleHappyPath, handleErrorScoped)
    .then(anotherHappyPath)
    .catch(err => handleError(err))
```

vs

```javascript
try {
    let value
    try {
        value = await myPromise
    } catch (err) {
        // possibly setting `value` to something
        handleErrorScoped(err)
    }
    let value2 = await handleHappyPath(value)
   handleAnotherHappyPath(value2)
} catch(err) {
    handleError(err)
}
```

https://dev.to/_hariti/promises-asyncawait-vs-then-how-we-got-here-and-why-i-use-both-emg
dev.to

> running away from callback hell, ran directly into try/catch hell.

Unless you use `catch`:

```javascript
const request = await getRequest()
  .catch(() => null);
```

https://www.reddit.com/r/learnjavascript/comments/ld8e6r/comment/gm505np/

Here it shows that nested then is worse than async/await.
tu dobrze zobrazowane, że jak masz nested then, to lepiej async/await:

```javascript
getAuthors().then((authors) =>
  getBooks()
    .then((books) => filterProlificAuthors(authors, books))
    .then((ids) => Promise.all(ids.map((id) => getBio(id))))
    .then((bios) => {
      // Do something with the bios
    })
);
```

vs

```javascript
async function getBios() {
  const authors = await getAuthors();
  const books = await getBooks();
  const prolificAuthorIds = filterProlificAuthors(authors, books);
  const bios = await Promise.all(prolificAuthorIds.map((id) => getBio(id)));
  // Do something with the bios
}
```

https://www.smashingmagazine.com/2020/11/comparison-async-await-versus-then-catch/
