cons and pros in comments <https://www.youtube.com/shorts/4PZeIwXx1hc>

##

Maps advantages over plain objects are:

- insertion order is preserved
- they can be indexed using any type including objects*
- they provide their own iterators for their keys, values and entries

- The drawback is it implies having a pointer to the key object elsewhere in memory in order to access the value.

##

All current browser implementations keep the order as well node, bunjs, etc, etc, this isn't true in old browsers.

Maps don't really have any benefits over object to be fair, and even would say that Objects can be stringify by default try to do that with Map

##

If you use objects as keys, they are compared by reference equality. So if you use .get({userId: 1}), you'll get undefined as {userId: 1} is a new object.

##

for objects as keys a WeakMap maybe is better in most cases

##

Maybe in one use case you have an array of immutable objects and want to map from each object to another, then you can map from array[i] -> something. You could also map directly from i -> something, but maybe you only have access to the instance of the object

##

An other alternative if you must use objects as keys, is to take the hash of the object and use that as the key. It is costly but it is a solution.

then you have to keep an eye on the amount of items as the more items there are, the more likely a hash collision can occur

##

You can't just JSON.stringify an object and expect that to work as a key either. The order of keys in the JSON string is not guaranteed to be the same every time.

##

WeakMap was mentioned in these comments but not explained.

It's a map that does not keep its keys alive in memory. A normal Map will keep all its contents, keys and values alike, alive in memory as long as any reference to that Map is alive. A WeakMap never keeps its keys alive, and it only keeps a value alive if that value's key is kept alive by something else in the program.

This also means that you cannot iterate over the entries in a WeakMap. Since it doesn't keep the keys alive, you are never allowed to retrieve those keys from it. Since it only keeps a value alive if its key is already alive, you can only retrieve a value if you have its key, proving that the value still lives in memory.

##

Please don't prioritize using Map() over objects. Avoid them unless you need special keys like functions or are just making a hashMap.

Iteration over objects is trivial, whereas Map iteration is... different.

If you do use Map objects (which is fine for data lookup), just understand that Map() is missing for...in functionality. You have to use for...of.

If you wind up using for...in, there won't be an error and your code will 'run' without functioning.

If you want a for in for maps just do a for of over map.keys()

you don't even need the for.. in it's baked into he for of loop, for of [key] of map

##

Can be serialized as array of arrays by passing map instance to Array.from(), and then turned back to map via Map constructor

##

In most cases you want to use integers or strings as keys, that is right. But I wouldn't say that you should never use objects as keys. Sometimes (but that is a very uncommon case) you can guarantee that the object references are equal

##

serialize to json: Add a toJSON method to a class that extends Map or use Object.fromEntries

##

you can serialize with built in JSON serializer just provide it the second parameter which will transform custom types

##

Exercise caution when turning a Map into a plain object. The keys will be turned into strings so it's not necessarily reversible.

##

You can also lose data if multiple keys happen to be serialized to the same string. Better to stick with an array of tuples, which is better for the Map constructor anyway.

For instance, 1 and "1", which would be different values in a Map would result in the keys "1" and "1" -- overwriting the first entry.

##

The advantage of using maps vs plain objects is that you can use reference types (eg objects, arrays, functions), instead of only value types (eg numbers and strings), as map keys. If two different objects have the same values (and therefore have the same JSON representation) but are different references, this distinction could be lost. If a reference to the same object is found in multiple places, this detail could also be lost.

What 3rd party serializing libraries do instead is they assign number ids to each distinct reference, references get substituted with their ids, and the actual individual serialized objects are serialized in a separate array.

Just to be clear, this serialization detail applies to everything in JS that uses references, including maps and plain objects.
