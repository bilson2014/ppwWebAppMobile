
$().ready(function() {
	setCardHeight();
	videoPlay();
	floating();
});

function setCardHeight(){
		 var screenWidth = document.documentElement.clientWidth;
		 var setHeight= screenWidth/16*9;
		 $('.videoCard').css('height',setHeight + "px");
}

function videoPlay(){
	
	$('#source').attr('src','http://www.apaipian.com/product/video/paipianwangMovie.mp4');
	$('#header3Video').load();
	 $('.showVideo').on('click',function(){
		  $('#header3Video').get(0).play();
	 });
	
}
function floating(){
	$('.one').on('click',function(){
		$('#one').show();
		$('#two').hide();
		$('#three').hide();
	});
	$('.two').on('click',function(){
		$('#one').hide();
		$('#two').show();
		$('#three').hide();
	});
	$('.three').on('click',function(){
		$('#one').hide();
		$('#two').hide();
		$('#three').show();
	});
	
}

