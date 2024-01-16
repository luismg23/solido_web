document.addEventListener('DOMContentLoaded', function() {
    const crearButton = document.getElementById('budget_create_check');
  
    crearButton.addEventListener('click', function() {
        $('#modalCheck').modal('show');
        var datetimepicker = new bootstrap.DatePicker(document.getElementById('datepicker1'), {
            format: 'yyyy-mm-dd',
            autoclose: true
          });
      
    })
});  
