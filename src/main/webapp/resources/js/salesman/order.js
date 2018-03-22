$().ready(function(){
	order.order();
});

var order = {
	order : function(){
		$('#order-btn').click(function(){
			// 检查数据是否完成
			if(checkData()){
				if(checkMobile($('#indent_tele').val())){ // 检查 是否 是手机号码
					$('#label-message').hide('normal');
					// 提交表单
//					$('#order-form').attr('action',getContextPath() + '/salesman/order/submit').submit();
					loadData2(function(result){	
						 if (result.ret){
							 window.location.href="/salesman/result/success";
						 }else{
							 window.location.href="/salesman/result/error";					 					 
						 }	 
					 }, getContextPath() + '/order/salesman', 
					 {
						csrftoken:$("#csrftoken").val(),
						token:$("#token").val(),
						indentName:$("#indentName").val(),
						indentSource:$("#indentSource").val(),
						indent_recomment:$("#indent_recomment").val(),
						indent_tele:$('#indent_tele').val()
//						productId:-1,
//						teamId:-1,
//						serviceId:-1,
					  });	
				}else {
					$('#label-message').show('normal');
					$('#label-message').text('请输入正确的手机格式');
					return false;
				}
			}
		});
	}
}

function checkData(){
	// 检查数据
	var contactTele = $('#indent_tele').val().trim();
	var flag = true;
	if(contactTele == '' || contactTele == null || contactTele == undefined){
		$('#label-message').show('normal');
		$('#label-message').text('请输入手机号码');
		flag = false;
	}
	return flag;
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
