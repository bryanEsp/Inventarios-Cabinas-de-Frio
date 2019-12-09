$(document).ready(function () {

    var lestras = /^[a-z]+$/i;
    var correos = /^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/;
    //Obtener el valor al dar click al boton registrar
    $("#registrar").click(function () {
        var longitud = $("#txtlongitud").val();
        var altitud = $("#txtaltitud").val();
        var temperatura = $("#txttemperatura").val();
        var estado_cuarto = $("#txtestado").val();
        var estante = $("#txte").val();
        var profunddidad = $("#txtp").val();
        var nivel = $("#txtn").val();
        var insti = $("#txtTipo").val();

        //longitud 
        if (longitud == "") {
            $('#txtlongitud').addClass('txterror');
            $('#txtlongitud').addClass('alert alert-danger');
            $('#lb3').addClass('labelerror');
            $("#error3").fadeIn("slow");
            return false;
        } else if (isNaN(longitud)) {
            $("#txtlongitud").addClass('txterror');
            $("#lb3").addClass('labelerror');
            $("#txtlongitud").addClass('alert alert-danger');
            $("#error11").fadeIn("slow");
            return false;
        }

// Altitud
        else if (altitud == "") {
            $("#txtaltitud").addClass('txterror');
            $("#lb4").addClass('labelerror');
            $("#txtaltitud").addClass('alert alert-danger');
            $("#error7").fadeIn("slow");
            return false;
        } else if (isNaN(altitud)) {
            $("#txtaltitud").addClass('txterror');
            $("#lb4").addClass('labelerror');
            $("#txtaltitud").addClass('alert alert-danger');
            $("#error9").fadeIn("slow");
            return false;
        }

//temperatura
        else if (temperatura == "") {
            $("#txttemperatura").addClass('txterror');
            $("#lb5").addClass('labelerror');
            $("#txttemperatura").addClass('alert alert-danger');
            $("#error8").fadeIn("slow");
            return false;
        } else if (isNaN(temperatura)) {
            $("#txttemperatura").addClass('txterror');
            $("#lb5").addClass('labelerror');
            $("#txttemperatura").addClass('alert alert-danger');
            $("#error33").fadeIn("slow");
            return false;
        }
//estado_cuarto
        else if (estado_cuarto == "") {
            $("#txtestado").addClass('txterror');
            $("#lb6").addClass('labelerror');
            $("#txtestado").addClass('alert alert-danger');
            $("#error4").fadeIn("slow");
            return false;
        } else if (!lestras.test(estado_cuarto)) {
            $("#txtestado").addClass('txterror');
            $("#lb6").addClass('labelerror');
            $("#txtestado").addClass('alert alert-danger');
            $("#error44").fadeIn("slow");
            return false;
        }

        //Estantes
        else if (estante == "") {
            $("#txte").addClass('txterror');
            $("#lb8").addClass('labelerror');
            $("#txte").addClass('alert alert-danger');
            $("#error01").fadeIn("slow");
            return false;
        } else if (isNaN(estante)) {
            $("#txte").addClass('txterror');
            $("#lb8").addClass('labelerror');
            $("#txte").addClass('alert alert-danger');
            $("#error02").fadeIn("slow");
            return false;
        } else if (estante > 26) {
            $("#txte").addClass('txterror');
            $("#lb8").addClass('labelerror');
            $("#txte").addClass('alert alert-danger');
            $("#error07").fadeIn("slow");
            return false;
        }
        //Profundidad
        else if (profunddidad == "") {
            $("#txtp").addClass('txterror');
            $("#lb9").addClass('labelerror');
            $("#txtp").addClass('alert alert-danger');
            $("#error03").fadeIn("slow");
            return false;
        } else if (isNaN(profunddidad)) {
            $("#txtp").addClass('txterror');
            $("#lb9").addClass('labelerror');
            $("#txtp").addClass('alert alert-danger');
            $("#error04").fadeIn("slow");
            return false;
        }
        //Niveles
        else if (nivel == "") {
            $("#txtn").addClass('txterror');
            $("#lb10").addClass('labelerror');
            $("#txtn").addClass('alert alert-danger');
            $("#error05").fadeIn("slow");
            return false;
        } else if (isNaN(nivel)) {
            $("#txtn").addClass('txterror');
            $("#lb10").addClass('labelerror');
            $("#txtn").addClass('alert alert-danger');
            $("#error06").fadeIn("slow");
            return false;
        }
//institucion 
        if (insti == "") {
            $("#txtTipo").addClass('txterror');
            $("#lb232").addClass('labelerror');
            $("#txtTipo").addClass('alert alert-danger');
            $("#error09").fadeIn("slow");
            return false;
        }


    });


//longitud
    $("#txtlongitud").keyup(function () {
        $('#txtlongitud').removeClass('alert alert-danger');
        $("#txtlongitud").removeClass('txterror');
        $("#lb3").removeClass('labelerror');
    });
    // Ocultar altitud
    $("#txtaltitud").keyup(function () {
        $('#txtaltitud').removeClass('alert alert-danger');
        $("#txtaltitud").removeClass('txterror');
        $("#lb4").removeClass('labelerror');
    });
    // Ocultar temperatura
    $("#txttemperatura").click(function () {
        $('#txttemperatura').removeClass('alert alert-danger');
        $("#txttemperatura").removeClass('txterror');
        $("#lb5").removeClass('labelerror');
    });
    //Apellido estado
    $("#txtestado").keyup(function () {
        $('#txtestado').removeClass('alert alert-danger');
        $("#txtestado").removeClass('txterror');
        $("#lb6").removeClass('labelerror');
    });

    // Ocultar Estante
    $("#txte").click(function () {
        $('#txte').removeClass('alert alert-danger');
        $("#txte").removeClass('txterror');
        $("#lb8").removeClass('labelerror');
    });
    // Ocultar Profundidad
    $("#txtp").click(function () {
        $('#txtp').removeClass('alert alert-danger');
        $("#txtp").removeClass('txterror');
        $("#lb9").removeClass('labelerror');
    });
    // Ocultar Nivel
    $("#txtn").click(function () {
        $('#txtn').removeClass('alert alert-danger');
        $("#txtn").removeClass('txterror');
        $("#lb10").removeClass('labelerror');
    });
    //institucion Ocultar
    $("#txtinstitucion").keyup(function () {
        $('#txtinstitucion').removeClass('alert alert-danger');
        $("#txtinstitucion").removeClass('txterror');
        $("#lb7").removeClass('labelerror');
    });
    $("#txtTipo").click(function () {
        $('#txtTipo').removeClass('alert alert-danger');
        $("#txtTipo").removeClass('txterror');
        $("#lb232").removeClass('labelerror');
    });
});
//Funcion para quitar el alerta-danger
function quitar() {
    document.getElementById('error3').style.display = "none";
    document.getElementById('error33').style.display = "none";
    document.getElementById('error11').style.display = "none";
    document.getElementById('error4').style.display = "none";
    document.getElementById('error7').style.display = "none";
    document.getElementById('error8').style.display = "none";
    document.getElementById('error9').style.display = "none";
    document.getElementById('error44').style.display = "none";
    document.getElementById('error01').style.display = "none";
    document.getElementById('error02').style.display = "none";
    document.getElementById('error03').style.display = "none";
    document.getElementById('error04').style.display = "none";
    document.getElementById('error05').style.display = "none";
    document.getElementById('error06').style.display = "none";
    document.getElementById('error09').style.display = "none";
    document.getElementById('error07').style.display = "none";

}


