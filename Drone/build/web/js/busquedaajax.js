function search() {
    var tabla = document.getElementById('datos');
    var buscador = document.getElementById('busca').value.toLowerCase();
    var cellsRow = "";
    var found = false;
    var comparewhith = "";

// Recorrer todas las filas ocn contenido de la tabla 
    for (var i = 1; i < tabla.rows.length; i++) {
        cellsRow = tabla.rows[i].getElementsByTagName('td');
        found = false;

        //Recorrer todas las celdas 
        for (var j = 0; j < cellsRow.length && !found; j++) {
            comparewhith = cellsRow[j].innerHTML.toLowerCase();

            if (buscador.length == 0 || (comparewhith.indexOf(buscador) > -1)) {

                found = true;
            }
        }
        if (found)
        {
            tabla.rows[i].style.display = '';
        } else {
            //si no encuentra argumentos esconde el registro
            tabla.rows[i].style.display = 'none';
        }



    }

}


