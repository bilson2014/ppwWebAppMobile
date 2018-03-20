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
	var name=$('#user_name').val();
	var phone=$('#indent_tele').val();
	$('#nameError').removeClass('errorShow');
	$('#phoneError').removeClass('errorShow');
	if(name == '' || name == null || name == undefined){
		$('#nameError').addClass('errorShow');
		$('#user_name').focus();
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
//	$('#order-form').attr('action',getContextPath() + '/activity/mg/submit').submit();
	
	loadData2(function(result){	
		 if (result.ret){
			 window.location.href="/activity/success";
		 }else{
			 window.location.href="/activity/error";					 					 
		 }	 
	 }, getContextPath() + '/order/salesman', 
	{
		csrftoken:$("#csrftoken").val(),
		token:$("#token").val(),
		salesmanUniqueId:$("#salesmanUniqueId").val(),
		indentSource:$("#indentSource").val(),
		user_name:$("#user_name").val(),
		indent_tele:$('#indent_tele').val(),
		indentName:'mg动画促销',
		indent_recomment:'联系人:'+$("#user_name").val(),
		productId:-1,
		teamId:-1,
		serviceId:-1
	  });
}

//AJAX POST
function loadData2(Func,url,param){
	$.ajax({
		url : url,
		type : 'POST',
		data : param,
		dataType : 'json',
		success : function(data){
			Func(data);
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.error('ajax(' + url + ')[' + jqXHR.status + ']' + jqXHR.statusText);
			console.error(jqXHR.responseText);
			console.error('[' + textStatus + ']' + errorThrown);
		}
	});
}


