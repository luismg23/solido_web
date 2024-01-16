document.addEventListener('DOMContentLoaded', function() {
    const pendingButton = document.getElementById('link_to_pendingModal');
  
    pendingButton.addEventListener('click', function() {
        $('#pendingModal').modal('show');
    })
});  
