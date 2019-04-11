- https://docs.mapbox.com/help/how-mapbox-works/static-maps/
- https://docs.mapbox.com/api/maps/#static
- https://docs.mapbox.com/help/interactive-tools/static-api-playground/

## With polygon overlay

```bash
$ accessToken="<token>"
$ curl "https://api.mapbox.com/v4/mapbox.satellite/geojson(%7B%0A%20%20%20%20%22type%22%3A%20%22Feature%22%2C%0A%20%20%20%20%22properties%22%3A%20%7B%7D%2C%0A%20%20%20%20%22geometry%22%3A%20%7B%0A%20%20%20%20%20%20%20%20%22type%22%3A%20%22Polygon%22%2C%0A%20%20%20%20%20%20%20%20%22coordinates%22%3A%20%5B%5B%5B-120.8492%2C%2039.4916%5D%2C%20%5B-120.8474%2C%2039.4896%5D%2C%20%5B-120.8510%2C%2039.4864%5D%2C%20%5B-120.8492%2C%2039.4916%5D%5D%5D%0A%20%20%20%20%7D%0A%7D)/-120.8492,39.4890,15/600x300@2x.png?access_token=$accessToken" -o file.jpg
```

- accessToken taken from https://account.mapbox.com/access-tokens/
- https://stackoverflow.com/questions/34700418/drawing-polygons-using-mapbox-static-api
- [Static API: Geojson Polygon overlay · Issue #283 · mapbox/mapbox-sdk-js](https://github.com/mapbox/mapbox-sdk-js/issues/283)
- https://stackoverflow.com/questions/34700418/drawing-polygons-using-mapbox-static-api

## Use transparent path and auto so we can use bounds

- https://api.mapbox.com/styles/v1/mapbox/light-v9/static/path(_p~iF~ps|U_ulLnnqC_mqNvxq%60@)/auto/400x400?access_token=$accessToken
- red with 0.5 opacity https://api.mapbox.com/styles/v1/mapbox/light-v9/static/path-1+e00-0.5(orq~Ftc}uOfeD_~D)/auto/400x400?access_token=$accessToken

- Polyline example ```_p~iF~ps|U_ulLnnqC_mqNvxq`@``` from https://developers.google.com/maps/documentation/utilities/polylinealgorithm
- generate polyline with interactive tool https://developers.google.com/maps/documentation/utilities/polylineutility
- https://stackoverflow.com/questions/49015956/creating-maps-with-multipolygons-not-working-using-mapbox-api-call/55624868#55624868

The problem is there is padding added when using `auto`.
