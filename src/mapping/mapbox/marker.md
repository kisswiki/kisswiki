- https://www.mapbox.com/mapbox-gl-js/example/custom-marker-icons/
- https://stackoverflow.com/questions/44208200/how-to-add-a-marker-to-a-mapbox-gl-js-map
- https://www.mapbox.com/mapbox-gl-js/api/#marker
- https://github.com/mapbox/mapbox-gl-js/blob/master/src/ui/marker.js

## errors

### TypeError marker Cannot read property 'add' of undefined

I was adding marker like `new map.Marker('idofcontainer')`, but it should done with `document.createElement`.
