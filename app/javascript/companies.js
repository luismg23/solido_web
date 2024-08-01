document.addEventListener('DOMContentLoaded', function() {
    const crearButton = document.getElementById('crearButton');
  
    crearButton.addEventListener('click', function() {
        $('#myModal').modal('show');
    });
});