$().ready(function(){
	var screenWidth = document.documentElement.clientWidth;
	var setHeight= screenWidth/16*9;
	$('video').css('height',setHeight);
	$('.footerBar').click();
	merchantBridge();
	//$('#setVideo').attr('src',''+getDfsHostName()+'group1/M00/00/20/CgqNZViiqe2ANmqIAZ-Ai8Au-R8971.mp4');
	//$('#setVideo').load();

	var docElem = document.documentElement;
	window.lazySizesConfig = window.lazySizesConfig || {};
	window.lazySizesConfig.loadMode = 1;
	window.lazySizesConfig.expand = Math.max(Math.min(docElem.clientWidth, docElem.clientHeight, 1222) - 1, 359);
	window.lazySizesConfig.expFactor = lazySizesConfig.expand < 380 ? 3 : 2;
	
	var member = {
			init:function(){
				this.check();//详情展开与关闭
				this.share();//分享
			},
			check:function(){
				$('.checkOpen').off("click").on('click',function(){
					if($(this).hasClass('open')){
						$(this).removeClass('open');
						$(this).parent().find($('.memberContent')).slideDown();
					}
					else{
						$(this).addClass('open');
						$(this).parent().find($('.memberContent')).slideUp();
					}
				});
				var m = window.location.hash;
				if(m){
					$(m).trigger("click");
					window.location.href = m;
				}
			},
			share:function(){
				
				$('.shareWx').click(function(){
					if($(this).parent().find('#showShare').hasClass('showIng')){
						$(this).parent().find('#showShare').removeClass('showIng');
						$(this).parent().find('#showShare').slideUp();
					}else{
						$(this).parent().find('#showShare').addClass('showIng');
						$(this).parent().find('#showShare').slideDown();
					}
				});
//				// 初始化 分享空间
//				$('.share').click(function(){
//					var title = '拍片网团队-'+$(this).data("flag");
//					var shareUrl = getHostName() + getContextPath() + '/member.html#/' + $(this).data("id");
//					var imgUrl = getHostName() + getContextPath() + $(this).data("img");
//					share.init(shareUrl,title,imgUrl);
//				});
			},
	}
	member.init();
});
