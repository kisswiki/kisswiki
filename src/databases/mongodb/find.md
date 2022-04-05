## regex with $ne

use `$not`

`db.getCollection('users').find({email: {$not: /^.*gmail\.com$/ } })`

https://stackoverflow.com/questions/20175122/how-can-i-use-not-like-operator-in-mongodb/20175230#20175230
