function initMap() {
  const mapElement = document.getElementById('map');
  const markers = JSON.parse(mapElement.dataset.markers);

  var marker0 = {lat: markers[0].lat, lng: markers[0].lng};
  var marker1 = {lat: markers[1].lat, lng: markers[1].lng};
  var marker2 = {lat: markers[2].lat, lng: markers[2].lng};
  var markerArray = [marker0, marker1, marker2];

  var styledMapType = new google.maps.StyledMapType(
          [
  {
      "featureType": "all",
      "elementType": "labels",
      "stylers": [
          {
              "visibility": "off"
          }
      ]
  },
  {
      "featureType": "all",
      "elementType": "labels.text",
      "stylers": [
          {
              "visibility": "on"
          }
      ]
  },
  {
      "featureType": "all",
      "elementType": "labels.text.fill",
      "stylers": [
          {
              "color": "#000000"
          }
      ]
  },
  {
      "featureType": "all",
      "elementType": "labels.text.stroke",
      "stylers": [
          {
              "color": "#ffffff"
          }
      ]
  },
  {
      "featureType": "all",
      "elementType": "labels.icon",
      "stylers": [
          {
              "visibility": "on"
          }
      ]
  },
  {
      "featureType": "administrative",
      "elementType": "all",
      "stylers": [
          {
              "visibility": "off"
          }
      ]
  },
  {
      "featureType": "administrative.neighborhood",
      "elementType": "geometry.fill",
      "stylers": [
          {
              "color": "#eaf1ff"
          }
      ]
  },
  {
      "featureType": "landscape",
      "elementType": "all",
      "stylers": [
          {
              "color": "#ffffff"
          }
      ]
  },
  {
      "featureType": "poi",
      "elementType": "all",
      "stylers": [
          {
              "visibility": "off"
          }
      ]
  },
  {
      "featureType": "road",
      "elementType": "geometry.fill",
      "stylers": [
          {
              "color": "#000000"
          },
          {
              "weight": 1
          }
      ]
  },
  {
      "featureType": "road",
      "elementType": "geometry.stroke",
      "stylers": [
          {
              "color": "#000000"
          },
          {
              "weight": 0.8
          }
      ]
  },
  {
      "featureType": "road",
      "elementType": "labels",
      "stylers": [
          {
              "visibility": "on"
          }
      ]
  },
  {
      "featureType": "transit",
      "elementType": "all",
      "stylers": [
          {
              "visibility": "off"
          }
      ]
  },
  {
      "featureType": "water",
      "elementType": "all",
      "stylers": [
          {
              "visibility": "off"
          }
      ]
  }
],

  {name: 'Styled Map'});


  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 13,
    center: marker0,
    mapTypeControlOptions: {
    mapTypeIds: ['roadmap', 'satellite', 'hybrid', 'terrain',
              'styled_map']
    }
  });

  //Associate the styled map with the MapTypeId and set it to display.
  map.mapTypes.set('styled_map', styledMapType);
  map.setMapTypeId('styled_map');

  var place1 = new google.maps.Marker({
    position: marker0,
    map: map,
    title: 'Marker0'
  });

  console.log(place1);

  var place2 = new google.maps.Marker({
    position: marker1,
    map: map,
    title: 'Marker1'
  });

  var place3 = new google.maps.Marker({
    position: marker2,
    map: map,
    title: 'Marker2'
  });

  var placeArray = [place1, place2, place3];

  // Instantiate a directions service.
  var directionsService = new google.maps.DirectionsService;
  var directionsService2 = new google.maps.DirectionsService;

  //check selected mode of transport
  const selectedMode = document.getElementById('mode').value;

  // Create a renderer for directions and bind it to the map.
  var directionsDisplay = new google.maps.DirectionsRenderer({map: map});
  var directionsDisplay2 = new google.maps.DirectionsRenderer({map: map});

  // Instantiate an info window to hold step text.
  var stepDisplay = new google.maps.InfoWindow;

  // Display the route between the initial start and end selections.
  calculateAndDisplayRoute(
      directionsDisplay, directionsDisplay2, directionsService, directionsService2, markerArray, placeArray, stepDisplay, selectedMode, map);
  // Listen to change events from the start and end lists.
  var onChangeHandler = function() {
    calculateAndDisplayRoute(
       directionsDisplay, directionsDisplay2, directionsService, directionsService2, markerArray, placeArray, stepDisplay, selectedMode, map);
  };

  document.getElementById('mode').addEventListener('change', onChangeHandler);

  //Associate the styled map with the MapTypeId and set it to display.
  map.mapTypes.set('styled_map', styledMapType);
  map.setMapTypeId('styled_map');


}


function calculateAndDisplayRoute(directionsDisplay, directionsDisplay2, directionsService, directionsService2,
    markerArray, placeArray, stepDisplay, selectedMode, map) {
  // First, remove any existing markers from the map.
  for (var i = 0; i < placeArray.length; i++) {
    placeArray[i].setMap(null);
  }

  // Retrieve the start and end locations and create a DirectionsRequest using
  // WALKING directions.
  directionsService.route({
    origin: markerArray[0],
    destination: markerArray[1],
    travelMode: google.maps.TravelMode[selectedMode]
  }, function(response, status) {
    if (status === 'OK') {
      // var inhtml = document.querySelectorAll('gm-iw')
      // console.log(inhtml)
      //     '<b>' + response.routes[0].warnings + '</b>';
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
    // Route the directions and pass the response to a function to create
    // markers for each step.
    attachInstructionText(
        stepDisplay, placeArray, map);
}

function calculateAndDisplayRoute(directionsDisplay, directionsDisplay2, directionsService, directionsService2,
    markerArray, placeArray, stepDisplay, selectedMode, map) {
  // First, remove any existing markers from the map.
  for (var i = 0; i < placeArray.length; i++) {
    placeArray[i].setMap(null);
  }

  // Retrieve the start and end locations and create a DirectionsRequest using
  // WALKING directions.
  directionsService.route({
    origin: markerArray[0],
    destination: markerArray[1],
    travelMode: google.maps.TravelMode[selectedMode]
  }, function(response, status) {
    if (status === 'OK') {
      // var inhtml = document.querySelectorAll('gm-iw')
      // console.log(inhtml)
      //     '<b>' + response.routes[0].warnings + '</b>';
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
    // Route the directions and pass the response to a function to create
    // markers for each step.
    attachInstructionText(
        stepDisplay, placeArray, map);
}

function showSteps(directionResult, placeArray, stepDisplay, map) {
  // For each step, place a marker, and add the text to the marker's infowindow.
  // Also attach the marker to an array so we can keep track of it and remove it
  // when calculating new routes.
  console.log("showsteps")
  var myRoute = directionResult.routes[0].legs[0];
  for (var i = 0; i < myRoute.steps.length; i++) {
    var marker = placeArray[i] = placeArray[i] || new google.maps.Marker;
    //to show marker instructions
    //marker.setMap(map);
    //marker.setPosition(myRoute.steps[i].start_location);
  }
}

function attachInstructionText(stepDisplay, placeArray, text, map) {
  console.log("instructionstxt")
  for (var i = 0; i < placeArray.length; i++) {
    console.log(placeArray[i]);
    google.maps.event.addListener(placeArray[i], 'click', function() {
      // Open an info window when the marker is clicked on, containing the text
      // of the step.
      stepDisplay.setContent("HELLO");
      stepDisplay.open(map, marker);
    });
  }
}

export { initMap };
