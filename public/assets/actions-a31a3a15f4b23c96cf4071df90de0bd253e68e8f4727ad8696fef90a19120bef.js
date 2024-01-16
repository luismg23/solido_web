document.addEventListener('DOMContentLoaded', function() {
  const crearButton = document.getElementById('crearButton');

  crearButton.addEventListener('click', function() {
      $('#myModal').modal('show');

      let clave = document.getElementById('bank_cve_banco');
      let sucursal = document.getElementById('bank_sucursal_banco');
      let direccion = document.getElementById('bank_direccion_banco');
      let telefono = document.getElementById('bank_telefono_banco');
      let nombre = document.getElementById('bank_nombre_banco');

      const saveButton = document.getElementById('saveButton');

      function can_be_saved(){
        const regexNumeros = /^\d+$/;
        if (regexNumeros.test(clave.value) && regexNumeros.test(telefono.value)) {
          return true
        }
        return false
      }

      function validate(){
        console.log('en el validate')
        const regexNumeros = /^\d+$/;
        if (clave.value !== '' && !regexNumeros.test(clave.value)) {
          var mensajeError = document.getElementById('clave-error');
          mensajeError.style.display = 'block'    
          saveButton.disabled = true;
        }
        else
        {
          var mensajeError = document.getElementById('clave-error');
          mensajeError.style.display = 'none'    
        }
        if (telefono.value !== '' && !regexNumeros.test(telefono.value)){
          var mensajeError = document.getElementById('telefono-error');
          mensajeError.style.display = 'block'
          saveButton.disabled = true;

        }
        else
        {
          var mensajeError = document.getElementById('telefono-error');
          mensajeError.style.display = 'none'    
        }
      }

      function enableButton() {
        if (clave.value !== '' && sucursal.value !== '' && direccion.value !== '' && telefono.value !== '' && nombre.value !== '') {
          let res = can_be_saved()
          if (res == true){
            saveButton.disabled = false;
          }
        } else {
          saveButton.disabled = true;
        }
      }
      clave.addEventListener('input', validate);
      telefono.addEventListener('input', validate);
      clave.addEventListener('input', enableButton);
      sucursal.addEventListener('input', enableButton);
      direccion.addEventListener('input', enableButton);
      telefono.addEventListener('input', enableButton);
      nombre.addEventListener('input', enableButton);

    });
});
