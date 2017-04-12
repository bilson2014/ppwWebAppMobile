var InterValObj; // timer变量，控制时间  
var count = 120; // 间隔函数，1秒执行  
var curCount; // 当前剩余秒数  
var PopInterValObj, oTimer, successIntervalObj;
$().ready(function(){
	//changeDiv();
	checkTap();
	login.init();
});

//成功信息 提示框弹出方法
function successToolTipShow(word) {
	window.clearInterval(successIntervalObj);
	$('#errorDiv').text(word);
	$('#errorDiv').slideDown('normal');
	successIntervalObj = window.setInterval(hideSuccessTooltip, 3000);
}

function hideSuccessTooltip() {
	$('#errorDiv').hide('normal');
}

function SetUsrRemainTime(){
	if(curCount == 0){
		window.clearInterval(InterValObj); // 停止计时器
		$('#get_code_user').text('重新获取');
		$('#get_code_user').removeAttr('disabled')
		// 清除session code
		getData(function(data){
		// 清除session code
		}, getContextPath() + '/login/clear/code');
	}else{
		curCount--;  
		$("#get_code_user").text('已发送('+ curCount +')');
	}
}

var login = {
		init:function(){
			this.userPhoneChange();
			this.changeKaptcha();
			this.userVerificationCode();
			this.userCheckVerification();
			this.user_phoneLogin();
		},
	 	userPhoneChange:function(){
	 		
			$('#user_phoneNumber').off("blur").on('blur',function(){
				var telephone = $('#user_phoneNumber').val().trim();
				if(telephone == '' || telephone == null || telephone == undefined){
					successToolTipShow('请填写手机号');
					$('#user_phoneNumber').focus();
					return ;
				}
				if(checkMobile(telephone)){
					loadData(function(flag){					
						if(flag.errorCode == 200){
							//  未注册
							successToolTipShow('该手机号未注册');
						}else if(flag.errorCode == 500){
							if(flag.result == false){
								// 已经注册
								
							}else{
								// 服务器错误
								successToolTipShow(flag.errorMsg);
							}
						}
						
					}, getContextPath() + '/provider/checkPhoneExisting', $.toJSON({
						telephone : telephone
					}));
				}else{
					successToolTipShow('手机号不正确');
					$('#user_phoneNumber').focus();
					return ;
				}
			});
		},
		//更换图片验证码
		changeKaptcha:function(){
			$('#kaptcha_pic').off("click").on('click',function(){
				$('#kaptcha_pic').val('');// 重置图片验证码
				// 初始化 验证码
				$('#kaptcha_pic').attr('src',getContextPath() + '/login/kaptcha.png?' + Math.floor(Math.random()*100));
				$('#kaptcha_pic').focus();
			});
		},
		//点击获取手机验证码
		userVerificationCode:function(){
			// 点击获取手机验证码发送按钮
			$('#get_code_user').off('click').on('click',function(){
				curCount = count;
				var telephone = $('#user_phoneNumber').val().trim();
				if(telephone == '' || telephone == null || telephone == undefined){
					successToolTipShow('请填写手机号');
					$('#user_phoneNumber').focus();
					return false;
				}
				if(checkMobile(telephone)){
					login.userCheckVerification();
				}else{
					successToolTipShow('手机号不正确');
					$('#user_phoneNumber').focus();
				}
			});
		},
		userCheckVerification:function(){
			var kaptchaCode = $('#kaptcha_code_user').val().trim();
			if(kaptchaCode != null && kaptchaCode != '' && kaptchaCode != undefined){
				// 判断 图片验证码 是否正确
				getData(function(info){
					if(!info.key){
						// 重置图片验证码
						$('#kaptcha_pic_user').val('');// 重置图片验证码
						$('#kaptcha_pic_user').attr('src',getContextPath() + '/login/kaptcha.png?' + Math.floor(Math.random()*100));
						$('#kaptcha_code_user').focus();
						successToolTipShow("图形验证码错误");
						return;
					}else{
						$("#kapt_error_info_user").addClass("hide");
						// 发送验证码
						// 设置 button 效果为禁用
						//图片验证码通过就发短信,修改按钮状态为disabled,防止信息发送中的多次点击
						$('#get_code_user').text('已发送('+ curCount +')');
						$('#get_code_user').attr('disabled','disabled');
						InterValObj = window.setInterval(SetUsrRemainTime, 1000); // 启动计时器，1秒钟执行一次
						loadData(function(flag){
							if(!flag){
								window.clearInterval(InterValObj);
								$('#get_code_user').text('重新获取');
								$('#get_code_user').removeAttr('disabled');
							}
						}, getContextPath() + '/login/verification/' + $('#user_phoneNumber').val().trim(), null);
					}
				}, getContextPath() + '/login/kaptcha/compare/' + kaptchaCode);
			}else{ // 图片验证码为空
				$('#kaptcha_pic_user').val('');// 重置图片验证码
				$('#kaptcha_pic_user').attr('src',getContextPath() + '/login/kaptcha.png?' + Math.floor(Math.random()*100));
				$('#kaptcha_code_user').focus();
				successToolTipShow("请填写图片验证码!");
			}
		},
		user_phoneLogin:function(){
			$("#submitBtn-user").off("click").on("click",function(){
				var phoneNumber = $('#user_phoneNumber').val();				
				var veri_code = $('#verification_code_user').val();
				var kap_code = $('#kaptcha_code_user').val();
				if(phoneNumber == null || phoneNumber == '' || phoneNumber == undefined){
					successToolTipShow("请输入手机号");
					$('#user_phoneNumber').focus();
					return false;
				}
				if(!checkMobile(phoneNumber.trim())){
					successToolTipShow('手机号不正确');
					$('#user_phoneNumber').focus();
					return false;
				}
				if(kap_code == null || kap_code == '' || kap_code == undefined){
					successToolTipShow("请输入图形验证码");
					$('#kaptcha_code_user').focus();
					return false;
				}
				if(veri_code == null || veri_code == '' || veri_code == undefined){
					successToolTipShow("请输入验证码");
					$('#verification_code_user').focus();
					return false;
				}
				loadData(function(info){
					if(info.key){
						window.location.href=getContextPath()+'/mgr/index';
					}else{
						successToolTipShow(info.value);
						return false;
					}
				},  getContextPath() + '/provider/doLogin', $.toJSON({
					loginType :'phone',
					telephone : phoneNumber,
					verification_code : veri_code
				}));
			})
		},
		user_nameLogin:function(){
			$("#submitBtn_user_name").off("click").on("click",function(){
				var loginName = $("#user_name").val();
				var pwd = $("#user_pwd").val();
				if(loginName == null || loginName == '' || loginName == undefined){
					successToolTipShow("请输入用户名");
					$('#user_name').focus();
					return false;
				}
				if(pwd == null || pwd == '' || pwd == undefined){
					successToolTipShow("请输入密码");
					$('#user_pwd').focus();
					return false;
				}
				if(pwd.length<6){
					successToolTipShow("密码最少六位");
					$('#user_pwd').focus();
					return false;
				}
				loadData(function(msg){
					$(".errorDiv").addClass("hide");
					if(msg.key){ 
						window.location.href=getContextPath()+ '/mgr/index';
					}else{
						$("#user_pwd_error").text(msg.value).removeClass("hide");
						return false;
					}
				}, getContextPath() + '/provider/doLogin', $.toJSON({
					loginType : 'loginName',
					loginName : loginName,
					password : Encrypt(pwd.trim())
				}))
			});
		},
}


var provider_login = {
		init:function(){
			//手机号码失去焦点
			this.phoneNumberChange();
			//更换图形验证码
			this.changeKaptcha();
			//获取手机验证码
			this.verificationCode();
			//注册或者登录
			this.regesterOrLogin();
		},
		
		phoneNumberChange:function(){
			$('#user_phoneNumber').off('change').on('change',function(){
				$('#submitBtn').removeAttr('data-id');//清空注册或登陆标记位，防止换号后数据错误
				$('#submitBtn').text("登录");
				var telephone = $('#user_phoneNumber').val().trim();
				if(telephone == '' || telephone == null || telephone == undefined){
					$('#user_phoneNumberId').removeClass('hide');
					$('#user_phoneNumberId').text('*请填写手机号');
					$('#user_phoneNumber').focus();
					return ;
				}
				if(checkMobile(telephone)){
					loadData(function(flag){
						if(flag.errorCode == 200){
							$('#user_phoneNumberId').addClass('hide');
							$('#submitBtn').text("注册");
							$("#submitBtn").attr('data-id','register'); // 标记register
							$('#infoOrder').removeClass('hide');
							$('#user_phoneNumberId').text('*手机号不正确');
						}else if(flag.errorCode == 300){
							$('#user_phoneNumberId').addClass('hide');
							$('#submitBtn').text("登录");
							$('#submitBtn').attr('data-id','login'); // 标记login
							$('#infoOrder').addClass('hide');
							$('#user_phoneNumberId').text('*手机号不正确');
						}else if(flag.errorCode == 500){
							$('#user_phoneNumberId').removeClass('hide');
							$('#user_phoneNumberId').text(flag.errorMsg);
						}
						
					}, getContextPath() + '/provider/checkPhoneExisting', $.toJSON({ // 改验证方式    
						phoneNumber : telephone
					}));
				}else{
					$('#user_phoneNumberId').removeClass('hide');
					$('#user_phoneNumberId').text('*手机号不正确');
					$('#user_phoneNumber').focus();
					return ;
				}
				$('#user_phoneNumberId').addClass('hide');
			});
		},
		//更换图片验证码
		changeKaptcha:function(){
			$('#kaptcha_pic').off("click").on('click',function(){
				$('#kaptcha_pic').val('');// 重置图片验证码
				// 初始化 验证码
				$('#kaptcha_pic').attr('src',getContextPath() + '/login/kaptcha.png?' + Math.floor(Math.random()*100));
				$('#kaptcha_pic').focus();
			});
		},
		//点击获取手机验证码
		verificationCode:function(){
			// 点击获取手机验证码发送按钮
			$('#verification_code_recover_btn').off('click').on('click',function(){
				curCount = count;
				var kaptchaCode = $('#kaptcha_code').val().trim();
				var telephone = $('#user_phoneNumber').val().trim();
				if(telephone == '' || telephone == null || telephone == undefined){
					$('#user_phoneNumberId').removeClass('hide');
					$('#user_phoneNumberId').text('*请填写手机号');
					$('#user_phoneNumber').focus();
					return ;
				}
				else{
				if(kaptchaCode != null && kaptchaCode != '' && kaptchaCode != undefined){
					// 判断 图片验证码 是否正确
					getData(function(info){
						if(!info.key){
							// 图片验证码 不一致 
							// 重置图片验证码
							$('#kaptcha_code').val(''); // 重置 图片验证码 信息
							// 初始化 验证码
							$('#kaptcha_pic').attr('src',getContextPath() + '/login/kaptcha.png?' + Math.floor(Math.random()*100));
							$('#kaptcha_code').focus();
							$("#kapt_error_info").text("*图形验证码错误").removeClass("hide");
						}else{
							// 验证通过
							// 发送验证码
							$("#kapt_error_info").addClass("hide");
							// 设置 button 效果为禁用
							//图片验证码通过就发短信,修改按钮状态为disabled,防止信息发送中的多次点击
							$('#verification_code_recover_btn').text('已发送('+ curCount +')');
							$('#verification_code_recover_btn').attr('disabled','disabled');
							InterValObj = window.setInterval(SetRemainTime, 1000); // 启动计时器，1秒钟执行一次
							// 倒计时
							loadData(function(flag){
								if(!flag){
									// 发送不成功
									// 显示重新发送
									$('#verification_code_btn').text('重新获取');
									$('#verification_code_btn').removeAttr('disabled');
								}
							}, getContextPath() + '/login/verification/' + $('#user_phoneNumber').val().trim(), null);
						}
					}, getContextPath() + '/login/kaptcha/compare/' + kaptchaCode);
				}else{ // 图片验证码为空
					$('#kaptcha_code').val('');// 重置图片验证码
					// 初始化 验证码
					$('#kaptcha_pic').attr('src',getContextPath() + '/login/kaptcha.png?' + Math.floor(Math.random()*100));
					$('#kaptcha_code').focus();
					$("#kapt_error_info").text("*请填写图片验证码!").removeClass("hide");
				}
				}
			});
		},
		regesterOrLogin:function(){
			var _this = this;
			$("#submitBtn").off("click").on("click",function(){
				var phone_code = $('#user_phoneNumber').val();				
				var veri_code = $('#verification_code').val();
				var kap_code = $('#kaptcha_code').val();
				$("#user_phoneNumberId").addClass("hide");
				$("#code_error_info").addClass("hide");
				$("#kapt_error_info").addClass("hide");
				
				if(phone_code == null || phone_code == '' || phone_code == undefined){
					$("#user_phoneNumberId").text("*请输入手机号").removeClass("hide");
					$('#user_phoneNumber').focus();
					return false;
				}
				if(!checkMobile(phone_code)){
					$("#user_phoneNumberId").text("*手机号不正确").removeClass("hide");
					$('#user_phoneNumber').focus();
					return false;
				}
				if(kap_code == null || kap_code == '' || kap_code == undefined){
					$("#kapt_error_info").text("*请输入图形验证码").removeClass("hide");
					$('#kaptcha_code').focus();
					return false;
				}
				if(veri_code == null || veri_code == '' || veri_code == undefined){
					$("#code_error_info").text("*请输入验证码").removeClass("hide");
					$('#verification_code').focus();
					return false;
				}
				//20160706 lt 添加验证begin		
				//provider_login.init();
				//end
				var action = $("#submitBtn").attr("data-id");//login or register
				$('#submitBtn').removeAttr('data-id');//清空注册或登陆标记位，防止重复点击
				if(action=='login'){
					_this.login(action);
				}
				if(action=='register'){
					_this.register(action);
				}
				
			})
		},
		login:function(action){
			loadData(function(info){
				if(info.result){
					$(".errorDiv").addClass("hide");
					window.location.href=getContextPath()+ '/';
				}else{
					$("#code_error_info").text(info.errorMsg).removeClass("hide");
					$('#submitBtn').attr('data-id',action);
					return false;
				}
			}, getContextPath() + '/provider/doLogin', $.toJSON({
				phoneNumber : $('#user_phoneNumber').val().trim(),
				password : Encrypt("123456"),
				loginType :'phone',
				verification_code : $('#verification_code').val().trim(),
			}))
		},
		register:function(action){
			loadData(function(info){
				if(info.key){
					$(".errorDiv").addClass("hide");
					window.location.href=getContextPath()+'/provider/leader';
				}else{
					$("#code_error_info").text(info.value).removeClass("hide");
					$('#submitBtn').attr('data-id',action);
					return false;
				}
			},  getContextPath() + '/provider/info/register', $.toJSON({
				phoneNumber : $('#user_phoneNumber').val().trim(),
				password : Encrypt("123456"),
				verification_code : $('#verification_code').val().trim(),
				flag : 3
			}));
		}
} 




//timer 处理函数 - 注册
function SetRemainTime(){
	if(curCount == 0){
		window.clearInterval(InterValObj); // 停止计时器
		$('#verification_code_recover_btn').text('重新获取');
		$('#verification_code_recover_btn').removeAttr('disabled')
		// 清除session code
		getData(function(data){
			// 清除session code
		}, getContextPath() + '/login/clear/code');
		
	}else{
		curCount--;  
		$("#verification_code_recover_btn").text('已发送('+ curCount +')');
	}
}

//确认状态
function checkState(){
	var href = window.location.href;
    var state = href.substr(href.lastIndexOf("?")+1,href.length);
    if(state.trim() == "role=director"){
    	toProvider();
    }
}



function toProvider(){
	$('#submitBtn').off('click');
	initPos();
	provider_login.init();
}


//控制标签

function checkTap(){
	$('#phoneLogin').off('click').on('click',function(){
		$('#loginTop').removeClass('loginTopActive');
		$('#phoneLoginDiv').show();
		$('#useLoginDiv').hide();
	});
	
	$('#noPhoneLogin').off('click').on('click',function(){
		$('#loginTop').addClass('loginTopActive');
		$('#phoneLoginDiv').hide();
		$('#useLoginDiv').show();
	});
	
	
}





