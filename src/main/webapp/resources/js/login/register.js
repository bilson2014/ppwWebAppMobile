var InterValObj; // timer变量，控制时间  
var count = 60; // 间隔函数，1秒执行  
var curCount; // 当前剩余秒数  
var PopInterValObj, oTimer, successIntervalObj;
$().ready(function(){
	register.init_user();
	merchantBridge();
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

var register = {
	    //方法都在init中
	    init_user: function() {
	    	//用户手机号码失去焦点
			this.userPhoneChange();
			//用户更换图形验证码
			this.userChangeKaptcha();
			//获取手机验证码
			this.userVerificationCode();
			//用户点击注册
			this.userRegister();
	    },
	    userPhoneChange:function(){
			$('#user_phoneNumber').off("change").on('change',function(){
				var telephone = $('#user_phoneNumber').val().trim();
				if(telephone == '' || telephone == null || telephone == undefined){
					successToolTipShow('请填写手机号');
					$('#user_phoneNumber').focus();
					return ;
				}
				if(checkMobile(telephone)){
					loadData(function(flag){
						if(flag.errorCode == 200){
							// 已经注册
							successToolTipShow('该手机号已经注册');
						}else if (flag.errorCode == 300){
						//  未注册
						}else if (flag.errorCode == 500){
							// 服务器错误
							successToolTipShow(flag.errorMsg);
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
					successToolTipShow('请填写手机号');
					$('#user_phoneNumber').focus();
					return false;
				}
				if(checkMobile(telephone)){
					register.userCheckVerification();
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
		userRegister:function(){
			var add = true;
			$("#submitBtn-user").off("click").on("click",function(){
				var phoneNumber = $('#user_phoneNumber').val();		
				loadData(function(flag){
					if(flag.errorCode == 200){
						// 已经注册
						successToolTipShow('该手机号已经注册');
					}else if (flag.errorCode == 300){
						if(add){
							add = false;//禁用点击事件， 防止网络拥堵或点击过快造成多次注册
							var veri_code = $('#verification_code_user').val();
							var kap_code = $('#kaptcha_code_user').val();
							$("#code_error_info_user").addClass("hide");
							$("#kapt_error_info_user").addClass("hide");
							if(phoneNumber == null || phoneNumber == '' || phoneNumber == undefined){
								successToolTipShow("请输入手机号");
								$('#user_phoneNumber').focus();
								add = true;
								return false;
							}
							if(!checkMobile(phoneNumber.trim())){
								successToolTipShow('手机号不正确');
								$('#user_phoneNumber').focus();
								add = true;
								return false;
							}
							if(kap_code == null || kap_code == '' || kap_code == undefined){
								successToolTipShow("请输入图形验证码");
								$('#kaptcha_code_user').focus();
								add = true;
								return false;
							}
							if(veri_code == null || veri_code == '' || veri_code == undefined){
								successToolTipShow("请输入验证码");
								$('#verification_code_user').focus();
								add = true;
								return false;
							}
							loadData(function(info){
								$(".errorDiv").hide();
								if(info.key){
									window.location.href=getContextPath()+'/';
								}else{
									add = true;
									successToolTipShow(info.value);
									return false;
								}
							},  getContextPath() + '/login/register', $.toJSON({
								telephone : phoneNumber,
								password : Encrypt("123456"),
								verification_code : veri_code,
							}));
						}
					}else if (flag.errorCode == 500){
						// 服务器错误
						successToolTipShow(flag.errorMsg);
					}
				}, getContextPath() + '/login/validation/phone', $.toJSON({
					telephone : phoneNumber
				}));
			})
		},
}
