var InterValObj; // timer变量，控制时间
var count = 60; // 间隔函数，1秒执行
var sendCodeFlag = true;
$().ready(function() {
	var localsrc = window.location.href;
	init();
	setHeight();
	initShareNew();
	success();
	var screenWidth = document.documentElement.clientWidth;
	$('body').css('width', screenWidth);
});

function varphone() {
	var phone = $('#phone').val();
	if (phone == '' || phone == null || phone == undefined) {
		$('#phoneerror').text('*手机号不能为空');
		return false;
	}
	if (!checkMobile(phone)) {
		$('#phoneerror').text('*请输入正确的手机号');
		return false;
	}
	$('#phoneerror').text('');
	return true;
}
function success() {
	//访问中飞官网
	$('#two').off('click').on('click',function(){
		window.location.href='http://www.airwing.net.cn/';
	});
}
// AJAX POST
function loadData2(Func, url, param) {
	$.ajax({
		url : url,
		type : 'POST',
		data : param,
		dataType : 'json',
		success : function(data) {
			Func(data);
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.error('ajax(' + url + ')[' + jqXHR.status + ']'
					+ jqXHR.statusText);
			console.error(jqXHR.responseText);
			console.error('[' + textStatus + ']' + errorThrown);
		}
	});
}
function verification(phone, ID) {
	curCount = count;
	// 发送验证码
	loadData(function(flag) {
		if (flag) { // 发送成功
			$('#' + ID).text('已发送(' + curCount + ')');
			// 设置 button 效果为禁用
			$('#' + ID).attr('disabled', 'disabled');
			InterValObj && window.clearInterval(InterValObj);
			InterValObj = window.setInterval(function() {
				if (curCount == 0) {
					window.clearInterval(InterValObj); // 停止计时器
					$('#' + ID).text('重新获取');
					$('#' + ID).removeAttr('disabled')
					// 清除session code
					getData(function(data) {
						// 清除session code
					}, getContextPath() + '/login/clear/code');
					sendCodeFlag = true;
				} else {
					curCount--;
					$('#' + ID).text('已发送(' + curCount + ')');
				}
			}, 1000); // 启动计时器，1秒钟执行一次
		} else { // 发送不成功
			// 显示重新发送
			$('#' + ID).text('重新获取');
			$('#' + ID).removeAttr('disabled');
		}
	}, getContextPath() + '/login/verification/' + phone, null);
}
function setHeight() {      
	var screenWidth = document.documentElement.clientWidth;
	var setHeight = screenWidth / 16 * 9;
	$('#playVideo').css('height', setHeight);
	var imgH = setHeight + 15;
	$('.pageOne').css('top', imgH);
}

function init() {
	document.addEventListener("WeixinJSBridgeReady", function() {
		document.getElementById('toPlayVideo').play();
	}, false);
	document.getElementById('toPlayVideo').play();
	$('#toPlayVideo').off('click').on('click', function() {
		document.getElementById('toPlayVideo').play();
	});
	var swiperV = new Swiper('.swiperVertical', {
		direction : 'vertical',
		pagination : '.swiper-pagination-v',
		paginationClickable : true,
		// loop:true,
		onSlideNextEnd : function(swiper) {
			var index = swiper.activeIndex;
			if (index == 0) {
				$('.spIcon').show();
			}
			if (index == 1) {
				document.addEventListener("WeixinJSBridgeReady", function() {
					document.getElementById('toPlayFullVideo').play();
				}, false);
				document.getElementById('toPlayFullVideo').play();
				$('#toPlayFullVideo').off('click').on('click', function() {
					document.getElementById('toPlayFullVideo').play();
				});
				$('.serWord').removeClass('animation');
				document.getElementById('toPlayVideo').pause();
			}
			if (index != 1) {
				document.getElementById('toPlayFullVideo').pause();
			}
			if (index == 1) {
				$('.spIcon').hide();
			}
			if (index == 2) {
				$('.spIcon').hide();
			}
		}
	});
}

function initShareNew() {

	wx.config({
		debug : false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
		appId : 'wxb5f2540cff5*****', // 必填，公众号的唯一标识
		timestamp : '1414587457', // 必填，生成签名的时间戳
		nonceStr : 'Wm3WZYTPz0wzccnW', // 必填，生成签名的随机串
		signature : '0f9de62fce790f9a083d5c99e95740ceb90c27ed',// 必填，签名
		jsApiList : [ 'onMenuShareAppMessage', 'onMenuShareTimeline' ]
	// 必填，需要使用的JS接口列表
	});
	wx.ready(function() {
				wx.onMenuShareAppMessage({
							title : '中飞艾维-电力巡检领导者', // 分享标题
							desc : '无人机一站式电力飞巡服务', // 分享描述
							link : 'http://m.apaipian.com/activity/airwing', // 分享链接
							imgUrl : 'http://m.apaipian.com/resources/images/salesMan/flyPlay/share.png', // 分享图标
							type : 'link', // 分享类型,music、video或link，不填默认为link
							dataUrl : '', // 如果type是music或video，则要提供数据链接，默认为空
						/*
						 * success: function () { }, cancel: function () { }
						 */
						});
				/*
				 * wx.error(function(res){ });
				 */
				wx.onMenuShareTimeline({
							title : '中飞艾维-电力巡检领导者', // 分享标题
							desc : '无人机一站式电力飞巡服务', // 分享描述
							link : 'http://m.apaipian.com/activity/airwing', // 分享链接
							imgUrl : 'http://m.apaipian.com/resources/images/salesMan/flyPlay/share.png', // 分享图标
							type : 'link', // 分享类型,music、video或link，不填默认为link
							dataUrl : '', // 如果type是music或video，则要提供数据链接，默认为空
						});
			});
}
