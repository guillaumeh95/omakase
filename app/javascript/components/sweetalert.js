import swal from 'sweetalert2';
import $ from 'jquery';

function sweetAlertDelete() {
  const link = document.getElementById('sweetalert-delete')
  link.addEventListener('click', (event) => {
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
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          },
          credentials: 'same-origin'
        })
          .then(res => res.json())
          .then((data) => {
            const dashboard = document.querySelector('.dashboard-container');
            dashboard.innerHTML = data.partial;
          });
      };
    });
  });
}


export { sweetAlertDelete };
