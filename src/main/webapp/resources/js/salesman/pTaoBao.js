$().ready(function() {
//	alert('bbb');
	//alert(1);
/*	initScroll();
	 window.onresize = function() {
	        initScroll();
		};
		$(window).load(function(){
			initScroll();
		});*/
		
});

function initScroll(){
	  var setVideoHeight = $('body').height();  
      
	  $('#big').text('c');
	   
	  event.preventDefault();
	  $('.pagePhone').on('touchstart ',function(e){
    	  e.preventDefault();
	    	/*  var aniHeight = setVideoHeight;
			  var nowPos = $('.pagePhone').scrollTop();*/
    	  $('#big').text('a');
		  });
/*	  
      $('.pagePhone').on('touchmove',function(e){
    	  e.preventDefault();
	    	  var aniHeight = setVideoHeight;
			  var nowPos = $('.pagePhone').scrollTop();
    	  $('#big').text('a');
	 });    
            
      $('#pagePhone').on('touchend',function(e) {
    	    e.preventDefault();
    	    $('#big').text('b');
    	    var logo1 = $('#logo1').offset().top;
    	    var logo2 = $('#logo2').offset().top;
    	    var logo3 = $('#logo3').offset().top;
    	    var logo4 = $('#logo4').offset().top;
    	    $('#big').text(logo1);
    		  if(logo1 >=setVideoHeight/3){
				  $('#logo1').addClass('rightAni');
			  }		
			  if(logo2 >=setVideoHeight/3){
				  $('#logo2').addClass('leftAni');
			  }	
			  if(logo3 >=setVideoHeight/2){
				  $('#logo3').addClass('rightAni');
			  }	
			  if(logo4 >=setVideoHeight/2){
				  $('#logo4').addClass('leftAni');
			  }	
    	 
    	});*/



	  
	/*  $('.pagePhone').scroll(function(){
		  $('#logo1').addClass('rightAni');
		  $('#logo2').addClass('leftAni');
		  $('#logo3').addClass('rightAni');
		  $('#logo4').addClass('leftAni');
		})*/
}

