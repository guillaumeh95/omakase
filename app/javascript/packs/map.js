import GMaps from 'gmaps/gmaps.js';

function mapDisplay(){
  const mapElement = document.getElementById('map');
  // if (mapElement) { // don't try to build a map if there's no div#map to inject in
    const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
    const markers = JSON.parse(mapElement.dataset.markers);
    map.addMarkers(markers);

    if (markers.length === 0) {
      map.setZoom(2);
    } else if (markers.length === 1) {
      let center = map.setCenter(markers[0].lat, markers[0].lng);
      map.setZoom(14);
      let mapTypeId = map.MapTypeId.ROADMAP;
      let directionsDisplay = map.DirectionsRenderer();
      let directionsService = map.DirectionsService();
      let geocoder = map.Geocoder();

      directionsDisplay.setMap(map);

      calculateAndDisplayRoute(directionsService, directionsDisplay);
      document.getElementById('mode').addEventListener('change', function() {
      calculateAndDisplayRoute(directionsService, directionsDisplay);
      });

    } else {
      map.fitLatLngBounds(markers);
    }

//////
  function calculateAndDisplayRoute(directionsService, directionsDisplay) {

    let depart = markers[0];
    let arrivee = markers[1];
  /*test si les variables sont bien initialisés*/
  if (depart && arrivee)
  {
  /*mode de transport*/
    const choixMode = document.getElementById('mode').value;
    const request = {
        origin: depart,
        destination:arrivee,
        travelMode: map.DirectionsTravelMode[choixMode]
    };
  /*appel à l'API pour tracer l'itinéraire*/
    directionsService.route(request, function(response, status) {
    directionsDisplay.setDirections(response);
    });
  }

}


//     const styles = [
//     {
//         "featureType": "all",
//         "elementType": "labels",
//         "stylers": [
//             {
//                 "visibility": "off"
//             }
//         ]
//     },
//     {
//         "featureType": "all",
//         "elementType": "labels.text",
//         "stylers": [
//             {
//                 "visibility": "on"
//             }
//         ]
//     },
//     {
//         "featureType": "all",
//         "elementType": "labels.text.fill",
//         "stylers": [
//             {
//                 "color": "#000000"
//             }
//         ]
//     },
//     {
//         "featureType": "all",
//         "elementType": "labels.text.stroke",
//         "stylers": [
//             {
//                 "color": "#ffffff"
//             }
//         ]
//     },
//     {
//         "featureType": "all",
//         "elementType": "labels.icon",
//         "stylers": [
//             {
//                 "visibility": "on"
//             }
//         ]
//     },
//     {
//         "featureType": "administrative",
//         "elementType": "all",
//         "stylers": [
//             {
//                 "visibility": "off"
//             }
//         ]
//     },
//     {
//         "featureType": "administrative.neighborhood",
//         "elementType": "geometry.fill",
//         "stylers": [
//             {
//                 "color": "#eaf1ff"
//             }
//         ]
//     },
//     {
//         "featureType": "landscape",
//         "elementType": "all",
//         "stylers": [
//             {
//                 "color": "#ffffff"
//             }
//         ]
//     },
//     {
//         "featureType": "poi",
//         "elementType": "all",
//         "stylers": [
//             {
//                 "visibility": "off"
//             }
//         ]
//     },
//     {
//         "featureType": "road",
//         "elementType": "geometry.fill",
//         "stylers": [
//             {
//                 "color": "#000000"
//             },
//             {
//                 "weight": 1
//             }
//         ]
//     },
//     {
//         "featureType": "road",
//         "elementType": "geometry.stroke",
//         "stylers": [
//             {
//                 "color": "#000000"
//             },
//             {
//                 "weight": 0.8
//             }
//         ]
//     },
//     {
//         "featureType": "road",
//         "elementType": "labels",
//         "stylers": [
//             {
//                 "visibility": "on"
//             }
//         ]
//     },
//     {
//         "featureType": "transit",
//         "elementType": "all",
//         "stylers": [
//             {
//                 "visibility": "off"
//             }
//         ]
//     },
//     {
//         "featureType": "water",
//         "elementType": "all",
//         "stylers": [
//             {
//                 "visibility": "off"
//             }
//         ]
//     }
//   ];

//   map.addStyle({
//     styles: styles,
//     mapTypeId: 'map_style'
//   });
//   map.setStyle('map_style');

}

//// GET THE ROUTES AND DIRECTIONS


export { mapDisplay };
