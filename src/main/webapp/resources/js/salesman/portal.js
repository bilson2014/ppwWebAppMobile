var critical = [39800,59800]; // 临界值

$().ready(function() {
	
	loadVideoList();
	closeVideo();
	showOhideImg();
  
});

function showOhideImg(){
	  $(document).on('touchmove',function(e){
		    var height = $('.example-basic').offset().top;
		    console.info(height);
		    if(height<0){
		    	$('#topImg').hide();
		    }else{
		    	$('#topImg').show();
		    }
		  });
}

function loadVideoList() {

	loadData(function(list) {
		
		if (list != null && list.length > 0) {
			var first_section = new Array(); // 第一区域
			var second_section = new Array(); // 第二区域
			var third_section = new Array(); // 第三区域
			var lowerPrice = critical[0];
			var higherPrice = critical[1];
			// 筛选
			$.each(list, function(i, product) {
				var price = Math.round(product.serviceRealPrice);
				if(price > 0 && price <= lowerPrice ){
					first_section.push(product);
				} else if(price > lowerPrice && price <= higherPrice ){
					second_section.push(product);
				} else if (price > higherPrice){
					third_section.push(product);
				}
			});
			
			// 填充数据
			$('#first-video-section').empty();
			$('#first-video-section').append(composing(first_section));
			$('#firstPrice').text('39800');
			
			// 装配第二块视频
			$('#second-video-section').empty();
			$('#second-video-section').append(composing(second_section));
			$('#secondPrice').text('59800');
			
			
			// 装配第三块视频
			$('#third-video-section').empty();
			$('#third-video-section').append(composing(third_section));
			$('#thirdPrice').text('99800');
			
			playVideo();
		}
	}, getContextPath() + '/salesman/load/product', null);

}

 function composing(list) {
	$body = '';
	 var uniqueId = $('#uniqueId').val();
	if (list != null && list.length > 0) {
		var listSize = list.length;
		for (var i = 0; i < listSize; i++) {
			var product = list[i];
			var videoId = product.productId;
			var url = getContextPath() + '/salesman/order/'+videoId+'/'+uniqueId+''; 
			var posterUrl = product.picLDUrl;
			var videoId="video"+videoId;
			if(posterUrl != undefined && posterUrl != null){
				var imgPath = getDfsHostName() + posterUrl;
				imgUrl = imgPath;
			} 
			var realPrice = thousandCount(product.serviceRealPrice);
			var videoUrl = product.videoUrl;
				if(videoUrl != undefined && videoUrl != null){
					var videoPath = getDfsHostName() + videoUrl;
				}
				$body += '<div class="video-area-card">';
				$body += '<div class="video-play-section" id="first-video-section">';
				$body += '<img class="video-play-section" src="'+imgPath+'" />';
				$body += '<input id="imgPath" value="'+imgPath+'" style="display:none" />';
				$body += '<input id="videoPath" value="'+videoPath+'" style="display:none" />';
				$body += '</div>';
				$body += '<div class="video-content">';
				$body += '<ul>';
				$body += '<li class="font-title">' + product.productName+ '</li>';
				$body += '<li><a href="'+url+'" ><div class="video-btn"><img style="width:100%" src="/resources/images/goodGod/toOrder.png"></div></a></li>';
				$body += '</div>';
				$body += '</ul>';
				$body += '</div>';
				$body += '</div>';
			
		}
	}
	return $body;
}
 
 function closeVideo(){
	 
     $('.closeVideo').on('click',function(){
    	 $('#toolbar-modal').fadeOut();
         $('#recomment-video').attr('src',"");
     });
     $('#closeBtn').on('click',function(){
      $('#toolbar-modal').fadeOut();
      $('#recomment-video').attr('src',"");
     });
     
     $('#closeVideoBot').on('click',function(){
         $('#toolbar-modal').fadeOut();
         $('#recomment-video').attr('src',"");
        });
}

 function playVideo(){
	            $('.video-play-section').off('click');
                $('.video-play-section').on('click',function(){
	                  $('#toolbar-modal').show();
	                  var imgX = $(this).find('#imgPath').val();
					  var videoPath = $(this).find('#videoPath').val();
					  $('#recomment-video').attr('src',videoPath);
					  $('#recomment-video').attr('poster',imgX);
                });
}

 function fill(html,price,index){
	var element;
	switch (index) {
		case 0: //价格最低
			element= $('#first-video-section');
			$('#firstPrice').text(price);
			break;
		case 1://价格中等
			element= $('#second-video-section');
			$('#secondPrice').text(price);
			break;
		case 2://价格最高
			element=$('#third-video-section');
			$('#thirdPrice').text(price);
			break;
	}
	if(element!=null){
		element.empty();
		element.append(html);
	}
 }

