Array.from({length: totalYears})

Array.from(Array(totalYears))

[...Array(totalYears)]

Array.apply( undefined, { length: totalYears } )

https://stackoverflow.com/questions/1295584/most-efficient-way-to-create-a-zero-filled-javascript-array


trochę na fill przejechałem, parametr jest traktowany jako referencja, więc jeśli chcemy mieć np. macierz 2d, to fill([]) się nie sprawdzi - wypełni tablicę referencjami do tej samej tablicy

https://www.facebook.com/groups/257881290932879/permalink/1587168231337505/