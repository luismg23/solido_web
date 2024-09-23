document.addEventListener('DOMContentLoaded', function() {
  const crearButton = document.getElementById('crearButton');
  const editButton = document.getElementById('edit-button');

  let clave = document.getElementById('bank_cve_banco');
  let sucursal = document.getElementById('bank_sucursal_banco');
  let direccion = document.getElementById('bank_direccion_banco');
  let telefono = document.getElementById('bank_telefono_banco');
  let nombre = document.getElementById('bank_nombre_banco');

  const saveButton = document.getElementById('saveButton');
  enableButton();

  function can_be_saved() {
    const regexNumeros = /^\d+$/;
    return regexNumeros.test(clave.value) && regexNumeros.test(telefono.value);
  }

  function validate() {
    const regexNumeros = /^\d+$/;
    
    // Validar clave
    if (clave.value !== '' && !regexNumeros.test(clave.value)) {
      var mensajeError = document.getElementById('clave-error');
      mensajeError.style.display = 'block';
      saveButton.disabled = true;
    } else {
      var mensajeError = document.getElementById('clave-error');
      mensajeError.style.display = 'none';
    }

    // Validar teléfono
    if (telefono.value !== '' && !regexNumeros.test(telefono.value)) {
      var mensajeError = document.getElementById('telefono-error');
      mensajeError.style.display = 'block';
      saveButton.disabled = true;
    } else {
      var mensajeError = document.getElementById('telefono-error');
      mensajeError.style.display = 'none';
    }
  }

  function enableButton() {
    const allFieldsFilled = clave.value !== '' && sucursal.value !== '' && direccion.value !== '' && telefono.value !== '' && nombre.value !== '';
    
    if (allFieldsFilled && can_be_saved()) {
      saveButton.disabled = false;
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

  crearButton.addEventListener('click', function() {
    $('#editModal').modal('show');
  });
});
