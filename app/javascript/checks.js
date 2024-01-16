document.addEventListener('DOMContentLoaded', function() {
    const crearButton = document.getElementById('budget_create_check');
  
    crearButton.addEventListener('click', function() {
        $('#modalCheck').modal('show');
    })
});  