var PopInterValObj, oTimer, successIntervalObj;
var curCount = 3;
var shengarray;
var shiarray;
var teamId = 0;
$().ready(function() {
	
	checkEven();
	initAddrSelector();
	checkType();
	initPrice();
	initInfoResource();
	returnFirst();
	checkStep();	
});

function checkStep(){
	
	$('#step1').off('click').on('click',function(){
		checkStepOne();
	});
	
	$('#step2').off('click').on('click',function(){
		checkStepTwo();
	});
	
}


function initAddrSelector() {
	$('.AddrSelector').on(
			'click',
			function() {
				var domSheng = $("#sheng"); // 省输入框
				var domShi = $("#shi"); // 市输入框
				var domShengID = $("#shengID"); // 省输入框
				var domShiID = $("#shiID"); // 市输入框
				//var shengid = 
				if (shengarray == undefined || shengarray == null || shengarray.length <= 0) {
					// 加载所有遇省市
					syncLoadData(function(msg) {
						// data conversion
						shengarray = new Array();
						for(var p in msg){
							var id = msg[p].provinceID;
							var text = msg[p].provinceName;
							var parentId = 0;
							shengarray.push(new city(id, text, parentId));
						}
					}, getContextPath() + '/get/provinces', $.toJSON({}));
					syncLoadData(function(msg) {
						shiarray = new Array();
						for(var c in msg){
							var id = msg[c].cityID;
							var text = msg[c].city;
							var parentId = msg[c].father;
							shiarray.push(new city(id, text, parentId));
						}
					}, getContextPath() + '/all/citys', $.toJSON({}));
				}

				var iosSelect = new IosSelect(2, [ shengarray, shiarray], {
					title : '省市选择',
					itemHeight : 35,
					oneTwoRelation : 1,
					twoThreeRelation : 1,
					oneLevelId: domShengID.val(),
				    twoLevelId: domShiID.val(),
					callback : function(selectOneObj, selectTwoObj,
							selectThreeObj) {
						domSheng.val(selectOneObj.value);
						domShengID.val(selectOneObj.id);
						domShi.val(selectTwoObj.value);
						domShiID.val(selectTwoObj.id);
					}
				});

			});
}

function checkEven() {
	$('#stepBtn1').on('click', function() {
		checkStepOne();
	});
	$('#sureBtn').on('click',function(){
		checkStepTwo();
	});
}

function checkType() {
	var base_business = $("div[name^=business]");
	var currCount = $("div[name^=business]").length;
	base_business.on('click', function() {
		if ($(this).hasClass('checkWord')) {
			$(this).removeClass('checkWord');
		} else {
			$(this).addClass('checkWord');
		}
		getBusiness();
	});

}

function getBusiness() {

	var busArr;
	$('.checkWord').each(function(i) {
		if (0 == i) {
			busArr = $(this).attr('data-id');
		} else {
			busArr += ',' + $(this).attr('data-id');
		}
	});
	return busArr;
}

function initPrice() {
	var showBankDom = document.querySelector('#company-priceRange');
	var bankIdDom = document.querySelector('#company-priceRange');
	showBankDom.addEventListener('click', function() {
		var bankId = showBankDom.dataset['id'];
		var bankName = showBankDom.dataset['value'];
		var data = [ {
			'id' : '10001',
			'value' : '看情况'
		}, {
			'id' : '10002',
			'value' : '1万元及以上'
		}, {
			'id' : '10003',
			'value' : '2万元及以上'
		}, {
			'id' : '10004',
			'value' : '3万元及以上'
		}, {
			'id' : '10005',
			'value' : '5万元及以上'
		}, {
			'id' : '10006',
			'value' : '10万元及以上'
		}, ];
		var bankSelect = new IosSelect(1, [ data ], {
			title : '价格区间',
			itemHeight : 35,
			oneLevelId : bankId,
			callback : function(selectOneObj) {
				bankIdDom.value = selectOneObj.value;
				showBankDom.innerHTML = selectOneObj.value;
				showBankDom.dataset['id'] = selectOneObj.id;
				showBankDom.dataset['value'] = selectOneObj.value;
			}
		});
	});
}

function initInfoResource() {
	var showBankDom = document.querySelector('#company-infoResource');
	var bankIdDom = document.querySelector('#company-infoResource');
	showBankDom.addEventListener('click', function() {
		var bankId = showBankDom.dataset['id'];
		var bankName = showBankDom.dataset['value'];
		var data = [ {
			'id' : '1',
			'value' : '友情推荐'
		}, {
			'id' : '2',
			'value' : '网络搜索'
		}, {
			'id' : '3',
			'value' : '拍片网'
		}, {
			'id' : '4',
			'value' : '拍片帮'
		}, {
			'id' : '5',
			'value' : '电销'
		} ];
		var bankSelect = new IosSelect(1, [ data ], {
			title : '获知渠道',
			itemHeight : 35,
			oneLevelId : bankId,
			callback : function(selectOneObj) {
				bankIdDom.value = selectOneObj.value;
				showBankDom.innerHTML = selectOneObj.value;
				showBankDom.dataset['id'] = selectOneObj.id;
				showBankDom.dataset['value'] = selectOneObj.value;
			}
		});
	});
}

function stepOneFinish(){
	$('#titleInfo').text('详细信息');
	$('.stepOne').addClass('hide');
	$('.stepTwo').removeClass('hide');
}

function stepTwoFinish(num){
	$('.stepTwo').addClass('hide');
	$('.model').show();
	SetLastTime(num);
}

function returnFirst(){
	
	$('#cancleBtn').on('click',function(){
		$('#step1').removeClass('hide');
		$('#step2').addClass('hide');
		$('#step-bar').removeClass('step-2');
		
	});
	 
}


function checkStepOne(){
	var name = $('#company-name').val().trim(); // 公司名称
	var email = $('#company-email').val().trim(); // 公司邮箱
	var linkman = $('#company-linkman').val().trim(); // 联系人
	var webchat = $('#company-webchat').val().trim(); // 微信
	var qq = $('#company-qq').val().trim(); // QQ
	var address = $('#company-address').val().trim();

	if (name == '' || name == null || name == undefined) {
		successToolTipShow('请输入公司名称!');
		$('#company-name').focus();
		return false;
	}

	if (linkman == '' || linkman == null || linkman == undefined) {
		successToolTipShow('请输入联系人!')
		$('#company-linkman').focus();
		return false;
	}

	if (webchat == '' || webchat == null || webchat == undefined) {
		successToolTipShow('请输入微信号!')
		$('#company-webchat').focus();
		return false;
	}

	if (qq == '' || qq == null || qq == undefined) {
		successToolTipShow('请输入QQ号码!')
		$('#company-qq').focus();
		return false;
	}

	if (email == '' || email == null || email == undefined) {
		successToolTipShow('请输入公司邮箱!')
		$('#company-email').focus();
		return false;
	}

	// 验证邮箱正确性
	if (!checkEmail(email)) {
		successToolTipShow('邮箱格式不正确!')
		$('#company-email').focus();
		return false;
	}

	if (address == '' || address == null || address == undefined) {
		successToolTipShow('请输入公司地址!')
		$('#company-address').focus();
		return false;
	}
	
	stepOneFinish();
	return true;
}


function checkStepTwo(){

	var sheng = $('#sheng').val().trim(); // 省
	var shi = $('#shi').val().trim(); // 市
	
	if(sheng == '' || sheng == null || sheng == undefined){
        successToolTipShow('请输入省!');
		$('#sheng').click;
		return false;
	}
	
	if(shi == '' || shi == null || shi == undefined){
        successToolTipShow('请输入市!');
		$('#shi').click;
		return false;
	}

    
	
	
	
	infoSave();
	return true;
}

// 成功信息 提示框弹出方法
function successToolTipShow(word) {
	window.clearInterval(successIntervalObj);
	$('#errorDiv').text(word);
	$('#errorDiv').slideDown('normal');
	successIntervalObj = window.setInterval(hideSuccessTooltip, 3000);
}

function hideSuccessTooltip() {
	$('#errorDiv').hide('normal');
}

function SetLastTime() {
	$('#checkTo').on('click',function(){
		window.location.href = getContextPath() + '/provider/info_'+teamId+'.html';
	});
	$('#lasttime').text(curCount);
	$('#lasttime').attr('disabled', 'disabled');
	InterValObj = window.setInterval(SetRemainTime, 1000);
}
function SetRemainTime() {
	if (curCount == 0) {
		window.clearInterval(InterValObj); // 停止计时器
		window.location.href = getContextPath() + '/';
	} else {
		curCount--;
		$('#lasttime').text(curCount);
	}
}
function city(id, text, parentId) {
	this.id = id;
	this.value = text;
	this.parentId = parentId;
}

function infoSave(){
	loadData(function(flag){
		if(flag>0){
			teamId = flag;
		  stepTwoFinish();
		}else{
			 successToolTipShow('状态错误!请联系客服');
		}
	}, getContextPath() + '/provider/update/leaderInfomation', $.toJSON({
			teamName : $('#company-name').val().trim(),
			email : $('#company-email').val().trim(),
			address : $('#company-address').val().trim(),
			webchat : $('#company-webchat').val().trim(),
			qq : $('#company-qq').val().trim(),
			city : '1',
			linkman: $('#company-linkman').val().trim(),
			infoResource : $('#company-infoResource').attr('data-id'),
			teamProvince : $("#shengID").val(),
			teamCity : $("#shiID").val()
		}));
	}


