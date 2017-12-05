import $ from "jquery";
import "bootstrap-slider";

  // Instantiate a slider
function initSliders() {
  $('.sliderbudget').slider({
    min: 1,
    max: 5,
    steps: 4,
    value: 3,
    orientation: 'horizontal',
    ticks: [1, 2, 3, 4, 5]
  });
$('.sliderknowledge').slider({
    min: 1,
    max: 5,
    steps: 4,
    value: 3,
    orientation: 'horizontal',
    ticks: [1, 2, 3, 4, 5]
    });

};

export {initSliders};

