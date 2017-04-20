$().ready(function(){
	
	var screenWidth = document.documentElement.clientWidth;
	var setHeight= screenWidth/16*9;
	$('video').css('height',setHeight);
	$('#setVideo').attr('src',''+getDfsHostName()+'group1/M00/00/60/CgpmTlib2EaAbOOdAQ1EMav8_P0022.mp4');
	
});
