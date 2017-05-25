- http://danluu.com/monorepo/
  - https://news.ycombinator.com/item?id=9563544
- https://buckbuild.com/about/overview.html
- https://www.reddit.com/r/programming/comments/41od1s/dangers_of_monorepo_projects/
- https://github.com/babel/babel/blob/master/doc/design/monorepo.md
- Lerna is a tool that optimizes the workflow around managing multi-package repositories with git and npm https://github.com/lerna/lerna

## Microsoft

We looked very hard at decomposing it and we found that our workflow just was not amenable to that. You might checkout the discussion on Hacker News and elsewhere and find that other large engineering companies like Google and Facebook reached similar conclusion about their core platforms and have adopted solutions with the same general aim as ours.

https://blogs.msdn.microsoft.com/bharry/2017/05/24/the-largest-git-repo-on-the-planet/

## Google

Google has the largest single repository. Check your facts:

Google’s monolithic software repository, which is used by 95% of its software developers worldwide, meets the definition of an ultra-large-scale system, providing evidence the single-source repository model can be scaled successfully.

The Google codebase includes approximately one billion files and has a history of approximately 35 million commits spanning Google’s entire 18-year existence. The repository contains 86TB of data, including approximately two billion lines of code in nine million unique source files.

https://cacm.acm.org/magazines/2016/7/204032-why-google-stores-billions-of-lines-of-code-in-a-single-repository/fulltext

https://blogs.msdn.microsoft.com/bharry/2017/05/24/the-largest-git-repo-on-the-planet/
