$().ready(function(){
   $('.cancleInput').off('click').on('click',function(){
	   $('#search-q').val('');
   });
	
	$("label").on("click",function(){
		var a=$(this).text().trim();
		if(a == '宣传片')
			a = '*宣传片';
	null!=a&&""!=a&&void 0!=a&&($("#search-q").val($(this).text().trim()),$("#s-form").submit())})});