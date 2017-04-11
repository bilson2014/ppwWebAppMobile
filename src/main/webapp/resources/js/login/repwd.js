var InterValObj; // timer变量，控制时间  
var count = 120; // 间隔函数，1秒执行  
var curCount; // 当前剩余秒数  
$().ready(function(){
    
	//user_login.init();
	rePwdCus.init();

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


var user_login = {
		init:function(){
			this.phoneChangeStep();
		},
		phoneChangeStep:function(){
			 $('#step1Btn').off('click').on('click',function(){
				 $('#topStep1').removeClass('red');
				 $('#topStep2').removeClass('gray');
				 $('#topStep1').addClass('gray');
				 $('#topStep2').addClass('red');
				 $('.step1').hide();
				 $('.step2').show();
			 });
			 
			 $('#step2Btn').off('click').on('click',function(){
				 $('#topStep2').removeClass('red');
				 $('#topStep3').removeClass('gray');
				 $('#topStep2').addClass('gray');
				 $('#topStep3').addClass('red');
				 $('.step2').hide();
				 $('#orderSuccess').show();
			 });
		},
		

} 

var rePwdCus = {
	    //方法都在init中
	    init: function() {
	    	//用户手机号码失去焦点
			this.userPhoneChange();
			//用户更换图形验证码
			this.userChangeKaptcha();
			//获取手机验证码
			this.userVerificationCode();
			//下一步，验证手机验证码
			this.phoneCodeValidate();
			//点击设置完密码，点击完成修改
			//this.finishModify();
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
						
					}, getContextPath() + '/login/validation/phone', $.toJSON({
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
		userChangeKaptcha:function(){
			$('#kaptcha_pic_user').off("click").on('click',function(){
				$('#kaptcha_pic_user').val('');// 重置图片验证码
				// 初始化 验证码
				$('#kaptcha_pic_user').attr('src',getContextPath() + '/login/kaptcha.png?' + Math.floor(Math.random()*100));
				$('#kaptcha_code_user').focus();
			});
		},
		//点击获取手机验证码
		userVerificationCode:function(){
			// 点击获取手机验证码发送按钮
			$('#get_code_user').off('click').on('click',function(){
				curCount = count;
				var telephone = $('#user_phoneNumber').val().trim();
				if(telephone == '' || telephone == null || telephone == undefined){
					successToolTipShow('请输入手机号');
					$('#user_phoneNumber').focus();
					return false;
				}
				if(checkMobile(telephone)){
					rePwdCus.userCheckVerification();
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
		phoneCodeValidate:function(){
			var _this = this;
			$("#step1Btn").off("click").on("click",function(){
				var phoneNumber = $('#user_phoneNumber').val();				
				var veri_code = $('#verification_code_user').val();
				var kap_code = $('#kaptcha_code_user').val();
				$("#code_error_info_user").addClass("hide");
				$("#kapt_error_info_user").addClass("hide");
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
						 $('#topStep1').removeClass('red');
						 $('#topStep2').removeClass('gray');
						 $('#topStep1').addClass('gray');
						 $('#topStep2').addClass('red');
						 $('.step1').hide();
						 $('.step2').show();
//			            _this.dealLoginNameStatus();
//			            _this.checkPWD();
					}else{
						successToolTipShow(info.value);
						return false;
					}
				},  getContextPath() + '/login/doLogin', $.toJSON({
					loginType :'phone',
					telephone : phoneNumber,
					verification_code : veri_code
				}));
			})
		},
		checkPWD:function(){
			$("#pwd").off("blur").on("blur",function(){
				var pwd = $('#pwd').val();
				if(pwd == null || pwd == '' || pwd == undefined){
					successToolTipShow("请输入密码");
					return false;
				}else if(pwd.length<6){
					successToolTipShow("密码不能少于6位");
					return false;
				}
			});
		},
		finishModify:function(){
			$("#stepFinishBtn").off("click").on("click",function(){

				var pwd = $('#pwd').val();	
				var newpwd = $('#newpwd').val();
				
				if(pwd == null || pwd == '' || pwd == undefined){
					successToolTipShow("请输入密码");
					$('#pwd').focus();
					return false;
				}else if(pwd.length<6){
					successToolTipShow("密码不能少于6位");
					$('#pwd').focus();
					return false;
				}
				if(newpwd == null || newpwd == '' || newpwd == undefined){
					successToolTipShow("请再次输入密码");
					$('#newpwd').focus();
					return false;
				}
				if(newpwd!=pwd){
					successToolTipShow("两次密码不一致");
					$('#newpwd').focus();
					return false;
				}
					loadData(function(info){
						if(info){
							 $('#topStep2').removeClass('red');
							 $('#topStep3').removeClass('gray');
							 $('#topStep2').addClass('gray');
							 $('#topStep3').addClass('red');
							 $('.step2').hide();
							 $('#orderSuccess').show();
						}else{
							successToolTipShow('修改失败');
							return false;
						}
					},  getContextPath() + '/user/modify/password', $.toJSON({
						password  :Encrypt(pwd),
					}));
			})
		},
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








