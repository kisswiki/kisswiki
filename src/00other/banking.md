## Database consistency

Myth: Money is important, so banks must use transactions to keep money safe and consistent, right?

Reality: Banking transactions are inconsistent, particularly for ATMs. ATMs are designed to have a normal case behaviour and a partition mode behaviour. In partition mode Availability is chosen over Consistency.

They’ve never had consistency because historically they’ve never had perfect communication. Instead, the financial industry depends on auditing. What accounts for the consistency of bank data is not the consistency of its databases but the fact that everything is written down twice and sorted out later using a permanent and unalterable record that is reconciled later. The idea of financial compensation for errors is an idea built deeply into the financial system.

http://highscalability.com/blog/2013/5/1/myth-eric-brewer-on-why-banks-are-base-not-acid-availability.html

You must distinguish technical correctness criteria from real-world systems requirements.

Certainly banks must be able to account for every withdrawal and deposit, and more generally for every in and out on their balance sheets. That's what regulators are for. But no regulator will ever hold a bank to prove that the accounts were completely "consistent" at any given point in time, particularly if it's long in the past. That's why banks can get away with deducting sums from your account while not crediting the recipient until days later, as long as they keep track of where everything has to go eventually.

In their own trades, modern banks are capable of millisecond-accurate accounting, so obviously this is not a technical limitation. The simple truth is that there is an incentive for the bank to execute deductions as early as possible, and credits as late as possible, because that earns them more fees that doing the opposite, and as long as there is no legislation which forbids this, they have no reason to improve. So 'eventual consistency' in banking is not a technical compromise for lack of a better alternative, as with huge NoSQL data stores - it is plain and simple good business for the money handlers.

http://programmers.stackexchange.com/questions/236743/eventual-consistency-in-banking-systems
