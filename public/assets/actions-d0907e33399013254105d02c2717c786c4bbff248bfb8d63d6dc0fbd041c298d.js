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
        Dropzone.autoDiscover = false;
        var myDropzone = new Dropzone("#my-dropzone-form", {
          clickable: false,
          url: "upload",
          maxFilesize: 5,
          maxFiles: 1,
          acceptedFiles: '.csv',
          dictDefaultMessage: 'Arrastra y suelta archivos o haz clic para seleccionar',
          dictRemoveFile: 'Eliminar archivo',
          init: function() {
            console.log('en la funcion')
            this.on('success', function(file, response) {
              console.log("Archivo subido con éxito:", response);
            });
    
            this.on('removedfile', function(file) {
              console.log("Archivo eliminado:", file);
            });
          }
        });
        console.log("Dropzone inicializado:", myDropzone);
        myDropzone.hiddenFileInput.style.display = 'none';

        myDropzone.on('sending', function(file, xhr, formData) {
          console.log('fallo')
          var csrfToken = document.querySelector('meta[name="csrf-token"]').content;
          formData.append('authenticity_token', csrfToken);
        });
  
      });
});
