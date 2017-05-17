    
$().ready(function() {
	pOrder.init();
});

/**
 * 主页业务处理部分
 */
var pOrder= {
	init:function(){
		pOrder.initOption();
	},
	initOption:function(){
		 var screenWidth = document.documentElement.clientWidth;
		 var setHeight= screenWidth/16*9;
		 $('.listCard').css('height',setHeight + "px");
	},
	showSuccess:function(){
		
	},
	
}