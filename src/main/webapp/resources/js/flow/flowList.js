var hasHeight = true;
var scrollHeight = 0;
var frameUrl = "http://"+getphoneUrl();
$().ready(function() {	
	document.domain = getUrlDo();
	    setMinHieght();
	    btnEven();
	$(window).resize(function () {          
		setMinHieght();
	});
	
	  $('.pagePhone').scroll(function() {
		  var pageScroll = $('.pagePhone').scrollTop();
		  var isScroll = $($('.frame').prop('contentWindow').document).find('#isScroll').val();
		  if(isScroll != null && isScroll != "" && isScroll != undefined){
			  if(hasHeight){
					 scrollHeight = $($('.frame').prop('contentWindow').document).find('.menuTag').offset().top;
				     hasHeight = false;
				  }
			  var setScroll = pageScroll+scrollHeight;
			  $($('.frame').prop('contentWindow').document).find('.menuTag').css('top',setScroll);
		  }else{
			  $($('.frame').prop('contentWindow').document).find('.frameHead').css('top',pageScroll);
		  }
	  });
	  $('.frame').attr('src',frameUrl+"projectFlow");
});

function setMinHieght(){
	var minHeight = $(window).height(); 
	$('.frame').css('min-height',minHeight);
}

function btnEven(){
	
	$('#toMission').off('click').on('click',function(){
		initItem($(this));
		//var url =  $($('.frame').prop('contentWindow').document).find('#url').val();
		var url = $(this).attr('data-content');
		$('.frame').attr('src',frameUrl+"todo"+url);
	});
	$('#toInfo').off('click').on('click',function(){
		initItem($(this));
		var url = $(this).attr('data-content');
		$('.frame').attr('src',frameUrl+"flowinfo"+url);
		});
	$('#toFlow').off('click').on('click',function(){
		initItem($(this));
		var url = $(this).attr('data-content');
		$('.frame').attr('src',frameUrl+"flow"+url);
	});
	$('#toMessage').off('click').on('click',function(){
		initItem($(this));
		var url = $(this).attr('data-content');
		$('.frame').attr('src',frameUrl+"message"+url);
	});
	$('#toFile').off('click').on('click',function(){
		initItem($(this));
		var url = $(this).attr('data-content');
		$('.frame').attr('src',frameUrl+"resource"+url);
	});
	
}

function initItem(item){
	$('.footBot .item').removeClass('checkItem');
	item.addClass('checkItem');
}