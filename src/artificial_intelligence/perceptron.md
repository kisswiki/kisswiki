In machine learning, the perceptron is an algorithm for supervised learning of binary classifiers. A binary classifier is a function which can decide whether or not an input, represented by a vector of numbers, belongs to some specific class. It is a type of linear classifier, i.e. a classification algorithm that makes its predictions based on a linear predictor function combining a set of weights with the feature vector.

The perceptron algorithm was invented in 1958 at the Cornell Aeronautical Laboratory by Frank Rosenblatt

Although the perceptron initially seemed promising, it was quickly proved that perceptrons could not be trained to recognise many classes of patterns. This caused the field of neural network research to stagnate for many years, before it was recognised that a feedforward neural network with two or more layers (also called a multilayer perceptron) had far greater processing power than perceptrons with one layer (also called a single layer perceptron).

Single layer perceptrons are only capable of learning linearly separable patterns; in 1969 a famous book entitled Perceptrons by Marvin Minsky and Seymour Papert showed that it was impossible for these classes of network to learn an XOR function. It is often believed (incorrectly) that they also conjectured that a similar result would hold for a multi-layer perceptron network. However, this is not true, as both Minsky and Papert already knew that multi-layer perceptrons were capable of producing an XOR function. (See the page on Perceptrons (book) for more information.) Nevertheless, the often-miscited Minsky/Papert text caused a significant decline in interest and funding of neural network research. It took ten more years until neural network research experienced a resurgence in the 1980s. This text was reprinted in 1987 as "Perceptrons - Expanded Edition" where some errors in the original text are shown and corrected.

https://en.m.wikipedia.org/wiki/Perceptron

## Minsky and XOR

It is claimed that pessimistic predictions made by the authors were responsible for a change in the direction of research in AI, concentrating efforts on so-called "symbolic" systems, a line of research that petered out and contributed to the so-called AI winter of the 1980s, when AI's promise was not realized.

Although a single neuron can in fact compute only a small number of logical predicates, it was widely known that networks of such elements can compute any possible boolean function. This was known by Warren McCulloch and Walter Pitts, who even proposed how to create a Turing machine with their formal neurons, is mentioned in Rosenblatt's book, and is even mentioned in the book Perceptrons.

What the book does prove is that in three-layered feed-forward perceptrons (with a so-called "hidden" or "intermediary" layer), it is not possible to compute some predicates unless at least one of the neurons in the first layer of neurons (the "intermediary" layer) is connected with a non-null weight to each and every input. This was contrary to a hope held by some researchers in relying mostly on networks with a few layers of "local" neurons, each one connected only to a small number of inputs. A feed-forward machine with "local" neurons is much easier to build and use than a larger, fully connected neural network, so researchers at the time concentrated on these instead of on more complicated models.

With the revival of connectionism in the late 80s, PDP researcher David Rumelhart and his colleagues returned to Perceptrons. In a 1986 report, they claimed to have overcome the problems presented by Minsky and Papert, and that "their pessimism about learning in multilayer machines was misplaced".

[Perceptrons](https://en.m.wikipedia.org/wiki/Perceptrons_(book))

## XOR - exclusive OR

```
0 + 0 = 0 0
0 + 1 = 0 1
1 + 0 = 0 1
1 + 1 = 1 0
```

The ones place of a single-bit addition is equivalent to the exclusive OR operation, not the OR operation. Hence XOR is used instead. Note that this is not the only way to build a half adder, you can do it without using an XOR gate, but it requires more gates.

For example, here is a half adder built with only AND, OR, and NOT gates:

![](https://i.stack.imgur.com/Crn41.gif)

https://electronics.stackexchange.com/questions/166633/why-is-a-half-adder-implemented-with-xor-gates-instead-of-or-gates/166634#166634

The XOR logic gate can be used as a one-bit adder that adds any two bits together to output one bit. For example, if we add 1 plus 1 in binary, we expect a two-bit answer, 10 (i.e. 2 in decimal). Since the trailing sum bit in this output is achieved with XOR, the preceding carry bit is calculated with an AND gate. This is the main principle in Half Adders. A slightly larger Full Adder circuit may be chained together in order to add longer binary numbers.

https://en.m.wikipedia.org/wiki/XOR_gate


![](https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Halfadder.gif/220px-Halfadder.gif)

[half-adder](https://en.m.wikipedia.org/wiki/Adder_(electronics)#Half_adder)


XOR has the worst-case Karnaugh map—if implemented from simple gates, it requires more transistors than any other function. The designers of the Z80 and many other chips saved a few transistors by implementing the XOR using pass-transistor logic rather than simple gates.

https://en.m.wikipedia.org/wiki/Pass_transistor_logic
