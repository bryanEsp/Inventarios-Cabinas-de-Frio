$(document).ready(function () {

    var lestras = /^[a-z]+$/i;
    var correos = /^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/;

    //Obtener el valor al dar click al boton registrar
    $("#registrar").click(function () {
        var nombre = $("#txtNombre").val();
        var numDocumento = $("#txtDocumento").val();
        var tipoDocumento = $("#txtTipo").val();
        var apellido = $("#txtApellido").val();
        var celular = $("#txtcelular").val();
        var dire = $("#txtdireccion").val();
        var correo = $("#txtcorreo").val();
        var clave = $("#txtclave").val();
        //Documento 


        //Nombre
        if (nombre == "") {
            $("#txtNombre").addClass('txterror');
            $("#lb3").addClass('labelerror');
            $("#txtNombre").addClass('alert alert-danger');
            $("#error3").fadeIn("slow");
            return false;
        } else if (!lestras.test(nombre)) {
            $("#txtNombre").addClass('txterror');
            $("#lb3").addClass('labelerror');
            $("#txtNombre").addClass('alert alert-danger');
            $("#error33").fadeIn("slow");
            return false;
        }
        //Apellido
        else if (apellido == "") {
            $("#txtApellido").addClass('txterror');
            $("#lb4").addClass('labelerror');
            $("#txtApellido").addClass('alert alert-danger');
            $("#error4").fadeIn("slow");
            return false;
        } else if (!lestras.test(apellido)) {
            $("#txtApellido").addClass('txterror');
            $("#lb4").addClass('labelerror');
            $("#txtApellido").addClass('alert alert-danger');
            $("#error44").fadeIn("slow");
            return false;
        }
        //Celular 
        if (celular == "") {
            $('#txtcelular').addClass('txterror');
            $('#txtcelular').addClass('alert alert-danger');
            $('#lb5').addClass('labelerror');
            $("#error5").fadeIn("slow");
            return false;
        } else if (isNaN(celular)) {
            $("#txtcelular").addClass('txterror');
            $("#lb5").addClass('labelerror');
            $("#txtcelular").addClass('alert alert-danger');
            $("#error55").fadeIn("slow");
            return false;
        }
        //Direccion
        else if (dire == "") {
            $('#txtdireccion').addClass('txterror');
            $('#txtdireccion').addClass('alert alert-danger');
            $('#lb6').addClass('labelerror');
            $("#error6").fadeIn("slow");
            return false;
        }
        //Correo
        else if (correo == "") {
            $('#txtcorreo').addClass('txterror');
            $('#txtcorreo').addClass('alert alert-danger');
            $('#lb7').addClass('labelerror');
            $("#error7").fadeIn("slow");
            return false;
        } else if (!correos.test(correo)) {
            $("#txtcorreo").addClass('txterror');
            $("#lb7").addClass('labelerror');
            $("#txtcorreo").addClass('alert alert-danger');
            $("#error77").fadeIn("slow");
            return false;
        }
        if (clave == "") {
            $("#txtclave").addClass('txterror');
            $("#lb8").addClass('labelerror');
            $("#txtclave").addClass('alert alert-danger');
            $("#error8").fadeIn("slow");
            return false;
        } else if (clave2 < 8) {
            $("#txtclave").addClass('txterror');
            $("#lb8").addClass('labelerror');
            $("#txtclave").addClass('alert alert-danger');
            $("#error02").fadeIn("slow");
            return false;
        }
        // Cargo 


    });
    //Nombre Ocultar
    $("#txtNombre").keyup(function () {
        $('#txtNombre').removeClass('alert alert-danger');
        $("#txtNombre").removeClass('txterror');
        $("#lb3").removeClass('labelerror');
    });
    // Ocultar Numero documento
    $("#txtDocumento").keyup(function () {
        $('#txtDocumento').removeClass('alert alert-danger');
        $("#txtDocumento").removeClass('txterror');
        $("#lb1").removeClass('labelerror');
    });
    // Ocultar tipo documento
    $("#txtTipo").click(function () {
        $('#txtTipo').removeClass('alert alert-danger');
        $("#txtTipo").removeClass('txterror');
        $("#lb2").removeClass('labelerror');
    });
    //Apellido Ocultar
    $("#txtApellido").keyup(function () {
        $('#txtApellido').removeClass('alert alert-danger');
        $("#txtApellido").removeClass('txterror');
        $("#lb4").removeClass('labelerror');
    });
    //Celular Ocultar
    $("#txtcelular").keyup(function () {
        $('#txtcelular').removeClass('alert alert-danger');
        $("#txtcelular").removeClass('txterror');
        $("#lb5").removeClass('labelerror');
    });
    //Direccion Ocultar
    $("#txtdireccion").keyup(function () {
        $('#txtdireccion').removeClass('alert alert-danger');
        $("#txtdireccion").removeClass('txterror');
        $("#lb6").removeClass('labelerror');
    });
    //Correo Ocultar
    $("#txtcorreo").keyup(function () {
        $('#txtcorreo').removeClass('alert alert-danger');
        $("#txtcorreo").removeClass('txterror');
        $("#lb7").removeClass('labelerror');
    });
    $("#txtclave").keyup(function () {
        $('#txtclave').removeClass('alert alert-danger');
        $("#txtclave").removeClass('txterror');
        $("#lb8").removeClass('labelerror');
    });

    //cargo Ocultar
    $("#txtCargo").click(function () {
        $('#txtCargo').removeClass('alert alert-danger');
        $("#txtCargo").removeClass('txterror');
        $("#lb9").removeClass('labelerror');
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
    document.getElementById('error8').style.display = "none";
    document.getElementById('error4').style.display = "none";
    document.getElementById('error44').style.display = "none";
    document.getElementById('error5').style.display = "none";
    document.getElementById('error55').style.display = "none";
    document.getElementById('error6').style.display = "none";
    document.getElementById('error7').style.display = "none";
    document.getElementById('error77').style.display = "none";
    document.getElementById('error9').style.display = "none";
    document.getElementById('error09').style.display = "none";
    document.getElementById('error02').style.display = "none";
}
