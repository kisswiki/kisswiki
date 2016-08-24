- https://www.reddit.com/r/golang/comments/3ty5uy/fast_http_package_for_go/
- https://www.reddit.com/r/golang/comments/3vf87b/fasthttp_vs_nginx_performance_comparison_for/
- https://www.quora.com/If-fasthttp-Go-can-make-199K-successful-database-queries-per-second-do-we-still-need-caching-for-an-application-based-on-Go
- https://husobee.github.io/golang/fasthttp/2016/06/23/golang-fasthttp.html

## Known net/http advantages comparing to fasthttp

- net/http supports HTTP/2.0 starting from go1.6
- net/http API is stable, while fasthttp API constantly evolves
- net/http handles more HTTP corner cases
- net/http should contain less bugs, since it is used and tested by much wider audience

https://github.com/valyala/fasthttp#faq
