document.addEventListener('DOMContentLoaded', function() {
    const createBudgetline = document.getElementById('budget_create_budgetline');
    const createBudget = document.getElementById('createBudget');

    createBudgetline.addEventListener('click', function() {
        $('#modalBudgetline').modal('show');
    })
    createBudget.addEventListener('click', function() {
        $('#modalBudget').modal('show');
        console.log('entra')
    })

});  
