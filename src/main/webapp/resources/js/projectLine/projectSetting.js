var configCache;
$().ready(function() {
	pSet.init();
	initConfig();
	getConfirm();
});
function getConfirm(){
	$('#confirm').on('click',function(){
		var cId = $('#CConfigId').val();
		var tId = $('#CTimeID').val();
		var subId = $('#CSubjoinID').val();
		window.location.href= '/product/confirm/indent?configId='+cId +'&timeId='+tId +'&subJoin='+subId;
	});
}
/**
 * 主页业务处理部分
 */
var pSet= {
	init:function(){
		this.initOption();
	},
	initOption:function(){
	    $('.cardContent').off('click').on('click',function(){
	    	$('.cardContent').removeClass('active');
	    	$(this).addClass('active');
	    });
	    $('.timeCard').off('click').on('click',function(){
	    	$('.timeCard').removeClass('active');
	    	$(this).addClass('active');
	    });
	    
	    $('.setItem').off('click').on('click',function(){
	    	$('.setItem').removeClass('active');
	    	$(this).addClass('active');
	    });
		$('.showMoreDiv').off('click').on('click',function(){
            $('.setInfo').slideDown();
            $('.showMoreDiv').hide();
	    });
		$('#closeInfo').off('click').on('click',function(){
			$('.setInfo').slideUp();
            $('.showMoreDiv').show();
	    });
		$('#normal').off('click').on('click',function(){
			  $('.cardItem').hide();
			  $('.normal').show();
			  $('.modItem').removeClass('active');
			  $(this).addClass('active');
			  initModel($(this).attr('data-id'));
			  $('#CConfigId').val($(this).attr('data-id'));
			  $('.setInfo').slideUp();
	          $('.showMoreDiv').show();
		});
		$('#k2').off('click').on('click',function(){
			  $('.cardItem').hide();
			  $('.k2').show();
			  $('.modItem').removeClass('active');
			  $(this).addClass('active');
			  initModel($(this).attr('data-id'));
			  $('#CConfigId').val($(this).attr('data-id'));
			  $('.setInfo').slideUp();
	          $('.showMoreDiv').show();
		});
		$('#k4').off('click').on('click',function(){
			  $('.cardItem').hide();
			  $('.k4').show();
			  $('.modItem').removeClass('active');
			  $(this).addClass('active');
			  initModel($(this).attr('data-id'));
			  $('#CConfigId').val($(this).attr('data-id'));
			  $('.setInfo').slideUp();
	          $('.showMoreDiv').show();
		});
		$('.toNext').off('click').on('click',function(){
			  $('#step1').hide();
			  $('#step2').show();
			  calculatedValue(0);
		});
		$('.goBefore').off('click').on('click',function(){
			  $('#step2').hide(); 
			  $('#step1').show();
		});
	},
}

function initConfig() {
	var productId = $('#productId').val();
	var view = $('.setCard');
	view.html('');
	loadData(function(res){
		configCache = res;
		if(res != null && res.length > 0){
			for (var int = 0; int < res.length; int++) {
				var jj = res[int];
				if(int == 0){
					var html = buildCar1(jj);
					view.append(html);
				}else if(int == 1){
					var html = buildCar2(jj);
					view.append(html);
				}else if(int == 2){
					var html = buildCar3(jj);
					view.append(html);
				}
			}
			initModel($('#normal').attr('data-id'));
		}
	}, getContextPath()+'/product/config/list?chanpinId='+productId, null);
}

function buildCar1(obj){
	var tags = obj.tags;
	var tag = '';
	if(tags != null){
		var tagArray = tags.split(" ");
		if(tagArray!=null && tagArray.length >0){
			for (var int = 0; int < tagArray.length; int++) {
				tag+= '<div class="tItem">'+tagArray[int]+'</div>';
			}
		}
	}
	$('#CConfigId').val(obj.chanpinconfigurationId);
	$('#normal').attr('data-id',obj.chanpinconfigurationId);
	$('#normal_prive').text(obj.basePrice);
	var html1 = [
	             '<div class="cardItem normal" data-id="'+obj.chanpinconfigurationId+'">',
	             '         <div class="showProduct">',
	             '              <img src="'+getDfsHostName() +obj.chanpinconfigurationPicLDUrl +'">',
                 '         </div>',
	             '              <div class="des">'+obj.chanpinconfigurationDescription+'</div>',
	             '               <div class="setTags">',
	             tag,
	             '               </div>',
	             '</div>'
	             ].join('');
	return html1;
}
function buildCar2(obj){
	var tags = obj.tags;
	var tag = '';
	if(tags != null){
		var tagArray = tags.split(" ");
		if(tagArray!=null && tagArray.length >0){
			for (var int = 0; int < tagArray.length; int++) {
				tag+= '<div class="tItem">'+tagArray[int]+'</div>';
			}
		}
	}
	$('#k2').attr('data-id',obj.chanpinconfigurationId);
	$('#k2_prive').text(obj.basePrice);
	var html1 = [
	             '<div class="cardItem k2" data-id="'+obj.chanpinconfigurationId+'">',
	             '         <div class="showProduct">',
	             '              <img src="'+getDfsHostName() +obj.chanpinconfigurationPicLDUrl +'">',
                 '         </div>',
	             '              <div class="des">'+obj.chanpinconfigurationDescription+'</div>',
	             '               <div class="setTags">',
	             tag,
	             '               </div>',
	             '</div>'
	             ].join('');
	return html1;
}
function buildCar3(obj){
	var tags = obj.tags;
	var tag = '';
	if(tags != null){
		var tagArray = tags.split(" ");
		if(tagArray!=null && tagArray.length >0){
			for (var int = 0; int < tagArray.length; int++) {
				tag+= '<div class="tItem">'+tagArray[int]+'</div>';
			}
		}
	}
	$('#k4').attr('data-id',obj.chanpinconfigurationId);
	$('#k4_prive').text(obj.basePrice);
	var html1 = [
	             '<div class="cardItem k4">',
	             '         <div class="showProduct">',
	             '              <img src="'+getDfsHostName() +obj.chanpinconfigurationPicLDUrl +'">',
                 '         </div>',
	             '              <div class="des">'+obj.chanpinconfigurationDescription+'</div>',
	             '               <div class="setTags">',
	             tag,
	             '               </div>',
	             '</div>'
	             ].join('');
	return html1;
}

function initModel(id){
	var v1 = $(".setPack");
	var v2 = $(".addSet");
	var v3 = $(".timeSet");
	v1.html("");
	v2.html("");
	v3.html("");
	for (var int = 0; int < configCache.length; int++) {
		var cc = configCache[int];
		if(cc.chanpinconfigurationId == id){
			var productModule = cc.pmsProductModule;
			var dimensions = cc.pmsDimensions;
			if(productModule != null && productModule.length > 0){
				for (var int2 = 0; int2 < productModule.length; int2++) {
					var mod = productModule[int2];
					var type = mod.pinConfiguration_ProductModule.cpmModuleType;
					if(type == 0){
						v1.append(createMustMod(mod,int2));
					}
					else{
						v2.append(createSubjoinMod(mod));
					}
				}
			}
			if(dimensions != null && dimensions.length > 0){
				for (var int3 = 0; int3 < dimensions.length; int3++) {
					var dd = dimensions[int3];
					var html = createTime(dd,int3);
					v3.append(html);
				}
			}
			$('.tItem').off('click').on('click', function() {
				$('.tItem').removeClass('active');
				$(this).addClass('active');
				calculatedValue(1);
				$('#CTimeID').val($(this).attr('data-id'));
			});

//			$('.aItem').off('click').on('click', function() {
//				$('.aItem').removeClass('active');
//				$(this).addClass('active');
//				calculatedValue(1);
//				$('#CSubjoinID').val($(this).attr('data-id'));
//			});
			
			$('.aItem').off('click').on('click', function() {
				var clas = $(this).hasClass('active');
				if(clas){
					$(this).removeClass('active');
				}else{
					$(this).addClass('active');
				}
				calculatedValue(1);
				var v3 = $(".aItem");
				if(v3.length > 0){
					var dId = '';
					for (var int4 = 0; int4 < v3.length; int4++) {
						if($(v3[int4]).hasClass('active')){
							dId += $(v3[int4]).attr('data-id');
							if((int4 + 1) != v3.length){
								dId +=',';
							}
						}
					}
					if(dId.lastIndexOf(',') == dId.length -1){
						dId = dId.substring(0,dId.length -1);
					}
					$('#CSubjoinID').val(dId);
				}
			});
		}
	}
}

function createMustMod(obj,num){
	var hasDes="";
	if(num<2){
		hasDes="(赠送)";
	   } 
	var html = ['<div class="cItem">',
				'    <div class="pTitle">'+obj.moduleName+'</div>',
				'    <div class="info">'+obj.description+'</div>',
				'    <div class="other">'+hasDes+'</div>',
				'</div>'].join('');
	return html;
}

function createSubjoinMod(obj){
	var html = [
				'<div class="aItem" data-id="'+obj.productModuleId+'">',
				'       <img src="'+getDfsHostName() +obj.pic +'">',
				'       <div class="mod"></div>' ,      
				'       <div class="itemContent">',
				'       	<div class="name">'+obj.moduleName+'</div>',
				'       	<div ><span class="price">'+obj.pinConfiguration_ProductModule.cpmModulePrice+'</span>元</div>',
				'       	<div >'+obj.description+'</div>',
				'       </div>',
				'</div>'
	            ].join('');
	return html;
}

function createTime(obj,num){
	var card = $(".typeMod div.active");
	var cardPrice = $(card).find('span').text();
	var setArray = new Array;
	setArray.push(cardPrice);
	if(obj.computeType == 0){
		setArray.push("*");
	}
	if(obj.computeType == 1){
		setArray.push("+");
	}
	if(obj.computeType == 2){
		setArray.push("-");
	}
	setArray.push(obj.rowValue);
	var realPrice = 0;
	$.ajax({
		url :  getContextPath()+'/product/compute',
		async : false,
		type : 'POST',
		data : {json:$.toJSON(setArray)},
		success : function(data){
			realPrice = data.result;
		}
	});
	if(num>0){
	    var html = [
					'<div class="tItem" data-id="'+obj.dimensionId+'">',
					'<span class="time name">'+obj.rowName+'</span>',
					'<div><span class="price">'+realPrice+'</span>元</div>',
					'</div>'
		            ].join('');
	}else{
		$('#CTimeID').val(obj.dimensionId);
	    var html = [
					'<div class="tItem active" data-id="'+obj.dimensionId+'">',
					'<span class="time name">'+obj.rowName+'</span>',
					'<div><span class="price">'+realPrice+'</span>元</div>',
					'</div>'
		            ].join('');
	}
	return html;
}

function calculatedValue(num){
	var addprice = 0;
	var priceArray = new Array;
	var typeMod = $(".typeMod .active");
	var addSet = $(".addSet div.active");
	var timeSet = $(".timeSet div.active");
	var typeModText = "["+$(typeMod).find('.info').text()+"]";
	var addSetText = "";
	var timeSetText = "["+$(timeSet).find('.name').text()+"]";
	var timePrice =  $(timeSet).find('.price').text();

	if(addSet.length > 0){
		for (var int = 0; int < addSet.length; int++) {
			var nowAdd = '+' + '[' + $(addSet[int]).find('.name').text() +']';
			var nowPrice =$(addSet[int]).find('.price').text();
			addSetText =addSetText + nowAdd;
		    priceArray.push(nowPrice);
			priceArray.push("+");
		}
	}
	if(num >0){
			$('.showDes').text('您选择了: '+ typeModText + '+' + timeSetText + addSetText);
	   }else{
		   $('.showDes').text('您选择了: '+ typeModText + '+' + timeSetText);
	   }
	
	priceArray.push(timePrice);
	if(timePrice!=''){
		$.ajax({
			url :  getContextPath()+'/product/compute',
			type : 'POST',
			data : {json:$.toJSON(priceArray)},
			success : function(data){
			$('#setTotalPrice').text(data.result);
			}
		});
	}
}


