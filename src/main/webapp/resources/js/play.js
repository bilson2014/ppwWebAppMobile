var imgUrl, play;
var kaptcharInterValObj; // timer变量，控制时间
var InterValObj; // timer变量，控制时间 - 注册
var InterValRecoverObj; // timer变量，控制时间 - 密码找回
var count = 60; // 间隔函数，1秒执行 
var curCount = 0; // 当前剩余秒数 - 注册
var recoverCount; // 当前剩余秒数 - 密码找回
var noCardIndex = 0;
$().ready(function() {
    play.initData();
    play.order();
    play.showMore();
    saveVideo();
    $('#verification_code_recover_btn').off('click').on('click',verificationCodeBtn);
    $('#submitOrder').off('click').on('click',submitOrder);
    $('.orderVideo').off('click').on('click',function(){
    	var loginTel = $('#rolephone').val();
    	if(loginTel!=null && loginTel!= "" ){
    		loginOrder();
    	}else{
    		$('#orderTo').show();
    	}
    });
    $('#checkSuccess').off('click').on('click',function(){
    	$('#orderSuccess').hide();
    });
    $('#closeOrder').off('click').on('click',function(){
    	$('#orderTo').hide();
    	$('#phoneCode').hide();
		$('#codeError').hide();
    	clearDate();
    });
});


function saveVideo(){	
	var loginTel = $('#rolephoneImg').val();
	if(loginTel!=null && loginTel!= "" ){
		loadData(function(flag){
			if(flag.result){
				$('#managerCollect').addClass('save');
				$('#showSave').hide();
			}else{
				$('#managerCollect').removeClass('save');
				$('#showSave').hide();
			}
		}, getContextPath() + '/mgr/favourites/judge/' + $('#videoId').val(), null);
	}
	
	$('#managerCollect').off('click').on('click',function(){
		if($(this).hasClass('save')){
			loadData(function(flag){
				if(flag){
					$('#managerCollect').removeClass('save');
					$('#showSave').fadeIn();
					$('#showSave').text('已取消');
					 setTimeout(function() {
						    $('#showSave').fadeOut();
			            }, 1000);
				}
			}, getContextPath() + '/mgr/favourites/remove/' + $('#videoId').val(), null);
		}else{
			loadData(function(flag){
				if(flag){
					$('#managerCollect').addClass('save');
					$('#showSave').fadeIn();
					$('#showSave').text('已收藏');
					setTimeout(function() {
							$('#showSave').fadeOut();
			            }, 1000);
				}
			}, getContextPath() + '/mgr/favourites/add/' + $('#videoId').val(), null);

		}
	});
}

play = {
    initData: function() {
        //add lt
    	var urlSize = $("#videoUrl").val();
    	var post = getDfsHostName()+$("#videoPoster").val();
        var url = getDfsHostName()+$("#videoUrl").val();
        //end
        var screenWidth = document.documentElement.clientWidth;
        var setHeight= screenWidth/16*9;
        
	        if(urlSize != '' && urlSize != null && urlSize != undefined){
		        $('#playVideo').prop('src',url);
		        $('#recomment-video').load();
		        $('#recomment-video').attr('poster',post);
		        $('#recomment-video').show();
		        $('video').css('height',setHeight);
	        }
        var img = $('#teamPhotoUrl').val();
	        if(img!=''&&img!=null){
                  $('#teamPhoto').attr('src',getDfsHostName()+$('#teamPhotoUrl').val());
	        }
    },
    //下单
    order: function() {
        $("#order-btn").on("click", function() {
            var a = $("#realPrice").val(),
                b = -1 == $("#serviceId").val() ? 0 : $("#serviceId").val(),
                c = " -- 无 -- " == $("#second").val() ? 0 : $("#second").val(),
                d = getContextPath() + "/order",
                e = $.toJSON({
                    teamId: "" == $("#teamId").val() ? 0 : $("#teamId").val(),
                    productId: $("#videoId").val(),
                    indentPrice: a,
                    serviceId: b,
                    second: c,
                    product_name: $("#videoName").val().trim()
                }),
                f = '<input type="hidden" name="json" value="' + htmlSpecialCharsEntityEncode(decodeURIComponent(e)) + '" />';
            $('<form action="' + d + '" method = "POST" autocomplete="off" accept-charset="UTF-8">' + f + "</form>").appendTo("body").submit().remove()
        })
    },
    //显示更多相关推荐
    showMore:function(){
    	var tags = $('#tags').val();
    	loadData(function(data){
    		var list = data.result;
			if(list.result.length > 0){
				for (var int = 0;int<list.result.length; int++) {
					var card = createCard(list.result[int]);
					$("#anliContent").append(card);
				}
			}else{
				$("#anliContent").hide();
			}
		}, getContextPath() + '/tags/product/search' ,$.toJSON({
			condition : tags,
			begin : 0,
			limit : 9
		}));
    }
};

function createCard(msg){
	var tema = msg.teamId;
	var pro = msg.productId;
	var str = msg.tags;
	var spl = str.split(" ");
	var tags = "";
	var indentProjectId = parseInt(msg.indentProjectId);
	var itemFlag = parseInt(msg.teamFlag);
	for (var int = 0; int < spl.length; int++) {
		if(int>4){
			break;
		}
		if(int > 0){
			 tags += " / " + spl[int];
		}else{
			tags += spl[int] ;
		}
	}
	var loginTel = $('#rolephoneImg').val();
	var $body1 = ''
		$body1 +='		 <div class="contentItem" style="background:url('+getDfsHostName()+''+msg.picLDUrl+') no-repeat">';
	
		if(loginTel!=null && loginTel!= "" ){
			if(indentProjectId != 0 && itemFlag == 1){
				$body1 +='<img class="roleImg" src="/resources/images/video/roleOur.png">';
			}
		    if(itemFlag == 4){
		    	$body1 +='<img class="roleImg" src="/resources/images/video/rolePlay.png">';
	       	}
		    if(indentProjectId == 0 && itemFlag == 1){
		    	$body1 +='<img class="roleImg" src="/resources/images/video/rolePro.png">';
			}
		}
	    $body1 +='            <div class="itemS">';
		 $body1 +='	                 <a href="'+getHostName() +'/provider/info_'+msg.teamId+'.html'+'">';
		$body1 +='			         <div class="itemTitle">'+msg.productName+'</div>';
		$body1 +='					 <div class="itemTag">'+tags+'</div>';
		 $body1 +='	                 </a>';
		$body1 +='                   <div class="toProvider">';
		 if(itemFlag != 4){
			 $body1 +='	                 <a href="'+getHostName() +'/provider/info_'+msg.teamId+'.html'+'">';
			 $body1 +='                      <img src="'+getDfsHostName()+''+msg.teamPhotoUrl+'">';
			 $body1 +='                      <div class="proName">'+msg.teamName+'</div> ';
			 $body1 +='                   </a>';
		 }
	    $body1 +='                   </div>';
	    $body1 +='            </div>';
	    $body1 +='   <a href="/play/'+tema+'_'+pro+'.html">';
	    $body1 +='			  <div class="itemBack"></div>';
	    $body1 +='	 </a>';
	    $body1 +='		 </div> ';

	return $body1;		
};

function submitOrder(){
		noLoginOrder();
}

function loginOrder(){
	
	var role = $('#role').val();
	if(role !="" && role !="客户"){
		var setInfo = "您现在登陆角色是" + role
		+ "</br>请退出登陆后重新下单，或联系我们</br>400-660-9728"
	$('#showInfo').show();
	$('#setInfo').html(setInfo);	

	}else{
	
		loadData2(function(msg){
			if(msg.ret){
				//showSuccess();
			   $('#orderTo').hide();
			   $('#orderSuccess').show();
			   $('#showStatues').text('恭喜您下单成功');
			   clearDate();
			}else{
				$('#orderTo').hide();
				$('#orderSuccess').show();
				$('#showStatues').text('服务器异常请稍后再试');
				clearDate();
			}
		}, getContextPath() + '/order/deliver', 
			{indentName : '网站-移动-' + $("#videoName").val(),
			productId :$("#videoId").val() ,
			teamId : $('#teamId').val(),
			serviceId : $('#serviceId').val(),
			csrftoken : $('#csrftoken').val(),
			indent_tele : $('#rolephone').val(),
			indent_recomment:'样片名称:'+$("#videoName").val()+',价格:'+$("#originalPrice").val(),
			indentSource : 18
			});
	}
	
}

function noLoginOrder(){
	var verificationCodeValue =	$("#verificationCodeValue").val().trim();
	var telephone = $('#phoneNumber').val().trim();
	$('#phoneCode').hide();
	$('#codeError').hide();
	if(checkData(1) && checkData(2)){
		loadData2(function(msg){
			if(msg.ret){
			   $('#orderTo').hide();
			   $('#orderSuccess').show();
			   $('#showStatues').text('恭喜您下单成功');
			   clearDate();
			}else{
				$('#codeError').text(msg.message);
				$('#codeError').show();
			}
		}, getContextPath() + '/order/deliver', 
			{indentName : '网站-移动-' + $("#videoName").val(),
			productId :$("#videoId").val() ,
			teamId : $('#teamId').val(),
			serviceId : $('#serviceId').val(),
			csrftoken : $('#csrftoken').val(),
			phoneCode : $('#verificationCodeValue').val(),
			indent_recomment:'样片名称:'+$("#videoName").val()+',价格:'+$("#originalPrice").val(),
			indent_tele : telephone,
			indentSource : 18
			});
	}
}

function checkData(type){
	var telephone = $('#phoneNumber').val().trim();
	var verificationCodeValue =	$("#verificationCodeValue").val().trim();
	switch (type) {
	case 1:
		if(telephone == '' || telephone == null || telephone == undefined){
			$('#phoneCode').show();
			$('#phoneCode').text('请填写手机号');
			$('#phoneNumber').focus();
			return false;
		}
		if(!checkMobile(telephone)){
			$('#phoneCode').show();
			$('#phoneCode').text('手机号输入错误');
			$('#phoneNumber').focus();
			return false;
		}
		return true;
	case 2:
		if(verificationCodeValue == '' || verificationCodeValue == null || verificationCodeValue == undefined){
			$('#codeError').show();
			$('#codeError').text('请填写验证码');
			$('#verificationCodeValue').focus();
			return false;
		}
		return true;
	}
}

function verificationCodeBtn(){
	if(curCount == 0 && checkData(1)){
		curCount = count;
		var telephone = $('#phoneNumber').val().trim();
		$('#verification_code_recover_btn').text('已发送('+ curCount +')');
		$('#verification_code_recover_btn').attr('disabled','disabled');
		InterValObj = window.setInterval(SetRemainTime, 1000); // 启动计时器，1秒钟执行一次
		loadData(function(flag){
			if(!flag){
				// 发送不成功
				// 显示重新发送
				sendCode=true;
				$('#verification_code_recover_btn').text('重新获取');
				$('#verification_code_recover_btn').removeAttr('disabled');
			}
		}, getContextPath() + '/login/verification/' + telephone, null);
	}
}
//timer 处理函数 - 注册
function SetRemainTime(){
	if(curCount == 0){
		window.clearInterval(InterValObj); // 停止计时器
		sendCode=true;
		$('#verification_code_recover_btn').text('重新获取');
		$('#verification_code_recover_btn').removeAttr('disabled')
		// 清除session code
		getData(function(data){
			// 清除session code
		}, getContextPath() + '/login/clear/code');
	}else{
		curCount--;  
		$("#verification_code_recover_btn").text('已发送('+ curCount +')');
	}
}

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

function clearDate(){
	
	$('#codeError').hide();
	$('#phoneCode').hide();
	$('#phoneNumber').val('');
	$('#verificationCodeValue').val('');
	$('#verification_code_recover_btn').text('发送验证码');
	$('#verification_code_recover_btn').removeAttr('disabled');
	window.clearInterval(InterValObj);
	count = 60;
	curCount = 0;
	
}