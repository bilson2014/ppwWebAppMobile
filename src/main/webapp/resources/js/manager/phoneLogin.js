$().ready(function(){
	doLogin();
});
function doLogin(){
	$('#submitBtn').on('click',function(){
		// 登陆
		loadData(function(result){
			if(result.ret){
				window.location.href=getContextPath()+ result.message;
			}else {
                 alert('登录失败请联系技术部王涛');
			}
		}, getContextPath() + '/mgr/doLogin', $.toJSON({
			employeeLoginName : $('#user_phoneNumber').val().trim(),
			employeePassword : Encrypt($('#user_passWord').val().trim())
		}));
	});
}



