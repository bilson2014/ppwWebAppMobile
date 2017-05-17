var num = 0;
$().ready(function() {
	pCommon.init();

//	$('.searchType').off('click').on('click',function(){
//		
//	});
});

var pCommon = {
	init:function(){
		this.search();
	},
	search:function(){
	$('.choose').off('click').on('click',function(){
		 if($('.searchType').hasClass('roateType')){
			 $('.searchType').removeClass('roateType');
			 $('.showType').hide();
		 }
		 else{
			 $('.searchType').addClass('roateType');
			 $('.showType').show();
		 }
	});
	},
}
