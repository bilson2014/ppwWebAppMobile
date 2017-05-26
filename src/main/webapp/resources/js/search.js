var loadMore = true;
//功能维度
var typeArray = new Array('产品宣传片','企业宣传片','产品广告','微电影','路演视频','病毒视频','品牌宣传片','活动宣传片','城市宣传片','形象宣传片','个人宣传片','创意广告','活动广告','品牌广告','TVC','发布会','访谈','公益片','暖场片','纪录片');
// 行业维度
var busArray = new Array('智能硬件','教育','医疗保健','互联网','电商','旅游','母婴','体育','金融','电子产品','大数据','游戏','服装纺织','家居建材','餐饮美食','食品饮料','农业','房地产','创投','首饰','日用美妆','云计算');
// 制作维度
var proArray = new Array('MG动画','Flash动画','明星演员','AE包装','3D','航拍','动画','电影级','广告级','长镜头','定格动画');

$().ready(function(){
	search.showTagsItem();
	search.initData();
	toSearch();
	touchLis();
	initLazySizes();
	search.getTags();
});

function getItemHeight(){
	 var screenWidth = document.documentElement.clientWidth;
	 var setHeight= screenWidth/16*9;
	 $('.contentItem').css('height',setHeight + "px");
}
//解析价格
function parsePrice() {
	var price = $('#price').val();
	var lowPrice = $('#lowPrice');
	var heightPrice = $('#heightPrice');
	if(price != undefined && price != '') {
		// 价钱不为空时
		if(price.indexOf('TO') > -1) {
			// 分解
			var pArray = price.split('TO');
			var startPrice = pArray[0].split('[')[1].trim();
			var endPrice = pArray[1].split(']')[0].trim();
			if(startPrice == '*') {
				// 开始价格如果为*，则认为只有结尾价格有效
				if(endPrice == '*') {
					// 开始、结束价格都为*则认为是查询全部价格
					return null;
				}
				heightPrice.val(Number(endPrice));
				return (Number(endPrice) / 10000) + '万以内';
			}
			
			if(endPrice == '*'){
				// 结尾价格如果为*，则认为只有开始价格有效
				if(startPrice == '*') {
					// 开始、结束价格都为*,则认为是查询全部价格
					return null;
				}
				lowPrice.val(Number(startPrice))
				return (Number(startPrice) / 10000) + '万以上';
			}
			
			lowPrice.val(Number(startPrice));
			heightPrice.val(Number(endPrice));
			return (Number(startPrice) / 10000) + '~' + (Number(endPrice) / 10000) + '万';
		}
	}
	return null;
}

var search = {
		initData : function() { // 加载分类信息
			getItemHeight();
			 search.showTags();
			 $('.searchType').off('click').on('click',function(){
				  if($('.searchBox').hasClass('searchInit')){
					  $('.searchBox').removeClass('searchInit');
					  $('.searchBoxInit').removeClass('searchInit');
					  $('.pagePhone').addClass('noTouch');
				  }else{
					  $('.searchBox').addClass('searchInit');
					  $('.searchBoxInit').addClass('searchInit');
					  $('.pagePhone').removeClass('noTouch');
				  }
			 });
		},
		//回显
		getTags : function(){
			
			var industry = $('#industry').val(); // 行业
			var genre = $('#genre').val();; // 类型
			var industryArr = industry.split(' ');
			var genreArr = genre.split(' ');
			if(industryArr != null && industryArr.length >0){
				for (var int = 0; int < industryArr.length; int++) {
						$('#'+industryArr[int]).addClass('checkActive');
				}
			}
			if(genreArr != null && genreArr.length >0){
				for (var int = 0; int < genreArr.length; int++) {
						$('#'+genreArr[int]).addClass('checkActive');
				}
			}
			parsePrice();
		},
        showTags : function(){
        	$('#qType').off('click').on('click',function(){
        		if($('#typeTags').hasClass('typeActive')){
        			$('#typeTags').removeClass('typeActive');
        			$('#typeTagsShow').addClass('noShow');
        		}else{
        			$('#typeTags').addClass('typeActive');
        			$('#typeTagsShow').removeClass('noShow');
        		}
        	});
        	$('#wType').off('click').on('click',function(){
        		if($('#workTags').hasClass('typeActive')){
        			$('#workTags').removeClass('typeActive');
        			$('#workTagsShow').addClass('noShow');
        		}else{
        			$('#workTags').addClass('typeActive');
        			$('#workTagsShow').removeClass('noShow');
        		}
        	});
        	
        	var base_business = $(".tags");
        	var currCount = $(".tags").length;
        	base_business.on('click', function() {
        		if ($(this).hasClass('checkActive')) {
        			$(this).removeClass('checkActive');
        		} else {
        			$(this).addClass('checkActive');
        		}
        	});
//        	//价格区域处理
        	var base_tagsPrice = $(".tagsPrice");
        	var tagsPrice = $(".tagsPrice").length;
        	base_tagsPrice.on('click', function() {
        		    $(".tagsPrice").removeClass('checkActive');
        			$(this).addClass('checkActive');
        			$('#lowPrice').val($(this).attr('data-low'));
        			$('#heightPrice').val($(this).attr('data-content'));
        	});
         	
         	$('#cancle').on('click',function(){
         		$('.searchBox').addClass('searchInit');
         		$('.searchBoxInit').addClass('searchInit');
         		$('.pagePhone').removeClass('noTouch');
				
         	});
         	
         	$('.hideBox').off('click').on('click',function(){
         		$('.searchBox').addClass('searchInit');
         		$('.searchBoxInit').addClass('searchInit');
         		$('.pagePhone').removeClass('noTouch');
         	})
         	
        },
        showTagsItem:function(){
     //类型   	
       for (var int = 0; int < 6; int++) {
          	var tags = createTags(typeArray[int]);
          	$('#typeTagsItem').append(tags);
        } 	
       for (var int = 6; int < typeArray.length; int++) {
		 var tags = createTags(typeArray[int]);
		 $('#typeTagsShow').append(tags);
	    }
     //end  
       //行业	
       for (var int = 0; int < 6; int++) {
          	var tags = createTags(busArray[int]);
          	$('#workTagsItem').append(tags);
        } 	
       for (var int = 6; int < busArray.length; int++) {
		 var tags = createTags(busArray[int]);
		 $('#workTagsShow').append(tags);
	    }
     //end  
      },
}
function createTags(name){
	var $body1 = '<div class="tags" id="'+name+'">'+name+'</div>';
	return $body1;		
}

function toSearch(){
	$('#toSearch').off('click').on('click',function(){
		var typeShow = $('#typeTagsItem').find('.checkActive');
		var typeNoShow = $('#typeTagsShow').find('.checkActive');
		var ubsShow = $('#workTagsItem').find('.checkActive');
		var ubsNoShow = $('#workTagsShow').find('.checkActive');
		var lowPrice = $('#lowPrice').val();
		var heightPrice = $('#heightPrice').val();
		var type = '&industry=';
		var ubs = '&genre=';
		var price = '&price=';
		var searchQ = '/search?q=*';
	    for (var int = 0; int < typeShow.length; int++) {
	    	type = type+$(typeShow[int]).text()+ ' ';
			
		}
	    for (var int = 0; int < typeNoShow.length; int++) {
			type = type+$(typeNoShow[int]).text()+ ' ';
		}
	    for (var int = 0; int < ubsShow.length; int++) {
	    	ubs = ubs + $(ubsShow[int]).text()+ ' ';
		}
	    for (var int = 0; int < ubsNoShow.length; int++) {
	    	ubs = ubs + $(ubsNoShow[int]).text() + ' ';
		}
	    if(lowPrice!="" && heightPrice!=""){
		    	price = price +"["+lowPrice+" TO "+heightPrice+"]";
	    }
	    if(lowPrice=="" &&  heightPrice!=""){
	    	price = price +"[*" + " TO "+heightPrice+"]";
	    }
	    if(heightPrice=="" && lowPrice!=""){
	    	price = price +"["+lowPrice+" TO "+"*]";
	    }
	    if(type !='&industry='){
	    	
	    	searchQ = searchQ+type;
	    }
	    if(ubs !='&genre='){
	    
	    	searchQ = searchQ+ubs;
	    }
	    if(price !='&price='){
	    
	    	searchQ = searchQ+price;
	    }
	    window.location.href=getContextPath()+searchQ;
	   	    
	});
}

function getBusiness() {
	var busArr;
	$('.tags').each(function(i) {
		if (0 == i) {
			busArr = $(this).text();
		} else {
			busArr += ',' + $(this).text();
		}
	});
	return busArr;
}

function initData(){
	loadData(function(itemList){
		var $ibody = '';
		$ibody += '<li><a href="'+ getContextPath() + '/search?q=' + $('#q').val() + '&item=*' + '&sortord=0' + '">全部</a></li>';
		$.each(itemList,function(i,item){
			$ibody += '<li>';
			$ibody += '<a href="'+ getContextPath() + '/search?q=' + $('#q').val() + '&item=' + item.itemId + '&sortord=0' + '">';
			$ibody += item.itemName;
			$ibody += '</a>';
			$ibody += '</li>';
		});
		$('.mm-listview').append($ibody);
	}, getContextPath() + '/item/list', null);
}

var pageSize = 20;
var currentSize = 0;
var p = 2;
var more = true;
//滑动回调
function touchLis(){
	  
	  $('.pagePhone').on("scrollstop", function() {
		   if(more){
			   var total = $('#total').val(); 
			   var rootView = $('.hideMenu');
			   var docH = parseInt($('.hideMenu').height()); 
			   var scrollH = parseInt($('.pagePhone').scrollTop());
			   // 计算此次事件触发需不要 加载数据
			   if((docH / 2) <= scrollH){
					loadProduction((p - 1) * pageSize);
					currentSize = (p - 1) * pageSize;
					p++;
					var item = rootView.find('a');
					if(item.length == total){
						more = false;
					}
			   }
		   }
	  })
}

//加载视频
function loadProduction(start){
	loadData(function(list){
		if(list != null && list.length > 0){
			var rootView = $('.hideMenu');
			for (var int = 0; int < list.length; int++) {
				var item = list[int];
				var html = createVideo(item);
				$(rootView).append(html);
				getItemHeight();
			}
		}
	}, getContextPath() + '/search/pagination', $.toJSON({
		begin : start,
		limit : pageSize,
		condition : $('#q').val().trim(),
		industry : $('#industry').val().trim(),
		genre : $('#genre').val().trim(),
		priceFq : $('#price').val(),
		lengthFq : $('#length').val()
	}));
}

function createVideo(product){
	var url = getDfsHostName()+ product.picLDUrl;
	var tags = product.tags;
	var ptags = '';
	if(tags != null && tags != '' && tags != undefined){
		var arr = tags.split(' ');
		if(arr != null && arr.length >0){
			for (var int = 0; int < arr.length; int++) {
				if(int !=0 )
					ptags += '/';
				ptags += arr[int];
			}
		}
	}
	var loginTel = $('#rolephoneImg').val();
	var htmlAddImg = 0;
	var indentProjectId = parseInt(product.indentProjectId);
	if(loginTel!=null && loginTel!= "" ){
		if(indentProjectId < 0){
			htmlAddImg = '<img class="roleImg" src="/resources/images/video/roleOur.png">';
		}
	    if(indentProjectId > 0){
	    	htmlAddImg = '<img class="roleImg" src="/resources/images/video/rolePlay.png">';
       	}
	    if(indentProjectId == 0){
	    	htmlAddImg = '<img class="roleImg" src="/resources/images/video/rolePro.png">';
		}
	}
	
	var htmlAdd = '<a href="'+getContextPath()+'/provider/info/'+product.teamId+'.html"><img src="'+getDfsHostName()+product.teamPhotoUrl+'"><div>'+product.teamName+'</div></a>';
	var itemFlag = parseInt(teamFlag);
	if(itemFlag == 4 || itemFlag == null ){
		htmlAdd ='';
	}
	var body = [
					'<div class="contentItem"">',
					      '<img src='+url+'> ',
					      htmlAddImg,
					      '<div class="itemS">',
					      '<div class="itemTitle">'+product.productName+'</div>',
					      '<div class="itemTag">',
					      ptags,
					      '</div>',
					      '<div class="toProvider">',
					      htmlAdd,
					      '</div>',
					      '</div>',
					      '<a class="videoItem" href="/play/'+product.teamId+'_'+product.productId+'.html">',
					      '<div class="itemBack"></div>',
					      '</a>',
					'</div>',
				].join('');
	return body;
}

function initLazySizes(){
	var docElem = document.documentElement;
	window.lazySizesConfig = window.lazySizesConfig || {};
	window.lazySizesConfig.loadMode = 1;
	window.lazySizesConfig.expand = Math.max(Math.min(docElem.clientWidth, docElem.clientHeight, 1222) - 1, 359);
	window.lazySizesConfig.expFactor = lazySizesConfig.expand < 380 ? 3 : 2;
}