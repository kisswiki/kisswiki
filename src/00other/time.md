- ISO 8601 https://xkcd.com/1179/

RFC 3339 is listed as a profile of ISO 8601. Most notably RFC 3339 specifies a complete representation of date and time (only fractional seconds are optional). The RFC also has some small, subtle differences. For example truncated representations of years with only two digits are not allowed -- RFC 3339 requires 4-digit years, and the RFC only allows a period character to be used as the decimal point for fractional seconds. The RFC also allows the "T" to be replaced by a space (or other character), while the standard only allows it to be omitted (and only when there is agreement between all parties using the representation).

https://stackoverflow.com/questions/522251/whats-the-difference-between-iso-8601-and-rfc-3339-date-formats/522281#522281


Contrary to this rule, RFC 3339, which is otherwise a profile of ISO 8601, permits the use of "-00", with the same denotation as "+00" but a differing connotation.[29]

https://en.m.wikipedia.org/wiki/ISO_8601
