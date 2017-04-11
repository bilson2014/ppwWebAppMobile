$().ready(function() {	
	windowChange(); 
	window.onresize = function(){
		windowChange(); 
	}
});

function windowChange(){
	var screenWidth = parseInt(document.body.clientWidth);
	var fontSize = parseInt(screenWidth/1080*100);
	$('html').css('font-size',fontSize);
}