$().ready(function(){
	
	var screenWidth = document.documentElement.clientWidth;
	var setHeight= screenWidth/16*9;
	$('video').css('height',setHeight);
	
});
