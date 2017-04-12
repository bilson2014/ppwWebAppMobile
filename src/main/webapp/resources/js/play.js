var imgUrl, play;
$().ready(function() {
    play.initData();
    play.order();
    play.showMore();
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
      //  $('#teamPhoto').attr('src',getDfsHostName()+$('#teamPhotoUrl').val());  





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
			if(data){
				for (var int = 0;int<=data.length; int++) {
					var card = createCard(data[int]);
					$("#anliContent").append(card);
				}
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