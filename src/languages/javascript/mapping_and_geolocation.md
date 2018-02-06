## Point in polygon

- https://github.com/mapbox/leaflet-pip
- http://turfjs.org/docs/#within
- https://github.com/mattwilliamson/Google-Maps-Point-in-Polygon
- https://github.com/sromku/polygon-contains-point

> Ciężko będzie użyć wydajnie czegoś lepszego niż PostGIS.
1. Przygotuj obszar/obszary (np. jak chcesz rysować to dobry jest edytor od MapBox'a)
2. Wyeksportuj do GeoJSON'a
3. W PostGIS GeoJSON'a przekonwertuj na geometry (ST_GeomFromGeoJSON) i zapisz do kolumny tego typu
4. Metoda sprawdzająca czy geometry np. POINT(lat,lng) znajduje się w zadanym geometry - tutaj również PostGIS (ST_Within).
-- https://www.facebook.com/groups/217169631654737/permalink/1170208983017459/

- http://gis.stackexchange.com/questions/83387/whats-the-fastest-way-to-do-a-bounding-box-query-in-postgis
