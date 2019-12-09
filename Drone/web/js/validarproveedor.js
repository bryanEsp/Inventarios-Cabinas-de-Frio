$(document).ready(function () {

    var lestras = /^[a-z]+$/i;
    var correos = /^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/;
    //Obtener el valor al dar click al boton registrar
    $("#registrar").click(function () {
        var nombre = $("#txtnombre").val();
        var nit = $("#txtnit").val();
        var celular = $("#txtcelular").val();
        var direccion = $("#txtdireccion").val();
        var correo = $("#txtcorreo").val();


        //longitud 
        if (nombre == "") {
            $('#txtnombre').addClass('txterror');
            $('#txtnombre').addClass('alert alert-danger');
            $('#lb3').addClass('labelerror');
            $("#error3").fadeIn("slow");
            return false;
        } else if (!lestras.test(nombre)) {
            $("#txtnombre").addClass('txterror');
            $("#lb3").addClass('labelerror');
            $("#txtnombre").addClass('alert alert-danger');
            $("#error33").fadeIn("slow");
            return false;
        }
// NIT


        if (nit == "") {
            $('#txtnit').addClass('txterror');
            $('#txtnit').addClass('alert alert-danger');
            $('#lb4').addClass('labelerror');
            $("#error4").fadeIn("slow");
            return false;
        } else if (isNaN(nit)) {
            $("#txtnit").addClass('txterror');
            $("#lb4").addClass('labelerror');
            $("#txtnit").addClass('alert alert-danger');
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

//Direcicon 
        if (direccion == "") {
            $('#txtdireccion').addClass('txterror');
            $('#txtdireccion').addClass('alert alert-danger');
            $('#lb6').addClass('labelerror');
            $("#error6").fadeIn("slow");
            return false;
        }

           //Correo
            else if (correo==""){
                    $('#txtcorreo').addClass('txterror');
                    $('#txtcorreo').addClass('alert alert-danger');
                    $('#lb7').addClass('labelerror');
                    $("#error7").fadeIn("slow");
                    return false;
                } else if(!correos.test(correo)){
                      $("#txtcorreo").addClass('txterror');
                      $("#lb7").addClass('labelerror');
                      $("#txtcorreo").addClass('alert alert-danger');
                      $("#error77").fadeIn("slow");
                      return false;
                }
      
    });


//nombre
    $("#txtnombre").keyup(function () {
        $('#txtnombre').removeClass('alert alert-danger');
        $("#txtnombre").removeClass('txterror');
        $("#lb3").removeClass('labelerror');
    });
    // NIT
    $("#txtnit").keyup(function () {
        $('#txtnit').removeClass('alert alert-danger');
        $("#txtnit").removeClass('txterror');
        $("#lb4").removeClass('labelerror');
    });
    // CELULAR
    $("#txtcelular").keyup(function () {
        $('#txtcelular').removeClass('alert alert-danger');
        $("#txtcelular").removeClass('txterror');
        $("#lb5").removeClass('labelerror');
    });
    //DIRECCION
    $("#txtdireccion").keyup(function () {
        $('#txtdireccion').removeClass('alert alert-danger');
        $("#txtdireccion").removeClass('txterror');
        $("#lb6").removeClass('labelerror');
    });
    //CORREO
    $("#txtcorreo").keyup(function () {
        $('#txtcorreo').removeClass('alert alert-danger');
        $("#txtcorreo").removeClass('txterror');
        $("#lb7").removeClass('labelerror');
    });
});
//Funcion para quitar el alerta-danger
function quitar() {
    document.getElementById('error3').style.display = "none";
    document.getElementById('error33').style.display = "none";
    document.getElementById('error4').style.display = "none";
    document.getElementById('error44').style.display = "none";
    document.getElementById('error5').style.display = "none";
    document.getElementById('error55').style.display = "none";
    document.getElementById('error6').style.display = "none";
    document.getElementById('error7').style.display = "none";
    document.getElementById('error77').style.display = "none";
}


