## content-addressed store paths

if an input change has no effect on the build result, the output is the same and nothing needs to be re-downloaded

> For completeness, another option currently investigated by the Nix developers is that of “content-addressed derivations”. While currently store file names contain a hash of the inputs used to produce them, the idea of content-addressed derivations is to make it a content hash; that way, if an input change has no effect on the build result, the output is the same and nothing needs to be re-downloaded (this is what Eelco Dolstra described as the intensional model in Chapter 6 of his seminal PhD thesis). This option is appealing, also for other reasons, but it’s a fundamental change with what looks like a high implementation complexity and transition cost. We have yet to gauge the pros and cons of following this approach.

https://guix.gnu.org/en/blog/2021/getting-bytes-to-disk-more-quickly/
