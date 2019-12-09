/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function mostrarformulario(){
    $("#registrocat").fadeIn();
}
function aparece(e){
    e.preventDefault();
    $("#oscurecer").fadeIn(500, mostrarformulario());
    
}
function Desaparece(){
    event.preventDefault();
    
}
 
function ActivarRegistro() {
$("#cerrar").click(Desaparece());
$("#ActivarRegistro").click(aparece());
}
$(document).ready (ActivarRegistro);

    