/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import 'bootstrap';
import "../plugins/flatpickr";
import "../components/trip_form";
import "../components/activities";
import {mapDisplay} from "./map";
import "../components/cards_dashboard";
import {initSliders} from "../components/slider";
import { setAlertsTimeouts } from '../components/alert';

// Sliders of new trip creation
initSliders();

// Modal hovering titile displays map
const openmodal = document.getElementById("ouverture_modal")
openmodal.addEventListener ("mouseover", (event) => {
  mapDisplay();
});

// Alerts disappearing automatically
if (document.querySelector(".alert")) {
  setAlertsTimeouts();
}
