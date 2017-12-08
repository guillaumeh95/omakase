// Dashboard cards change style when card is hovered

const cards = document.querySelectorAll(".card.full-card");

if (cards) {
  cards.forEach((card) => {
    card.addEventListener("mouseenter", (event) => {
      const target = event.currentTarget.querySelector(".trip-details");
      target.classList.remove('hidden');
      target.classList.add('fade-card');
      const title = event.currentTarget.querySelector(".trip-title");
      title.classList.remove('trip-title');
      title.classList.add('trip-title-large', 'fade-card');

    });
    card.addEventListener("mouseleave", (event) => {
      const target = event.currentTarget.querySelector(".trip-details");
      target.classList.add('hidden');
      target.classList.remove('fade-card');
      const title = event.currentTarget.querySelector(".trip-title-large");
      title.classList.remove('trip-title-large');
      title.classList.add('trip-title', 'fade-card');
    });
  });
}


const activities = document.querySelectorAll(".card-activity-unit")

if (activities) {
  activities.forEach((activity) => {
    activity.addEventListener("click", (event) => {
      const activityId = event.currentTarget.dataset.activityId
      console.log(activityId)
    })
  })
}
