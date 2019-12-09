$(document).ready(function () {

    var lestras = / ^ [a-z, .’-] $ /;
    var correos = /^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/;

    //Obtener el valor al dar click al boton registrar
    $("#registrar").click(function () {
        var nombre = $("#txtNombre").val();
        var celular = $("#txtcelular").val();
        var dire = $("#txtdireccion").val();
        var operacion = true;
        //Nombre
        if (nombre == "") {
            $("#txtNombre").addClass('txterror');
            $("#lb3").addClass('labelerror');
            $("#txtNombre").addClass('alert alert-danger');
            $("#error3").slideToggle();
            operacion = false;
        }

        //Celular 
        if (celular == "") {
            $('#txtcelular').addClass('txterror');
            $('#txtcelular').addClass('alert alert-danger');
            $('#lb5').addClass('labelerror');
            $("#error5").slideToggle();
            operacion = false;
        }
        if (isNaN(celular)) {
            $("#txtcelular").addClass('txterror');
            $("#lb5").addClass('labelerror');
            $("#txtcelular").addClass('alert alert-danger');
            $("#error55").slideToggle();
            operacion = false;
        }
        //Direccion
        if (dire == "") {
            $('#txtdireccion').addClass('txterror');
            $('#txtdireccion').addClass('alert alert-danger');
            $('#lb6').addClass('labelerror');
            $("#error6").slideToggle();
            operacion = false;
        }
        if (operacion == false) {
            return operacion;
        } else {
        }

    });
    //Nombre Ocultar
    $("#txtNombre").keyup(function () {
        $('#txtNombre').removeClass('alert alert-danger');
        $("#txtNombre").removeClass('txterror');
        $("#lb3").removeClass('labelerror');
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
});





//Funcion para quitar el alerta-danger
function quitar() {
    document.getElementById('error3').style.display = "none";
    document.getElementById('error33').style.display = "none";
    document.getElementById('error5').style.display = "none";
    document.getElementById('error55').style.display = "none";
    document.getElementById('error6').style.display = "none";
}


function permite(elEvento, permitidos) {
    // Variables que definen los caracteres permitidos
    var numeros = "0123456789";
    var caracteres = " abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ";
    var numeros_caracteres = numeros + caracteres;
    var teclas_especiales = [8, 37, 39, 46];
    // 8 = BackSpace, 46 = Supr, 37 = flecha izquierda, 39 = flecha derecha
    // Seleccionar los caracteres a partir del parámetro de la función
    switch (permitidos) {
        case 'num':
            permitidos = numeros;
            break;
        case 'car':
            permitidos = caracteres;
            break;
        case 'num_car':
            permitidos = numeros_caracteres;
            break;
    }
    // Obtener la tecla pulsada
    var evento = elEvento || window.event;
    var codigoCaracter = evento.charCode || evento.keyCode;
    var caracter = String.fromCharCode(codigoCaracter);
    // Comprobar si la tecla pulsada es alguna de las teclas especiales
    // (teclas de borrado y flechas horizontales)
    var tecla_especial = false;
    for (var i in teclas_especiales) {
        if (codigoCaracter == teclas_especiales[i]) {
            tecla_especial = true;
            break;
        }
    }
    return permitidos.indexOf(caracter) != -1 || tecla_especial;

}