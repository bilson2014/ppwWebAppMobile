var InterValObj; // timer变量，控制时间  
var PopInterValObj, oTimer, successIntervalObj;

$().ready(function(){
	// 弹出电话预约界面
	$('.common-icons-tele-client').click(function(){
		$('#toolbar-modal').modal({
			keyboard: false
		})
		
		$('#modal-call').on('click',function(){
			// 检测手机号码
			var phoneNumber = $('#phoneCall').val();
			if(phoneNumber != null && phoneNumber != '' && phoneNumber != undefined){
				if(checkMobile(phoneNumber)){
					loadData(function(result){
						if(result){
							// 消息发送成功
							$('#modal-dd-second').empty();
							$('#modal-h3-first').text('视频营销专家正火速与您联系!');
							/*$('.modal-message').empty();
							$('.modal-message').text('亲!我们的视频专家将马上与您致电,请耐心等候!');
							$('.modal-message').show('normal');*/
						}else{
							// 消息发送失败
							$('.modal-message').empty();
							$('.modal-message').text('亲!拍拍出了点小问题，正在努力自我修复，请刷新后再试哦!');
							$('.modal-message').show('normal');
						}
					}, getContextPath() + '/appointment/' + phoneNumber, null);
				}else {
					$('.modal-message').empty();
					$('.modal-message').text('请输入正确的电话号码哦亲!');
					$('.modal-message').show('normal');
				}
			}else {
				$('.modal-message').empty();
				$('.modal-message').text('别忘记输入电话哦亲!');
				$('.modal-message').show('normal');
			}
		});
	});
	
	$('#s-btn').on('click',function(){
		var q = $('#search-q').val().trim();
		if(q != null && q != '' && q != undefined){
			$('#s-form').submit();
		} else if(q == null || q == ''){
			$('#search-q').val('*');
			$('#s-form').submit();
		}
	});
	
	menuInit();
	getImgUrl();
	
});


function getImgUrl(){
	var p = $('#getImgUrl').attr('data-value');
	if(p!=null && p!=''){
		if(p.indexOf("/resources/") == -1){
			$('#getImgUrl').attr('src',getDfsHostName() + p);
		}
	}
}

function debug(obj) {

	var linebreak = "\r\n";
	// var linebreak = "; ";

	var msg = "OBJECT->" + linebreak;
	msg += obj + linebreak;
	for ( var e in obj) {
		msg += e + "=" + obj[e] + linebreak;
	}

	return alert(msg);
}
//获取项目路径
function getContextPath() {
	var path = document.location.pathname.substr(1);
	path = "/" + path.substr(0, path.indexOf("/"));
	return '';
}

//AJAX GET
function getData(Func,url){
	$.ajax({
		url : url,
		type : 'GET',
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

// AJAX POST
function loadData(Func,url,param){
	$.ajax({
		url : url,
		type : 'POST',
		data : param,
		dataType : 'json',
		contentType : 'application/json; charset=UTF-8',
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
//AJAX POST
function syncLoadData(Func,url,param){
	$.ajax({
		url : url,
		type : 'POST',
		data : param,
		dataType : 'json',
		async:false,
		contentType : 'application/json; charset=UTF-8',
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

//导出excel
function download(url,condition){
	
	$.growlUI('报表输出中…', '正在为您输出报表，请稍等。。。');
	
	var inputHTML = '<input type="hidden" name="json" value="'+ htmlSpecialCharsEntityEncode(decodeURIComponent(condition)) +'" />';
	$('<form action="'+ getContextPath() + url +'" method="POST">' + inputHTML + '</form>').appendTo('body').submit().remove();
}

var htmlSpecialCharsRegEx = /[<>&\r\n"']/gm;

var htmlSpecialCharsPlaceHolders = {
	'<' : 'lt;',
	'>' : 'gt;',
	'&' : 'amp;',
	'\r' : "#13;",
	'\n' : "#10;",
	'"' : 'quot;',
	"'" : 'apos;' /*single quotes just to be safe*/
};

function htmlSpecialCharsEntityEncode(str) {
	return str.replace(htmlSpecialCharsRegEx, function(match) {
		return '&' + htmlSpecialCharsPlaceHolders[match];
	});
}

/**
 * 获取文件名
 */
function getFileName(val){
	var arr = val.split('/');
	var imgName = '';
	for(var i = 0;i < arr.length;i ++){
		if(i == arr.length - 1 ){
			imgName = arr[i]
		}
	}
	
	return imgName;
}

/**
 * 获取 主机名
 * @returns http://localhost:8080
 */
function getHostName(){
	
	return window.location.protocol + '//' + window.location.host;
}
/**
 * 获取 dfs的主机名
 */
function getDfsHostName(){
	var rPath = $('#storage_node').val();
	return rPath == undefined ? "http://resource.apaipian.com/resource/" : rPath;
}
/**
 * 数据加分隔符
 * @param number
 * @returns
 */
function thousandCount(number) {
	var tableData;
	if (number == 0) {
		tableData = 0;
	} else {
		if(number != undefined){
			tableData = number.toLocaleString();
			var indexOf = tableData.indexOf(".");
			if (indexOf > -1) {
				tableData = tableData.substring(0, indexOf);
			}
		}
	}
	return tableData;
}

/**
 * 去掉千分位显示
 */
function DisThousandCount(number){
	var tableData;
	if (number == 0) {
		tableData = 0;
	} else {
		tableData = number.toLocaleString();
		var indexOf = tableData.indexOf(".");
		if (indexOf > -1) {
			tableData = tableData.substring(0, tableData.indexOf("."));
		}
		tableData = tableData.replace(',','');
	}
	return tableData;
}

// 重新编码
function htmlSpecialCharsEntityEncode(str) {
	return str.replace(htmlSpecialCharsRegEx, function(match) {
		return '&' + htmlSpecialCharsPlaceHolders[match];
	});
}

var htmlSpecialCharsRegEx = /[<>&\r\n"']/gm;
var htmlSpecialCharsPlaceHolders = {
	'<' : 'lt;',
	'>' : 'gt;',
	'&' : 'amp;',
	'\r' : "#13;",
	'\n' : "#10;",
	'"' : 'quot;',
	"'" : 'apos;' /*single quotes just to be safe*/
};

/**
 * 验证 手机号
 * @param str
 */
function checkMobile(str) {
	var reg = /^(0|86|17951)?(13[0-9]|15[012356789]|17[0678]|18[0-9]|14[57])[0-9]{8}$/;
	if(str.match(reg)){
		return true;
	} else{
		return false;
	}
}

/**
 * 验证 邮箱地址
 */
function checkEmail(str){
	reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
	if(str.match(reg))
		return true; 
	else
		return false;
}

function checkNumber(str){
	reg = /^[1-9]+[0-9]*]*$/;
	if(str.match(reg))
		return true;
	else
		return false;
}

function checkDecimal(str){
	reg =/^\d+(\.\d+)?$/;
	if(str.match(reg))
		return true;
	else
		return false;
	
}
/**
 * 检验 用户名格式
 * @param name 用户名
 */
function checkUserName(name){
	var reg = /^[a-zA-Z0-9_]{6,16}$/ ;
	if(name.match(reg))
		return true; 
	else
		return false;
}
Date.prototype.Format = function (fmt) { 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}

/**
 * 加密
 * @param word
 * @returns
 */
function Encrypt(word){
	var cryptKey = '0102030405060708';
	var key = CryptoJS.enc.Utf8.parse(cryptKey);
	var iv  = CryptoJS.enc.Utf8.parse(cryptKey);
	var srcs = CryptoJS.enc.Utf8.parse(word);
	var encrypted = CryptoJS.AES.encrypt(srcs, key, { iv: iv,mode:CryptoJS.mode.CBC});  
	return encrypted.toString();
}

function Decrypt(word){//解密
	var cryptKey = '0102030405060708';
	var key = CryptoJS.enc.Utf8.parse(cryptKey);
	var iv  = CryptoJS.enc.Utf8.parse(cryptKey);
    var decrypted = CryptoJS.AES.decrypt(word,cryptKey,
            {
                iv:iv,
                mode:CryptoJS.mode.CBC,
                padding:CryptoJS.pad.Pkcs7
            });
    return decrypted.toString(CryptoJS.enc.Utf8);
}
// 分享
var share = {
		init :function(url,title,img){
			mobShare.config({
				 
				debug: true, // 开启调试，将在浏览器的控制台输出调试信息
			
				appkey: '8c49c537a706', // appkey
			
				params: {
					url: url, // 分享链接
					title: title, // 分享标题
					description: '拍片网-中国领先的视频营销服务平台', // 分享内容
					pic: img, // 分享图片，使用逗号,隔开
				},
			 
				callback: function( plat, params ) {
					
				}
			});
		}
}

var _hmt = _hmt || [];
(function() {
	var hm = document.createElement("script");
	hm.src = "//hm.baidu.com/hm.js?b0ac6d7e1cee0e96c5c43106c5d43537";
	var s = document.getElementsByTagName("script")[0];
	s.parentNode.insertBefore(hm, s);
})();
/*var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?e6cdc36f100fe051e5adec56d084b6ca";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();*/

var _vds = _vds || [];
window._vds = _vds;
(function(){
  _vds.push(['setAccountId', '9f2e33a3d43b5d78']);
  (function() {
    var vds = document.createElement('script');
    vds.type='text/javascript';
    vds.async = true;
    vds.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'dn-growing.qbox.me/vds.js';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(vds, s);
  })();
})();


function menuInit(){
	$('#openMenu').off('click').on('click',function(){
		 $('#menu').show();
		 setTimeout(function(){
			 $('#menu').addClass('menuActive'); 
		 },100)			 
	 });
	 
$('#closeMenu').off('click').on('click',function(){
		 $('#menu').removeClass('menuActive'); 
		 setTimeout(function(){
			 $('#menu').hide();
		 },1500)			 
	 });

$('#editInfo').off('click').on('click',function(){
	 if($('#showMore').hasClass('toShow')){
		 $('#showMore').slideUp();
		 $('#showMore').removeClass('toShow');
	 }else{
		 $('#showMore').slideDown();
		 $('#showMore').addClass('toShow');
	 }
});

$('#showSafeSet').off('click').on('click',function(){
	 $('.safeSet').show();
	 $('#showMore').slideUp();
});

$('#safeClose').off('click').on('click',function(){
	 $('.safeSet').hide();
});
}

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

