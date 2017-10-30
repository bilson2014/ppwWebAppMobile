var InterValObj; // timer变量，控制时间  
var count = 60; // 间隔函数，1秒执行  
var curCount; // 当前剩余秒数 
var swiper;
var add = true ;
var reSet = false;

var pageSize = 20;
var currentSize = 0;
var currentPage = 1;

$().ready(function() {
	newsList.touchLis();
	newsList.initCategory();
	merchantBridge();
});

var newsList = {
	//滑动回调
	touchLis : function() {
		$('.pagePhone').on("scrollstop", function() {
			   // 总页数
			   var total = $('#total').val(); 
			   var scrollH = parseInt($('.pagePhone').scrollTop());
			   // 计算此次事件触发需不要 加载数据
			   if(scrollH > 300){
				   // 总页数
				   var pageCount = Math.ceil(total / pageSize);
				   if(currentPage >= pageCount)
					   return ;
				   else {
					   // 计算页数，分页
					   currentSize = currentPage * pageSize;
					   loadNews(currentSize);
					   currentPage ++;
				   }
			   }
		  })
	},
	initCategory : function() {
		var q = $('#q').val();
		if(q != undefined && q != '' && q != null) {
			$.each($('.category'),function(i,model) {
				if($(model).data('value') == q) {
					$('.category').removeClass('active');
					$(this).addClass('active');
					return;
				}
			});
		}else {
			// q为空时，判断是 全部还是最热资讯
			var param = getParam();
			if(param != null && param != '' && param != undefined){
				$.each($('.category'),function(i,model) {
					if($(model).data('value') == '最热资讯') {
						$('.category').removeClass('active');
						$(this).addClass('active');
						return;
					}
				});
			}
		}
	}
}

//加载视频
function loadNews(begin){
	var storageNode = $('#storage_node').val();
	loadData(function(list){
		
		$('.newsContent').append(mergeNewContentHtml(list,storageNode));
		
	}, getContextPath() + '/search/news/pagination', $.toJSON({
		begin : begin,
		limit : pageSize,
		condition : $('#q').val().trim()
	}));
}

function getParam() {
    var r = window.location.search.substr(1).replace('q=','');  
    if (r != null) return decodeURI(r);  
    return null;
}

// 拼装新闻信息html
function mergeNewContentHtml(list,storageNode) {
	var $body = '';
	
	if(list != null && list.length > 0){
		for (var i = 0; i < list.length; i++) {
			var newInfo = list[i];
			$body += '<a href="/news/article-'+ newInfo.id +'.html">';
			$body += '<div class="newsItem">';
			$body += '<img src="'+ storageNode + newInfo.picLDUrl +'" alt="'+ newInfo.title +'_拍片网" >';
			$body += '<div class="itemContent">';
			$body += '<div>'+ newInfo.title +'</div>';
			$body += '<div>'+ formatDate(newInfo.creationTime) +'</div>';
			$body += '</div>';
			$body += '</div>';
			$body += '</a>';
		}
	}
	return $body;
}

// 格式化日期
function formatDate(dateTime) {
	var dateForm = dateTime.replace('-','年').replace('-','月') + '日';
	return dateForm;
}