var InterValObj; // timer变量，控制时间  
var count = 60; // 间隔函数，1秒执行  
var curCount; // 当前剩余秒数 
var swiper;
var reSet = false;
$().ready(function() {
	

	init();
	 

});
function init() {

  $('.btnSub').off('click').on('click',function(){
	  check();
  });
	
	
	
}

function check(){
	
	var name=$('#name').val();
	var phone=$('#indent_tele').val();
	$('#nameError').removeClass('errorShow');
	$('#phoneError').removeClass('errorShow');
	if(name == '' || name == null || name == undefined){
		$('#nameError').addClass('errorShow');
		$('#name').focus();
		return;
	}
	if(phone == '' || phone == null || phone == undefined){
		$('#phoneError').addClass('errorShow');
		$('#phoneError').text('请填写手机号');
		$('#indent_tele').focus();
		return;
	}
	if(!checkMobile(phone)){
		$('#phoneError').addClass('errorShow');
		$('#phoneError').text('手机号格式不正确');
		$('#indent_tele').focus();
		return;
	}
	
	$('#indent_recomment').val(name + phone);
	
	$('#order-form').attr('action',getContextPath() + '/salesman/order/submit').submit();
}

