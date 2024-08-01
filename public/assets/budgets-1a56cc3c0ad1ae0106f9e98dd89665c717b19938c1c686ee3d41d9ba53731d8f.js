document.addEventListener('DOMContentLoaded', function() {
    const createBudgetline = document.getElementById('budget_create_budgetline');
    const createBudget = document.getElementById('createBudget');
    const viewCheck = document.getElementById('budget_view_check');
    const viewDetails = document.getElementById('budget_view_details');
    const viewRenglones = document.getElementById('budget_view_budgetline');
    const viewCheckDetail = document.getElementById('view_check_button');

    var botonIrArriba = document.getElementById('go-up-btn');
    var menuDesplegable = document.getElementById('menu-desplegable');
    var opciones = menuDesplegable.getElementsByTagName('li');
  
    botonIrArriba.addEventListener('click', function() {
      menuDesplegable.style.display = (menuDesplegable.style.display === 'none' || menuDesplegable.style.display === '') ? 'block' : 'none';
    });
  
    // Agregar manejadores de eventos a cada opción del menú
    for (var i = 0; i < opciones.length; i++) {
      opciones[i].addEventListener('click', function() {
        var opcionId = this.id;
        handleClick(opcionId);
      });
    }
  
  function handleClick(opcionId) {
    if (opcionId == 1){
        createBudgetline.click();
    }
    if (opcionId == 2){
        createcj.click();
    }
    if (opcionId == 3){
        createBudgetline.click();
    }

}
  
    if (createBudgetline) {
        createBudgetline.addEventListener('click', function() {
            $('#modalBudgetline').modal('show');
        })    
    }
    if (createBudget){
        createBudget.addEventListener('click', function() {
            $('#createBudgetModal').modal('show');
        })    
    }
    if(viewRenglones){
        viewRenglones.addEventListener('click', function() {
            go_to('renglones');
        })    
    }
    if(viewCheck){
        viewCheck.addEventListener('click', function() {
            go_to('cheques_y_movimientos');
            click_on_tab(1);
        })    
    }
    if(viewDetails){
        viewDetails.addEventListener('click', function() {
            go_to('cheques_y_movimientos');
            click_on_tab(2);
        })    
    }
    function go_to(id){
        var targetSection = document.getElementById(id);
        if (targetSection) {
            targetSection.scrollIntoView({ behavior: 'smooth' });
        }
    }
    function click_on_tab(id) {
        var tabs = {
            1: document.querySelector('.nav-tabs .nav-link[href="#tab1"]'),
            2: document.querySelector('.nav-tabs .nav-link[href="#tab2"]')
        };
        var otherTabId = (id === 1) ? 1 : 2;
    
        tabs[otherTabId].click();
    }
    document.querySelectorAll('.view-check-button').forEach(function(button) {
        button.addEventListener('click', function() {

          var check_available = 0;
          var suma = 0;
          var details = '';
          var targetModalId = button.getAttribute('data-element-id');
          var checks_raw = button.getAttribute('data-checks');
          var checks = JSON.parse(checks_raw);
          var details_raw = button.getAttribute('data-details');
          details = JSON.parse(details_raw);
          var budgetlines_raw = button.getAttribute('data-budgetlines');
          var budgetlines = JSON.parse(budgetlines_raw);
      
          var modalNumber = targetModalId.replace(/\D/g, '');

          var targetCheck = checks.find(function(check) {
            return check.IdInterno === parseInt(modalNumber);
          });

          var targetDetails = details.filter(function(details_) {
            return details_.IdInternoCheque === parseInt(targetCheck['IdInterno']);
          });

          for (var i = 0; i < targetDetails.length; i++) {
            suma += targetDetails[i]["importe_renglon"]
            }
            check_available = targetCheck["Total"];
            if (suma > 0) {
                check_available = targetCheck["Total"] - suma;
            }
                      
          var tituloModal = targetCheck["num_cheque"] + ' - ' + targetCheck["concepto_cheque"];
          $('#view_check_modal').on('show.bs.modal', function (event) {
            $('#view_check_modal .modal-title').text(tituloModal).addClass('text-center');
            var contenidoHtml = `
            <div class="cheque-info">
                <div>
                <label><strong>Número de Cheque:</strong></label>
                <span id="cheque_number_value">${targetCheck["num_cheque"]}</span>
                </div>
                <div>
                <label><strong>Concepto:</strong></label>
                <span id="total_value">${targetCheck["concepto_cheque"]}</span>
                </div>
                <div>
                <label><strong>Total:</strong></label>
                <span id="total" style="color: green;">${new Intl.NumberFormat('es-MX', { style: 'currency', currency: 'MXN' }).format(targetCheck["Total"])}</span>
                </div>
                <div>
                <label><strong>Disponible:</strong></label>
                <span id="available" style="color: green;">${new Intl.NumberFormat('es-MX', { style: 'currency', currency: 'MXN' }).format(check_available)}</span>
                </div>
            </div>`;
            $('#view_check_modal .modal-body').html(contenidoHtml);
            var tablaHtml = '<table class="table">';
            tablaHtml += '<thead><tr><th>Concepto</th><th>Importe</th></tr></thead>';
            tablaHtml += '<tbody>';
            if (targetDetails && targetDetails.length > 0) {
              targetDetails.forEach(function (detalle) {
                tablaHtml += '<tr>';
                tablaHtml += '<td>' + detalle["description"] + '</td>';
                tablaHtml += '<td style="color: ' + (detalle["importe_renglon"] >= 0 ? 'green' : 'red') + ';">' + detalle["importe_renglon"].toLocaleString('es-MX', { style: 'currency', currency: 'MXN' }) + '</td>';
                tablaHtml += '</tr>';
            });
            } else {
              tablaHtml += '<tr><td colspan="2">No se encontraron movimientos aún.</td></tr>';
            }
            
            tablaHtml += '</tbody></table>';
            $('#view_check_modal .modal-body').append(tablaHtml);
        });
        
          $('#view_check_modal').modal('show');
        });
      });
});  
