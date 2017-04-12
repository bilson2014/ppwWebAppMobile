var InterValObj; // timer变量，控制时间  
var count = 60; // 间隔函数，1秒执行  
var curCount; // 当前剩余秒数 
var swiper;
var add = true ;
var reSet = false;
$().ready(function() {

	newsList.initCategory();
	
});

var newsList = {
    
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

function getParam() {
    var r = window.location.search.substr(1).replace('q=','');  
    if (r != null) return decodeURI(r);  
    return null;
}
