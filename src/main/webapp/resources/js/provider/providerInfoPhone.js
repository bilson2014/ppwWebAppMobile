$().ready(function(){
	merchantBridge();
	var tag = $('#id_tags').val();
	var root = $('.adb');
	if(tag !=null && tag != ''){
		var json = $.evalJSON(tag);
		if(json != null && json.length >0){
			for (var int = 0; int < json.length; int++) {
				var body = '';
					body+='<div class="card">';
					body+= json[int];
					body+= '</div>';
					root.append(body);
			}
		}
	}
});
	
	showHeadImg();
	var providerInfoPhone = {
			init:function(){
				this.tree();//加载其他作品
			},
			tree:function(){
				var _this = this;
				var teamId = $("#teamId").val();
				loadData(function(data){
					if(data){
						for (var int = 0;int < (data.length>5?5:data.length) ; int++) {
							var card = createCard(data[int]);
							$("#moreProduct").append(card);
						}
						getHeight();
					}
					if(data.length<=5){
						$(".findMore").addClass("hide")
					}//不足五个，没有点击加载更多
					_this.getMore(data);//点击加载更多
					lazyLoad();
					getHeight();
				}, getContextPath() + '/product/order/loadWithTeamName' ,$.toJSON({
					condition:"teamName:"+ '"' + $('#teamName').val() + '"'
				}));
			},
			getMore:function(data){
				$(".findMore").off("click").on("click",function(){
				$(".findMore").addClass("hide");
					for(var i = 5;i < data.length;i++){
						var card = createCard(data[i]);
						$("#moreProduct").append(card);
					}
					lazyLoad();
					getHeight();
				})
			},
	}
	providerInfoPhone.init();
	function createCard(msg){
		var tema = msg.teamId;
		var pro = msg.productId;
		var str = msg.tags;
		var spl = str.split(" ");
		var tags = "";
		for (var int = 0; int < spl.length; int++) {
			if(int>4){
				break;
			}
			if(int > 0){
				tags += " / " + spl[int];
			}else{
				tags += spl[int];
			}
		}
		var $body1 = ''
			+'   <a href="/play/'+tema+'_'+pro+'.html">'
			+'		 <div class="contentItem" style="background:url('+getDfsHostName()+''+msg.picLDUrl+') no-repeat">'
			+'			   <div class="itemTitle">'+msg.productName+'</div>'
			+'					 <div class="itemTag">'+tags+'</div>'
			+'					 <div class="itemBack"></div>'
			+'		 </div> '
			+'	 </a>'
		return $body1;		
};

function showHeadImg(){
	var userImgPath = $('#user_img').val();
	if(userImgPath != null && userImgPath != '' && userImgPath != undefined){ // 加载用户头像
		
		if(userImgPath.indexOf('http') > -1){
			// 第三方登录
			$('#infoHead').attr('src',userImgPath);
		}else{
			var imgPath = getDfsHostName() + userImgPath;
			$('#infoHead').attr('src',imgPath);
		}
	}else{
		// 加载 默认头像
		var defaultImgPath = getHostName() + '/resources/images/icons/lazyloading3.png';
		$('#infoHead').attr('src',defaultImgPath);
	}
}

function namePos(){
	var stateWidth = $('.states').width();
    var posWidth = stateWidth - 4;
	$('.nameSize').css('left',stateWidth);
}

function getHeight(){
	 var screenWidth = document.documentElement.clientWidth;
	 var setHeight= screenWidth/16*9;
	 $('.contentItem').css('height',setHeight + "px");
	
}
