function initMap() {
  const mapElement = document.getElementById('map');
  const markers = JSON.parse(mapElement.dataset.markers);
  var marker0 = markers[0]
  var marker1 = markers[1]
  var marker2 = markers[2]
  var markerArray = markers;
  var styledMapType = new google.maps.StyledMapType(

    [
    {
        "featureType": "water",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#e9e9e9"
            },
            {
                "lightness": 17
            }
        ]
    },
    {
        "featureType": "landscape",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#f5f5f5"
            },
            {
                "lightness": 20
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#ffffff"
            },
            {
                "lightness": 17
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "color": "#ffffff"
            },
            {
                "lightness": 29
            },
            {
                "weight": 0.2
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#ffffff"
            },
            {
                "lightness": 18
            }
        ]
    },
    {
        "featureType": "road.local",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#ffffff"
            },
            {
                "lightness": 16
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#f5f5f5"
            },
            {
                "lightness": 21
            }
        ]
    },
    {
        "featureType": "poi.park",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#dedede"
            },
            {
                "lightness": 21
            }
        ]
    },
    {
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "color": "#ffffff"
            },
            {
                "lightness": 16
            }
        ]
    },
    {
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "saturation": 36
            },
            {
                "color": "#333333"
            },
            {
                "lightness": 40
            }
        ]
    },
    {
        "elementType": "labels.icon",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "transit",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#f2f2f2"
            },
            {
                "lightness": 19
            }
        ]
    },
    {
        "featureType": "administrative",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#fefefe"
            },
            {
                "lightness": 20
            }
        ]
    },
    {
        "featureType": "administrative",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "color": "#fefefe"
            },
            {
                "lightness": 17
            },
            {
                "weight": 1.2
            }
        ]
    }
], { name: 'Styled Map' });


  var map = new google.maps.Map(document.getElementById('map'), {
    center: marker0,
    mapTypeControlOptions: {
      mapTypeIds: ['roadmap', 'satellite', 'hybrid', 'terrain', 'styled_map']
    }
  });

  //Associate the styled map with the MapTypeId and set it to display.
  map.mapTypes.set('styled_map', styledMapType);
  map.setMapTypeId('styled_map');


  var image1 = 'http://res.cloudinary.com/djlkudqpv/image/upload/c_scale,w_35/v1513163786/1_ljmdmd.png';
  var imageMarker1 = new google.maps.Marker({
    position: marker0,
    map: map,
    icon: image1
  });

  var image2 = 'http://res.cloudinary.com/djlkudqpv/image/upload/c_scale,w_35/v1513163787/2_c5kne3.png';
  var imageMarker2 = new google.maps.Marker({
    position: marker1,
    map: map,
    icon: image2
  });

  var image3 = 'http://res.cloudinary.com/djlkudqpv/image/upload/c_scale,w_35/v1513163787/3_i4d0wn.png';
  var imageMarker3 = new google.maps.Marker({
    position: marker2,
    map: map,
    icon: image3
      });


  // Instantiate a directions service.
  var directionsService = new google.maps.DirectionsService;
  var directionsService2 = new google.maps.DirectionsService;

  //check selected mode of transport
  const selectedMode = document.getElementById('mode').value;

  // Create a renderer for directions and bind it to the map.
  var directionsDisplay = new google.maps.DirectionsRenderer({map: map, polylineOptions:{strokeColor:"#4a4a4a",strokeWeight:4}, suppressMarkers: true});
  var directionsDisplay2 = new google.maps.DirectionsRenderer({ map: map, polylineOptions:{strokeColor:"#4a4a4a",strokeWeight:4}, suppressMarkers:true})

  // Instantiate an info window to hold step text.
  var stepDisplay = new google.maps.InfoWindow;

  // Display the route between the initial start and end selections.
  calculateAndDisplayRoute(directionsDisplay, directionsDisplay2, directionsService, directionsService2, markers, stepDisplay, selectedMode, map);
  // Listen to change events from the start and end lists.
  var onChangeHandler = function() {
    calculateAndDisplayRoute(directionsDisplay, directionsDisplay2, directionsService, directionsService2, markers, stepDisplay, selectedMode, map);
  };

  document.getElementById('mode').addEventListener('change', onChangeHandler);

  //Associate the styled map with the MapTypeId and set it to display.
  map.mapTypes.set('styled_map', styledMapType);
  map.setMapTypeId('styled_map');

  // fit bounds to map fitBounds fitLatLng(markers)
  //fitBoundsToVisibleMarkers(markers);

}

// function fitBoundsToVisibleMarkers(markers) {

//     var bounds = new google.maps.LatLngBounds();

//     for (var i=0; i<markers.length; i++) {
//       console.log(markers[i]);
//         if(markers[i].getVisible()) {
//             bounds.extend( markers[i].getPosition() );
//         }
//    }

//     map.fitBounds(bounds);

//}

function calculateAndDisplayRoute(directionsDisplay, directionsDisplay2, directionsService, directionsService2, markerArray, stepDisplay, selectedMode, map) {
  // First, remove any existing markers from the map.
  // for (var i = 0; i < placeArray.length; i++) {
  //   placeArray[i].setMap(null);
  // }

  // Retrieve the start and end locations and create a DirectionsRequest using
  // WALKING directions.
  directionsService.route({
    origin: markerArray[0],
    destination: markerArray[1],
    travelMode: google.maps.TravelMode[selectedMode]
  }, function(response, status) {
    if (status === 'OK') {
      directionsDisplay.setDirections(response);
      // showSteps(response, placeArray, stepDisplay, map);
    } else {
      window.alert('Directions request failed due to ' + status);
    }
  });

  directionsService2.route({
    origin: markerArray[1],
    destination: markerArray[2],
    travelMode: google.maps.TravelMode[selectedMode]
  }, function(response2, status) {
    if (status === 'OK') {
      // document.getElementById('warnings-panel').innerHTML =
      //     '<b>' + response.routes[0].warnings + '</b>';
      directionsDisplay2.setDirections(response2);
      // showSteps(response, placeArray, stepDisplay, map);
    } else {
      window.alert('Directions request failed due to ' + status);
    }
  });

}

export { initMap };
