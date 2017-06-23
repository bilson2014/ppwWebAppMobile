$().ready(function() {
	$('.cancleInput').off('click').on('click', function() {
		$('#search-q').val('');
	});

	$("label").on('click', function() {
		var a = $(this).text().trim();
		if ( a != undefined && a != null && a != '') {
			if(a == '宣传片')
				a = '*宣传片';
			if(a == '广告片')
				a = '*广告';
			$("#search-q").val(a);
		}
		$("#s-form").submit();
	});
});