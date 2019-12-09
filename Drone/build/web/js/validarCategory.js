$(document).ready(function () {

    var lestras = / ^ [a-z, .’-] $ /;
    var correos = /^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/;

    //Obtener el valor al dar click al boton registrar
    $("#cate").click(function () {
        var nombre = $("#txtnomvre").val();
        var descripcion = $("#txtde").val();

        if (nombre == "") {
            $('#txtnomvre').addClass('txterror');
            $('#txtnomvre').addClass('alert alert-danger');
            $('#lb01').addClass('labelerror');
            $("#error23").fadeIn("slow");
            return false;
        }
        
        if (descripcion == "") {
            $('#txtde').addClass('txterror');
            $('#txtde').addClass('alert alert-danger');
            $('#lb02').addClass('labelerror');
            $("#error04").fadeIn("slow");
            return false;
        }
    });

    $("#txtnomvre").keyup(function () {
        $('#txtnomvre').removeClass('alert alert-danger');
        $("#txtnomvre").removeClass('txterror');
        $("#lb01").removeClass('labelerror');
    });

    $("#txtde").keyup(function () {
        $('#txtde').removeClass('alert alert-danger');
        $("#txtde").removeClass('txterror');
        $("#lb02").removeClass('labelerror');
    });
});

function quitar() {
    document.getElementById('error23').style.display = "none";
    document.getElementById('error133').style.display = "none";
    document.getElementById('error04').style.display = "none";
}