- base64

  - Base64 is just a way to encode any data in ASCII using only printable characters common to most character sets. A-Z, a-z, and 0-9. No punctuation or whitespace to potentially mess with your parsing of the data. https://www.reddit.com/r/kubernetes/comments/b2zam7/comment/eiw0kpy/
  - The base64 is for storing binary data, not for encryption https://groups.google.com/forum/#!topic/kubernetes-users/SBizRN110Jc
  - "Man"

    M (77) -> 01001101

    a (97) -> 01100001

    n (110) -> 01101110

    So now you have your data in binary: 01001101 01100001 01101110

    Then to encode it in base 64, instead of looking at them in blocks of 8, we read blocks of 6: 010011 010110 000101 101110

    Then use the base-64 table (A-Za-z0-9+/) to convert it back.

    010011 (19) -> T

    010110 (22) -> W

    000101 (5) -> F

    101110 (46) -> u

    - https://www.reddit.com/r/explainlikeimfive/comments/j7vak/comment/c29womn/

  - "Ma"

    - | M               | A               |     |
      | --------------- | --------------- | --- | ----------- |
      | 0 1 0 0 1 1 0 1 | 0 1 1 0 0 0 0 1 | 0 0 | ~ ~ ~ ~ ~ ~ |
      | T               | W               | E   | =           |

    - If there are only two significant input octets (e.g., 'Ma'), or when the last input group contains only two octets, all 16 bits will be captured in the first three Base64 digits (18 bits); the two least significant bits of the last content-bearing 6-bit block will turn out to be zero, and discarded on decoding (along with the succeeding = padding character).

    An exception in which padding characters are required is when multiple Base64 encoded files have been concatenated.

    This encoding causes an overhead of 33–37% (33% by the encoding itself; up to 4% more by the inserted line breaks). https://en.m.wikipedia.org/wiki/Base64#Examples
