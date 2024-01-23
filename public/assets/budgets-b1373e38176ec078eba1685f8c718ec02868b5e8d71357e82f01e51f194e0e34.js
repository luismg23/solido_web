document.addEventListener('DOMContentLoaded', function() {
    const createBudgetline = document.getElementById('budget_create_budgetline');
    const createBudget = document.getElementById('createBudget');
    const viewCheck = document.getElementById('budget_view_check');

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
    if(viewCheck){
        viewCheck.addEventListener('click', function() {
            $('#viewCheckModal').modal('show');
        })    

    }

});  
