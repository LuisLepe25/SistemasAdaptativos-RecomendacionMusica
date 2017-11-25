$(document).ready(function () {
    var email = document.getElementById("email");
    var lblEmail = document.getElementById("lblEmail");
    if (email.value != null) {
        $(lblEmail).addClass("active");
    }
    else {
        alert("error al actualizar");
    }
});