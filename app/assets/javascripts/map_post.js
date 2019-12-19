var mapOptions = {
  zoom: 11,
  mapTypeId: google.maps.MapTypeId.ROADMAP,
  center: center,
  mapTypeControl: false,
  fullscreenControl: false,
  streetViewControl: false,
  zoomControl: true,
};

var map = new google.maps.Map(document.getElementById("map-camvas"), mapOptions);
var marker = new google.maps.Marker();
var geocoder = new google.maps.Geocoder();

  map.addListener('click', function (e) {
    getClickLatLng(e.latLng, map);
  });
function getClickLatLng(lat_lng, map) {
  document.getElementById('lat').value = lat_lng.lat();
  document.getElementById('lng').value = lat_lng.lng();

  console.log(marker)
  if (marker) {
    marker.setMap(null);
  }
  marker = new google.maps.Marker({
    position: lat_lng,
    map: map
  });

  map.panTo(lat_lng);
}

var getMap = (function () {
  function codeAddress(address) {

    geocoder.geocode({
      'address': address
    }, function (results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        map.setCenter(results[0].geometry.location);
        document.getElementById('lat').value = results[0].geometry.location.lat();
        document.getElementById('lng').value = results[0].geometry.location.lng();
        if (marker) {
          marker.setMap(null);
        }
        marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
        });
      } else {
        console.log('Geocode was not successful for the following reason: ' + status);
      }
    });
  }
  return {
    getAddress: function () {
      var button = document.getElementById("map_button");
      button.onclick = function () {
        var address = document.getElementById("address").value;
        codeAddress(address);
      }
      window.onload = function () {
        var address = document.getElementById("address").value;
        codeAddress(address);
      }
    }
  };
})();
getMap.getAddress();