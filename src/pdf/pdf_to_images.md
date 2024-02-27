```shell
brew install poppler

export PATH="$(brew --prefix poppler)/bin/:$PATH"

mkdir output

pdfimage path/to/pdf.pdf output/
```

- https://stackoverflow.com/questions/430707/how-can-i-extract-images-from-a-pdf-file/431075#431075
- https://www.cyberciti.biz/faq/easily-extract-images-from-pdf-file/
