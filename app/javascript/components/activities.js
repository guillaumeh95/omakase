// const activitiesOne = document.getElementById("activities-one");
// const allActivitiesOne = activitiesOne.querySelectorAll(".card-activity-unit");
// // const activitiesOneFiltered = document.getElementById("activities-one-filtered");
// // const activitiesOneClicked = document.getElementById("activities-one-clicked");

// const activitiesTwo = document.getElementById("activities-two");
// const allActivitiesTwo = activitiesTwo.querySelectorAll(".card-activity-unit");
// // const activitiesTwoFiltered = document.getElementById("activities-two-filtered");
// // const activitiesTwoClicked = document.getElementById("activities-two-clicked");

// const activitiesThree = document.getElementById("activities-three");
// const allActivitiesThree = activitiesThree.querySelectorAll(".card-activity-unit");
// // const activitiesThreeFiltered = document.getElementById("activities-three-filtered");
// // const activitiesThreeClicked = document.getElementById("activities-three-clicked");

// function getSiblings(elem) {
//   var siblings = [];
//   var sibling = elem.parentNode.firstChild;
//   for (; sibling; sibling = sibling.nextSibling) {
//       if (sibling.nodeType !== 1 || sibling === elem) continue;
//       siblings.push(sibling);
//   }
//   return siblings;
// };

// if (activitiesOne) {
//   allActivitiesOne.forEach((activities) => {
//     activities.addEventListener("click", (event) => {
//       const activityOne = event.currentTarget;
//       const siblings = getSiblings(activityOne);
//       siblings.forEach((sibling) => {
//         sibling.classList.toggle("hidden")
//         // change class hidden for opacity (one with 1 and other 0) if want transition
//       });
//       activityOne.parentNode.classList.toggle("stretch");
//       activityOne.querySelector(".card-activity-description-full").classList.toggle("hidden")
//       const activityOneId = activityOne.dataset.activityId;
//       console.log(activityOneId);
//       activitiesTwo.classList.toggle("hidden");
//     });
//   });
// };

// if (activitiesTwo) {
//   allActivitiesTwo.forEach((activities) => {
//     activities.addEventListener("click", (event) => {
//       const activityTwo = event.currentTarget;
//       const siblings = getSiblings(activityTwo);
//       siblings.forEach((sibling) => {
//         sibling.classList.toggle("hidden");
//       });
//       activityTwo.parentNode.classList.toggle("stretch");
//       activityTwo.querySelector(".card-activity-description-full").classList.toggle("hidden");
//       const activityTwoId = activityTwo.dataset.activityId;
//       console.log(activityTwoId);
//       activitiesThree.classList.toggle("hidden");
//     });
//   });
// };

// if (activitiesThree) {
//   allActivitiesThree.forEach((activities) => {
//     activities.addEventListener("click", (event) => {
//       const activityThree = event.currentTarget;
//       const siblings = getSiblings(activityThree);
//       siblings.forEach((sibling) => {
//         sibling.classList.toggle("hidden")
//       });
//       activityThree.parentNode.classList.toggle("stretch");
//       activityThree.querySelector(".card-activity-description-full").classList.toggle("hidden")
//       const activityThreeId = activityThree.dataset.activityId;
//       console.log(activityThreeId);
//     });
//   });
// };

