$().ready(function(){
	doLogin();

});

function doLogin(){
	getItemHeight();
    $(".session-box").slide2del({
        sItemClass: ".session-box",
        sDelBtnClass: ".del-btn",
        delHandler: function (target) {
        	var proId = target.find('.del-btn').attr('id');
            loadData(function(flag){
				if(flag.result){
					  target.remove();
				}
			}, getContextPath() + '/mgr/favourites/remove/' + proId, null);
        },
        itemClickHandler: function (target) {
//        	var toPro = target.find('.itemBack');
//        	console.log("你点击了选项：" + target.text());
//        	console.info(target.find('.itemBack').attr('data-value'));
//        	toPro.on('click',function(){
//        		window.location.href=target.find('.itemBack').attr('data-value');
//        	});
        	
        }
    });
	$('.itemBack').on('click',function(){
		window.location.href=$(this).attr('data-value');
	});
	$('.toProvider').on('click',function(){
		window.location.href=$(this).attr('data-value');
	});
}

function getItemHeight(){
	 var screenWidth = document.documentElement.clientWidth;
	 var setHeight= screenWidth/16*9;
	 $('.contentItem').css('height',setHeight + "px");
	 $('.del-btn ').css('line-height',setHeight + "px");
}



