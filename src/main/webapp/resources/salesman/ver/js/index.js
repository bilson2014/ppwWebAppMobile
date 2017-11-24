var nowImg = 1;
var imgNum = 5;
var counts = 60; // 间隔函数，1秒执行
var curCounts = 0; // 当前剩余秒数 - 注册
var InterValObj; // timer变量，控制时间 - 注册
var a=true;
$().ready(function() {
	subPaipian();
	//背景图片
	$('#img1').addClass('activeImg');
	setInterval(function(){
		 if(nowImg >= imgNum){
			 nowImg = 1;
			 $('.backImg').find('img').removeClass('activeImg');
			 $('#img'+nowImg).addClass('activeImg');	
		 }else{
			 nowImg++;
			 $('.backImg').find('img').removeClass('activeImg');
			 $('#img'+nowImg).addClass('activeImg');	 
		 }
	},5000);
	$('.slideBox .prev').addClass('.addstyle');
	setInterval(function(){
		if (a){
			$('.slideBox .next').css('opacity','1');
			$('.slideBox .prev').css('opacity','0.5');
			a=false;
		}else {
			$('.slideBox .next').css('opacity','0.5');
			$('.slideBox .prev').css('opacity','1');
			a=true;
		}	
	},400);
	jQuery(".slideBox").slide({mainCell:".bd ul",effect:"fold",});

});

function checkData(){
	// 检查数据
	var contactTele = $('#indent_tele').val().trim();
	var flag = true;
	
	if(contactTele == '' || contactTele == null || contactTele == undefined){
		$('#error').show('normal');
		$('#error').text('请输入手机号码');
		flag = false;
	}
	return flag;
}
function subPaipian(){
	var role = $('#role').val();
	if(role!=null && role!= "" ){
			loginOrder();
	}else{
		noLoginOrder();
	}
	$('#getPhoneCode').off("click").on('click',function(){
		$('#error').hide();
		$('#codeError').hide();
		if(curCounts == 0 && checkDatas(2)){
			curCounts = counts;
			var telephone = $('#indent_tele').val().trim();
			$('#getPhoneCode').text('已发送(' + curCounts + ')');
			$('#getPhoneCode').attr('disabled', 'disabled');
			InterValObj = window.setInterval(SetRemainTimes, 1000); // 启动计时器，1秒钟执行一次
			loadData(function(flag) {
				if (!flag) {
					// 发送不成功
					// 显示重新发送
					sendCode = true;
					$('#getPhoneCode').text('重新获取');
					$('#getPhoneCode').removeAttr('disabled');
				}
			}, getContextPath() + '/login/verification/' + telephone, null);
		}
	});
}

function loginOrder(){
	
	$('#subPaipian').off("click").on("click",function(){	
		var role = $('#role').val();
		if(role !="" && role !="客户"){
			var setInfo = "您现在登陆角色是" + role
			+ "</br>请退出登陆后重新下单，或联系我们</br>400-660-9728"
		$('#showInfo').show();
		$('#setInfo').html(setInfo);	
		}else{
			loadData2(function(msg){
				if(msg.ret){
					$('.comOrder').hide();
					$('#orderSuccess').show().addClass('moedlActive');
					$('#error').hide();
					$('#codeError').hide();
					$('#showStatues').text('恭喜您下单成功');
				}
				else{
					$('.comOrder').hide();
					$('#orderSuccess').show().addClass('moedlActive');
					$('#error').hide();
					$('#codeError').hide();
					$('#showStatues').text('服务器异常请之后再试');
				}
				flag = true;
			}, getContextPath() + '/order/deliver', 
				{	
				csrftoken:$("#csrftoken").val(),
				indent_tele:'',
				indent_recomment:$("#submit-indent-recomment").text(),
				indentName:'网站-移动-首页banner',
				productId:-1,
				teamId:-1,
				serviceId:-1,
				phoneCode : '',
				indentSource : 16
			});	
		}
		

	});
}



function noLoginOrder(){
	var flag = true;
	$('#subPaipian').off("click").on("click",function(){
		$('#error').hide();
		$('#codeError').hide();
		if(checkDatas(1)){ // 检查数据完整性
				if(flag){
					flag = false;
					loadData2(function(msg){
						if(msg.ret){
							$('.comOrder').hide();
							$('#orderSuccess').show().addClass('moedlActive');
							$('#error').hide();
							$('#codeError').hide();
							window.clearInterval(InterValObj);
							$('#getPhoneCode').text('发送验证码');
							$('#getPhoneCode').removeAttr('disabled');
							counts = 60;
							curCounts = 0;
							var contactTele = $('#indent_tele').val('');
							var phoneCode = $('#phoneCode').val('');
							$('#showStatues').text('恭喜您下单成功');
						}
						else{
							$('#codeError').show();
							$('#codeError').text('验证码错误');
						}
						flag = true;
					}, getContextPath() + '/order/deliver', 
						{	
						csrftoken:$("#csrftoken").val(),
						indent_tele:$("#indent_tele").val(),
						indent_recomment:$("#submit-indent-recomment").text(),
						indentName:'网站-移动-首页banner',
						productId:-1,
						teamId:-1,
						serviceId:-1,
						phoneCode : $('#phoneCode').val(),
						indentSource : 16
					});	
				}
		}
	});
}


function SetRemainTimes() {
	if (curCounts == 0) {
		window.clearInterval(InterValObj); // 停止计时器
		sendCode = true;
		$('#getPhoneCode').text('重新获取');
		$('#getPhoneCode').removeAttr('disabled')
		// 清除session code
		getData(function(data) {
			// 清除session code
		}, getContextPath() + '/login/clear/code');
	} else {
		curCounts--;
		$("#getPhoneCode").text('已发送(' + curCounts + ')');
	}
}

//检查数据完整性
function checkDatas(type) {
	// 检查数据
	var contactTele = $('#indent_tele').val().trim();
	var phoneCode = $('#phoneCode').val().trim();
	var flag = true;
	if (contactTele == '' || contactTele == null || contactTele == undefined) {
		$('#error').show();
		$('#error').text('请输入手机号码');
		flag = false;
		return flag;
	}
	if (!checkMobile(contactTele)) {
		$('#error').show();
		$('#error').text('手机格式不正确');
		flag = false;
		return flag;
	}
	if ((phoneCode == '' || phoneCode == null || phoneCode == undefined)
			&& type == 1) {
		$('#codeError').show();
		$('#codeError').text('请输入手机验证码');
		flag = false;
		return flag;
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

function getCardWord(){
	
	$.each($('.des'), function(i,model) {
		$(model).text(getContentIndex(title));
	})
	
}

function getContentIndex(string){
	 var screenWidth = document.documentElement.clientWidth;
	 var num = 33;  
	if(string.length<=num){
		var content = string
	}else{
		var content = string.substr(1,num) +"[...]"
	}
	return  content;
}