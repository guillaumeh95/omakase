// Sliders of new trip form

import $ from "jquery";
import "bootstrap-slider";

  // Instantiate a slider
function initSliders() {
  $('.sliderbudget').slider({
    min: 1,
    max: 5,
    steps: 4,
    value: 5,
    orientation: 'horizontal',
    ticks: [1, 2, 3, 4, 5],
    ticks_labels: ['Free', '€', '€€', '€€€', 'Not sure']
  });
$('.sliderknowledge').slider({
    min: 1,
    max: 5,
    steps: 4,
    value: 5,
    orientation: 'horizontal',
    ticks: [1, 2, 3, 4, 5],
    ticks_labels: ['Not At All', 'Little', 'Good', 'Well', 'Not Sure']
    });

};

function arrangeWidth() {
  const inputs = document.querySelectorAll('.slider-tick-label')
  if(inputs) {
    inputs.forEach(function(input) {
      input.style.width = '179.75px'
    });
  }
  const labels = document.querySelectorAll('.slider-tick-label-container')
    if(labels) {
    labels.forEach(function(label) {
      label.style.marginLeft = '-89.875px'
    });
  }
}

export {arrangeWidth};
export {initSliders};

