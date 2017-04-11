$().ready(function() {


  showVideo();
  getCardheight();
  closeVideo();
  changeName();
  var swiper = new Swiper('.swiper-container', {
      pagination: '.swiper-pagination',
      paginationClickable: true
  });

});

 function getCardheight(){ 
 var ulH = $('#ulHeight').height();
 
  var utRH = ulH + 35;
 //var number = ulH+'px !important';
  //$('#setHeight').height(ulH+'!important');
  $('.swiper-container').css('height',utRH);
 $('#setHeight').css('height',ulH);

}

 function showVideo(){ 
 	var openVideo=$("[name^=openVideo]");
			var cout=openVideo.length;
			openVideo.on('click',function(){
				    var imageUrl=$(this).attr('src');				
					var videoUrl=$(this).attr('data-video-url');
					$('#toolbar-modal').show();
					$('#recomment-video').attr('src',videoUrl);
					//$('#recomment-video').attr('src','/product/video/product11-20150630124357383.mp4');
					$('#recomment-video').attr('poster',imageUrl);
			});
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
 
 function changeName(){
	 var titleName=$("[name^=title]");
	 var cout=titleName.length;
	 $.each(titleName,function(i,item){
		  var name = $(this).text();
		  
		  switch(name)
		  {
		  case '众创空间宣传片':
		    $(this).text('企业宣传片');
		    break;
		  case '阿布产品动画片':
			  $(this).text('产品宣传片');
		    break;
		  case '触景无限产品宣传片':
			  $(this).text('产品宣传片');
		    break;
		  case '麻麻汇产品宣传片':
			  $(this).text('TVC广告');
		    break;
		  case '土曼手表外观篇':
			  $(this).text('TVC广告');
		    break;
		  case '歌曲稻草人MV':
			  $(this).text('MV');
		    break;
		  case 'ppgun微电影':
			  $(this).text('微电影');
		    break;  
		  case '飞鹰骑行宣传片':
			  $(this).text('专题片');
			break;  
		  }
		 
		});
	
	 
 }

