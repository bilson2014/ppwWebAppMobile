var loadMore = true;
var typeArray = new Array('产品宣传片','企业宣传片','活动广告',' 广告','微电影','病毒视频',' 宣传片','个人宣传片','活动宣传片','城市宣传片','品牌宣传片','场景宣传片','招商宣传片','形象宣传片','TVC','创意广告','产品广告','品牌广告','路演视频','公益片','社交媒体视频','花絮');
var busArray = new Array('互联网','智能硬件','电商','电子产品','金融','医疗保健','电器','通讯','服装纺织','游戏','交通运输','汽车','文化','日用美妆','家居建材','政府机构','企业服务','餐饮美食','母婴','美容','美发','食品饮料','影视','房地产');
$().ready(function(){
	search.showTagsItem();
	search.initData();
	toSearch();
	touchLis();
});

var search = {
		initData : function() { // 加载分类信息
			 var screenWidth = document.documentElement.clientWidth;
			 var setHeight= screenWidth/16*9;
			 $('.contentItem').css('height',setHeight + "px");
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
//        	
//        	$('#heightPrice').blur('click',function(){
//        		var lowPrice = $('#lowPrice').val();
//        		var heightPrice = $('#heightPrice').val();
//                if(lowPrice !=null && lowPrice !="" && lowPrice != undefined){
//                	if(heightPrice < lowPrice){
//                		$('#heightPrice').val(lowPrice);
//                		$('#lowPrice').val(heightPrice);
//                	}
//                }    		
//        	});
//        	
//         	$('#lowPrice').blur('click',function(){
//        		var lowPrice = $('#lowPrice').val();
//        		var heightPrice = $('#heightPrice').val();
//                if(heightPrice !=null && heightPrice !="" && heightPrice != undefined){
//                	if(heightPrice < lowPrice){
//                		$('#heightPrice').val(lowPrice);
//                		$('#lowPrice').val(heightPrice);
//                	}
//                }    		
//        	});
         	
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
	var $body1 = '<div class="tags">'+name+'</div>';
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
var p = 1;
var more = true;
//滑动回调
function touchLis(){
	  $(document).on('touchend',function(e){
		   var total = $('#total').val(); 
		   var rootView = $('.hideMenu');
		   var item = rootView.find('a');
		   
		   var docH = parseInt($('.pagePhone').height()); 
		   var scrollH = parseInt($('.pagePhone').scrollTop());
		   // 计算此次事件触发需不要 加载数据
		   if((docH / 2) <= scrollH){
				loadProduction((p - 1) * pageSize);
				currentSize = (p - 1) * pageSize;
				p++;
		   }
	  });
}

//加载视频
function loadProduction(start){
	loadData(function(list){
		console.log(list);
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
