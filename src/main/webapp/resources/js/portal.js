//var critical = [2,10]; // 临界值
var critical = [ 1, 2, 3, 4 ]; // 推荐值数组

var myScroll;
$().ready(function() {
	// 装配分类数据
	portal.initData();

	// 轮播图
	portal.flexSlider();

	// 分享
	/* portal.share(); */

	// 分类
	portal.classify();


	btnPosition();

	portal.loadProduct();

//	var screenWidth = parseInt(document.body.clientWidth);
//	var screenHeight = parseInt(document.body.clientHeight);
//	var height;
//	height = screenHeight - 55;
//	$('.footerBar').css('top', height);

//	if (screenWidth < 360) {
//		height = screenHeight - 45;
//		$('.footerBar').css('top', height);
//	} else if (screenWidth <= 500) {
//		height = screenHeight - 55;
//		$('.footerBar').css('top', height);
//	} else {
//		height = screenHeight - 79;
//		$('.footerBar').css('top', height);
//	}

});

var portal = {
	initData : function() { // 加载分类信息

		loadData(function(itemList) {
			var $ibody = '';
			$ibody += '<li><a href="' + getContextPath()
					+ '/search?q=&sortord=0&item=*">全部</a></li>';
			$.each(itemList, function(i, item) {
				$ibody += '<li>';
				$ibody += '<a href="' + getContextPath()
						+ '/search?q=&sortord=0&item=' + item.itemId
						+ '">';
				$ibody += item.itemName;
				$ibody += '</a>';
				$ibody += '</li>';
			});
			$('.mm-listview').append($ibody);
		}, getContextPath() + '/item/list', null);

	},
	flexSlider : function() { // 初始化轮播
		$('.flexslider').flexslider({
			directionNav : true,
			pauseOnAction : false
		});
	},
	share : function() { // 分享
		$('.share').click(
				function() {
					var title = '拍片网-中国领先的视频营销服务平台';
					var shareUrl = getHostName() + getContextPath()
							+ '/portal';
					var imgUrl = getHostName() + getContextPath()
							+ '/resources/images/icons/logo_red.png';
					share.init(shareUrl, title, imgUrl);
				});
	},
	classify : function() { // 分类
		$('nav#menu').mmenu({
			navbar : {
				title : '视频分类'
			}
		});
	},
	loadProduct : function() { // 视频装配
		// 装载视频
		loadData(function(productList) {
			var first_section = new Array(); // 第一区域
			var second_section = new Array(); // 第二区域
			//var third_section = new Array(); // 第三区域
		//	var forth_section = new Array(); // 第四区域
			// 按照价格区间 分配视频区域
			if (productList != null && productList.length > 0) {
				$.each(productList, function(i, product) {
					if (product.recommend == critical[0]) {
						first_section.push(product);
					}
					if (product.recommend == critical[1]) {
						second_section.push(product);
					}
					//if (product.recommend == critical[2]) {
					//	third_section.push(product);
					//}
					//if (product.recommend == critical[3]) {
					//	forth_section.push(product);
					//}
				});
				// 装配第一块视频
				$('#first-video-section').empty();
				$('#first-video-section').append(composing(first_section));

				// 装配第二块视频
				$('#second-video-section').empty();
				$('#second-video-section').append(composing(second_section));

				// 装配第三块视频
				//$('#third-video-section').empty();
				//$('#third-video-section').append(composing(third_section));
				// 装配第四块视频
				//$('#forth-video-section').empty();
				//$('#forth-video-section').append(composing(forth_section));
				lazyLoad();
				btnPosition();
			}
		}, getContextPath() + '/product/loadProduct',$.toJSON({
			sort:"supportCount"//排序字段
		}));
	}
}

// 排版
function composing(list) {
	$body = '';
	if (list != null && list.length > 0) {
		var listSize = list.length;
		for (var i = 0; i < listSize; i++) {
			var solr = list[i];
			var imgPath = getDfsHostName() + solr.picLDUrl;
			var realPrice = thousandCount(solr.price);
			var originalPrice = thousandCount(solr.orignalPrice);
			var setOriginalPrice = 0;
			if(realPrice == originalPrice ){
				setOriginalPrice = ''
			}
			else{
				setOriginalPrice = originalPrice;
			}

			$body += '<div class="contain-row">';
			$body += '<a href="' + getContextPath() + '/play/'+
			solr.teamId+'_'+ solr.productId + '.html" target="_self">';
			$body += '<div class="video-col">';
			$body += '<div class="video-post">';
			$body += '<img class="lazy" src="/resources/images/icons/lazyloading1.png" data-original="'
					+ imgPath + '" alt="' + solr.productName + '_拍片网" />';
			$body += '</div>';
			$body += '<div class="video-desc">';
			$body += '<dl>';
			$body += '<dt><h2>' + solr.productName + '</h2></dt>';
			$body += '<dd>' + solr.pDescription + '</dd>';
			$body += '<dt><label>￥</label>' + realPrice
					+ '<label class="doraction">' + setOriginalPrice
					+ '</label></dt>';
			$body += '<dd><a href="' + getContextPath() + '/play/'+
			solr.teamId+'_'+ solr.productId + '.html"><div class="detail-btn">查看详情</div></a></dd>';
			$body += '</dl>';
			$body += '</div>';
			$body += '</div>';
			$body += '</a>';
			$body += '</div>';
		}
	}
	return $body;
}

function btnPosition() {


	

	var top = $('#toTop');
	var footer = $('#toFooter');
	
	$('#toTop').on('click',function(){
		  top.addClass('hide');
		  footer.removeClass('hide');

	});
	
    $('#toFooter').on('click',function(){
    	  top.removeClass('hide');
		  footer.addClass('hide');
	});
	

	
	  $(document).on('touchmove',function(e){
		    //e.preventDefault();
		    var touch = event.touches[0]; 
			var topPos=$('#top').offset().top;
			var botBtn=$('#footer').offset().top;
		    
		    var top = $('#toTop');
		  
			  if(topPos > 0){
				  top.addClass('hide');
				  footer.removeClass('hide');
				  
			  }
			  if(botBtn>600&&topPos < 0){
				  top.removeClass('hide');
				  footer.removeClass('hide');
				 
			  }
			  if(botBtn<600){
				  top.removeClass('hide');
				  footer.addClass('hide');
				 
			  }
			
		  });
	  

	
}