var InterValObj; // timer变量，控制时间  
var count = 60; // 间隔函数，1秒执行  
var curCount; // 当前剩余秒数 
var swiper;
var reSet = false;
$().ready(function() {

	 getUrlTarget();
	 init();
	 getVerificationCode();
	 initTools();
	 merchantBridge();

});
function init() {

	 swiper = new Swiper('.swiper-container', {
	        pagination: '.swiper-pagination',
	        paginationClickable: true,
	        direction: 'vertical',
	        onSlidePrevEnd:function(swiper){
	        	swiper.unlockSwipeToNext();
	        },
	        onSlideNextEnd: function(swiper){
	        	var index = swiper.activeIndex;
	        	switch (index){
	        	case 0:
	        		break;
	        	case 1:
	        		break;
	        	case 2:
	        		initStep2();
	        		
	        		break;
	        	case 3:
	        		initStep3();
	        		break;
	        	case 4:
	        		initStep4();
	        		break;
	        	case 5:
	        		initStep5();
	        		break;
	        	case 6:
	        		initStep6();
	        		break;
	        	case 7:
	        		initStep7();		
	        		swiper.lockSwipeToNext();
	        		break;
	        	}
	            }
	    });
	 
	 $('.reCost').on('click',function(){
		 step2.find('div').removeClass('red-2');
		 step3.find('div').removeClass('red-3');
		 step4.find('div').removeClass('red-4');
		 step5.find('div').removeClass('red-5');
		 step6.find('div').removeClass('red-6');
		 step7.find('div').removeClass('red-7');
		 swiper.slideTo(1, 1000, false);//切换到第一个slide，速度为1秒
		 $('#codePhone').hide();
		 $('#phone').hide();
		 reSet = true;
		 $('#phoneCard').show();
		 $('.sOrder').removeClass('sOrderEnd');
		 $('#bar').removeClass('proWidth'); 
	 	 $('#showOrder').removeClass('scaleSmall');
	 	 $('.toOrderDiv').addClass('errorPhoneReset');
	 	 $('#phoneCard').removeClass('cardBack');
	 	 
	 });
	 $('.icon').on('click',function(){
		// swiper.slideNext();
	 });
	 
	var step1 = $('.stepBtn-1');
	var step2 = $('.stepBtn-2');
	var step3 = $('.stepBtn-3');
	var step4 = $('.stepBtn-4');
	var step5 = $('.stepBtn-5');
	var step6 = $('.stepBtn-6');
	var step7 = $('.stepBtn-7');
	step1.off('click').on('click',function(){
		swiper.slideNext();
     });
	step2.off('click').on('click',function(){
		step2.find('div').removeClass('red-2');
		$(this).find('div').addClass('red-2');
		setTimeout(function() {
			swiper.slideNext();
		}, 500);
	
                     
     });
	step3.off('click').on('click',function(){
		step3.find('div').removeClass('red-3');
		$(this).find('div').addClass('red-3');
		setTimeout(function() {
			swiper.slideNext();
		}, 500);
     });
	step4.off('click').on('click',function(){
		step4.find('div').removeClass('red-4');
		$(this).find('div').addClass('red-4');
		setTimeout(function() {
			swiper.slideNext();
		}, 500);
     });
	step5.off('click').on('click',function(){
		step5.find('div').removeClass('red-5');
		$(this).find('div').addClass('red-5');
		setTimeout(function() {
			swiper.slideNext();
		}, 500);
     });
	step6.off('click').on('click',function(){
		step6.find('div').removeClass('red-6');
		$(this).find('div').addClass('red-6');
		setTimeout(function() {
			swiper.slideNext();
		}, 500);
     });
	step7.off('click').on('click',function(){
		step7.find('div').removeClass('red-7');
		$(this).find('div').addClass('red-7');
		setTimeout(function() {
			swiper.slideNext();
		}, 500);
     });
    
    $('#showSuccessImg').on('click',function(){
    	if(checkCode()){
    		getPrice();
    	}
    });
}

function initStep2(){
	
	if($('.stepBtn-2 div').hasClass('red-2')){
	}else{
		$('#noInfo').show();
		swiper.slidePrev();
	}
	
}

function initStep3(){
	if($('.stepBtn-3 div').hasClass('red-3')){
	}else{
		$('#noInfo').show();
		swiper.slidePrev();
	}
}

function initStep4(){
	if($('.stepBtn-4 div').hasClass('red-4')){
	}else{
		$('#noInfo').show();
		swiper.slidePrev();
	}
}

function initStep5(){
	if($('.stepBtn-5 div').hasClass('red-5')){
//		swiper.unlockSwipeToNext();
	}else{
		$('#noInfo').show();
//		swiper.unlockSwipeToNext();
		swiper.slidePrev();
	}
}

function initStep6(){
	if($('.stepBtn-6 div').hasClass('red-6')){
		swiper.unlockSwipeToNext();
	}else{
		$('#noInfo').show();
		swiper.unlockSwipeToNext();
		swiper.slidePrev();
	}
}

function initStep7(){
	if($('.stepBtn-7 div').hasClass('red-7')){
		swiper.lockSwipeToNext();
	}else{
		$('#noInfo').show();
		swiper.unlockSwipeToNext();
		swiper.slidePrev();
	}
}

function getPrice(){
	var videoType =$('.red-2').attr('data-content') == undefined ? 0 : $('.red-2').attr('data-content');
	var videoTypeText = $('.red-2').attr('data-text') == undefined ? '企业宣传' : $('.red-2').attr('data-text');

	var team = $('.red-3').attr('data-content') == undefined ? 0 : $('.red-3').attr('data-content');
	var teamText = $('.red-3').attr('data-text') == undefined ? '专业级导演团队' : $('.red-3').attr('data-text');
	
	var equipment = $('.red-4').attr('data-content') == undefined ? 0 : $('.red-4').attr('data-content') ;
	var equipmentText = $('.red-4').attr('data-text') == undefined ? '专业级设备(HD)' : $('.red-4').attr('data-text');
	
	var videotime = $('.red-5').attr('data-content') == undefined ? 0 : $('.red-5').attr('data-content');
	var videotimeText = $('.red-5').attr('data-text') == undefined ? '1-3分钟' :  $('.red-5').attr('data-text');
	
	var actor = $('.red-6').attr('data-content') == undefined ? 0 : $('.red-6').attr('data-content');
	var actorText = $('.red-6').attr('data-text') == undefined ? '自有演员' :  $('.red-6').attr('data-text');
	
	var animation = $('.red-7').attr('data-content') == undefined ? 0 : $('.red-7').attr('data-content');
	var animationText = $('.red-7').attr('data-text') == undefined ? '无配音' :  $('.red-7').attr('data-text');

	var indentId = $('#phoneCode').attr('data-content');
	var description = [ "视频类别:" + videoTypeText, ",导演团队:" + teamText,",拍摄设备:" + equipmentText, 
		",时长:" + videotimeText,  ",演员:" + actorText, ",配音:" + animationText ].join("");
	var phone =  $('#phone').val();
	var verification_code = $('#phoneCode').val();
    if(reSet){
    	verification_code == "";
    }
	loadData(function(job){
               if(job.code == 1){
            	   var cheng=thousandCount(job.cost);           	  
					var num=cheng.indexOf(',');					
					var le=cheng.substring(0,num);					
					var ri=cheng.substring(num+1,cheng.length);					
					if (ri.length>3){						
						var a=ri.indexOf(',');						
						var b=ri.substring(0,a);						
						var c=ri.substring(a+1,ri.length);						
						$('#getPriceSpan').text(le+","+b+","+c);
					}else {
						$('#getPriceSpan').text(le+","+ri);
					}	
					$('#phoneCode').attr('data-content', job.indentId);
					  swiper.unlockSwipeToNext();
					  showBar();
					$("#code-container").remove();
				}else if(job.code == 0 && job.msg == '手机号不匹配'){
					$('#errorInfo').text('手机号不匹配');
				}else{
					$('#errorCode').text(job.msg);					
				}
             
		}, getContextPath() + '/activity/calculate/result', $.toJSON({
			videoType : videoType,
			team : team,
			equipment :equipment ,
			actor : actor,
			animation : animation,
			time:videotime,
			phone : $('#phone').val(),
			indentId : $('#phoneCode').attr('data-content'),
			description : description,
			verification_code:verification_code,
			target:$('#target').val(),
<<<<<<< HEAD
			indentSource:'17',//订单来源编号
			salesmanUniqueId:'costcpa',//标识
=======
			indentSource:'17',
			salesmanUniqueId:$('#target').val()
>>>>>>> f4f2af9b46bd1dff8a051af4df1b85f5cbaaedbd
		}));
	}

function checkCode(){
	
	$('#errorCode').text('');
	$('#errorInfo').text('');
	
	var code = $('#phoneCode').val();
	var phone = $('#phone').val();
	if(phone == null || phone == '' || phone == undefined){
        $('#errorInfo').text('手机号未填写');
		return false;
	}
	if (!checkMobile(phone)) {
		$('#errorInfo').text('手机格式不正确');
		return false;
	}
	
	if(!reSet){
	if(code == null || code == '' || code == undefined){
        $('#errorCode').text('验证码未填写');
		return false;
	}
	}
	return true;
}

function setRemainTime(){
	if(curCount == 0){
		window.clearInterval(InterValObj); // 停止计时器
		$('#getPhoneCode').text('重新获取');
		$('#getPhoneCode').removeAttr('disabled')
		// 清除session code
		getData(function(data){
			// 清除session code
		}, getContextPath() + '/login/clear/code');
	}else{
		curCount--;  
		$("#getPhoneCode").text('已发送('+ curCount +')');
	}
}

function getVerificationCode(){
	// 点击获取手机验证码发送按钮
	
	$('#getPhoneCode').off('click').on('click',function(){
		curCount = count;
		$('#phone').removeClass('errorPhone');
		$("#errorPhone").attr('data-content','');
		var phone = $('#phone').val();
		if(phone == null || phone == '' || phone == undefined){
			$('#errorInfo').text('手机号未输入');
			return false;
		}
		$('#errorInfo').text('');
		if (!checkMobile(phone)) {
			$('#errorInfo').text('手机格式不正确');
			return false;
		}
		$('#errorCode').text('');
		$('#getPhoneCode').text('已发送('+ curCount +')');
		$('#getPhoneCode').attr('disabled','disabled');
		InterValObj = window.setInterval(setRemainTime, 1000); // 启动计时器，1秒钟执行一次
		loadData(function(flag){
			if(!flag){
				window.clearInterval(InterValObj);
				$('#getPhoneCode').text('重新获取');
				$('#getPhoneCode').removeAttr('disabled');
			}
		}, getContextPath() + '/login/verification/' + $('#phone').val().trim(), null);
	});
}

function initTools(){
	share();
	code();
	
	$('.closeInfo').on('click',function(){
		$('#noInfo').hide();
	});
}

function share(){
    $("#shareWx").click(function() {
    	$('#showWeixin').show();
    });
    $('#showWeixin').click(function(){
    	$('#showWeixin').hide();
    });
}

function code(){
	
	$('#toShowCode').off('click').on('click',function(){
    	$('#code').show();
    });
	
	$('#code').off('click').on('click',function(){
    	$('#code').hide();
    });
}

function showBar(){
	$('#phoneCard').hide();
 	$('#showOrder').show();
 	setTimeout(function() {
 		$('.sOrder').addClass('sOrderEnd');
	},10);
 
 	setTimeout(function() {
 		$('.sOrder').addClass('sOrderEnd');
 		$('#bar').addClass('proWidth'); 
	}, 500);
 	setTimeout(function() {
 		$('#showOrder').addClass('scaleSmall');
	}, 2000);
 	setTimeout(function() {
 		swiper.slideNext();
 		$('.backGround').addClass('scaleBig');
	}, 2500);
 	setTimeout(function() {
 		$('#showOrder').hide();
	}, 3000);
}

function getUrlTarget(){
	 var reg = new RegExp("(^|&)target=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null){
    	 $("#target").val(unescape(r[2])); 
     }
}
