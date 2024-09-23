document.addEventListener('DOMContentLoaded', function() {
  const createBudgetline = document.getElementById('budget_create_budgetline');
  const createBudget = document.getElementById('createBudget');
  const viewCheck = document.getElementById('budget_view_check');
  const viewDetails = document.getElementById('budget_view_details');
  const viewRenglones = document.getElementById('budget_view_budgetline');
  const viewCheckDetail = document.getElementById('view_check_button');

  const clave = document.getElementById('budget_cve_presupuesto');
  const year = document.getElementById('budget_anio_presupuesto');
  const name = document.getElementById('budget_nombre_presupuesto');
  const amount = document.getElementById('budget_monto_presupuestado');

  var menuDesplegable = document.getElementById('menu-desplegable');

  if (createBudgetline) {
    createBudgetline.addEventListener('click', function() {
      $('#modalBudgetline').modal('show');
    });
  }

  if (createBudget) {
    createBudget.addEventListener('click', function() {
      $('#createBudgetModal').modal('show');
      validate();
    });
  }

  if (viewRenglones) {
    viewRenglones.addEventListener('click', function() {
      go_to('renglones');
    });
  }

  if (viewCheck) {
    viewCheck.addEventListener('click', function() {
      go_to('cheques_y_movimientos');
      click_on_tab(1);
    });
  }

  if (viewDetails) {
    viewDetails.addEventListener('click', function() {
      go_to('cheques_y_movimientos');
      click_on_tab(2);
      });
  }

  function validate() {
    clave.addEventListener('input', validate_inputs);
    year.addEventListener('input', validate_inputs);
    name.addEventListener('input', validate_inputs);
    amount.addEventListener('input', validate_inputs);   
  }

  function validate_inputs() {
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
  }
});
