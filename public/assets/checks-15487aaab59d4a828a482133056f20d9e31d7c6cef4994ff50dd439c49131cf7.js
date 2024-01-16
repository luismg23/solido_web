document.addEventListener('DOMContentLoaded', function() {
    const crearButton = document.getElementById('budget_create_check');
  
    crearButton.addEventListener('click', function() {
        $('#modalCheck').modal('show');
        if ($.fn.datepicker) {
            $('.datepicker').datepicker({
                format: 'yyyy-mm-dd',
                autoclose: true
            });
        } else {
            console.error('La función datepicker no está definida.');
        }
              
    })
});  
