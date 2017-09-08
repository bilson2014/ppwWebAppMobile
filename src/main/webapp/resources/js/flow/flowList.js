var hasHeight = true;
var scrollHeight = 0;
$().ready(function() {	
	document.domain = getUrlDo();
	    setMinHieght();
	$(window).resize(function () {          
		setMinHieght();
	});
	
	  $('.pagePhone').scroll(function() {
		  var pageScroll = $('.pagePhone').scrollTop();
		  var isScroll = $($('.frame').prop('contentWindow').document).find('#isScroll').val();
		  
		  if(isScroll != null && isScroll != "" && isScroll != undefined){
			  if(hasHeight){
					 scrollHeight = $($('.frame').prop('contentWindow').document).find('.menuTag').offset().top;
				     hasHeight = false;
				  }
			  var setScroll = pageScroll+scrollHeight;
			  $($('.frame').prop('contentWindow').document).find('.menuTag').css('top',setScroll);
		  }else{
			  $($('.frame').prop('contentWindow').document).find('.frameHead').css('top',pageScroll);
		  }
		
	  });
});

function setMinHieght(){
	var minHeight = $(window).height(); 
	$('.frame').css('min-height',minHeight);
}