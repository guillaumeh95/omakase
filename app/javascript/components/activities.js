const activitiesOne = document.getElementById("activities-one")
const activitiesOneFiltered = document.getElementById("activities-one-filtered")
const activitiesOneClicked = document.getElementById("activities-one-clicked")

const activitiesTwo = document.getElementById("activities-two")
const activitiesTwoFiltered = document.getElementById("activities-two-filtered")
const activitiesTwoClicked = document.getElementById("activities-two-clicked")

const activitiesThree = document.getElementById("activities-three")
const activitiesThreeFiltered = document.getElementById("activities-three-filtered")
const activitiesThreeClicked = document.getElementById("activities-three-clicked")

if (activitiesOne) {
    activitiesOne.addEventListener("click", (event) => {
      activityOneId = event.currentTarget.dataset.activityId
      console.log(activityOneId)
    })
}
