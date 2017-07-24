var InterValObj; // timer变量，控制时间  
var count = 60; // 间隔函数，1秒执行  
var curCount; // 当前剩余秒数 
var swiper;
var add = true ;
var reSet = false;
$().ready(function() {
	init();
});
function init() {
	$('#closeInfo').off('click').on('click',function(){
	   $('.modelTool').hide();
	});
}