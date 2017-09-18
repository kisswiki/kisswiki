## onStyleLoad

- https://github.com/alex3165/react-mapbox-gl/issues/22
- onStyleLoad callback is now called before childrens components are rendered https://github.com/alex3165/react-mapbox-gl/blob/master/CHANGELOG.md
- To use the original Mapbox API use onStyleLoad property, the callback function will receive the map object as a first arguments, then you can add your own logic alongside react-mapbox-gl. https://github.com/alex3165/react-mapbox-gl/blob/master/docs/API.md

## center map with offset and padding

```jsx
    let boundsArray = BHUTAN_BOUNDS;
    let fitBoundsOptions = { offset: [sidebarWidth / 2, 0] }; // eslint-disable-line no-magic-numbers

    if (selectedTour) {
      let bounds = new mapboxgl.LngLatBounds();
      map.markers.visible.map(marker => bounds.extend(marker.coordinates));
      boundsArray = [bounds.getSouthWest().toArray(), bounds.getNorthEast().toArray()];
      fitBoundsOptions.padding = 150;
    }
    return (
      <div>
        <MapBox
          style={mapBoxConfig.style}
          // required here to load before MapBox rendering
          containerStyle={{ position: 'fixed', top: 0, left: 0, bottom: 0, right: 0 }}
          dragRotate={false}
          onClick={clearPoiMarkerSelection}
          fitBounds={boundsArray}
          fitBoundsOptions={fitBoundsOptions}
          ...
```
