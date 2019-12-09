$(document).ready(function () {

    var lestras = /^[a-z]+$/i;
    var correos = /^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/;

    //Obtener el valor al dar click al boton registrar
    $("#registrar").click(function () {
        var nombre = $("#nombre").val();
        var Descripcion = $("#descripcion").val();
        var pes = $("#Peso").val();
        var cantg = $("#CantidadGeneral").val();
        var Tem = $("#Temperatura").val();
        var un = $("#txtTipo").val();
        var cat = $("#txtTipo2").val();
        var provedo = $("#txtp").val();
        //Nombre
        if (nombre === "") {
            $("#nombre").addClass('txterror');
            $("#lb1").addClass('labelerror');
            $("#nombre").addClass('alert alert-danger');
            $("#error3").fadeIn("slow");
            return false;
        } else if (!lestras.test(nombre)) {
            $("#nombre").addClass('txterror');
            $("#lb1").addClass('labelerror');
            $("#nombre").addClass('alert alert-danger');
            $("#error33").fadeIn("slow");
            return false;
        }
        //Descripcion
        if (Descripcion === "") {
            $("#descripcion").addClass('txterror');
            $("#lb2").addClass('labelerror');
            $("#descripcion").addClass('alert alert-danger');
            $("#error4").fadeIn("slow");
            return false;
        }

        if (un == "Unidad de Medida") {
            $("#txtTipo").addClass('txterror');
            $("#lb3").addClass('labelerror');
            $("#txtTipo").addClass('alert alert-danger');
            $("#error77").fadeIn("slow");
            return false;
        }
        //Peso 
        if (pes == "") {
            $('#Peso').addClass('txterror');
            $('#Peso').addClass('alert alert-danger');
            $('#lb4').addClass('labelerror');
            $("#errorPV").fadeIn("slow");
            return false;
        } else if (isNaN(pes)) {
            $("#Peso").addClass('txterror');
            $("#lb4").addClass('labelerror');
            $("#Peso").addClass('alert alert-danger');
            $("#errorPN").fadeIn("slow");
            return false;
        }
        //cantg 
        if (cantg == "") {
            $('#CantidadGeneral').addClass('txterror');
            $('#CantidadGeneral').addClass('alert alert-danger');
            $('#lb5').addClass('labelerror');
            $("#errorCGV").fadeIn("slow");
            return false;
        } else if (isNaN(cantg)) {
            $("#CantidadGeneral").addClass('txterror');
            $("#lb5").addClass('labelerror');
            $("#CantidadGeneral").addClass('alert alert-danger');
            $("#errorCGN").fadeIn("slow");
            return false;
        }
        //Temperatura 
        if (Tem == "") {
            $('#Temperatura').addClass('txterror');
            $('#Temperatura').addClass('alert alert-danger');
            $('#lb6').addClass('labelerror');
            $("#errorTV").fadeIn("slow");
            return false;
        } else if (isNaN(Tem)) {
            $("#Temperatura").addClass('txterror');
            $("#lb6").addClass('labelerror');
            $("#Temperatura").addClass('alert alert-danger');
            $("#errorTN").fadeIn("slow");
            return false;
        }
        if (cat == "Seleccione Categoria") {
            $("#txtTipo2").addClass('txterror');
            $("#lb7").addClass('labelerror');
            $("#txtTipo2").addClass('alert alert-danger');
            $("#error111").fadeIn("slow");
            return false;
        }
        if (provedo == "Seleccione Proveedor") {
            $("#txtp").addClass('txterror');
            $("#lb007").addClass('labelerror');
            $("#txtp").addClass('alert alert-danger');
            $("#error1111").fadeIn("slow");
            return false;
        }

    });
    //Nombre Ocultar
    $("#nombre").keyup(function () {
        $('#nombre').removeClass('alert alert-danger');
        $("#nombre").removeClass('txterror');
        $("#lb1").removeClass('labelerror');
    });

    //Descripcion Ocultar
    $("#descripcion").keyup(function () {
        $('#descripcion').removeClass('alert alert-danger');
        $("#descripcion").removeClass('txterror');
        $("#lb2").removeClass('labelerror');
    });
    //Peso Ocultar
    $("#Peso").keyup(function () {
        $('#Peso').removeClass('alert alert-danger');
        $("#Peso").removeClass('txterror');
        $("#lb4").removeClass('labelerror');
    });
    //Cantidad General Ocultar
    $("#CantidadGeneral").keyup(function () {
        $('#CantidadGeneral').removeClass('alert alert-danger');
        $("#CantidadGeneral").removeClass('txterror');
        $("#lb5").removeClass('labelerror');
    });
    //Cantidad General Ocultar
    $("#Temperatura").keyup(function () {
        $('#Temperatura').removeClass('alert alert-danger');
        $("#Temperatura").removeClass('txterror');
        $("#lb6").removeClass('labelerror');
    });
    //tipo Ocultar
    $("#txtTipo").click(function () {
        $('#txtTipo').removeClass('alert alert-danger');
        $("#txtTipo").removeClass('txterror');
        $("#lb3").removeClass('labelerror');
    });
    $("#txtTipo2").click(function () {
        $('#txtTipo2').removeClass('alert alert-danger');
        $("#txtTipo2").removeClass('txterror');
        $("#lb7").removeClass('labelerror');
    });
    $("#txtp").click(function () {
        $('#txtp').removeClass('alert alert-danger');
        $("#txtp").removeClass('txterror');
        $("#lb007").removeClass('labelerror');
    });
});





//Funcion para quitar el alerta-danger
function quitar2() {
    document.getElementById('error3').style.display = "none";
    document.getElementById('error33').style.display = "none";
    document.getElementById('error4').style.display = "none";
    document.getElementById('error77').style.display = "none";
    document.getElementById('errorPV').style.display = "none";
    document.getElementById('errorPN').style.display = "none";
    document.getElementById('errorCGV').style.display = "none";
    document.getElementById('errorCGN').style.display = "none";
    document.getElementById('errorTV').style.display = "none";
    document.getElementById('errorTN').style.display = "none";
    document.getElementById('error111').style.display = "none";
    document.getElementById('error1111').style.display = "none";
}