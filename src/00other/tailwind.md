## pros

login-remember is providing the necessary spacing. Semantic CSS class naming puts an unnecessary burden on the developer to conflate the function of the code (a paragraph for remembering login) with what it should look like.

In a Tailwind world, we would have seen font-normal m-4. No need to "label" the group of styles as "remember" or "lawsuit" for that matter.

Oh and, of course, !important is indicative of some hidden cascade hell tech debt of sorts that would also not exist in Tailwind land.
Image

https://x.com/rauchg/status/1844167336947060789

Mixing of Concerns is a design methodology whereby "concerns" of various kinds are mixed into a single code unit.  This improves locality in that code unit by placing all relevant logic within it.  An example of this is hypermedia, which mixes control & presentation information.

https://x.com/htmx_org/status/1843830823113634132
