
$().ready(function() {
	
	floating();
	showbox();
	setCardHeight();
});
function setCardHeight(){
	 var screenWidth = document.documentElement.clientWidth;
	 var setHeight= screenWidth/16*9;
	 $('.videoCard').css('height',setHeight + "px");
}
function showbox(){
	$('.showtime').on('click',function(){		
		if($('.showtime').text()=='分类'){
			$('.boxs').addClass('boxadd');
			$('.showtime').text('收起');
			$('.boxs').removeClass('boxadds');
		}else {
			$('.boxs').addClass('boxadds');
			$('.showtime').text('分类');
			$('.boxs').removeClass('boxadd');
		}
	})
}
//function scrollWindow()
//{
//window.scrollTo(100,500)
//}
function showcommon(){	
	$('.boxs').addClass('boxadds');
	$('.showtime').text('分类');
	$('.boxs').removeClass('boxadd');
	$('.pagePhone').scrollTop(380);	
}
function floating(){
	$('.all').addClass('add');
	$('.all').on('click',function(){
		$('#live').show();	
		$('#skin').show();
		$('#cosmetics').show();
		$('#electronic').show();
		$('#parent').show();
		$('#car').show();
		$('#ele').show();
		$(this).addClass("add").siblings().removeClass("add");
		showcommon();
	});
	
	$('.live').on('click',function(){
		$('#live').show();
		$('#skin').hide();
		$('#cosmetics').hide();
		$('#electronic').hide();
		$('#parent').hide();
		$('#car').hide();
		$('#ele').hide();
		$(this).addClass("add").siblings().removeClass("add");
		showcommon();
	});
	$('.skin').on('click',function(){
		$('#live').hide();	
		$('#skin').show();
		$('#cosmetics').hide();
		$('#electronic').hide();
		$('#parent').hide();
		$('#car').hide();
		$('#ele').hide();
		$(this).addClass("add").siblings().removeClass("add");
		showcommon();
	});
	$('.cosmetics').on('click',function(){
		$('#live').hide();	
		$('#skin').hide();
		$('#cosmetics').show();
		$('#electronic').hide();
		$('#parent').hide();
		$('#car').hide();
		$('#ele').hide();
		$(this).addClass("add").siblings().removeClass("add");
		showcommon();
	});
	$('.electronic').on('click',function(){
		$('#live').hide();	
		$('#skin').hide();
		$('#cosmetics').hide();
		$('#electronic').show();
		$('#parent').hide();
		$('#car').hide();
		$('#ele').hide();
		$(this).addClass("add").siblings().removeClass("add");
		showcommon();
	});
	$('.parent').on('click',function(){
		$('#live').hide();	
		$('#skin').hide();
		$('#cosmetics').hide();
		$('#electronic').hide();
		$('#parent').show();
		$('#car').hide();
		$('#ele').hide();
		$(this).addClass("add").siblings().removeClass("add");
		showcommon();
	});
	$('.car').on('click',function(){
		$('#live').hide();	
		$('#skin').hide();
		$('#cosmetics').hide();
		$('#electronic').hide();
		$('#parent').hide();
		$('#car').show();
		$('#ele').hide();
		$(this).addClass("add").siblings().removeClass("add");
		showcommon();
	});
	$('.ele').on('click',function(){
		$('#live').hide();	
		$('#skin').hide();
		$('#cosmetics').hide();
		$('#electronic').hide();
		$('#parent').hide();
		$('#car').hide();
		$('#ele').show();
		$(this).addClass("add").siblings().removeClass("add");
		showcommon();
	});
}

