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
        }
    });
}

function getItemHeight(){
	 var screenWidth = document.documentElement.clientWidth;
	 var setHeight= screenWidth/16*9;
	 $('.contentItem').css('height',setHeight + "px");
	 $('.del-btn ').css('line-height',setHeight + "px");
}



