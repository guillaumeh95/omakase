import swal from 'sweetalert2';

function sweetAlertDelete() {
  const link = document.getElementById('sweetalert-delete')
  link.addEventListener('click', (event) => {
    console.log(event);
    event.preventDefault();
    swal({
      title: "Are you sure you want to delete this trip?",
      type: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Yes, delete it!',
      cancelButtonText: 'No, keep it'
    }).then((result) => {
      if (result.value) {
        const csrfToken = document.querySelector('meta[name="csrf-token"]').attributes.content.value;
        fetch(`/trips/${link.dataset.tripId}`, {
          method: "DELETE",
          headers: {
            'X-Requested-With': 'XMLHttpRequest',
            'X-CSRF-Token': csrfToken,
            'Content-Type': 'application/javascript',
            'Accept': 'application/javascript'
          },
          credentials: 'same-origin'
        });
      };
    });
  });
}


export { sweetAlertDelete };
