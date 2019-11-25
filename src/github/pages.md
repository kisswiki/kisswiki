## Quickstart

1. in admin page of example.com add for entries with IPs with A record. I.e. go to https://porkbun.com/account/domains > your domain > Details > DNS RECORDS > Edit
  - Type A
  - Answer: 185.199.108.153
  - Add
2. Do this for all 4 github IPs.
3. In https://github.com/name/repo/settings > Custom domain > example.com
4. check with

```bash
$ dig EXAMPLE.COM +noall +answer
> EXAMPLE.COM     3600    IN A     185.199.108.153
> EXAMPLE.COM     3600    IN A     185.199.109.153
> EXAMPLE.COM     3600    IN A     185.199.110.153
> EXAMPLE.COM     3600    IN A     185.199.111.153
```

- https://help.github.com/en/github/working-with-github-pages/managing-a-custom-domain-for-your-github-pages-site#configuring-a-subdomain
- https://stackoverflow.com/questions/9082499/custom-domain-for-github-project-pages
- Use this fror deploy https://github.com/rofrol/closeyoureyesnow/blob/master/build_and_deploy.sh

## Links

- https://stackoverflow.com/questions/39048654/how-to-enable-directory-indexing-on-github-pages
- https://gon.to/2015/03/03/f-percent-number-ck-github-pages-for-jekyll-why-i-decided-to-use-digital-ocean/
- http://jekyllbootstrap.com/
- You no longer need a gh-pages branch. GitHub now allows pages to be published from the master  branch, or from a docs folder in master.
  - http://stackoverflow.com/questions/35978862/github-pages-why-do-i-need-a-gh-pages/39024307#39024307
  - https://help.github.com/articles/user-organization-and-project-pages/
- Theme https://github.com/orderedlist/minimal
