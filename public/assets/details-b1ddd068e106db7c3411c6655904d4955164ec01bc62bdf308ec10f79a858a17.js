document.addEventListener('DOMContentLoaded', function() {
    const crearDetail = document.getElementById('budget_create_detail');
  
    crearDetail.addEventListener('click', function() {
        $('#modalDetail').modal('show');
        console.log('da')
    })
});  
