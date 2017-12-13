import swal from 'sweetalert'

// Sélectionner les checkboxes
const descriptionBoxes = document.querySelectorAll('.select-description');
// parcourir les checkboxes
descriptionBoxes.forEach((descriptionBox) => {
  // Ecouter le click sur chacune d'entre elles
  descriptionBox.addEventListener('click', (event) => {
    const activeBoxes = document.querySelectorAll('.select-description.active');
    if (event.currentTarget.classList.contains('active')) {
      event.currentTarget.classList.remove('active');
      event.currentTarget.querySelector('input[type=hidden]').value = false;
    } else {
      if (activeBoxes.length === 3) {
        swal({
          title: 'You can select only three profiles',
          type: 'warning',
          icon: "warning",
          dangerMode: true
        });
        submit.disabled = true;
      } else {
        event.currentTarget.classList.add('active');
        // Add true value to hidden
        event.currentTarget.querySelector('input[type=hidden]').value = true;
      }
    }

    const submit = document.getElementById('submit-trip');
    if (activeBoxes.length === 2) {
      // Enable submit
      submit.disabled = false;
    } else {
      // Disable submit
      submit.disabled = true;
    }
    countActivedChoices();
  });
});

// Status selection
const statusBoxes = document.querySelectorAll('.select-status');
// Run through all checkboxes
statusBoxes.forEach((statusBox) => {
  // Listen the click on each checkbox
  statusBox.addEventListener('click', (event) => {
    // Active boxes selection
    const activeBoxes = document.querySelectorAll('.select-status.active');
    if (event.currentTarget.classList.contains('active')) {
      event.currentTarget.classList.remove('active');
      event.currentTarget.querySelector('input[type=hidden]').disabled = true;
    } else {
      if (activeBoxes.length === 1) {
        activeBoxes[0].classList.remove('active');
        event.currentTarget.classList.add('active');
      } else {
        event.currentTarget.classList.add('active');
        // Add true value to hidden
        event.currentTarget.querySelector('input[type=hidden]').disabled = false;
      }
    }
  });
});

// Number of selected profiles count
function countActivedChoices() {
  const activeChoices = document.getElementById("active-choices");
  let numberActiveChoices = document.querySelectorAll(".description-checkboxes .active").length;
  activeChoices.innerHTML = numberActiveChoices;
}
