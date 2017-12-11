

function addDeleteLink () {
  const visitOne = document.getElementById("activities-one-selected");
  const visitTwo = document.getElementById("activities-two-selected");
  const visitThree = document.getElementById("activities-three-selected");
  if (visitThree) {
    const deleteLink = visitThree.querySelector(".delete-link");
    deleteLink.style.display = "";
  }
  else if (visitTwo) {
    const deleteLink = visitTwo.querySelector(".delete-link");
    deleteLink.style.display = "";
  }
  else if (visitOne) {
    const deleteLink = visitOne.querySelector(".delete-link");
    deleteLink.style.display = "";
  }
}

export {addDeleteLink};
