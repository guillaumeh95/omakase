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
    ticks_labels: ['Free', '€', '€€', '€€€', "Don't know"]
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

export {initSliders};

