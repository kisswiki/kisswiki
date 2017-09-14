## onStyleLoad

- https://github.com/alex3165/react-mapbox-gl/issues/22
- onStyleLoad callback is now called before childrens components are rendered https://github.com/alex3165/react-mapbox-gl/blob/master/CHANGELOG.md
- To use the original Mapbox API use onStyleLoad property, the callback function will receive the map object as a first arguments, then you can add your own logic alongside react-mapbox-gl. https://github.com/alex3165/react-mapbox-gl/blob/master/docs/API.md
