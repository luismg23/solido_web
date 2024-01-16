document.addEventListener('DOMContentLoaded', function() {
    const crearButton = document.getElementById('budget_create_budgetline');
  
    crearButton.addEventListener('click', function() {
        $('#modalBudgetline').modal('show');
    })
});  
