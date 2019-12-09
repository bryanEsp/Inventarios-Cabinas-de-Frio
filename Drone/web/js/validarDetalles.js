$(document).ready(function () {

    var lestras = /^[a-z]+$/i;
    var correos = /^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/;
    //Obtener el valor al dar click al boton registrar
    $("#btF").click(function () {
        var longitud = $("#txt2").val();
        var descrip = $("#txt3").val();

        var tabla = document.getElementById('tablaprueba');
        indice = document.getElementById("txt1").selectedIndex;
        indice2 = document.getElementById("txt4").selectedIndex;
        //longitud 
        if (tabla.rows.length == 1) {
            if (indice == null || indice == 0) {
                $("#txt1").addClass('txterror');
                $("#lb2").addClass('labelerror');
                $("#txt1").addClass('alert alert-danger');
                $("#error33").fadeIn("slow");
                return false;
            }

            if (longitud == "") {
                $('#txt2').addClass('txterror');
                $('#txt2').addClass('alert alert-danger');
                $('#lb1').addClass('labelerror');
                $("#error3").fadeIn("slow");
                return false;
            } else if (isNaN(longitud)) {
                $("#txt2").addClass('txterror');
                $("#lb1").addClass('labelerror');
                $("#txt2").addClass('alert alert-danger');
                $("#error333").fadeIn("slow");
                return false;
            }
            if (descrip == "") {
                $('#txt3').addClass('txterror');
                $('#txt3').addClass('alert alert-danger');
                $('#lb3').addClass('labelerror');
                $("#error01").fadeIn("slow");
                return false;
            }
            if (indice2 == null || indice2 == 0) {
                $("#txt4").addClass('txterror');
                $("#lb4").addClass('labelerror');
                $("#txt4").addClass('alert alert-danger');
                $("#error03").fadeIn("slow");
                return false;
            }
        }
        if (tabla.rows.length == 1) {
            $("#tablaprueba").addClass('txterror');
            $("#tablaprueba").addClass('alert alert-danger');
            $("#error3333").fadeIn("slow");
            return false;
        }

    });


//longitud
    $("#txt2").keyup(function () {
        $('#txt2').removeClass('alert alert-danger');
        $("#txt2").removeClass('txterror');
        $("#lb1").removeClass('labelerror');
    });
    $("#txt3").keyup(function () {
        $('#txt3').removeClass('alert alert-danger');
        $("#txt3").removeClass('txterror');
        $("#lb3").removeClass('labelerror');
    });
    // Ocultar altitud
    $("#txt1").click(function () {
        $('#txt1').removeClass('alert alert-danger');
        $("#txt1").removeClass('txterror');
        $("#lb2").removeClass('labelerror');
    });
    $("#txt4").click(function () {
        $('#txt4').removeClass('alert alert-danger');
        $("#txt4").removeClass('txterror');
        $("#lb4").removeClass('labelerror');
    });

});
//Funcion para quitar el alerta-danger
function quitar() {
    document.getElementById('error3').style.display = "none";
    document.getElementById('error33').style.display = "none";
    document.getElementById('error333').style.display = "none";
    document.getElementById('error01').style.display = "none";
    document.getElementById('error03').style.display = "none";

}


