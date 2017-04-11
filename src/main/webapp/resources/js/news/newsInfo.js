var InterValObj; // timer变量，控制时间  
var count = 60; // 间隔函数，1秒执行  
var curCount; // 当前剩余秒数 
var swiper;
var add = true ;
var reSet = false;
$().ready(function() {
	
	newsInfo.initData();
	
	 

});

var newsInfo = {
		initData : function() { // 加载分类信息
			 var screenWidth = document.documentElement.clientWidth;
			 var setHeight= screenWidth/16*9;
			 $('#banner').css('height',setHeight);
		}
}
