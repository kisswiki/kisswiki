- 0, 1, 2 `Math.floor(Math.random()*3)` https://www.facebook.com/DevHumor/posts/1155959127761661
- -, 0, + `0.5 - Math.random()` https://www.facebook.com/groups/217169631654737/permalink/1068685586503133/

Math.random() * 2 returns any number (including decimal values) between 0(inclusive) and 2(exclusive). Now, when you compute Math.floor() on these values, you can only get 0 or 1 because it rounds DOWN.
However, Math.random() * 5 returns returns any random number (including decimal values) between 0(inclusive) and 5(exclusive). And so, Math.random() * 5 + 1 returns any random number (including decimal values) between 1(inclusive) and 6(exclusive). Now, when you computer Math.floor() on these values, the only possible values are the integer values of 1, 2, 3, 4 & 5.

https://www.codecademy.com/en/forum_questions/556f210b9113cbad080009bc

## Range

The Math.random() function returns a floating-point, pseudo-random number in the range [0, 1) that is, from 0 (inclusive) up to but not including 1 (exclusive).
Here are two example randomly generated numbers:

```javascript
Math.random() // 0.011153860716149211
Math.random() // 0.9729151880834252
```

Because of this, when we multiply our randomly generated number by another number, it will range from 0 to a maximum of 1 lower than the number being multiplied by (as Math.floor() simply removes the decimal places rather than rounding the number (that is to say, 0.999 becomes 0 when processed with Math.floor(), not 1)).

```javascript
Math.floor(0.011153860716149211 * 5) // 0
Math.floor(0.9729151880834252 * 5)   // 4
Adding one simply offsets this to the value you're after:

```javascript
Math.floor(0.011153860716149211 * 5) + 1 // 1
Math.floor(0.9729151880834252 * 5) + 1   // 5
```

https://stackoverflow.com/questions/21483667/concept-of-math-floormath-random-5-1-what-is-the-true-range-and-why

## no-biased

What is the probability of getting 0, 1 and -1 respectively? If you think it’s ~33% than you are wrong, 0 has 50% of probability since anything inside the range -0.5...0.5 is going to rounded to 0 - I already knew it before I coded the naive approach but at that time I didn’t needed any sort of precision - It is important to note that the problem only affects the min/max values no matter how large is the range.

Running this code 1000x:

view sourceprint?

```
// first run
-1 => 24.7%
 0 => 50.2%
 1 => 25.1%
 
// second run
-1 => 24.8%
 0 => 51.6%
 1 => 23.5%
 ```

 ```javascript
 function rand(min, max) {
    return lerp(Math.random(), min, max);
}

// " linear interpolation" between start and end
function lerp(ratio, start, end) {
    return start + (end - start) * ratio;
}

function randInt(min, max) {
    // can't be `max + 0.5` otherwise it will round up if `rand`
    // returns `max` causing it to overflow range.
    return Math.round( rand(min - 0.5, max + 0.499999999999) );
}

function randInt(min, max) {
    return Math.round( rand(min - 0.5, max + 0.5) );
}
```

http://blog.millermedeiros.com/generating-non-biased-random-integers/