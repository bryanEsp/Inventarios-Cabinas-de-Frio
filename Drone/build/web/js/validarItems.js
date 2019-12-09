$(document).ready(function () {

    var lestras = /^[a-z]+$/i;
    var correos = /^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/;
    //Obtener el valor al dar click al boton registrar
    $("#registrar").click(function () {
        var barras = $("#barras").val();
        var Fecha_vencimiento = $("#txtfecha").val();
        var cantidad = $("#txtcantidad").val();
        var observacion = $("#txtobservacion").val();
        var lote = $("#txtlote").val();
        var fecha_ingreso = $("#txtingresofechahor").val();
        var embalaje = $("#txtembalaje").val();
        var cod_producto = $("#txtproducto").val();
        var cuarto_frio = $("#txtcuartofrio").val();
        var estante = $("#txtestante").val();
        var nivel = $("#txtnivel").val();
        var pro = $("#txtprofundidad").val();



        var x = new Date();
        var y = new Date(Fecha_vencimiento);
        //longitud 

//temperatura
        if (barras == "") {
            $("#barras").addClass('txterror');
            $("#lb444").addClass('labelerror');
            $("#barras").addClass('alert alert-danger');
            $("#error45").fadeIn("slow");
            return false;
        } else if (isNaN(barras)) {
            $("#barras").addClass('txterror');
            $("#lb444").addClass('labelerror');
            $("#barras").addClass('alert alert-danger');
            $("#error445").fadeIn("slow");
            return false;
        }


        if (Fecha_vencimiento == "") {
            $('#txtfecha').addClass('txterror');
            $('#txtfecha').addClass('alert alert-danger');
            $('#lb1').addClass('labelerror');
            $("#error3").fadeIn("slow");
            return false;
        } else if (x > y) {
            $('#txtfecha').addClass('txterror');
            $('#txtfecha').addClass('alert alert-danger');
            $('#lb1').addClass('labelerror');
            $("#error").fadeIn("slow");
            return false;
        }


//institucion 
        if (cantidad == "") {
            $('#txtcantidad').addClass('txterror');
            $('#txtcantidad').addClass('alert alert-danger');
            $('#lb5').addClass('labelerror');
            $("#error555").fadeIn("slow");
            return false;
        } else if (isNaN(cantidad)) {
            $("#txtcantidad").addClass('txterror');
            $("#lb5").addClass('labelerror');
            $("#txtcantidad").addClass('alert alert-danger');
            $("#error77").fadeIn("slow");
            return false;
        }


//institucion 
        if (observacion == "") {
            $('#txtobservacion').addClass('txterror');
            $('#txtobservacion').addClass('alert alert-danger');
            $('#lb6').addClass('labelerror');
            $("#error8").fadeIn("slow");
            return false;
        }
        //institucion 
        if (lote == "") {
            $('#txtlote').addClass('txterror');
            $('#txtlote').addClass('alert alert-danger');
            $('#lb7').addClass('labelerror');
            $("#error9").fadeIn("slow");
            return false;
        }

        //institucion 
        if (embalaje == "") {
            $('#txtembalaje').addClass('txterror');
            $('#txtembalaje').addClass('alert alert-danger');
            $('#lb9').addClass('labelerror');
            $("#error13").fadeIn("slow");
            return false;
        }

        //institucion 
        if (cod_producto == "") {
            $('#txtproducto').addClass('txterror');
            $('#txtproducto').addClass('alert alert-danger');
            $('#lb10').addClass('labelerror');
            $("#error15").fadeIn("slow");
            return false;
        } else if (isNaN(cod_producto)) {
            $("#txtproducto").addClass('txterror');
            $("#lb10").addClass('labelerror');
            $("#txtproducto").addClass('alert alert-danger');
            $("#error16").fadeIn("slow");
            return false;
        }

        //institucion 
        if (cuarto_frio == "") {
            $('#txtcuartofrio').addClass('txterror');
            $('#txtcuartofrio').addClass('alert alert-danger');
            $('#lb11').addClass('labelerror');
            $("#error17").fadeIn("slow");
            return false;
        } else if (isNaN(cuarto_frio)) {
            $("#txtcuartofrio").addClass('txterror');
            $("#lb11").addClass('labelerror');
            $("#txtcuartofrio").addClass('alert alert-danger');
            $("#error18").fadeIn("slow");
            return false;
        }

        // Altitud
        else if (estante == "" || estante == null ) {
            $("#txtestante").addClass('txterror');
            $("#lb2").addClass('labelerror');
            $("#txtestante").addClass('alert alert-danger');
            $("#error5").fadeIn("slow");
            return false;
        }

//temperatura
        else if (nivel == "") {
            $("#txtnivel").addClass('txterror');
            $("#lb3").addClass('labelerror');
            $("#txtnivel").addClass('alert alert-danger');
            $("#error6").fadeIn("slow");
            return false;
        }
//estado_cuarto
        else if (pro == "") {
            $("#txtprofundidad").addClass('txterror');
            $("#lb4").addClass('labelerror');
            $("#txtprofundidad").addClass('alert alert-danger');
            $("#error4").fadeIn("slow");
            return false;
        }
    });



    // Ocultar altitud
    $("#barras").keyup(function () {
        $('#barras').removeClass('alert alert-danger');
        $("#barras").removeClass('txterror');
        $("#lb444").removeClass('labelerror');
    });
//longitud
    $("#txtfecha").click(function () {
        $('#txtfecha').removeClass('alert alert-danger');
        $("#txtfecha").removeClass('txterror');
        $("#lb1").removeClass('labelerror');
    });

    // Ocultar altitud
    $("#txtestante").click(function () {
        $('#txtestante').removeClass('alert alert-danger');
        $("#txtestante").removeClass('txterror');
        $("#lb2").removeClass('labelerror');
    });
    // Ocultar temperatura
    $("#txtnivel").click(function () {
        $('#txtnivel').removeClass('alert alert-danger');
        $("#txtnivel").removeClass('txterror');
        $("#lb3").removeClass('labelerror');
    });
    //Apellido estado
    $("#txtprofundidad").click(function () {
        $('#txtprofundidad').removeClass('alert alert-danger');
        $("#txtprofundidad").removeClass('txterror');
        $("#lb4").removeClass('labelerror');
    });
    //institucion Ocultar
    $("#txtcantidad").keyup(function () {
        $('#txtcantidad').removeClass('alert alert-danger');
        $("#txtcantidad").removeClass('txterror');
        $("#lb5").removeClass('labelerror');
    });
    //institucion Ocultar
    $("#txtobservacion").keyup(function () {
        $('#txtobservacion').removeClass('alert alert-danger');
        $("#txtobservacion").removeClass('txterror');
        $("#lb6").removeClass('labelerror');
    });
    //institucion Ocultar
    $("#txtlote").keyup(function () {
        $('#txtlote').removeClass('alert alert-danger');
        $("#txtlote").removeClass('txterror');
        $("#lb7").removeClass('labelerror');
    });

    //institucion Ocultar
    $("#txtembalaje").keyup(function () {
        $('#txtembalaje').removeClass('alert alert-danger');
        $("#txtembalaje").removeClass('txterror');
        $("#lb9").removeClass('labelerror');
    });
    //institucion Ocultar
    $("#txtproducto").click(function () {
        $('#txtproducto').removeClass('alert alert-danger');
        $("#txtproducto").removeClass('txterror');
        $("#lb10").removeClass('labelerror');
    });
    //institucion Ocultar
    $("#txtcuartofrio").click(function () {
        $('#txtcuartofrio').removeClass('alert alert-danger');
        $("#txtcuartofrio").removeClass('txterror');
        $("#lb11").removeClass('labelerror');
    });
});
//Funcion para quitar el alerta-danger
function quitar() {
    document.getElementById('error').style.display = "none";
    document.getElementById('error3').style.display = "none";
    document.getElementById('error11').style.display = "none";
    document.getElementById('error4').style.display = "none";
    document.getElementById('error5').style.display = "none";
    document.getElementById('error77').style.display = "none";
    document.getElementById('error8').style.display = "none";
    document.getElementById('error9').style.display = "none";
    document.getElementById('error6').style.display = "none";
    document.getElementById('error13').style.display = "none";
    document.getElementById('error15').style.display = "none";//
    document.getElementById('error16').style.display = "none";
    document.getElementById('error17').style.display = "none";
    document.getElementById('error18').style.display = "none";
    document.getElementById('error555').style.display = "none";
    document.getElementById('error45').style.display = "none";
    document.getElementById('error445').style.display = "none";
}


