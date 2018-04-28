<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=9,chrome=1">
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0,minimum-scale=1.0, user-scalable=no" name="viewport" />
	<meta name="keywords" content="">
	<meta name="description" content="">
	<meta name="baidu-site-verification" content="dMz6jZpIwd" />
	<title>填写订单信息</title>
	<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
	<script src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<!-- 	<link rel="stylesheet" href="/resources/lib/swiper/swiper.min.css"> -->
	<link rel="stylesheet" href="/resources/css/salesman/taobao/message.css">

	<!-- imgPath -->
	<spring:url value="/resources/images/salesMan" var="imgPath" />
	<link rel="shortcut icon" href="/resources/images/favicon.ico">
</head>
<body>
	<input type="hidden" id="uniqueId" value="${uniqueId}">
	<div class="phoneHeader">
	     <a href='/salesman/taobao/index/${uniqueId}' id="openMenu"><img src="${imgPath }/taobao/back.png" alt='返回'></a>
	     <span>填写订单信息</span>
	</div>
	<div class='colorline'></div>
	<div class='messageboxs'>
		<div class='textboxs'>
			<div class='line'>
				<span>联系人:</span>
				<input type='' placeholder='请输入' id='name'>
			</div>
			<div class='line'>
				<span>联系电话:</span>
				<input type='' placeholder='请输入' id='phone'>
			</div>
			<div class='line'>
				<span>微信:</span>
				<input type='' placeholder='请输入' id='wechat'>
			</div>
			<div class='line'>
				<span>店铺名称:</span>
				<input type='' placeholder='请输入' id='shop'>
			</div>
			<div class='line'>
				<span>商品名称:</span>
				<input type='' placeholder='请输入' id='commodity'>
			</div>
			<div class='line'>
				<span>购买数量:</span>
				<div class='subtract'>-</div>
				<div class='number'>1</div>
				<div class='plus'>+</div>
			</div>
			<div class='line'>
				<span>总价:</span>
				<div class='total'>￥2588</div>
			</div>
			<div class='but'>提交订单</div>
			<div class='mask'>
				<img src="${imgPath }/taobao/hint.png" alt='提示'>
				<span>请输入您的手机号</span>
			</div>
		</div>		
	</div>
    <script src="/resources/lib/jquery/jquery-2.0.3.min.js"></script>
    <script src="/resources/js/common.js"></script>	
    <script src="/resources/js/salesman/taobao/message.js"></script>

</body>
</html>