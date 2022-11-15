- [Yonatan Kra - CI/CD with GitHub actions - YouTube](https://www.youtube.com/watch?v=-rLE4LDZjKc)

## secret

This should work --> Also one should add a newline after the key:

```
-----BEGIN RSA PRIVATE KEY-----
<< the key itself goes here >>
-----END RSA PRIVATE KEY-----

```

Ensure the new line after the closing is present.

https://github.com/JamesIves/github-pages-deploy-action/discussions/614#discussioncomment-3382881
