> HAR files don't actually contain packet details really - yes they contain the HTTP request/response info, but really as higher-level meta-data, not as the real sequence of UTF-8 characters that actually comprised the HTTP layer of the packets. (not to mention it won't have the TCP or IP info) It's not really possible to reconstruct the original HTTP messages from a HAR
> https://ask.wireshark.org/questions/43731/unable-to-open-or-import-http-archive-files-har-generated-by-chrome

- How to get a HAR capture https://toolbox.googleapps.com/apps/har_analyzer/?lang=en
