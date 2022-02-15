> osoba handlująca cyfrową walutą musi zapłacić podatek według skali, czyli według stawek 18 i 32 proc. Po zakończeniu roku składa zeznanie PIT-36 – mówi Grzegorz Grochowina, menedżer w KPMG w Polsce.
>
> -- http://www.rp.pl/Podatek-dochodowy/311239969-Bitcoin-jaki-podatek-trzeba-placic-od-wirtualnej-waluty.html

<br>

> The blockchain is a big spreadsheet in the cloud that anyone can use to keep track of who owns what. Bitcoins are simply an instrument for which you can record a transaction.
>
> For money to be effective it needs to be counterfeit-proof and it should be fungible. In the age of the internet, it should be secure, and you should be able to transact with it instantly.
>
> Bitcoin — which is the most popular digital money — has all of these properties and more. In fact, by using the blockchain as its core technology, Bitcoin has fundamentally altered our relationship to value.
>
> -- https://toa.life/forget-self-driving-cars-make-way-for-self-paying-cars-d41858734cf

- analyzing cryptocurrencies with postgresql https://news.ycombinator.com/item?id=14655382

## Cons

Comprehensive synthesis of the technological, ecological and political critique of blockchainism (permalink)
I've just read one of the most lucid, wide-ranging, cross-disciplinary critiques of cryptocurrency and blockchain I've yet to encounter. It comes from David "DSHR" Rosenthal, a distinguished technologist whose past achievements including helping to develop X11 and the core technologies for Nvidia.

https://blog.dshr.org/2022/02/ee380-talk.html

Rosenthal's critique is a transcript of a lecture he gave to Stanford's EE380 class, adapted from a December 2021 talk for an investor conference. It is a bang-up-to-date synthesis of many of the critical writings on the subject, glued together with Rosenthal's own deep technical expertise. He calls it "Can We Mitigate Cryptocurrencies' Externalities?"

The presence of "externalities" in Rosenthal's title is key. Rosenthal identifies blockchainism's core ideology as emerging from "the libertarian culture of Silicon Valley and the cypherpunks," and states that "libertarianism's attraction is based on ignoring externalities."

This is an important critique of libertarianism. The idea that "liberty" is the freedom to do as you like, provided it doesn't harm others is simple enough on its face, but the reality is very few of our actions are free from the potential to harm others. The freedom to drive, or operate a firearm, or to determine your own vaccination preferences all have impacts on others. We can (and should) argue about what consideration you owe to your neighbors and what tolerance they owe to you, but all too often, that argument is settled by ignoring it.

Think of the people who talk about masking as a "personal choice." Human beings have an undeniably entwined epidemiological destiny. There are few epidemiological choices that are purely personal – they redound to the people around you.

The existence of a shared destiny and the necessity of a society to manage it runs smack into the idea that messy personal conflicts are best resolved by carving out individual zones of autonomy. All too often, the libertarian definition of "liberty" is cover for "I don't want to pay taxes to support a society." This is a pretty unpopular position, so libertarians form alliances with naked authoritarians, such as elements of the Christian right:

https://pluralistic.net/2021/09/29/jubilance/#tolerable-racism

That's how you end up with archlibertarians arguing that the world would be "freer" if women weren't allowed to vote:

https://www.gawker.com/5231390/facebook-backer-wishes-women-couldnt-vote

Or that democracy itself is incompatible with liberty, since it lets workers vote to limit the activities of their bosses:

https://www.cato-unbound.org/2009/04/13/peter-thiel/education-libertarian/

The maintenance of libertarian ideology may not require that you ignore externalities, but it sure helps. When advocates for "liberty" champion the likes of Augusto Pinochet, who tortured and slaughtered his political enemies by the thousands, they are discounting the lethal externalities of Pinochet's economic "freedoms" to zero.

Rosenthal's critique of contemporary blockchainism starts with this idea of discounted externalities – the foundational contradiction that one's "liberty" exists in a state of pristine isolation, and doesn't harm anyone else.

To get to this, he looks at the history of blockchains. He divides blockchain technology into an older, "permissioned" blockchain technology, invented in 1990, and "permissionless" blockchains, which were invented around 2008 with the first Bitcoin white-paper.

A permissioned blockchain require on a central authority that dictates who can write to the chain. Within that stricture, it produces a highly computationally efficient public ledger that can identify malfunctioning or corrupt nodes in the network and route around them.

Permissionless blockchains, like the Bitcoin blockchain, are born decentralized. No one authority gets to decide who can participate in the ledger's creation – at first. This decentralization comes at a high price, though. Blockchains are vulnerable to "Sybil attacks" where one attacker impersonates a horde of unconnected actors and takes over the system. To defend against this, permissionless blockchains make Sybil attacks expensive, so that the most you can steal in a Sybil attack is less than it would cost to pull it off. The inescapable corollary of this is that using the network has to be expensive – the system has to have a giant electricity bill and hence a massive carbon footprint.

This expense, in turn, compensates miners for the money they pour into defeating Sybil attacks. These miners get paid in cryptocurrency, and for cryptocurrency to have value, it has to have someone who's willing to buy cryptos with "fiat" – dollars or other easily spent money. The only reason for someone to trade fiat for those cryptos (apart from making ransomware payments) is as an "investment" – that is, because you think the cryptocurrency's price will rise. Thus these blockchains require speculation to function.

All of this means that the majority of blockchain activity is just about maintaining the blockchain – not about buying or selling things. There are only about 27,000 "economically meaningful" Bitcoin transactions in a day – and 75% of those are inter-exchange transactions. All told, only 2.5% of Bitcoin transactions represent someone buying something from someone (fewer than five per minute, globally).

This profound wastefulness is a feature, not a bug. It's the expense that keeps Sybil attacks at bay, without centralizing authority over the blockchain, as would be the case with the otherwise vastly more efficient permissioned blockchains that have been around for 30 years.

But here's where Rosenthal unveils the other half of his critique: the drive to maximize the efficiency of mining drives miners to consolidate, in order to attain economies of scale. The more valuable a blockchain is, the more centralized it becomes.

Today, 10% of miners control 90% of the mining. The top 0.1% of miners control 50% of mining. Five mining pools control the majority of Bitcoin mining. Last November, only two mining pools controlled the majority of Ethereum mining. This is the worst of all worlds: a highly volatile blockchain that is incredibly wasteful and centralized, with control in the hands of largely anonymous parties who are accountable to no one, who can cheat with impunity.

https://www.nber.org/papers/w29396

So far, the focus of Rosenthal's externality critique has been energy consumption and climate harms. But here he comes to his second externality: e-waste. To maintain their position in the highly concentrated mining sectors, miners have to run their equipment hard and discard it quickly as it burns out. The average service life of an ASIC used in blockchain mining is a mere 16 months – whereupon it turned into ewaste, retiring its embodied materials and energy. Other blockchain verification systems, like proof of space-and-time, do the same thing to mass storage devices.

Now, it's true that the finance and tech sectors produce a lot of ewaste on their own. But that's because their equipment wears out despite their best efforts to preserve it. The foundational premise of cryptocurrency mining is that you are in a race with other miners to discard and replace your equipment as rapidly as possible, to eke out every speed advantage.

The blockchainst response to this is to ignore the ewaste problem and hand-wave the emissions issue by claiming that they're fixing it with offsets. Offsets, meanwhile, are a market for lemons. Most carbon offsets are fairy tales:

https://asia.nikkei.com/Spotlight/Environment/Climate-Change/Opaque-carbon-credit-market-undermines-fight-against-climate-change

And, as Rosenthal points out, even if your cryptos are being mined with renewables, that is only carbon neutral if you assume "that doing so doesn't compete with more socially valuable uses for renewables, or indeed for power in general."

Blockchainists are aware of the problems with proof of work, and many are calling for a transition to proof of stake, a notionally less climate-intensive way of running a permissionless blockchain.

Rosenthal's critique of proof of stake begins by observing that it drives even more centralization than proof of work. A proof of stake network allows the people who have the most to tax the transactions of those with less, cementing their dominance and increasing centralization.

So both permissioned and permissionless blockchains end up centralized, but permissionless blockchains – the type beloved of blockchainists – are centralized into unaccountable and often anonymous hands. So while a permissioned blockchain that is run by a benevolent (or at least accountable) authority can reverse frauds, permissionless blockchains struggle to do this.

This immutability is part of the reason that blockchains and fraud go together like peanut butter and chocolate. Thefts on working permissionless blockchains can't be readily reversed, making them permanent. Meanwhile, the entities who end up at the top of the centralization pile in these networks can commit thefts by rewriting the "immutable" ledgers.

It's not a purely hypothetical problem. The Steem proof of stake network was compromised by Justin Sun in 2021, who took advantage of the highly centralized staking sector to hijack the Steem blockchain.

The immutability problem is worse in programmable cryptos like Ethereum. The "smart contracts" that operate on these chains are effectively bug bounties whose maximum payout is everything in the wallets connected to them. The attack surface of programmable money which is connected to social media, Discord servers, standalone wallets, etc, is virtually unbounded.

This is another important point raised by Rosenthal: not only are permissionless blockchains highly concentrated, they're also ineluctably bound up with Web 2.0 technologies. The fact that Binance conducts two thirds of crypto derivative transactions and half of all spot technologies using browsers and other 2.0 stuff multiplies all the blockchain vulns by all the non-blockchain vulns.

Here Rosenthal cites Adam Levitin's recent, excellent analysis of the legal status of crypto exchange users in bankruptcy proceedings (tldr: if your exchange goes bust, you'll probably get nothing or nearly nothing):

https://pluralistic.net/2022/02/03/liquidation-preference/#we-live-in-a-society

Rosenthal's boils this all down to four points:

I. Permissioned blockchains can stop Sybil attacks without cryptocurrency and have no significant externalities;

II. Permissionless blockchains require a cryptocurrency to stop Sybil attacks, and this produce major externalities;

III. To be successful, permissionless blockchains require proof-of-work or some other deliberately wasteful system, making externalities inevitable;

IV. Likewise inevitable is that any security system based on wasting resources will create the centralization that permissionless blockchains claim to eliminate.

Rosenthal concludes his talk by affirming that he values decentralization and it is that value that causes him to reject blockchainism. He reminds us that the billions pouring into the Web3 bubble are bets on attaining scale and dominance – the only reason to pump billions into a blockchain technology is if you think that you can corner a market and make it back. In other words, Web3 investors see high barriers to entry as a feature, not a bug, and they're committed to centralization.

- https://pluralistic.net/2022/02/14/externalities/
- https://twitter.com/doctorow/status/1493288001107021826
