var Lista = [];


function agregarFila(form) {
    var nombre = document.getElementById("txt1").value;
    var cantidad = document.getElementById("txt2").value;
    var motivo = document.getElementById("txt3").value;
    var tipo = document.getElementById("txt4").value;
    indice = document.getElementById("txt1").selectedIndex;
    indice2 = document.getElementById("txt4").selectedIndex;

    if (indice == null || indice == 0 || cantidad == "" || motivo == "" || nombre == "" || indice2 == null || indice2 == 0) {
        $("#txt1").addClass('txterror');
        $("#lb2").addClass('labelerror');
        $("#txt1").addClass('alert alert-danger');
        $("#error33").fadeIn("slow");
        $('#txt2').addClass('txterror');
        $('#txt2').addClass('alert alert-danger');
        $('#lb1').addClass('labelerror');
        $("#error3").fadeIn("slow");
        $('#txt3').addClass('txterror');
        $('#txt3').addClass('alert alert-danger');
        $('#lb3').addClass('labelerror');
        $("#error01").fadeIn("slow");
        $("#txt4").addClass('txterror');
        $("#lb4").addClass('labelerror');
        $("#txt4").addClass('alert alert-danger');
        $("#error03").fadeIn("slow");
    } else {
        document.getElementById("tablaprueba").insertRow(-1).innerHTML = '<td><input id="txtNom" readonly name="Nombre" value="' + nombre + '" ></td><td><input id="txtNom" readonly name="Cantidad" value="' + cantidad + '" ></td><td><textarea id="txtNom2" readonly name="Motivo"  >' + motivo + '</textarea></td><td><input id="txtNom" readonly name="Tipo" value="' + tipo + '" ></td>';
        document.getElementById("txt1").value = "";
        document.getElementById("txt2").value = "";
        document.getElementById("txt3").value = "";
        $('#txt1').removeClass('alert alert-danger');
        $("#txt1").removeClass('txterror');
        $("#lb2").removeClass('labelerror');
        $('#txt3').removeClass('alert alert-danger');
        $("#txt3").removeClass('txterror');
        $("#lb3").removeClass('labelerror');
        $('#txt2').removeClass('alert alert-danger');
        $("#txt2").removeClass('txterror');
        $("#lb1").removeClass('labelerror');
        $('#txt4').removeClass('alert alert-danger');
        $("#txt4").removeClass('txterror');
        $("#lb4").removeClass('labelerror');
        $('#tablaprueba').removeClass('alert alert-danger');
        $("#tablaprueba").removeClass('txterror');
        document.getElementById('error3333').style.display = "none";
    }
}

function eliminarFila() {
    var table = document.getElementById("tablaprueba");
    var rowCount = table.rows.length;
    if (rowCount <= 1)
        alert('No se puede eliminar el encabezado');
    else
        table.deleteRow(rowCount - 1);
}
function Recargar() {
    indice = document.getElementById("txtTipo").selectedIndex;
    if (indice == null || indice == 0) {

    } else {
        location.reload();
    }
}
