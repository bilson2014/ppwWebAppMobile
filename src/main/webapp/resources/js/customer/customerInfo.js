$().ready(function() {
	showHeadImg();
	initDefaultMsg();
});

function initDefaultMsg() {
	var providerName = $('#providerName').text();
	if (providerName == null || providerName == undefined || providerName == '') {
		$('#providerName').text('未设置');
	}

	var realName = $('#realName').text();
	if (realName == null || realName == undefined || realName == '') {
		$('#realName').text('未设置');
	}

	var email = $('#email').text();
	if (email == null || email == undefined || email == '') {
		$('#email').text('未设置');
	}

	var qq = $('#qq').text();
	if (qq == null || qq == undefined || qq == '') {
		$('#qq').text('未设置');
	}

	var loginName = $('#loginName').text();
	if (loginName == null || loginName == undefined || loginName == '') {
		$('#loginName').text('未设置');
	}

	var telephone = $('#telephone').text();
	if (loginName == null || loginName == undefined || loginName == '') {
		$('#loginName').text('未设置');
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
