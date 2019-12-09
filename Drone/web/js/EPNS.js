var abecedario = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];

function agregar() {
    var et = document.from2.txtestante;
    var ni = document.from2.txtnivel;
    var pro = document.from2.txtprofundidad;

    var cod_c = document.getElementById('txtcuartofrio').value;
    for (var i = 0; i < cuartoFrio.length; i++) {
        if (cod_c == cuartoFrio[i]) {
            for (var j = 0; j < estante[i]; j++) {
                var option = document.createElement("option");
                option.value = abecedario[j];
                option.text = abecedario[j];
                et.appendChild(option)
            }
            for (var u = 0; u < nivel[i]; u++) {
                var option = document.createElement("option");
                option.value = u + 1;
                option.text = u + 1;
                ni.appendChild(option)
            }
            for (var w = 0; w < profundidad[i]; w++) {
                var option = document.createElement("option");
                option.value = w + 1;
                option.text = w + 1;
                pro.appendChild(option)
            }

        } else {
        }
    }
}
function esta() {
    var et = document.from2.txtestante;
    var cod_c = document.getElementById('txtcuartofrio').value;
    for (var i = 0; i < cuartoFrio.length; i++) {
        if (cod_c == cuartoFrio[i]) {
            for (var j = 0; j < estante[i]; j++) {
                var option = document.createElement("option");
                option.value = abecedario[j];
                option.text = abecedario[j];
                et.appendChild(option)
            }
        } else {
        }
    }
}
function  esta2() {
    var ni = document.from2.txtnivel;
    var cod_c = document.getElementById('txtcuartofrio').value;
    for (var i = 0; i < cuartoFrio.length; i++) {

        if (cod_c == cuartoFrio[i]) {
            for (var u = 0; u < nivel[i]; u++) {
                var option = document.createElement("option");
                option.value = u + 1;
                option.text = u + 1;
                ni.appendChild(option)
            }
        } else {
        }
    }

}
function esta3() {
    var pro = document.from2.txtprofundidad;
    var cod_c = document.getElementById('txtcuartofrio').value;
    for (var i = 0; i < cuartoFrio.length; i++) {
        if (cod_c == cuartoFrio[i]) {

            for (var w = 0; w < profundidad[i]; w++) {
                var option = document.createElement("option");
                option.value = w + 1;
                option.text = w + 1;
                pro.appendChild(option)
            }

        } else {
        }
    }
}
function qui1() {
    $('#txtestante').empty();
}
function qui2() {
    $('#txtnivel').empty();
}
function qui3() {
    $('#txtprofundidad').empty();
}

function revo() {
    $('#txtestante').empty();
    $('#txtnivel').empty();
    $('#txtprofundidad').empty();
}



