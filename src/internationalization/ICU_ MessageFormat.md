- http://userguide.icu-project.org/formatparse/messages


## transifex

While Transifex does not natively support the ICU MessageFormat, the most important and frequently-used features of ICU can be supported, such as plurals, context and developer comments. Depending on the file format you use, you can access some or all of these features.

So why aren't we natively supporting ICU and suggest workarounds? Here are some of our thoughts on this.

ICU really affects a very small percentage of users and phrases. Very, very few of our users' phrases are pluralized (eg. you rarely see plurals in marketing and user-generated content). From those few users, very few have the need to also support male and female versions. And out of those, less than half are actually are willing to put the effort to support it in their code.

ICU is also a quite complex framework. The phrase itself is no longer plain English, but has variables and logic in it. That's a fundamental difference, it's like replacing your house's bricks with a brick that can grow in size with a button. The change affects every single piece of a localization system like Transifex. Some examples are the Translation Memory (serializing entries when updating a TM of billions of entries is no joke!), the wordcount across the platform, etc.

Finally, as outlined on this page, you can support the most important ICU features with Transifex already, such as plurals.

Properly supporting ICU would mean an overhaul of many core components in Transifex. This, in combination with the above, makes us want to push this in the future, until more customers ask for it.

https://docs.transifex.com/projects/plurals-and-genders
