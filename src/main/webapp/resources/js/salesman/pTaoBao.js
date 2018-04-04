$().ready(function() {
	  window.onresize = function() {
	        initScroll();
		};
		$(window).load(function(){
			initScroll();
		});
		initScroll();
});

function initScroll(){
	  var setVideoHeight = $('body').height();
  
      
      
      $('.pagePhone').on('touchmove',function(e){
	    	/*  var aniHeight = setVideoHeight;
			  var nowPos = $('.pagePhone').scrollTop();*/
		
		  });
      
            
      $('#pagePhone').on('touchend',function(e) {
    	    var _touch = e.originalEvent.targetTouches[0];
    	    var logo1 = $('#logo1').offset().top;
    	    var logo2 = $('#logo2').offset().top;
    	    var logo3 = $('#logo3').offset().top;
    	    var logo4 = $('#logo4').offset().top;
    	    
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
    	 
    	});



	  
/*	  $('.pagePhone').scroll(function(){
		  var aniHeight = setVideoHeight;
		  var nowPos = $('.pagePhone').scrollTop();
		  if(nowPos - logo1 >=100){
			  $('#logo1').addClass('rightAni');
		  }		
		  if(nowPos - logo2 >=100){
			  $('#logo2').addClass('leftAni');
		  }	
		  if(nowPos - logo3 >=100){
			  $('#logo3').addClass('rightAni');
		  }	
		  if(nowPos - logo4 >=100){
			  $('#logo4').addClass('leftAni');
		  }	
		})*/
}

