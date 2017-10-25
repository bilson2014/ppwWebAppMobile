var InterValObj; // timer变量，控制时间  
var count = 60; // 间隔函数，1秒执行  
$().ready(function() {
	init();
	setHeight();
	initShareNew();
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
	       // loop:true,
	        onSlideNextEnd: function(swiper){
	        	var index = swiper.activeIndex;
	        	 if(index != 2){
	        		 $('.spIcon').show();
	        	 }
	            if(index == 1){
	            	document.addEventListener("WeixinJSBridgeReady", function () {
	     		    	document.getElementById('toPlayFullVideo').play();
	     		     }, false);
	     		    document.getElementById('toPlayFullVideo').play();
	     			$('#toPlayFullVideo').off('click').on('click',function(){
	     				document.getElementById('toPlayFullVideo').play();
	     			});
	            	//$('.serWord').removeClass('animation');
	            }
	            if(index == 2){
	            	$('.spIcon').hide();
	            }
	           }
	    });
      
	/*    var swiper3 = new Swiper('.step2',{
	        pagination: '.swiper-pagination-H',
	        paginationClickable: true,
	        loop:true,
	    });*/
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
	

function initShareNew(){
	
	wx.config({
        debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
        appId: 'wxb5f2540cff5*****', // 必填，公众号的唯一标识
        timestamp:'1414587457' , // 必填，生成签名的时间戳
        nonceStr: 'Wm3WZYTPz0wzccnW', // 必填，生成签名的随机串
        signature: '0f9de62fce790f9a083d5c99e95740ceb90c27ed',// 必填，签名
        jsApiList: ['onMenuShareAppMessage','onMenuShareTimeline'] // 必填，需要使用的JS接口列表
    });
    wx.ready(function(){
        wx.onMenuShareAppMessage({
            title: '这简直不像一条招聘广告', // 分享标题
            desc: '这里有一个你不能错过的工作机会', // 分享描述
            link: 'http://m.apaipian.com/employ', // 分享链接
            imgUrl: 'http://m.apaipian.com/resources/images/employee/em1.png', // 分享图标
            type: 'link', // 分享类型,music、video或link，不填默认为link
            dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
        /*    success: function () { 
            },
            cancel: function () { 
            }*/
        });
    /*  wx.error(function(res){
        });*/
        wx.onMenuShareTimeline({
            title: '这简直不像一条招聘广告', // 分享标题
            desc: '这里有一个你不能错过的工作机会', // 分享描述
            link: 'http://m.apaipian.com/employ', // 分享链接
            imgUrl: 'http://m.apaipian.com/resources/images/employee/em1.png', // 分享图标
            type: 'link', // 分享类型,music、video或link，不填默认为link
            dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
        });
    });
		
}
	


