- draw polygon in Elm https://ellie-app.com/jYTfqG92Ga1/1

Math.cos takes radians and returns values for Unit Circle with radius 1.

Does radian comes from radius word?

Radian is 360 deg / pi.

360 / 6.28.... is around 57 degrees.

> 180/Math.PI
57.29577951308232

To get coordinates (vertices) of pentagon:

1. Calculate what is the angle in radians between vertices. `var angle = 2 * Math.PI / 5`.

> 2 * Math.PI / 5
1.2566370614359172

2. For the start let's just calculate x postions.

for 1 angle

```javascript
var x1 = Math.cos(angle * 1); // x / 1 = 0.30901699437494745
var x2 = Math.cos(angle * 2); // -0.8090169943749473
var x3 = Math.cos(angle * 3); // -0.8090169943749475
var x4 = Math.cos(angle * 4); // 0.30901699437494723
var x5 = Math.cos(angle * 5); // 1
```

##

Let's calculate cos for 1.2566370614359172 by hand using Maclaurin series https://en.wikipedia.org/wiki/Taylor_series#Trigonometric_functions

```javascript
var x = 1.2566370614359172;

function fac(n) { return n < 2 ? 1 : n * fac(n - 1); };
function sin(x) {
    var result = 0;
    for(let n = 0, limit = 5; n <= limit; n = n + 1) {
        let c = Math.pow(-1, n) * Math.pow(x, 2 * n + 1) / fac(2 * n + 1);
        // console.log(c);
        result += c;
    }
    return result;
}

function cos(x) {
    var result = 0;
    for(let n = 0, limit = 5; n <= limit; n = n + 1) {
        let c = Math.pow(-1, n) * Math.pow(x, 2 * n) / fac(2 * n);
        // console.log(c);
        result += c;
    }
    return result;
}

console.log(sin(x)); // 0.9510565131892438
console.log(cos(x)); // 0.30901696228110964
```

## calculate by hand

The mathematical processes behind the trig functions are, except for
special values like 0, 30, 45, 60, 90, and the like, not finite
processes.  Specifically, one uses the series

  sin(x) = (x) - (x^3)/3! + (x^5)/5! - ...  where x is in radians.  

So, if you wanted sin(5 deg), you would convert 5 degrees to radians:
 
  x = 5*pi/180

Then, using the above formula
 
  sin(5*pi/180) = (5*pi/180) - (5*pi/180)^3/3! + (5*pi/180)^5/5! - ...

If you evaluate just the first three terms you will find (for small
angles) a pretty good approximation.  From above, our approximation is

  sin(5*pi/180) = .0872664626 - .0001107620 + .0000000422
                =  0.0871557428 

Compare that with the result from my calculator, which is

  sin(5deg) = 0.087155742...

For bigger angles you would need to calculate more terms in the
formula to maintain that level of accuracy.

Calculators, however, don't use the series because it would take too
much time.  They use an algorithm called the CORDIC algorithm.  It is
very accurate and can be done rapidly.  If you do a Google search on
CORDIC you will find a description of this algorithm.  One such link
is here:
  
  CORDIC FAQ
    http://www.dspguru.com/info/faqs/cordic.htm

A similar calculation is used to find the other trig functions,
particularly the cosine.

- http://mathforum.org/library/drmath/view/64635.html
- https://www.quora.com/How-do-I-calculate-cos-sine-etc-without-a-calculator/answer/David-Joyce-11?share=1&srid=Vor9
- https://en.wikipedia.org/wiki/Taylor_series#Trigonometric_functions