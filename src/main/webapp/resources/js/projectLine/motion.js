$().ready(function() {
	initScene();
	//initFeature();
	initProduct();
	initBanner();
});

function initBanner() {
	var str = $('#bannerArray').text().trim();
	var view = $('.setImg');
	view.html('');
	var json = $.evalJSON(str);
	if (json != null && json.length > 0) {
		for (var int = 0; int < json.length; int++) {
			var jj = json[int];
			if (jj.type == 0) {
				var html = '<div style="background:url('+getDfsHostName() + jj.url+') no-repeat center top"></div>';
				view.append(html);
			}
		}
	}
}

//应用场景
function initScene(){
	var productId = $('#productId').val();
	loadData(function(res){
		if(res.errorCode == 200){
			var rows = res.result.rows;
			var view = $('#sceneView');
			view.html('');
			if(rows != null && rows.length > 0){
				for (var int = 0; int < rows.length; int++) {
					var rr = rows[int];
					var html = [
								'<div class="mItem">',
								'	<img src="'+getDfsHostName() + rr.scenenPicLDUrl +'">',
								'	<div>'+rr.sceneName+'</div>',
								'</div>'
					            ].join('');
					view.append(html);
				}
			}
		}
	}, getContextPath() +'/product/scene/'+productId, null);
}

//产品优势
function initFeature(){
	var str =  $('#featureArray').text().trim();
	var view = $('#featureView');
	view.html('');
	var json = $.evalJSON(str);
	if( json!=null && json.length > 0){
		for (var int = 0; int < json.length; int++) {
			var jj = json[int];
			var html = [
						'<div class="pItem">',
						'     <img src="'+getDfsHostName() + jj.picHDUrl+'">',
						'     <div>'+jj.description+'</div>',
						'     <div>'+jj.name+'</div>',
						'</div>'
			           ].join('');
			view.append(html);
		}
	}
	
}
//产品案例
function initProduct(){
	
	var productId = $('#productId').val();
	loadData(
			function(res) {
				var view = $('.eContent');
				view.html('');
						for (var int = 0; int < res.length; int++) {
							var rr = res[int];
						
							var tags = rr.product.tags;
							var ptags = '';
							if(tags != null && tags != '' && tags != undefined){
								var arr = tags.split(' ');
								
								if(arr != null && arr.length >0){
									for (var int1 = 0; int1 < arr.length; int1++) {
										if(int1 !=0 )
											ptags += '/';
										ptags += arr[int1];
									}
								}
							}
							
							var html = [
							            '<a href="/play/'+rr.product.teamId+'_'+rr.productId+'.html">',
										'<div class="contentItem">',
										'     <img src="' + getDfsHostName() + rr.product.picHDUrl + '">',
										'     <div class="itemTitle">'+rr.product.productName+'</div>	',
										'     <div class="itemTag">'+ptags+'</div>	',
										'     <div class="itemBack"></div>',
										'</div></a>'
							           ].join('');
								view.append(html);
						}
						product();
			}, getContextPath() + '/product/case?productId=' + productId, null);

}

