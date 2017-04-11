$().ready(function() {
//	showHeadImg();
//	initDefaultMsg();
	$('#upDateInfo').off('click').on('click',function(){
		initDefaultMsg();
	});
});

function initDefaultMsg() {
	var userName = $('#userName').val();
	
	if (userName == null || userName == undefined || userName == '') {
		successToolTipShow('用户名未设置');
		$('#userName').focus();
		return;
	}

	var companyName = $('#company-name').val();
	if (companyName == null || companyName == undefined || companyName == '') {
		successToolTipShow('公司名未设置');
		$('#company-name').focus();
		return;
	}

	var realName = $('#realName').val();
	if (realName == null || realName == undefined || realName == '') {
		successToolTipShow('真实姓名未设置');
		$('#realName').focus();
		return;
	}
	
	var email = $('#company-email').val();
	if (email == null || email == undefined || email == '') {
		successToolTipShow('邮箱未设置');
		$('#company-email').focus();
		return;
	}
	if(!checkEmail(email)){
		successToolTipShow('邮箱格式不正确!');
		$('#company-email').focus();
		return false;
	}

	var companyqq = $('#company-qq').val();
	if (companyqq == null || companyqq == undefined || companyqq == '') {
		successToolTipShow('qq未设置');
		$('#company-qq').focus();
		return;
	}
	var reg = /^[1-9]\d{4,9}$/;
	if(!companyqq.match(reg)){
		successToolTipShow('QQ号码有误!');
			$('#company-qq').focus();
			return false;
	}

	var loginName = $('#loginName').val();
	if (loginName == null || loginName == undefined || loginName == '') {
		successToolTipShow('登录名未设置');
		$('#loginName').focus();
		return;
	}

	var telephone = $('#telephone').val();
	if (telephone == null || telephone == undefined || telephone == '') {
		successToolTipShow('手机号未设置');
		$('#telephone').focus();
		return;
	}
	
	if(!checkMobile(telephone)){
		successToolTipShow('手机号格式有误');
		$('#telephone').focus();
		return;
	}
	
}

function showHeadImg() {
	var userImgPath = $('#user_img').val();
	if (userImgPath != null && userImgPath != '' && userImgPath != undefined) { // 加载用户头像
		if (userImgPath.indexOf('http') > -1) {
			// 第三方登录
			$('#infoHead').attr('src', userImgPath);
		} else {
			//modify by wlc 2016-11-4 11:56:34
			//修改为fdfs路径 begin
			//var imgName = getFileName(userImgPath);
			//var imgPath = getHostName() + '/user/img/' + imgName;
			var imgPath = getDfsHostName() + userImgPath;
			//修改为fdfs路径 end
			$('#infoHead').attr('src', imgPath);
		}
	} else {
		// 加载 默认头像
		var defaultImgPath = getHostName() + '/resources/images/icons/lazyloading3.png';
		$('#infoHead').attr('src',defaultImgPath);
	}
}
