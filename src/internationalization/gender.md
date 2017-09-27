Proper localization is incredibly difficult. E.g. many languages feature complicated rules for declension that might change the root of the word, or depends on the grammatical gender of that word in the target language. My primary language is German, where articles are gendered. So a template "I'm holding a %s" would need to have three different German forms:

"Ich halte eine %s" for feminine words such as Blume (flower).
"Ich halte einen %s" for masculine words such as Schlüssel (key).
"Ich halte ein %s" for neutral words such as Band (ribbon).
In fact, the English indefinite article a/an depends on the starting sound of the following word, so even this case is difficult to represent in a localization system without a complicated rule engine. Even within the indo-germanic group of languages (which share common grammatical features), there are unique cases that make it impossible to have a simple substitution-based translation tool.

So, can we have an ideal translation tool? Yes, by using a proper programming language rather than a substitution-based system. In such an architecture, we would associate each message key with a callback that is responsible for returning a properly localized string with equivalent meaning, depending on the context information passed into that callback. Unfortunately, this requires the translators to be programmers, and the language to have decent support for callbacks. Switching the language is not as simple as reading from a different translation file, instead it probably requires us to dynamically link to another library.

All of this complication is a good argument for not using perfect solutions, and rather doing something that works sufficiently well in most cases, especially when this translation engine has to work within the restrictions of C. If gettext were parameterized and included a complex template engine – it would still struggle to properly portray the whole wealth of human languages.

Names are a whole chapter of their own on difficulties of localization – partially because quite a lot cultures place the “family name” before the “given name”, but mostly because many people don't have exactly two names that fit exactly these two roles. 40 Falsehoods Programmers Believe About Names is an entertaining read on this topic. In the context of software systems, it would be best to stop distinguishing first and family names except as needed for legal reasons, and rather use a display name that contains the full name in any order or formatting that person prefers. Note that the correct name order depends on the person carrying that name, not on the context in which that name is being displayed in.

https://softwareengineering.stackexchange.com/questions/284842/why-isnt-gettext-parameterized
