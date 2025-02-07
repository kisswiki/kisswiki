## pros

login-remember is providing the necessary spacing. Semantic CSS class naming puts an unnecessary burden on the developer to conflate the function of the code (a paragraph for remembering login) with what it should look like.

In a Tailwind world, we would have seen font-normal m-4. No need to "label" the group of styles as "remember" or "lawsuit" for that matter.

Oh and, of course, !important is indicative of some hidden cascade hell tech debt of sorts that would also not exist in Tailwind land.
Image

<https://x.com/rauchg/status/1844167336947060789>

Mixing of Concerns is a design methodology whereby "concerns" of various kinds are mixed into a single code unit.  This improves locality in that code unit by placing all relevant logic within it.  An example of this is hypermedia, which mixes control & presentation information.

<https://x.com/htmx_org/status/1843830823113634132>

## using tailwindcss from cdn and directives like @apply

This will work only with style in the same file as html

```html
<style>
@import "tailwindcss";

@layer components {
  body {
    @apply bg-white text-lg max-w-xl mx-auto my-16;
  }
}
</style>

Otherwise you need to use cli:

```shell
npm i @tailwindcss/cli
npx @tailwindcss/cli -i ./src/styles.css -o ./src/output.css --watch
```

- <https://tailwindcss.com/docs/installation/tailwind-cli>
- <https://tailwindcss.com/docs/upgrade-guide>
- [Beginner tutorial for setting up tailwind v 4 using the standalone CLI (no node.js)](https://github.com/tailwindlabs/tailwindcss/discussions/15855)
