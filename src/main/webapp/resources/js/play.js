var imgUrl, play;
var kaptcharInterValObj; // timer变量，控制时间
var InterValObj; // timer变量，控制时间 - 注册
var InterValRecoverObj; // timer变量，控制时间 - 密码找回
var count = 120; // 间隔函数，1秒执行 
var curCount = 0; // 当前剩余秒数 - 注册
var recoverCount; // 当前剩余秒数 - 密码找回
var noCardIndex = 0;
$().ready(function() {
    play.initData();
    play.order();
    play.showMore();
    $('#verification_code_recover_btn').off('click').on('click',verificationCodeBtn);
    $('#submitOrder').off('click').on('click',submitOrder);
    $('.orderVideo').off('click').on('click',function(){
    	 $('#orderTo').show();
    });
    
}), play = {
    initData: function() {
        //var b, c, d, e, f, g, h, i, j, k, l, m, a = $("#videoPoster").val();
        
        //add lt
    	var urlSize = $("#videoUrl").val();
    	var post = getDfsHostName()+$("#videoPoster").val();
        var url = getDfsHostName()+$("#videoUrl").val();
        var hret = $('#yk-play').val();
        //end
        
        var screenWidth = document.documentElement.clientWidth;
        var setHeight= screenWidth/16*9;

        
        if(urlSize != '' && urlSize != null && urlSize != undefined){
	        $('#playVideo').attr('src',url);
	        $('#recomment-video').attr('poster',post);
	        $('#recomment-video').show();
	        $('video').css('height',setHeight);
        } else{
        	if(hret != '' && hret != null && hret != undefined){
        		makePlayer('video-play', hret); // 创建视频浏览器
        		$('#video-play').css('height',setHeight);
        	}
        }
      $('#teamPhoto').attr('src',getDfsHostName()+$('#teamPhotoUrl').val());  

    },
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
    showMore:function(){
    	var tags = $('#tags').val();
    	loadData(function(data){
    		var list = data.result;
			if(list!=null){
				for (var int = 0;int<list.result.length; int++) {
					var card = createCard(list.result[int]);
					$("#anliContent").append(card);
				}
			}else{
				$("#anliContent").hide();
			}
		}, getContextPath() + '/tags/product/search ' ,$.toJSON({
			condition : tags,
			begin : 0,
			limit : 9
		}));
    },
    
};

function createCard(msg){
	var tema = msg.teamId;
	var pro = msg.productId;
	var $body1 = ''
		+'   <a href="/play/'+tema+'_'+pro+'.html">'
		+'		 <div class="contentItem" style="background:url('+getDfsHostName()+''+msg.picLDUrl+') no-repeat">'
		+'			   <div class="itemTitle">'+msg.productName+'</div>'
		+'					 <div class="itemTag">'+msg.tags+'</div>'
		+'		 </div> '
		+'	 </a>'
	return $body1;		

};











function submitOrder(){
	var verificationCodeValue =	$("#verificationCodeValue").val().trim();
	var telephone = $('#phoneNumber').val().trim();
	if(checkData(1) && checkData(2)){
		loadData2(function(msg){
			if(msg.ret){
				//showSuccess();
			   $('#orderTo').hide();
			   $('#orderSuccess').show();
			}else{
				$('#codeError').text('下单失败');
			}
		}, getContextPath() + '/order/deliver', 
			{indentName : $("#videoName").val(),
			productId :$("#videoId").val() ,
			teamId : $('#teamId').val(),
			serviceId : $('#serviceId').val(),
			csrftoken : $('#csrftoken').val(),
			phoneCode : $('#verificationCodeValue').val(),
			indent_recomment:'样片名称:'+$("#videoName").val()+',价格:'+$("#originalPrice").val(),
			indent_tele : telephone
			});
		// ret
	}	
}

function checkData(type){
	var telephone = $('#phoneNumber').val().trim();
	var verificationCodeValue =	$("#verificationCodeValue").val().trim();
	//showError($('#phoneError'),'');
	//showError($('#phoneCodeError'),'');
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

//order verificationCode
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