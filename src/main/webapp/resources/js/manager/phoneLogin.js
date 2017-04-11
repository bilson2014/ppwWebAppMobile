
$().ready(function(){
	doLogin();
	
});


function doLogin(){

	$('#submitBtn').on('click',function(){
		// 登陆
		loadData(function(result){
			if(result.ret){
				window.location.href=getContextPath()+ '/';
			}else {
                 alert('登录失败请联系郭阳');
			}
		}, getContextPath() + '/mgr/doLogin', $.toJSON({
			employeeLoginName : $('#user_phoneNumber').val().trim(),
			employeePassword : Encrypt($('#user_passWord').val().trim())
		}));
	});
}



