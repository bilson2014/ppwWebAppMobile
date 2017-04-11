$().ready(function(){
	search.initData();
//	initData();
//	$('nav#menu').mmenu({
//		"offCanvas" : {
//			"position": "left"
//		},
//		navbar : {
//			title : '视频分类'
//		}
//	});
//	
//	if($('#sequence').val() != null && $('#sequence').val() != '' && $('#sequence').val() != undefined){
//		var iName = 'unchange.png';
//		if($('#sortord').val() == 0){ // 升序
//			iName = 'asc-icon.png';
//		}else{ // 降序
//			iName = 'desc-icon.png';
//		}
//		$('#' + $('#sequence').val() + '-img').attr('src',getContextPath() + '/resources/images/icons/' + iName);
//		$('#' + $('#sequence').val() + '-lb').css('color',"#fe5453");
//	}
//	
//	$('.condition-section').children('label').on('click',function(){
//		var q = $('#q').val().trim();
//		var sequence = $(this).data('sequence');
//		
//		if(q != null && q != '' && q != undefined){
//			// 查询条件不为空,则执行相应的操作
//			var sortord = $(this).data('sortord');
//			if(sortord == 0){
//				$(this).data('sortord',1);
//				sortord = 1;
//			}else {
//				$(this).data('sortord',0);
//				sortord = 0;
//			}
//			
//			if(sequence != null && sequence != '' && sequence != undefined) {
//				$('#search-sortord').val(sortord);
//				$('#search-sequence').val(sequence);
//				
//				$('#s-form').submit(); // 提交
//			}
//			return false;
//		}
//	});
//	lazyLoad();
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
					  $('#checkBtn').show();
				  }else{
					  $('.searchBox').addClass('searchInit');
					  $('#checkBtn').hide();
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
        	//价格区域处理
        	var base_tagsPrice = $(".tagsPrice");
        	var tagsPrice = $(".tagsPrice").length;
        	base_tagsPrice.on('click', function() {
        		    $(".tagsPrice").removeClass('checkActive');
        			$(this).addClass('checkActive');
        			$('#lowPrice').val($(this).attr('data-low'));
        			$('#heightPrice').val($(this).attr('data-content'));
        	});
        	
        	$('#heightPrice').blur('click',function(){
        		var lowPrice = $('#lowPrice').val();
        		var heightPrice = $('#heightPrice').val();
                if(lowPrice !=null && lowPrice !="" && lowPrice != undefined){
                	if(heightPrice < lowPrice){
                		$('#heightPrice').val(lowPrice);
                		$('#lowPrice').val(heightPrice);
                	}
                }    		
        	});
        	
         	$('#lowPrice').blur('click',function(){
        		var lowPrice = $('#lowPrice').val();
        		var heightPrice = $('#heightPrice').val();
                if(heightPrice !=null && heightPrice !="" && heightPrice != undefined){
                	if(heightPrice < lowPrice){
                		$('#heightPrice').val(lowPrice);
                		$('#lowPrice').val(heightPrice);
                	}
                }    		
        	});
         	
         	$('#cancle').on('click',function(){
         		$('.searchBox').addClass('searchInit');
				$('#checkBtn').hide();
         	});
        }
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
