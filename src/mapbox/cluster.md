- https://github.com/alex3165/react-mapbox-gl/blob/master/example/src/demos/htmlCluster.tsx
- https://github.com/mapbox/supercluster
- https://www.mapbox.com/mapbox.js/example/v1.0.0/filtering-marker-clusters/
- https://www.mapbox.com/mapbox-gl-js/example/cluster/

## old version works bad

Clustering in react-mapbox-gl 1.12.0 also clusters single markers. Upgraded to 2.5.0 and it works. But be aware that you also have to use it differently:

```diff
+    const Map = ReactMapboxGl({ accessToken: mapBoxConfig.accessToken });
 
     return (
       <div>
-        <ReactMapboxGl
+        <Map
```

## cluster marker width and height

Width and height for clusterMarker have to be provided as inline style:

```jsx
const clusterMarker = tourColor => (
  coordinates,
  pointCount,
  getLeaves,
) => (
  <Marker
    key={coordinates.toString()}
    coordinates={coordinates}
    style={{
      width: 40,
      height: 40,
      backgroundColor: tourColor }}
    className="cluster-marker"
  >
    <div>{pointCount}</div>
  </Marker>
  );
```
+    const Map = ReactMapboxGl({ accessToken: mapBoxConfig.accessToken });
 
     return (
       <div>
-        <ReactMapboxGl
+        <Map
