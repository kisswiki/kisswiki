```javascript
var no = "Z".charCodeAt() - "A".charCodeAt() + 1;
var encoded = "IUDPH VHHG WKHPH PHUFB";
for (let i = 1; i < no; i++) {
  const perm = encoded
    .split("")
    .map((c) =>
      c === " "
        ? c
        : String.fromCharCode(
            "A".charCodeAt() + ((c.charCodeAt() - "A".charCodeAt() + i) % no),
          ),
    )
    .join("");
  console.log(i, perm);
}
```

- https://www.dcode.fr/caesar-cipher
