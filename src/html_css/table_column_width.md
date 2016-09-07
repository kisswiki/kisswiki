```css
table {
  table-layout: fixed;
}

th:nth-child(1), th:nth-child(2)  {
  width: 25%;
}
```

> fixed
Table and column widths are set by the widths of table and col elements or by the width of the first row of cells. Cells in subsequent rows do not affect column widths.
>
> Under the "fixed" layout method, the entire table can be rendered once the first table row has been downloaded and analyzed. This can speed up rendering time over the "automatic" layout method, but subsequent cell content may not fit in the column widths provided. Any cell that has content that overflows uses the overflow property to determine whether to clip the overflow content.
> https://developer.mozilla.org/pl/docs/Web/CSS/table-layout

<br>

> height for td works like min-height
> http://stackoverflow.com/questions/19432092/can-i-use-a-min-height-for-table-tr-or-td/25329017#25329017

- https://css-tricks.com/fixing-tables-long-strings/
- http://stackoverflow.com/questions/4636269/prevent-text-from-overlap-table-td-width
- http://stackoverflow.com/questions/8465385/how-can-i-set-the-max-width-of-a-table-cell-using-percentages
- http://stackoverflow.com/questions/7410784/how-can-i-limit-table-column-width
- http://stackoverflow.com/questions/4581005/how-can-i-style-table-to-be-full-width-of-container-and-make-the-cells-use-perce
- http://stackoverflow.com/questions/4457506/set-the-table-column-width-constant-regardless-of-the-amount-of-text-in-its-cell
