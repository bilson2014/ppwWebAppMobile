var InterValObj; // timer变量，控制时间  
var count = 60; // 间隔函数，1秒执行  
$().ready(function() {
	init();
	setHeight();
});

function setHeight(){
	  var screenWidth = document.documentElement.clientWidth;
      var setHeight= screenWidth/16*9;
	  $('#playVideo').css('height',setHeight);
}

function init() {
	    document.addEventListener("WeixinJSBridgeReady", function () {
	    	document.getElementById('toPlayVideo').play();
	     }, false);
	    document.getElementById('toPlayVideo').play();
		$('#toPlayVideo').off('click').on('click',function(){
			document.getElementById('toPlayVideo').play();
		});
       var swiperV = new Swiper('.swiperVertical', {
	        direction: 'vertical',
	        pagination: '.swiper-pagination-v',
	        paginationClickable: true ,
	        loop:true,
	        onSlideNextEnd: function(swiper){
	        	var index = swiper.activeIndex;
	            if(index == 1){
	            	$('.serWord').removeClass('animation');
	            }
	           }
	    });
      
	    var swiper3 = new Swiper('.step2',{
	        pagination: '.swiper-pagination-H',
	        paginationClickable: true,
	        loop:true,
	    });
	    /*
	    var swiper4 = new Swiper('.step4',{
	        pagination: '.swiper-pagination-H',
	        paginationClickable: true,
	    });
	    var swiper6 = new Swiper('.step6',{
	        pagination: '.swiper-pagination-H',
	        paginationClickable: true,
	    });*/
}
	 
	


