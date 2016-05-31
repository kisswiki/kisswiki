# Service Oriented Architecture

SOA is a new badge for some very old ideas:
- Divide your code into reusable modules.
- Encapsulate in a module any design decision that is likely to change.
- Design your modules in such a way that they can be combined in different useful ways (sometimes called a "family" or "product line").

These are all bedrock software-development principles, many of them first articulated by David Parnas.

What's new in SOA is
- You're doing it on a network.
- Modules are communicating by sending messages to each other over the network, rather than by more tradtional programming-language mechanisms like procedure calls. In particular, in a service-oriented architecture the parts generally don't share mutable state (global variables in a traditional program). Or if they do share state, that state is carefully locked up in a database which is itself an agent and which can easily manage multiple concurrent clients.

http://stackoverflow.com/questions/2026523/what-is-soa-in-plain-english/2030581#2030581
