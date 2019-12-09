$(document).ready(function(){
    var Items = $('.slider li').length; 
    var modalP=1;
    for (var i = 1; i <= Items; i++) {
    	$('.pagination').append('<li><span class="fas fa-circle"></span></li>');
    }
    $('.slider li').hide();
    $('.slider li:first').show();
    $('.pagination li:first').css({'color':'rgb(49,147,154)'});

    //Ejecucion Funciones----------------------
    $('.pagination li').click(pagination);
    $('.right span').click(nextSlider);
    $('.left span').click(prevtSlider);



    //Funciones--------------------------------
    function pagination(){
    	var paginationPos = $(this).index()+1;

    	$('.slider li').hide();
    	$('.slider li:nth-child('+paginationPos+')').fadeIn();

    	$('.pagination li').css({'color':'rgb(129, 128, 128)'});
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
    	$('.pagination li').css({'color':'rgb(129, 128, 128)'});
    	$('.pagination li:nth-child('+modalP+')').css({'color':'rgb(49,147,154)'});
    	$('.slider li').hide();
    	$('.slider li:nth-child('+modalP+')').fadeIn();


    }
    function prevtSlider(){
    	if (modalP <= 1){
    		modalP=Items;
    		
    	}else
    	{
    		modalP--;
    		
    	}
    	$('.pagination li').css({'color':'rgb(129, 128, 128)'});
    	$('.pagination li:nth-child('+modalP+')').css({'color':'rgb(49,147,154)'});
    	$('.slider li').hide();
    	$('.slider li:nth-child('+modalP+')').fadeIn();
    }

});