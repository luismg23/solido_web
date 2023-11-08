document.addEventListener('DOMContentLoaded', function() {
  console.log('jalo?')
  const crearButton = document.getElementById('crearButton');

  crearButton.addEventListener('click', function() {
    console.log('Se ha clickeado el botón "Crear"');
      $('#myModal').modal('show'); // Abre el modal utilizando jQuery
    });

});
