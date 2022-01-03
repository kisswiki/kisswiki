## content-addressed store paths

> For completeness, another option currently investigated by the Nix developers is that of “content-addressed derivations”. While currently store file names contain a hash of the inputs used to produce them, the idea of content-addressed derivations is to make it a content hash; that way, **if an input change has no effect on the build result, the output is the same and nothing needs to be re-downloaded** (this is what Eelco Dolstra described as the intensional model in Chapter 6 of his seminal PhD thesis). This option is appealing, also for other reasons, but it’s a fundamental change with what looks like a high implementation complexity and transition cost. We have yet to gauge the pros and cons of following this approach.

https://guix.gnu.org/en/blog/2021/getting-bytes-to-disk-more-quickly/

> In the content addressable nix store, we no longer take the hash from the derivation file but instead take the hash for the path name using the actual content produced upon evaluating the derivation file
>
> In the talk he also cites an example of making a whitespace change to glibc which with content addressable storage would have the same output hash and thus not be duplicated, and that makes sense to me at least.

https://www.reddit.com/r/NixOS/comments/9rriwn/comment/e8kso5o/?utm_source=reddit&utm_medium=web2x&context=3
