var handler = Gmaps.build('Google');
handler.buildMap({ internal: {id: 'multi_markers'}}, function(){
  var markers = handler.addMarkers([
    { lat: 43, lng: 3.5},
    { lat: 45, lng: 4},
    { lat: 47, lng: 3.5},
    { lat: 49, lng: 4},
    { lat: 51, lng: 3.5}
  ]);
  handler.bounds.extendWith(markers);
  handler.fitMapToBounds();
});