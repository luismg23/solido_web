document.addEventListener('DOMContentLoaded', function() {
    const pendingButton = document.getElementById('openModalLink');
  
    pendingButton.addEventListener('click', function() {
        console.log('entra0')
        $('#pendingModal').modal('show');
    })
});  
