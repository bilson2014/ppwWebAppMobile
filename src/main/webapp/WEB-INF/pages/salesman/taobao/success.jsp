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
	<title>订单完成</title>
	<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
	<script src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<!-- 	<link rel="stylesheet" href="/resources/lib/swiper/swiper.min.css"> -->
	<link rel="stylesheet" href="/resources/css/salesman/taobao/success.css">

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
   		<div class='main'>
   			<img src="${imgPath }/taobao/success.png" alt='提交'>
   			<span>订单已提交</span>
   		</div>
   		<div class='contact'>
   			<span>请通过二维码联系客服并支付费用</span>
   			<span>如已转账成功请联系客服确认订单</span>
   			<img src="${imgPath }/taobao/message.png" alt='微信'>
   			<p>拍片网客服二维码</p>
   			<p class='day'>如需联系 请在工作日拨打</p>
   			<p class='phone'>400-660-9728</p>
   		</div>
   		<div class='share'>
   			<span>邀请好友 共享优惠</span>
   		</div>
   </div>

    <script src="/resources/lib/jquery/jquery-2.0.3.min.js"></script>
    <script src="/resources/js/common.js"></script>	
    <script src="/resources/js/salesman/taobao/success.js"></script>

</body>
</html>