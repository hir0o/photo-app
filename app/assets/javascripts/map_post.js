var mapOptions = {
  zoom: 11,
  mapTypeId: google.maps.MapTypeId.ROADMAP,
  center: center,
  mapTypeControl: false,
  fullscreenControl: false, //全画面表示コントロール
  streetViewControl: false, //ストリートビュー コントロール
  zoomControl: true, //ズーム コントロール
};

var map = new google.maps.Map(document.getElementById("map-camvas"), mapOptions);

var marker = new google.maps.Marker({ // マーカーの追加
  position: center, // マーカーを立てる位置を指定
  map: map // マーカーを立てる地図を指定
});

var geocoder = new google.maps.Geocoder();
// マップをクリックで位置変更
  map.addListener('click', function (e) {
    getClickLatLng(e.latLng, map);
  });
function getClickLatLng(lat_lng, map) {
  //表示している地図上の緯度経度
  document.getElementById('lat').value = lat_lng.lat();
  document.getElementById('lng').value = lat_lng.lng();
  // マーカーを設置
  console.log(marker)
  if (marker) {
    marker.setMap(null);
  }
  marker = new google.maps.Marker({
    position: lat_lng,
    map: map
  });
  // 座標の中心をずらす
  map.panTo(lat_lng);
}

var getMap = (function () {
  function codeAddress(address) {
    // geocoder.geocode()メソッドを実行 
    geocoder.geocode({
      'address': address
    }, function (results, status) {
      // ジオコーディングが成功した場合
      if (status == google.maps.GeocoderStatus.OK) {
        // 変換した緯度・経度情報を地図の中心に表示
        map.setCenter(results[0].geometry.location);
        //☆表示している地図上の緯度経度
        document.getElementById('lat').value = results[0].geometry.location.lat();
        document.getElementById('lng').value = results[0].geometry.location.lng();
        // マーカー設定
        if (marker) {
          marker.setMap(null);
        }
        marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
        });
        // ジオコーディングが成功しなかった場合
      } else {
        console.log('Geocode was not successful for the following reason: ' + status);
      }
    });
  }
  //inputのvalueで検索して地図を表示
  return {
    getAddress: function () {
      // ボタンに指定したid要素を取得
      var button = document.getElementById("map_button");
      // ボタンが押された時の処理
      button.onclick = function () {
        // フォームに入力された住所情報を取得
        var address = document.getElementById("address").value;
        // 取得した住所を引数に指定してcodeAddress()関数を実行
        codeAddress(address);
      }
      //読み込まれたときに地図を表示
      window.onload = function () {
        // フォームに入力された住所情報を取得
        var address = document.getElementById("address").value;
        // 取得した住所を引数に指定してcodeAddress()関数を実行
        codeAddress(address);
      }
    }
  };
})();
getMap.getAddress();