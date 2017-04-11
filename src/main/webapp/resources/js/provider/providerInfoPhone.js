$().ready(function(){
	
	 var screenWidth = document.documentElement.clientWidth;
	 var setHeight= screenWidth/16*9;
	 $('.contentItem').css('height',setHeight + "px");
	
});
	
	/*showHeadImg();
	//namePos();
	var providerInfoPhone = {
			init:function(){
				this.tree();//加载其他作品
				this.share();//分享
			},
			tree:function(){
				var _this = this;
				var teamId = $("#teamId").val();
				loadData(function(data){
					if(data){
						var flag = -1;
						for(var i = 0;i < (data.length>5?5:data.length);i++){
							var year = new Date(data[i].creationTime).Format("yyyy");
							data[i].year = year;
							data[i].flag = -1;
							if(year!=flag){//需要添加年限隔开
								data[i].flag = 1;
								flag = year;
							}
							var card = createCard(data[i]);
							$("#productContent").append(card);
						}
					}
					if(data.length<=5){$("#redadMore").addClass("hide")}//不足五个，没有点击加载更多
					_this.getMore(data);//点击加载更多
					lazyLoad();
				}, getContextPath() + '/product/order/loadWithTeamName' ,$.toJSON({
					condition:"teamName:"+ '"' + $("#teamName").val() + '"'
				}));
			},
			getMore:function(data){
				$("#redadMore").off("click").on("click",function(){
					$("#redadMore").addClass("hide");
					var flag = data[4].year;
					for(var i = 5;i < data.length;i++){
						var year = new Date(data[i].creationTime).Format("yyyy");
						data[i].year = year;
						data[i].flag = -1;
						if(year!=flag){//需要添加年限隔开
							data[i].flag = 1;
							flag = year;
						}
						var card = createCard(data[i]);
						$("#productContent").append(card);
					}
					lazyLoad();
				})
			},
			share:function(){
				// 初始化 分享空间
				$('.share').click(function(){
					if(typeof WeixinJSBridge != "undefined"){
						$('#qq').click(function(){
							$('#weixin').click();
						});
					}
					//var title = $('#videoName').val();
					var shareUrl = getHostName() + getContextPath() + '/play/';
					share.init(shareUrl,title,imgUrl);
				});
			}
	}
	providerInfoPhone.init();
	function createCard(msg){
		
		var year = msg.year;
		var yearNum = parseInt(year%5);
		var color = "color1";
		if(yearNum == 0 ){
			var color = "color2";
		}
		else if (yearNum == 1 ){
			var color = "color1";
		}
		else if (yearNum == 2 ){
			var color = "color3";
		}
		else if (yearNum == 3 ){
			var color = "color4";
		}
		else if (yearNum == 4 ){
			var color = "color5";
		}
		
		
		
		var $body1 = ''
			+'   <div class="videoCardArea">'
			+'		  <div class="year">'
			+'			   <div class="yearCircle">'
			+'					 <div class="'+color+'"></div>'
			+'				</div> '
			+'				<div class="yearTime '+color+'">'+msg.year+'</div>'
			+'		  </div> '
			+'	</div>';
		var $body2 = ''
			+'	<div class="videoCardArea">'
			+'			<div class="timeLineImg"><div class="dianImg"></div><div class="timeTitle">'+msg.creationTime+'</div></div>'
			+'			<div class="videoCradYear cardMaring">'
			+'			   <div class="videoContent">'
			+'					<a href="/play/'+msg.teamId+'_'+msg.productId+'.html"><img class="lazy" src="/resources/images/icons/lazyloading1.png" data-original="'+getDfsHostName()+msg.picLDUrl+'"></a>'
			+'					<div class="title">'+msg.productName+'</div>'
			+'					<div class="videoContentInfo">'+msg.pDescription+'</div>'
			+'					<div class="cardBottom">'
			+'						   <div class="price">'
			+'								 <span class="firstSpan">￥</span>'
			+'								 <span class="secondSpan">'+msg.price+'</span>';
		if(msg.price != msg.orignalPrice){
			$body2=$body2 +'<span class="lastSpan">'+msg.orignalPrice+'</span>'
		}
		$body2=$body2+'				   </div>' 
			+'						   <a href="/play/'+msg.teamId+'_'+msg.productId+'.html">'
			+'						   <div class="videoBtn btn-red-common">查看详情</div>'
			+'						   </a>'
			+'					</div>'
			+'				</div> '
			+'			</div>'
			+'	 </div>';
		if(msg.flag==1){
			return $body1+$body2;
		}
		return $body2;		
	}
});


function showHeadImg(){
	var userImgPath = $('#user_img').val();
	if(userImgPath != null && userImgPath != '' && userImgPath != undefined){ // 加载用户头像
		
		if(userImgPath.indexOf('http') > -1){
			// 第三方登录
			$('#infoHead').attr('src',userImgPath);
		}else{
			//修改为dfs路径 2016-11-4 14:53:14
			//var imgName = getFileName(userImgPath);
			//var imgPath = getHostName() + '/team/img/' + imgName;
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

*/
