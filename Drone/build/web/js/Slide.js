/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
    var Items = $('.slide li').length; 
    var modalP=1;
    for (var i = 1; i <= Items; i++) {
    	$('.pagination').append('<li><span class="fas fa-circle"></span></li>');
    }
    $('.slide li').hide();
    $('.slide li:first').show();
    $('.pagination li:first').css({'color':'rgb(49,147,154)'});

    //Ejecucion Funciones----------------------
    $('.pagination li').click(pagination);
    $('.right span').click(nextSlider);
    $('.left span').click(prevtSlider);



    //Funciones--------------------------------
    function pagination(){
    	var paginationPos = $(this).index()+1;

    	$('.slide li').hide();
    	$('.slide li:nth-child('+paginationPos+')').fadeIn();

    	$('.pagination li').css({'color':'#858585'});
    	$(this).css({'color':'rgb(49,147,154)'});

    	modalP=paginationPos;
    }
	function nextSlider(){
    	if (modalP >= Items){
    		modalP=1;
    		
    	}
    	else
    	{
    		modalP++;
    	}
    	$('.pagination li').css({'color':'#858585'});
    	$('.pagination li:nth-child('+modalP+')').css({'color':'rgb(49,147,154)'});
    	$('.slide li').hide();
    	$('.slide li:nth-child('+modalP+')').fadeIn();


    }
    function prevtSlider(){
    	if (modalP <= 1){
    		modalP=Items;
    		
    	}else
    	{
    		modalP--;
    		
    	}
    	$('.pagination li').css({'color':'#858585'});
    	$('.pagination li:nth-child('+modalP+')').css({'color':'rgb(49,147,154)'});
    	$('.slide li').hide();
    	$('.slide li:nth-child('+modalP+')').fadeIn();
    }

});

