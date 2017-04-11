//图片懒加载 wanglc
function lazyLoad(){
	var container = $(window);
	  var scrollEls = $('.lazy');
	  //动态显示数据
	  var timer;
	  
	  // 预加载图片，防止页面上短暂的抖动
	  var preload = function(el, callback) {
	    var src = el.data('original');
	    var default_ = el.attr('src');
	    var i = new Image();
	    //创建一个Image对象，实现图片的预下载
	
	    i.onload = function() {
	      i.onload = null;
	      if (callback) {
	        callback(src);
	      }
	    };
	    //找不到就替换默认图片
	    i.onerror = function(){
	    	i.onerror = null;
	    	el.attr("src",default_);
	    	el.attr("data-src",default_);
	    }
	    i.src = src;
	  };
	  
	  var loading = function() {
		  //容器的高度								//页面相对顶部的偏移
	    var contHeight = container.height(), contop = container.scrollTop();
	    	scrollEls = $('.lazy');
	    $.each(scrollEls, function(i, el) {
	      el = $(el);
	
	      var post = el.offset().top - contop;//元素距离顶部的距离-页面相对偏移
	
	     if (post >= -300 && post < contHeight+30) {//提前加载，而不是图片刚出现时
	    //if (post >= 0 && post < contHeight) {
	        preload(el, function(src) {
	        	el.attr("src",src);
	        });
	      }
	    });
	  };
	  var startTimer = function() {
	    timer && clearTimeout(timer);
	    timer = setTimeout(loading, 0);//触摸及时生效
	    timer = setTimeout(loading, 1000);//代替scroll事件，延迟生效
	  };
	  //事件触发
	  //加载完毕即执行
	  loading();
	  //滚动执行
	  container.bind('touchmove', startTimer);
}