- `<!>` or `<br>` http://stackoverflow.com/questions/3358056/multiple-blockquotes-in-a-row-using-markdown-syntax
- editor https://github.com/brrd/Abricotine

## multline blockquote

```
> Lorem[space][space]
ipsum[space][space]
dolor sit amet
```

use two spaces and add a CR, and not just a carriage return(CR) at the eol to get the Block effect word wrapping with a <br />. GFM always inserts a <br /> when two spaces are left at the end of the line even with a normal paragraph

https://stackoverflow.com/questions/48643629/how-can-i-wrap-a-multi-line-quote-in-gfm#comment95770697_48643701

or

```html
<blockquote>This is one paragraph. This is another paragraph.</blockquote>
```

If you're using kramdown, you can use break `<br>` or multiple `<br><br>` break tag
