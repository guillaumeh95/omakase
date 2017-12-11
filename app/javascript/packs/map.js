import GMaps from 'gmaps/gmaps.js';

function initMap(){
    const mapElement = document.getElementById('map');
  // if (mapElement) { // don't try to build a map if there's no div#map to inject in

    const markers = JSON.parse(mapElement.dataset.markers);
    const directionsDisplay = new google.maps.DirectionsRenderer;
    const directionsService = new google.maps.DirectionsService;
    const directionsDisplay2 = new google.maps.DirectionsRenderer;
    const directionsService2 = new google.maps.DirectionsService;
    const map = new google.maps.Map(document.getElementById('map'), {
          zoom: 14,
          center: {lat: markers[0].lat, lng: markers[0].lng}
        });
    directionsDisplay.setMap(map);
    directionsDisplay2.setMap(map);

    console.log(map);



    if (markers.length === 0) {
      // map.setZoom(2);
      console.log("premier if");
    } else if (markers.length > 1) {
      console.log("deuxieme if");
      // let center = map.setCenter(markers[0].lat, markers[0].lng);
      // map.setZoom(14);

      calculateAndDisplayRoute(directionsService, directionsDisplay);
      calculateAndDisplayRoute2(directionsService2, directionsDisplay2);
      document.getElementById('mode').addEventListener('change', function() {
        calculateAndDisplayRoute(directionsService, directionsDisplay);
        calculateAndDisplayRoute2(directionsService2, directionsDisplay2);
      });
    }

     else {
      map.fitLatLngBounds(markers);
      console.log("else");
    }

}

    function calculateAndDisplayRoute(directionsService, directionsDisplay) {
     const mapElement = document.getElementById('map');
     console.log("1");

     const markers = JSON.parse(mapElement.dataset.markers);

    const selectedMode = document.getElementById('mode').value;
    directionsService.route({
      origin: {lat: markers[0].lat, lng: markers[0].lng},  // Haight.
      destination: {lat: markers[1].lat, lng: markers[1].lng},  // Ocean Beach.
      // Note that Javascript allows us to access the constant
      // using square brackets and a string value as its
      // "property."
      travelMode: google.maps.TravelMode[selectedMode]
    }, function(response, status) {
      if (status == 'OK') {
        directionsDisplay.setDirections(response);
      } else {
        window.alert('Directions request failed due to ' + status);
      }
    });
  }

    function calculateAndDisplayRoute2(directionsService2, directionsDisplay2) {
     const mapElement = document.getElementById('map');
     console.log("2");

     const markers = JSON.parse(mapElement.dataset.markers);

    const selectedMode = document.getElementById('mode').value;
    directionsService2.route({
      origin: {lat: markers[1].lat, lng: markers[1].lng},  // Haight.
      destination: {lat: markers[2].lat, lng: markers[2].lng},  // Ocean Beach.
      // Note that Javascript allows us to access the constant
      // using square brackets and a string value as its
      // "property."
      travelMode: google.maps.TravelMode[selectedMode]
    }, function(response, status) {
      if (status == 'OK') {
        directionsDisplay2.setDirections(response);
      } else {
        window.alert('Directions request failed due to ' + status);
      }
    });
  }

export { initMap };

//   function calculateAndDisplayRoute(directionsService, directionsDisplay) {
//     const mapElement = document.getElementById('map');
//     console.log("hey");
//     const markers = JSON.parse(mapElement.dataset.markers);
//     let depart = markers[0];
//     console.log(depart);
//     let arrivee = markers[1];
//   /*test si les variables sont bien initialisés*/
//   if (depart && arrivee)
//   {
//   // mode de transport
//     const choixMode = document.getElementById('mode').value;
//     const request = {
//         origin: depart,
//         destination:arrivee,
//         travelMode: map.DirectionsTravelMode[choixMode]
//     };
//   /*appel à l'API pour tracer l'itinéraire*/
//     directionsService.route(request, function(response, status) {
//     directionsDisplay.setDirections(response);
//     });
//   }
// }

// [
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

  // map.addStyle({
  //   styles: styles,
  //   mapTypeId: 'map_style'
  // });
  // map.setStyle('map_style');


//// GET THE ROUTES AND DIRECTIONS



