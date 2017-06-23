var InterValObj; // timer变量，控制时间  
var count = 60; // 间隔函数，1秒执行  
var curCount; // 当前剩余秒数 
var swiper;
var reSet = false;
var indentId = 0;
var add = true;
var first = true;
$().ready(function() {
	 init();
	 getVerificationCode();
	 controlCost();
});
function controlCost(){
	
	$('.start').off('click').on('click',function(){
		var loginTel = $('#rolephone').val();
		if(loginTel!=null && loginTel!= "" ){
			loginOrder();
		}else{
			noLoginOrder();
		}
	});
}
function loginOrder(){
	var videoType = $('.tags1').siblings('.type').attr('data-content');
	var team = $('.tags2').siblings('.team').attr('data-content');
	var equipment = $('.tags3').siblings('.equipment').attr('data-content');
	var actor = $('.tags4').siblings('.actor').attr('data-content');
	var animation = $('.tags5').siblings('animation').attr('data-content');
	var videoTypeText = $('.tags1').siblings('.type').text();
	var teamText = $('.tags2').siblings('.team').text();
	var equipmentText = $('.tags3').siblings('.equipment').text();
	var actorText = $('.tags4').siblings('.actor').text();
	var animationText = $('.tags5').siblings('animation').text();
	var time = $('#time').text();
	var indentId = $('#phone').attr('data-content');
	var description = [ "视频类别:" + videoTypeText, ",时长: 未选择", ",导演团队:" + teamText,
			",拍摄设备:" + equipmentText, ",演员:" + actorText, ",动画:" + animationText ].join("");
	var phone = $('#rolephone').val();
	if(first){
		add = false;
		loadData(function(result) {
			add = true;
				$('#price').text(thousandCount(result.cost));
				$('#phone').attr('data-content', result.indentId);
				$("#code-container").remove();
				$('#bar').removeClass('proWidth'); 
				$('.item').hide();
				$('#step1').hide();
				$('#step2').show();
			 	setTimeout(function() {
				 		$('#bar').addClass('proWidth'); 
					}, 500);
			 	setTimeout(function() {
					$('#step2').hide();
					$('#step3').show();
				}, 3000);
				first = false;
		}, getContextPath() + '/calculate/cost', $.toJSON({
			videoType : videoType,
			team : team,
			equipment : equipment,
			actor : actor,
			animation : animation,
			phone : '',
			indentId : indentId,
			description : description,
			verification_code:'',
			indentName : '网站-移动-成本计算器',
			indentSource : 1
		}));
	}else{
		loadData(function(result) {
			flag = 1;
			$('#price').text(thousandCount(result.cost));
			$('#phone').attr('data-content', result.indentId);
			$('.item').hide();
			$('#step1').hide();
			$('#step2').show();
		 	setTimeout(function() {
			 		$('#bar').addClass('proWidth'); 
				}, 500);
		 	setTimeout(function() {
				$('#step2').hide();
				$('#step3').show();
			}, 3000);
		}, getContextPath() + '/calculate/cost', $.toJSON({
			videoType : videoType,
			team : team,
			equipment : equipment,
			actor : actor,
			animation : animation,
			phone : '',
			indentId : indentId,
			description : description,
			verification_code:'',
			indentSource : 1
		}));
	}
	
}

function noLoginOrder(){
	if(checkData()){
		var videoType = $('.tags1').siblings('.type').attr('data-content');
		var team = $('.tags2').siblings('.team').attr('data-content');
		var equipment = $('.tags3').siblings('.equipment').attr('data-content');
		var actor = $('.tags4').siblings('.actor').attr('data-content');
		var animation = $('.tags5').siblings('animation').attr('data-content');
		var videoTypeText = $('.tags1').siblings('.type').text();
		var teamText = $('.tags2').siblings('.team').text();
		var equipmentText = $('.tags3').siblings('.equipment').text();
		var actorText = $('.tags4').siblings('.actor').text();
		var animationText = $('.tags5').siblings('animation').text();
		
		var time = $('#time').text();
		var indentId = $('#phone').attr('data-content');
		var description = [ "视频类别:" + videoTypeText, ",时长: 未选择", ",导演团队:" + teamText,
				",拍摄设备:" + equipmentText, ",演员:" + actorText, ",动画:" + animationText ].join("");
		var phone = $('#phone').val();
		var verification_code = $('#phoneCode').val();
		if(add){
			if(first){
				add = false;
				loadData(function(result) {
					add = true;
					$('#phoneError').hide();
					$('#codeError').hide();
					if(result.code == 1){
						$('#price').text(thousandCount(result.cost));
						$('#phone').attr('data-content', result.indentId);
						$("#code-container").remove();
						$('#bar').removeClass('proWidth'); 
						$('.item').hide();
						$('#step1').hide();
						$('#step2').show();
					 	setTimeout(function() {
						 		$('#bar').addClass('proWidth'); 
							}, 500);
					 	setTimeout(function() {
							$('#step2').hide();
							$('#step3').show();
						}, 3000);
						first = false;
					}else if(result.code == 0 && result.msg == '手机号不匹配'){
						$('#phoneError').text( '手机号不匹配');
						$('#phoneError').show();
					}else{
						$('#codeError').text( result.msg);
						$('#codeError').show();
					}
				}, getContextPath() + '/calculate/cost', $.toJSON({
					videoType : videoType,
					team : team,
					equipment : equipment,
					actor : actor,
					animation : animation,
					indentName : '网站-移动-成本计算器',
					phone : phone,
					indentId : indentId,
					description : description,
					verification_code:verification_code,
					indentSource : 1
				}));
			}else{
				loadData(function(result) {
					flag = 1;
					$('#price').text(thousandCount(result.cost));
					$('#phone').attr('data-content', result.indentId);
					$('.item').hide();
					$('#step1').hide();
					$('#step2').show();
				 	setTimeout(function() {
					 		$('#bar').addClass('proWidth'); 
						}, 500);
				 	setTimeout(function() {
						$('#step2').hide();
						$('#step3').show();
					}, 3000);
				}, getContextPath() + '/calculate/cost', $.toJSON({
					videoType : videoType,
					team : team,
					equipment : equipment,
					actor : actor,
					animation : animation,
					phone : phone,
					indentId : indentId,
					description : description,
					verification_code:verification_code,
					indentSource : 1
				}));
			}
		}
	}
}

function init() {
	 var swiper = new Swiper('.swiper-container', {
	        pagination: '.swiper-pagination',
	        slidesPerView: 'auto',
	        paginationClickable: true,
	        spaceBetween:0,
	        onSlideNextEnd: function(swiper){
	        	var index = swiper.activeIndex;
	        	switch (index){
	        	case 1:
	        		initStep1(swiper);
	        		break;
	        	case 2:
	        		initStep2(swiper);
	        		break;
	        	case 3:
	        		initStep3(swiper);
	        		break;
	        	case 4:
	        		initStep4(swiper);
	        		break;
	        	case 5:
	        		initStep5(swiper);
	        		break;
	        	}
	        }
	    });
	 
	 controlActive(swiper);
	 
	 $('.reCost').on('click',function(){
		 swiper.slideTo(0, 1000, false);//切换到第一个slide，速度为1秒
		 $('#step1').show();
		 $('#step2').hide();
		 $('#step3').hide();
		 $('#bar').removeClass('proWidth'); 
	 });
	
}

function controlActive(swiper){
	
	$('.tags1').off('click').on('click',function(){
		$('.tags1').removeClass('type');
		$(this).addClass('type');
		swiper.slideNext();
	});
	
	$('.tags2').off('click').on('click',function(){
		$('.tags2').removeClass('team');
		$(this).addClass('team');
		swiper.slideNext();
	});
	
	$('.tags3').off('click').on('click',function(){
		$('.tags3').removeClass('equipment');
		$(this).addClass('equipment');
		swiper.slideNext();
	});
	
	$('.tags4').off('click').on('click',function(){
		$('.tags4').removeClass('actor');
		$(this).addClass('actor');
		swiper.slideNext();
	});
	
	$('.tags5').off('click').on('click',function(){
		$('.tags5').removeClass('animation');
		$(this).addClass('animation');
		swiper.slideNext();
	});
	
	$('.closeInfo').off('click').on('click',function(){
		$('#noInfo').hide();
	});
	
}

function initStep1(swiper){
	if($('.tags1').hasClass('type')){
	}else{
		$('#noInfo').show();
		swiper.slidePrev();
	}
}
function initStep2(swiper){
	if($('.tags2').hasClass('team')){
	}else{
		$('#noInfo').show();
		swiper.slidePrev();
	}
}
function initStep3(swiper){
	if($('.tags3').hasClass('equipment')){
	}else{
		$('#noInfo').show();
		swiper.slidePrev();
	}
}
function initStep4(swiper){
	if($('.tags4').hasClass('actor')){
	}else{
		$('#noInfo').show();
		swiper.slidePrev();
	}
}
function initStep5(swiper){
	if($('.tags5').hasClass('animation')){
	}else{
		$('#noInfo').show();
		swiper.slidePrev();
	}
}

function checkData(){
	var phone = $('#phone').val();
	var code = $('#phoneCode').val();
	var phoneError = $('#phoneError');
	var codeError = $('#codeError');
	var indentId = $('#phone').attr('data-content');
	if(phone == null || phone == '' || phone == undefined){
		$('#phone').addClass('errorPhone');
		phoneError.text('请输入手机号');
		phoneError.show();
		return false;
	}
	if (!checkMobile(phone)) {
		$('#phone').addClass('errorPhone');
		phoneError.text('手机格式不正确');
		phoneError.show();
		return false;
	}
	if( indentId == 0 ){//只有第一次计算需要验证码
		if(code == null || code == '' || code == undefined){
			$('#phoneCode').addClass('errorPhone');
			codeError.text('请填写验证码');
			codeError.show();
			return false;
		}
	}
	return true;
}

//点击获取手机验证码
function getVerificationCode(){
	// 点击获取手机验证码发送按钮
	$('#checkCode').off('click').on('click',function(){
		curCount = count;
		var phone = $('#phone').val();
		var code = $('#phoneCode').val();
		var phoneError = $('#phoneError');
		var codeError = $('#codeError');
		if(phone == null || phone == '' || phone == undefined){
			$('#phone').addClass('errorPhone');
			phoneError.text('请输入手机号');
			phoneError.show();
			return false;
		}
		if (!checkMobile(phone)) {
			$('#phone').addClass('errorPhone');
			phoneError.text('手机格式不正确');
			phoneError.show();
			return false;
		}
		$('#checkCode').text('已发送('+ curCount +')');
		$('#checkCode').attr('disabled','disabled');
		InterValObj = window.setInterval(setRemainTime, 1000); // 启动计时器，1秒钟执行一次
		loadData(function(flag){
			if(!flag){
				window.clearInterval(InterValObj);
				$('#checkCode').text('重新获取');
				$('#checkCode').removeAttr('disabled');
			}
		}, getContextPath() + '/login/verification/' + $('#phone').val().trim(), null);
	});
}

//timer 处理函数 - 注册
function setRemainTime(){
	if(curCount == 0){
		window.clearInterval(InterValObj); // 停止计时器
		$('#checkCode').text('重新获取');
		$('#checkCode').removeAttr('disabled')
		// 清除session code
		getData(function(data){
			// 清除session code
		}, getContextPath() + '/login/clear/code');
	}else{
		curCount--;  
		$("#checkCode").text('已发送('+ curCount +')');
	}
}
