document.addEventListener('DOMContentLoaded', function() {
    const createBudgetline = document.getElementById('budget_create_budgetline');
    const createBudget = document.getElementById('createBudget');
    const viewCheck = document.getElementById('budget_view_check');
    const viewDetails = document.getElementById('budget_view_details');

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
            scrollToChecksSection();
        })    
    }
    if(viewDetails){
        viewCheck.addEventListener('click', function() {
            scrollToDetailsSection();
        })    
    }
    function scrollToChecksSection() {
        var targetSection = document.getElementById('tab1');
        if (targetSection) {
          targetSection.scrollIntoView({ behavior: 'smooth' });
        }
    }
    function scrollToDetailsSection() {
        var targetSection = document.getElementById('tab2');
        console.log('entro')
        if (targetSection) {
          targetSection.scrollIntoView({ behavior: 'smooth' });
        }
        else{
            console.log('fallo')
        }
    }

});  
