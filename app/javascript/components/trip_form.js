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
      // Si déjà 3 éléments sélectionnés
      if (activeBoxes.length === 3) {
        alert('you can select only three profiles');
      } else {
        event.currentTarget.classList.add('active');
        // Ajouter la value true au input hidden correspondant
        event.currentTarget.querySelector('input[type=hidden]').value = true;
      }
    }
    const submit = document.getElementById('submit-trip');
    // Compter le nombre de checkboxes cochées
    // Si yen a 3
    if (activeBoxes.length === 2) {
      // On enable le submit
      submit.disabled = false;
    } else {
      // On disable
      submit.disabled = true;
    }
  });
});

const statusBoxes = document.querySelectorAll('.select-status');
// Parcourir les checkboxes
statusBoxes.forEach((statusBox) => {
  // Ecouter le click sur chacune d'entre elles
  statusBox.addEventListener('click', (event) => {
    const activeBoxes = document.querySelectorAll('.select-status.active');
    if (event.currentTarget.classList.contains('active')) {
      event.currentTarget.classList.remove('active');
      event.currentTarget.querySelector('input[type=hidden]').disabled = true;
    } else {
      // Si déjà 3 éléments sélectionnés
      if (activeBoxes.length === 1) {
        alert('you can select only three profiles');
      } else {
        event.currentTarget.classList.add('active');
        // Ajouter la value true au input hidden correspondant
        event.currentTarget.querySelector('input[type=hidden]').disabled = false;
      }
    }
  });
});
