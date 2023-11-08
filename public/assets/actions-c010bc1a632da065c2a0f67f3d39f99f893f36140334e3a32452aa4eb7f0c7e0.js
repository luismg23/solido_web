document.addEventListener('DOMContentLoaded', function() {
  console.log('jalo?')
  const crearButton = document.getElementById('crearButton');

  crearButton.addEventListener('click', function() {
    console.log('Se ha clickeado el botón "Crear"');
    modalContainer.innerHTML = '<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">\
      <div class="modal-dialog" role="document">\
        <div class="modal-content">\
          <div class="modal-header">\
            <h5 class="modal-title" id="exampleModalLabel">Crear Modal Dinámico</h5>\
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">\
              <span aria-hidden="true">&times;</span>\
            </button>\
          </div>\
          <div class="modal-body">\
            Contenido del modal\
          </div>\
          <div class="modal-footer">\
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>\
            <button type="button" class="btn btn-primary">Guardar cambios</button>\
          </div>\
        </div>\
      </div>\
    </div>';

    // Mostrar el modal
    const modal = new bootstrap.Modal(document.getElementById('myModal'));
    modal.show();
  });

});
