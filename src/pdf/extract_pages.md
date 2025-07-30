`qpdf --empty --pages infile.pdf 1-5 -- outfile.pdf`

<https://askubuntu.com/questions/221962/how-can-i-extract-a-page-range-a-part-of-a-pdf/672001#672001>

## Old

Although pdftk is certainly a tool that can do the job, I would recommend against it. This is not free software, but an clunky piece of shareware. Also it needs the JVM. A more reasonable tool is qpdf <https://askubuntu.com/questions/221962/how-can-i-extract-a-page-range-a-part-of-a-pdf#comment1798509_282455>

`pdftk full-pdf.pdf cat 12-15 output outfile_p12-15.pdf`

<http://askubuntu.com/questions/221962/how-can-i-extract-a-page-range-a-part-of-a-pdf/282455#282455>
