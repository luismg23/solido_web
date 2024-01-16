document.addEventListener('DOMContentLoaded', function() {
  console.log('jalo?')
  const crearButton = document.getElementById('crearButton');

  crearButton.addEventListener('click', function() {
    console.log('Se ha clickeado el botón "Crear"');
      $('#myModal').modal('show');
    });

   const loadButton = document.getElementById('loadButton');

   loadButton.addEventListener('click', function() {
      console.log('Se ha clickeado el botón "load"');
        $('#loadModal').modal('show');
        var myDropzone = new Dropzone("#my-dropzone-form", {
          url: "/upload",
          maxFilesize: 5,
          maxFiles: 1,
          acceptedFiles: '.csv',
          dictDefaultMessage: 'Arrastra y suelta archivos o haz clic para seleccionar',
          dictRemoveFile: 'Eliminar archivo',
          init: function() {
            this.on('success', function(file, response) {
              console.log("Archivo subido con éxito:", response);
            });
    
            this.on('removedfile', function(file) {
              console.log("Archivo eliminado:", file);
            });
          }
        });
        console.log("Dropzone inicializado:", myDropzone);

        myDropzone.on('sending', function(file, xhr, formData) {
          console.log('fallo')
          // Agregar el token CSRF a la solicitud para protección contra falsificaciones de solicitudes entre sitios (CSRF)
          var csrfToken = document.querySelector('meta[name="csrf-token"]').content;
          formData.append('authenticity_token', csrfToken);
        });
  
      });
  
  
});
