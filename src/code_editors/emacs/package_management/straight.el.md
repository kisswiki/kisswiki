##  how many packages do you have?

You can get that number by evaluating `(length (hash-table-keys straight--success-cache))`

https://github.com/raxod502/straight.el/issues/9#issuecomment-317011517

## use-package

```lisp
(use-package el-patch
  :straight t)
```

https://github.com/raxod502/straight.el#integration-with-use-package-1

This issue is now completely resolved since straight.el uses a different keyword (:straight) and does not modify :ensure in any way.

https://github.com/raxod502/straight.el/issues/135#issuecomment-354918386

## Bug reporting

- https://emacs.stackexchange.com/questions/17542/how-to-load-only-a-subset-of-installed-packages/34909#34909

