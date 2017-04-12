//var critical = [2,10]; // 临界值
var critical = [ 1, 2, 3, 4 ]; // 推荐值数组
var videoPath = "http://www.apaipian.com/product/video/paipianwangMovie.mp4";
var imgX = "/resources/images/index/moreInfo.JPG";
var myScroll;
var nowImg = 1;
var imgNum = 5;
$().ready(function() {
	
	portal.initData();
	portal.toOrder();
	portal.controlLogo();
	portal.getProviderItem();
	//isWeiXin();

});

function checkPassWord(){
	$("#newpwd").off("change").on("change",function(){
		var pwd = $("#newpwd").val().trim();
		if(checkData(1)){
			$("#newpwd").parent().find('.orTrue').show();
			$("#newpwd").parent().find('.orError').hide();
		}
	});
	$("#repwd").off("change").on("change",function(){
		if(checkData(2)){
			$("#newpwd").parent().find('.orTrue').show();
			$("#newpwd").parent().find('.orError').hide();
		}
	});
}


function checkData(type){

	var pwd = $("#newpwd").val().trim();
	var repwd = $("#repwd").val().trim();
	var cpwd = $("#cpwd").val().trim();

	switch (type) {
	case 1:
		if(null==pwd || ''==pwd || undefined==pwd){
			$("#newpwd").parent().find('.error').show().text("密码不能为空");
			$("#newpwd").parent().find('.orTrue').hide();
			$("#newpwd").parent().find('.orError').show();
			return false;
		}
		if(pwd.length<6 || pwd.length>16){
			$("#newpwd").parent().find('.error').show().text("密码不能为空");
			$("#newpwd").parent().find('.orTrue').hide();
			$("#newpwd").parent().find('.orError').show();
			return false;
		}

		return true;
		break;
		
	case 2:
		if(null==repwd || ''==repwd || undefined==repwd){
			$("#repwd").parent().find('.error').show().text("密码不能为空");
			$("#repwd").parent().find('.orTrue').hide();
			$("#repwd").parent().find('.orError').show();
			return false;
		}
		if(repwd.length<6 || repwd.length>16){
			$("#repwd").parent().find('.error').show().text("密码不能为空");
			$("#repwd").parent().find('.orTrue').hide();
			$("#repwd").parent().find('.orError').show();
			return false;
		}
		  
		
		break;

	case 3:	
		
		if(null==cpwd || ''==cpwd || undefined==cpwd){
			$("#cpwd").parent().find('.error').show().text("密码不能为空");
			$("#cpwd").parent().find('.orTrue').hide();
			$("#cpwd").parent().find('.orError').show();
			return false;
		}
		if(cpwd.length<6 || cpwd.length>16){
			$("#cpwd").parent().find('.error').show().text("密码不能为空");
			$("#cpwd").parent().find('.orTrue').hide();
			$("#cpwd").parent().find('.orError').show();
			return false;
		}
		if(repwd != pwd){
			showCommonError($('#repwd-error'),"两次密码不一致");
			$("#repwd").parent().removeClass("sureIcon").addClass("errorIcon");
			return false;
		}
		
		break;
		
	case 4:
		if(repwd != pwd){
			showCommonError($('#repwd-error'),"两次密码不一致");
			$("#repwd").parent().removeClass("sureIcon").addClass("errorIcon");
			return false;
		}
		resumeCommonError($(".setItem"),'');
		return true
		break;
	}
}



function isWeiXin() {
	var ua = window.navigator.userAgent.toLowerCase();
	console.log(ua);//mozilla/5.0 (iphone; cpu iphone os 9_1 like mac os x) applewebkit/601.1.46 (khtml, like gecko)version/9.0 mobile/13b143 safari/601.1
	if (ua.match(/MicroMessenger/i) == 'micromessenger') {
	return true;
	} else {
	return false;
	}
	
	if(isWeiXin()){
		console.log(" 是来自微信内置浏览器");
		alert("是来自微信内置浏览器");
		}else{
		console.log("不是来自微信内置浏览器");
		alert("不是来自微信内置浏览器");
	}
}
	


var portal = {
	initData : function() { // 加载分类信息

		 var banner = new Swiper('.swiper-container', {
		        loop: true,
		        grabCursor: true,
		        autoplay: 5000,
		    });
		 
		 $('#checkSuccess').on('click',function(){
			 $('#orderSuccess').hide();
		 });
		 $('.playVideo').on('click',function(){
			  $('#header3Video').get(0).play();
		 });
		 $('#closeBtn').on('click',function(){
			  $('#header3Video').get(0).pause();
		 });	 
	 $('#img1').addClass('activeImg');
		 //视频大小
		 var screenWidth = document.documentElement.clientWidth;
		 var setHeight= screenWidth/16*9;
		 $('#showVideo').css('height',setHeight+"px");
		 //背景图片
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

	},
	toOrder : function() { // 初始化轮播
		$('#order-btn').click(function(){
			// 检查数据是否完成
			if(checkData()){
				if(checkMobile($('#indent_tele').val())){ // 检查 是否 是手机号码
					$('#error').hide('normal');
					// 提交表单
				//	$('#order-form').attr('action',getContextPath() + '/salesman/order/submit').submit();
					$('#orderSuccess').show().addClass('moedlActive');
				}else {
					$('#error').show('normal');
					$('#error').text('请输入正确的手机格式');
					return false;
				}
			}
		});
	},
	controlLogo : function() { // 分享
		 $('.ppwLogo').hide();
		 $('.pagePhone').scroll(function() {
			  var divTop = $('#logoPos').offset().top;
			  var nowTop = $('.pagePhone').scrollTop();
              if(divTop < nowTop){
            	  $('.ppwLogo').show();
              }else{
            	  $('.ppwLogo').hide();
              }
			
		  });
	},
	
	getProviderItem:function(){
		loadData(function(data){
			if(data.code == 1){
			    $.each(data.result, function(i, item) {
			    	portal.setProvider(item);
			    });
			}else{
				console.log("数据加载错误")
			}
		}, getContextPath() + '/team/recommend ',null);
	
	},
	
	setProvider:function(item){
		
		var str=item.business;
		var json = $.evalJSON(str);
		 var $body = '<div class="item">' +
						 '<div class="proLogo">'+
					         '<img src="'+getDfsHostName()+''+item.teamPhotoUrl+'">'+
					         '<img src="/resources/images/index/true.png">'+
					     '</div>'+
						  '<div class="proContent">'+
				                '<div class="title">'+item.teamName+'</div>'+
				                '<div class="des">'+item.description+'</div>'+
				                '<div class="tags">';
					 if(json!=null && json !=''){
						 for (var int = 0; int < json.length; int++) {
							 $body += '<div class="tagsItem">'+ json[int]+'</div>';
						}
					 }
		 $body +=			      '</div>'+
				            '</div>';
		  $body += '</div>';
		  $(".ourCus").append($body);
	},
	
}

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


function getBusiness() {

	var busArr;
	$('.checkWord').each(function(i) {
		if (0 == i) {
			busArr = $(this).text();
		} else {
			busArr += ',' + $(this).text();
		}
	});
	return busArr;
}


function btnPosition() {

	var top = $('#toTop');
	var footer = $('#toFooter');
	
	$('#toTop').on('click',function(){
		  top.addClass('hide');
		  footer.removeClass('hide');
	});
	
    $('#toFooter').on('click',function(){
    	  top.removeClass('hide');
		  footer.addClass('hide');
	});
	
	
	  $(document).on('touchmove',function(e){
		    //e.preventDefault();
		    var touch = event.touches[0]; 
			var topPos=$('#top').offset().top;
			var botBtn=$('#footer').offset().top;
		    
		    var top = $('#toTop');
		  
			  if(topPos > 0){
				  top.addClass('hide');
				  footer.removeClass('hide');
				  
			  }
			  if(botBtn>600&&topPos < 0){
				  top.removeClass('hide');
				  footer.removeClass('hide');
				 
			  }
			  if(botBtn<600){
				  top.removeClass('hide');
				  footer.addClass('hide');
				 
			  }
			
		  });	
}