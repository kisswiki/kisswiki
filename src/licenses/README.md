- https://en.wikipedia.org/wiki/Comparison_of_free_and_open-source_software_licenses
- http://choosealicense.com/
  - http://choosealicense.com/licenses/
- https://tldrlegal.com/license/apache-license-2.0-(apache-2.0)
- https://tldrlegal.com/license/bsd-2-clause-license-(freebsd)
- https://tldrlegal.com/license/mozilla-public-license-2.0-(mpl-2)
- https://tldrlegal.com/license/academic-free-license-3.0-(afl)
- http://stackoverflow.com/questions/2982364/how-does-apache-2-0-license-differ-from-gpl
- https://www.amazon.com/Intellectual-Property-Open-Source-Protecting/dp/0596517963
- https://www.gnu.org/licenses/license-list.en.html
- http://opensource.stackexchange.com/questions/1255/how-is-selling-floss-packages-for-monetary-compensation-a-viable-strategy
- Analiza porównawcza modeli licencjonowania oprogramowania http://prawo.vagla.pl/node/8314

> Open-source licenses require different degrees of reciprocity from a licensee
> http://zgp.org/~dmarti/qanda/what-are-the-differences-between-open-source-licenses/

<br>

> Both BSD and Apache licenses are permissive. You can use code licensed under either license to create code licensed under a different one (or one of the above, or even both).
> https://www.quora.com/We-are-developing-a-tool-with-Apache-license-2-0-Can-I-use-this-dependency-with-BSD-license-http-mvnrepository-com-artifac

<br>

> polskie prawo pozwala na odwołanie dowolnej licencji (really?)
> http://prawo.vagla.pl/node/8314#comment-24579

## Copyrightable

> The applicability of CC licenses to data depends on whether data can be copyrighted. If data cannot be copyrighted, then there is no point to putting a CC license on them because those licenses waive rights that the data creators do not have.
>
> So what kinds of works are protected by copyright? Though laws vary across jurisdictions (and thus make this question difficult to answer), two important principles are the "Idea-Expression divide" and "the threshold of originality". In the former, only expressions of ideas can be copyrighted, while ideas themselves cannot be. In the latter, among expressions, only those that are original are protected (thus reproductions of works do not earn copyright protection de novo).
>
> Thus data only have copyright protection if they are an expression of an idea rather than idea itself and if they are not simply "facts" (i.e., they are something sufficiently original).
>
> - In the United States, this almost universally means that data cannot be copyrighted. A classic legal case here is Feist Publications, Inc., v. Rural Telephone Service Co., which ruled that telephone number listings in a phonebook are not protected by copyright. Importantly, nothing produced by the federal government has copyright protection (all federal government works are in the public domain, but this does not necessarily apply to other levels of government).
> - In Europe, however, databases do have copyright-like protection. Not all databases are protected; protection comes from "qualitatively and/or quantitatively a substantial investment in either the obtaining, verification or presentation of the contents". Such rights extend for 15 years.
> http://opensource.stackexchange.com/questions/1675/why-arent-creative-commons-licenses-appropriate-for-data

## copyleft vs permissive

> Copyleft licenses require the derivative works or modified versions of existing software to be released under the same license.
> The Apache License doesn’t have any such requirements. It’s a permissive license.
> It permits you to release the modified parts of the code under any license of your choice.
> However, you are required to release all the unmodified parts of the software under the same license (the Apache License).
> Additionally, every licensed file must contain any original copyright, patent, trademark, and attribution notices in its redistributed code. Each modified file must also contain a notice about all the changes made to the original file.
>
> The Apache License is also a permissive license. However, it has stringent terms when it comes to modifications. It requires you to explicitly list out all the modifications that you’ve done in the original software, i.e., you’re required to preserve modification notices. The Apache License also states clearly that you can’t name your product in any way that hints at the product being endorsed by Apache. So you can call your product “SuperWonderServer powered by Apache” but not “Apache SuperWonderServer”. The MIT license doesn’t impose any such terms.
The MIT license is also gaining popularity with developers due to its short and clear license agreement, in contrast to the Apache license agreement. Although the Apache License is nearly identical in terms of what you can and can't do, it is much more heavily "lawyered" and is significantly more verbose. Heck, the appendix alone, which explains how to apply the license, is longer than the entire MIT license.
>
> 7. What is the difference between Apache License 2.0 and BSD?
> The key differences between the two licenses are:
Explicit grant of patent rights: Apache License 2.0 explicitly lays down the grant of patent rights while using, modifying or distributing Apache licensed software; it also lists the circumstances when such grant gets withdrawn.
Clear definitions of the used concepts: Apache License 2.0 explicitly defines all the terms and concepts that it uses. This leaves little scope for ambiguity.
Reusable without rewording: Apache License 2.0 can be easily used by other projects without any rewording in the license document itself.
> http://www.whitesourcesoftware.com/whitesource-blog/top-10-apache-license-questions-answered/

## Apache

- https://softwareengineering.stackexchange.com/questions/307610/using-the-apache-license-2-0-by-reference-only/307627#307627
- http://www.apache.org/licenses/GPL-compatibility.html
- http://www.apache.org/legal/resolved.html#required-third-party-notices
- https://www.quora.com/Is-the-trademark-portion-of-Apache-2-0-license-unnecessary
- Overview http://oss-watch.ac.uk/resources/apache2
- http://www.whitesourcesoftware.com/whitesource-blog/top-10-apache-license-questions-answered/
- http://opensource.stackexchange.com/questions/1453/copyfree-open-innovation-license-compatibility
- http://computerlaw.pl/2014/02/licencja-apache-2-0-po-polsku-wersja-dla-programisty/

> MIT has a killer failing: it was developed prior to the onset of software patents, and so has no patent release. This dooms it to being appropriate for only trivial projects. It doesn't matter if you think there's nothing patentable in your code: others don't know that. If you want people to use your code in this day and age, a patent release is critically important.
Use Apache. Why be concerned about license length? Include the license once and then refer to it in your source copies. No big deal.
> https://news.ycombinator.com/item?id=3402450

<br>

> - Apache 2.0 - Like MIT/X11/BSD, but with patent protection
> - MPLv2 - Like GPL, but only protects itself. A second file that's combined "in-memory" is not required to be GPL. It's OK to combine in-memory with files of differing licenses.
>
> Upvote for Apache, because:
> - with MPL one would have to include the full original script in case of redistribution with modifications. Feels a bit awkward in case of a shell-script.
> - with Apache you can redistribute and reuse with modifications but must state  the changes, which seems more  appropriate for a community-project.
> https://github.com/srvrco/getssl/issues/24

## MPLv2

- weak copyleft https://julien.ponge.org/blog/mozilla-public-license-v2-a-good-middleground/
- https://www.mozilla.org/en-US/MPL/2.0/FAQ/
- https://en.wikipedia.org/wiki/Mozilla_Public_License

> By allowing proprietary modules in derived projects while requiring core files to remain open source, the MPL is designed to motivate both businesses and the open-source community to help develop core software.
> The one exception to covered source files remaining under the MPL occurs when code under version 2.0 or later is are combined with separate code files under the GNU GPL, GNU Lesser GPL (LGPL), or GNU Affero GPL (AGPL). In this case, the program as a whole will be under the chosen GNU license, but the MPL-covered files will be dual-licensed, so that recipients can choose to distribute them under that GNU License or the MPL. The initial author of MPL code may choose to opt out of this GPL-compatibility by adding a notice to their source files.
> https://en.wikipedia.org/wiki/Mozilla_Public_License

### Compatibility

- http://opensource.stackexchange.com/questions/4056/what-is-required-of-a-party-who-receives-a-larger-work-under-the-mozilla-public

> Q14: May I combine MPL-licensed code and (L)GPL-licensed code in the same executable program?
> Software can become “Incompatible With Secondary Licenses” in one of two ways: the original author marks it as such by adding the file header in Exhibit B, or the original author published the software under MPL 1.1 and did not dual- or tri-license the code with the (L)GPL.
> https://www.mozilla.org/en-US/MPL/2.0/FAQ/

<br>

> If the initial MPLv2.0 copyright holder explicitly states that the code is "Incompatible with Secondary Licenses", then they are opting out of the compatibility scheme, and the license is GPL-incompatible.
> https://fedoraproject.org/wiki/Licensing/MPLv2.0

<br>

> 1.5. “Incompatible With Secondary Licenses”
> means
> that the initial Contributor has attached the notice described in Exhibit B to the Covered Software; or
> that the Covered Software was made available under the terms of version 1.1 or earlier of the License, but not also under the terms of a Secondary License.
> https://www.mozilla.org/en-US/MPL/2.0/

## MIT

> It’s no secret many individuals and also companies use the MIT license, because it is one of the most permissive free software licenses. With MIT you can do whatever you like, you only need to make sure you’re following this one rule: add a copy of the original MIT license and copyright notice to it.
> https://www.quora.com/Whats-the-different-between-Apache-v2-0-and-MIT-license/answer/Sivan-Michaeli-Roimi

## Creative Commons

> you can take something that's CC, and something that's GPL, mix the two, and legally license the result as GPL
> https://www.reddit.com/r/linux/comments/3nz78a/cc_bysa_40_now_oneway_compatible_with_gplv3/
