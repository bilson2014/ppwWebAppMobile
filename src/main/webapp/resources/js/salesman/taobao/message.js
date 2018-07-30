var total = 62440;
$().ready(function() {
	number();
	submitbut();
	$('.mask').hide();
});
function number(){
	$('.subtract').off('click').on('click',function(){
		var num=$('.number').text();
		var total=$('.total').text();
		if (num<=5){
			$('.number').text(5);
			$('.total').text('￥'+getValue(5));
			total = getValue(5);
			$('#show').text(9);
		}else {
			num--;
			$('.number').text(num);
			$('.total').text('￥'+getValue(num));
			total = getValue(num);
		}	
	});
	$('.plus').off('click').on('click',function(){
		var num=$('.number').text();
		var total=$('.total').text();
		num++;
		$('.number').text(num);
		$('.total').text('￥'+getValue(num));
		total = getValue(num);
	})
}

function getValue(num){
	if(num >=20){
		$('#show').text(6);
		return Math.round(num*(5188*0.6));
	}
	if(num >=10){
		$('#show').text(8);
		return Math.round(num*(5188*0.8));
	}
	if(num >=5){
		$('#show').text(9);
		return Math.round(num*(5188*0.9));
	}
	$('#show').text(9);
	return Math.round(num*5188);
}


function submitbut(){
	$('.but').off('click').on('click',function(){
		var name=$('#name').val();
		var phone=$('#phone').val();
		var wechat=$('#wechat').val();
		var shop=$('#shop').val();
		var commodity=$('#commodity').val();
		var num=$('.number').text();
		var total=$('.total').text();
		total = total.substring(1,total.length ); 
		if (name=='' || name==null || name==undefined){
			$('.mask').show();
			$('.mask span').text('请输入联系人');
			$('#name').focus();
			setTimeout(function(){
				$('.mask').hide();
			},3000);
			return false;
		}else if (phone=='' || phone==null || phone==undefined){
			$('.mask').show();
			$('.mask span').text('请输入联系电话');
			$('#phone').focus();
			setTimeout(function(){
				$('.mask').hide();
			},3000);
			return false;
		}else if (!checkMobile(phone)){
			$('.mask').show();
			$('.mask span').text('手机填写不正确');
			$('#phone').focus();
			setTimeout(function(){
				$('.mask').hide();
			},3000);
			return;
		}/*else if (shop=='' || shop==null || shop==undefined){
			$('.mask').show();
			$('.mask span').text('请输入店铺名称');
			$('#shop').focus();
			setTimeout(function(){
				$('.mask').hide();
			},3000);
			return;
		}*/else if (commodity=='' || commodity==null || commodity==undefined){
			$('.mask').show();
			$('.mask span').text('请输入商品名称');
			$('#commodity').focus();
			setTimeout(function(){
				$('.mask').hide();
			},3000);
			return;
		}else{
			loadData2(function(result){	
				window.location.href="/salesman/taobao/success/"+$('#uniqueId').val();	
			 }, getContextPath() + '/order/salesman', 
			 {	
				salesmanUniqueId : $('#uniqueId').val(),
				indentSource : 24,//订单来源编号
				user_name:name,//联系人
				indent_tele:phone,//联系电话
				indentName:commodity,//商品名称
				indent_recomment:'商品名称:'+commodity+';下单数量:'+num,
				wechat:wechat,//微信
				userCompany:shop,//店铺名称
				indentPrice:total,//总价						
			  });
		}
	})
	
	
}

