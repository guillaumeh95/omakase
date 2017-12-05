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

const cards = document.querySelectorAll(".card.full-card");

if (cards) {
  cards.forEach((card) => {
    card.addEventListener("mouseenter", (event) => {
      const target = event.currentTarget.querySelector(".trip-actions");
      target.classList.remove('hidden');
      target.classList.add('fade-card');
      const title = event.currentTarget.querySelector(".trip-title");
      title.classList.remove('trip-title');
      title.classList.add('trip-title-large');
      title.classList.add('fade-card');

    });
    card.addEventListener("mouseleave", (event) => {
      const target = event.currentTarget.querySelector(".trip-actions");
      target.classList.add('hidden');
      target.classList.remove('fade-card');
      const title = event.currentTarget.querySelector(".trip-title-large");
      title.classList.remove('trip-title-large');
      title.classList.add('trip-title');
      title.classList.add('fade-card');
    });
  });
}
