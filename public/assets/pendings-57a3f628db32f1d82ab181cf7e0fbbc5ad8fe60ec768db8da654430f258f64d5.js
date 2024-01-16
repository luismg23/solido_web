document.addEventListener('DOMContentLoaded', function() {
    const pendingButton = document.getElementById('link_to_pendingModal');
  
    pendingButton.addEventListener('click', function() {
        console.log('entra0')
        $('#pendingModal').modal('show');
    })
});  
