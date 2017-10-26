var InterValObj; // timer变量，控制时间  
var count = 60; // 间隔函数，1秒执行  
var sendCodeFlag = true;
$().ready(function() {
	
	var localsrc=window.location.href;
	init();
	setHeight();
	initShareNew();
	success();	
	var screenWidth = document.documentElement.clientWidth;
	$('body').css('width',screenWidth); 
});


function varphone(){
	var phone=$('#phone').val();
	var reg = /^(0|86|17951)?(13[0-9]|15[012356789]|17[01678]|18[0-9]|14[57])[0-9]{8}$/;
	console.log(phone);
	console.log($('#phoneerror').text());
	if (phone==''||phone==null||phone==undefined){
		$('#phoneerror').text('*手机号不能为空');
		return false;
	}
	if(!phone.match(reg)){
		$('#phoneerror').text('*请输入正确的手机号');
		return false;
	} 
	$('#phoneerror').text('');
	return true;
}
function success(){
	//立即报名
	$('#btnSub').on('click',function(){
		if (varphone()){
			var num=$('#num').val();
			if (num==''||num==null||num==undefined){
				 $('#numerror').text('*验证码不能为空');
				 return false;
			}else {
				loadData2(function(result){	
					console.log(result);
					 if (!result.ret){
						$('#numerror').text('*'+ result.message);
						return false;
					 }else{
						 $('#orderSuccess').attr('style','display:block;');	
						 $('#numerror').text('');
						 window.clearInterval(InterValObj);
						 $('#varnum').text('获取验证码');
						 $('#phone').val('');
						 $('#num').val('');
						 sendCodeFlag = true;						 					 
					 }	 
				 }, getContextPath() + '/order/deliver', 
				 {	
					csrftoken:$("#csrftoken").val(),
					indent_tele:$('#phone').val(),
					indentName:'线上-活动',//订单名称
					productId:-1,
					teamId:-1,
					serviceId:-1,
					phoneCode : $('#num').val(),
					indentSource : 2//订单来源编号			
				  });	
			}			 
		}				 
	})
	//验证码
	$('#varnum').on('click',function(){		
		if(varphone()){
			if(sendCodeFlag){//防止多次点击			
				sendCodeFlag = false;
				var phone=$('#phone').val();
				verification(phone,'varnum');			
			}
		}
	})
	//报名成功弹框确认事件
	$('#checkSuccess').on('click',function(){
		$('#orderSuccess').attr('style','display:none;');
		
	})
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
function verification(phone,ID){
	curCount = count;
	// 发送验证码	
	loadData(function(flag){
		if(flag){ // 发送成功
			$('#'+ID).text('已发送('+ curCount +')');
			// 设置 button 效果为禁用
			$('#'+ID).attr('disabled','disabled');
			InterValObj && window.clearInterval(InterValObj);
			InterValObj = window.setInterval(function(){
				if(curCount == 0){
					window.clearInterval(InterValObj); // 停止计时器
					$('#'+ID).text('重新获取');
					$('#'+ID).removeAttr('disabled')
					// 清除session code
					getData(function(data){
						// 清除session code
					}, getContextPath() + '/login/clear/code');
					sendCodeFlag = true;
				}else{
					curCount--;  
					$('#'+ID).text('已发送('+ curCount +')');
				}
			}, 1000); // 启动计时器，1秒钟执行一次
		}else{ // 发送不成功
			// 显示重新发送
			$('#'+ID).text('重新获取');
			$('#'+ID).removeAttr('disabled');
		}			
	}, getContextPath() + '/login/verification/' + phone, null);		
		
}


function setHeight(){
	  var screenWidth = document.documentElement.clientWidth;
      var setHeight= screenWidth/16*9;
	  $('#playVideo').css('height',setHeight);
	  var iconHeight=$('.pageOneIcon').height();
      var top = setHeight - (iconHeight/2);
      $('.pageOneIcon').css('top',top);
}

function init() {
	    document.addEventListener("WeixinJSBridgeReady", function () {
	    	document.getElementById('toPlayVideo').play();
	     }, false);
	    document.getElementById('toPlayVideo').play();
		$('#toPlayVideo').off('click').on('click',function(){
			document.getElementById('toPlayVideo').play();
		});
       var swiperV = new Swiper('.swiperVertical', {
	        direction: 'vertical',
	        pagination: '.swiper-pagination-v',
	        paginationClickable: true ,
	       // loop:true,
	        onSlideNextEnd: function(swiper){
	        	var index = swiper.activeIndex;
	        	 if(index == 0){
	        		 $('.spIcon').show();
	        	 }
	            if(index == 1){
	            	document.addEventListener("WeixinJSBridgeReady", function () {
	     		    	document.getElementById('toPlayFullVideo').play();
	     		     }, false);
	     		    document.getElementById('toPlayFullVideo').play();
	     			$('#toPlayFullVideo').off('click').on('click',function(){
	     				document.getElementById('toPlayFullVideo').play();
	     			});
	            	$('.serWord').removeClass('animation');
	            	document.getElementById('toPlayVideo').pause();
	            }
	            if(index == 1){
	            	$('.spIcon').hide();
	            }
	           }
	    });
}
	

function initShareNew(){
	
	wx.config({
        debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
        appId: 'wxb5f2540cff5*****', // 必填，公众号的唯一标识
        timestamp:'1414587457' , // 必填，生成签名的时间戳
        nonceStr: 'Wm3WZYTPz0wzccnW', // 必填，生成签名的随机串
        signature: '0f9de62fce790f9a083d5c99e95740ceb90c27ed',// 必填，签名
        jsApiList: ['onMenuShareAppMessage','onMenuShareTimeline'] // 必填，需要使用的JS接口列表
    });
    wx.ready(function(){
        wx.onMenuShareAppMessage({
        	title: '9999元拍企业视频名片', // 分享标题
            desc: '精准覆盖10000+用户', // 分享描述
            link: 'http://m.apaipian.com/activity/vi', // 分享链接
            imgUrl: 'http://m.apaipian.com/resources/images/employee/em1.png', // 分享图标
            type: 'link', // 分享类型,music、video或link，不填默认为link
            dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
        /*    success: function () { 
            },
            cancel: function () { 
            }*/
        });
    /*  wx.error(function(res){
        });*/
        wx.onMenuShareTimeline({
            title: '9999元拍企业视频名片', // 分享标题
            desc: '精准覆盖10000+用户', // 分享描述
            link: 'http://m.apaipian.com/activity/vi', // 分享链接
            imgUrl: 'http://m.apaipian.com/resources/images/employee/em1.png', // 分享图标
            type: 'link', // 分享类型,music、video或link，不填默认为link
            dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
        });
    });	
}
	


