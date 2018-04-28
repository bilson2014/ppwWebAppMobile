
$().ready(function() {	
	initSwiper();
	initVideo();
	initEven();
	initTime();
});

function initTime(){
	
	  var starttime = new Date("2018/5/5");
		  setInterval(function () {
		    var nowtime = new Date();
		    var time = starttime - nowtime;
		    var day = parseInt(time / 1000 / 60 / 60 / 24);
		    var hour = parseInt(time / 1000 / 60 / 60 % 24);
		    var minute = parseInt(time / 1000 / 60 % 60);
		    var seconds = parseInt(time / 1000 % 60);
		    var setTime;
		    if(starttime < nowtime){
		    	setTime = "活动结束"
		    }else{
		    	if(day == 0){
		    		setTime = hour + "小时" + minute + "分钟" + seconds + "秒";
		    	}else{
		    		setTime= day + "天" + hour + "小时" + minute + "分钟" + seconds + "秒";
		    	}
		    }
		    $('#time').text(setTime)
		  }, 1000);

	
}

function initSwiper(){
	
	 var swiper = new Swiper('.swiper-container', {
	        paginationClickable: true,
	        direction: 'vertical',
	        onSlideChangeEnd: function(swiper){
	        	var index = swiper.activeIndex;
	        	if(index !=0){
	        		$('.orderBtn').removeClass('hide');
	        	}else{
	        		$('.orderBtn').addClass('hide');
	        	}
	        }
	    });
	
}

function initVideo(){
	
/*	var w = document.documentElement.clientWidth;
	var videoH = w/16*9;
	$('video').css('height',videoH);*/
	$('video').off('click').on('click',function(){
		document.getElementById('video').play();
	});
}

function initEven(){
	
	$('.closeBtn').off('click').on('click',function(){
		$('.setBackground').hide();
		$('.modelType').removeClass('rePos');
		$('.orderBtn').removeClass('hide');
	});
	
	$('#openOrder').off('click').on('click',function(){
		$('.setBackground').show();
		$('#orderUse').addClass('rePos');
		$('.orderBtn').addClass('hide');
	});
	
	$('#openOur').off('click').on('click',function(){
		$('.setBackground').show();
		$('#orderOur').addClass('rePos');
		$('.orderBtn').addClass('hide');
	});
	
	$('#openWay').off('click').on('click',function(){
		$('.setBackground').show();
		$('#orderWay').addClass('rePos');
		$('.orderBtn').addClass('hide');
	});

}



	




	


