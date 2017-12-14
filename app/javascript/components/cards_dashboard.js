// Dashboard cards change style when card is hovered
const cards = document.querySelectorAll(".card.full-card");

if (cards) {
  cards.forEach((card) => {
    card.addEventListener("mouseenter", (event) => {
      const target = event.currentTarget.querySelector(".trip-actions");
      target.classList.remove('hidden');
      target.classList.add('fade-card');
      // Animate title
      const title = event.currentTarget.querySelector(".trip-title");
      title.classList.add('animated', 'fadeOut');
      // Animate actions menu
      const tripActions = event.currentTarget.querySelector(".trip-actions-btn");
      tripActions.classList.add('animated', 'fadeInDown');
      // Animate date
      const tripDate = event.currentTarget.querySelector(".trip-date-info");
      tripDate.classList.add('animated', 'fadeInDown');
    });
    card.addEventListener("mouseleave", (event) => {
      const target = event.currentTarget.querySelector(".trip-actions");
      target.classList.add('hidden');
      target.classList.remove('fade-card');
      // Animate title
      const title = event.currentTarget.querySelector(".trip-title");
      title.classList.remove('animated', 'fadeOut');
      title.classList.add('fade-card', 'animated', 'fadeIn');
    });
  });
}



