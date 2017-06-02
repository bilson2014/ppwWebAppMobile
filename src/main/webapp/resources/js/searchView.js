$().ready(function() {
	$('.cancleInput').off('click').on('click', function() {
		$('#search-q').val('');
	});

	$("label").on('click', function() {
		var a = $(this).text().trim();
		if ( a != undefined && a != null && a != '' && a == '宣传片') {
			a = '*宣传片';
			$("#search-q").val(a);
		}
		$("#s-form").submit();
	});
});