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
				var html = '<img src="'+getDfsHostName() + jj.url+'">';
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
	var view = $('.eContent');
	view.html('');
			var html = [
						'<div class="contentItem" style="${imgPath }/projectLine/motion/test.jpg">',
						'     <div class="itemTitle">华为智能机顶盒国际版</div>	',
						'     <div class="itemTag">产品宣传片 / 电视机顶盒 / 智能硬件 / AE包装 / 3D</div>	',
						'     <div class="itemBack"></div>',
						'</div>'
			           ].join('');
			view.append(html);
}

