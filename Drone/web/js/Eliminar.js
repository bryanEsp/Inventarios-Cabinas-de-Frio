/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*
$(document).ready(function () {
    $("tr #btneliminar").cllick(function () {
        var idp = $(this).parent().find("#CodigoPro").val();
        swal({
            title: "Esta Seguro de Eliminar?",
            text: "Una vez eliminado, no podrá recuperar este archivo!",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        })
                .then((willDelete) => {
                    if (willDelete) {
                         eliminar(idp);
                        swal("El Producto ha Sido Eliminado", {
                            icon: "success",
                        }).then((willDelete)=>{
                            if (willDelete){
                                parent.location.href="${pageContext.request.contextPath}/Producto/consultar_producto.jsp";
                            }
                        });
                    } else {
                        swal("Registro no Eliminado!");
                    }
                });
       
    });
    function eliminar(idp) {
        var url = "ProductoControlador?opcion=3";
        $.ajax({
            type: 'POST',
            url: url,
            data: "idp=" + idp,
            success: function (data, textStatus, jqXHR) {

            }
        })
    }
});

*/