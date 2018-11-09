## Index numbers and indexes

Index numbers are a statistician's way of expressing the difference between two measurements by designating one number as the "base", giving it the value 100 and then expressing the second number as a percentage of the first.

Example: If the population of a town increased from 20,000 in 1988 to 21,000 in 1991, the population in 1991 was 105% of the population in 1988. Therefore, on a 1988 = 100 base, the population index for the town was 105 in 1991.

An "index", as the term is generally used when referring to statistics, is a series of index numbers expressing a series of numbers as percentages of a single number.

Example: the numbers

50      75     90    110 

expressed as an index, with the first number as a base, would be 

100   150   180   220

https://www150.statcan.gc.ca/n1/pub/11-533-x/using-utiliser/4072258-eng.htm#indexes

This is (almost) how index is calculated:

```
def index
    (audience_datapoint_percentage / audience_base_datapoint_percentage) * 100
end
```
