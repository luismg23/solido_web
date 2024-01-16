document.addEventListener('DOMContentLoaded', function() {
    const createBudgetline = document.getElementById('budget_create_budgetline');
    const createBudget = document.getElementById('createBudget');
    
    if (createBudgetline) {
        createBudgetline.addEventListener('click', function() {
            $('#modalBudgetline').modal('show');
        })    
    }
    if (createBudget){
        createBudget.addEventListener('click', function() {
            console.log('daaa')
            $('#createBudget').modal('show');
        })    
    }

});  
