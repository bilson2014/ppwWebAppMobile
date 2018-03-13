<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%-- import CSS --%>
<spring:url value="/resources/lib/Bootstrap/css/bootstrap-alert.min.css" var="bootstrapAlertCss"/>
<spring:url value="/resources/lib/Bootstrap/css/bootstrap-button.min.css" var="bootstrapButtonCss"/>
<spring:url value="/resources/css/salesman/order.css" var="orderCss"/>

<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js" var="jqueryJs"/>
<spring:url value="/resources/lib/jquery/plugins.js" var="pluginJs"/>
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js" var="jsonJs"/>
<spring:url value="/resources/js/common.js" var="commonJs"/>
<spring:url value="/resources/js/salesman/order.js" var="orderJs"/>
<spring:url value="/resources/js/testRem.js" var="RemJs"/>


<!-- imgPath -->
<spring:url value="/resources/images" var="imgPath"/>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=9,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
	<!-- iphone 手机默认全屏 -->
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<title>移动端_订单页－拍片网</title>

	<link rel="shortcut icon" href="${imgPath }/favicon.ico" >
	<link rel="stylesheet" href="${bootstrapAlertCss }">
	<link rel="stylesheet" href="${bootstrapButtonCss }">
	<link rel="stylesheet" href="${orderCss }">
	<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
	<script src="${jqueryJs }"></script>
	<script src="${pluginJs }"></script>
	<script src="${jsonJs }"></script>
	<script src="${commonJs }"></script>
	<script src="${orderJs }"></script>
	<script src="${RemJs}"></script>
	<script src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
</head>
<body>
	<div class="wrap">
		<input type="hidden" id="storage_node" value="${file_locate_storage_path }" />
		<div class="content-wrap">
		    <a href="tel:59005941">
		    <img style="width:100%" src="/resources/images/goodGod/orderTop.jpg">
		    </a>
		    
			<form id="order-form" role="form" method="post" autocomplete="off" accept-charset="UTF-8">
				<input type="hidden" id="csrftoken" name="csrftoken" value="${csrftoken}"/>
				<input type="hidden" id="token" name="token" value="${token}"/>
				<input type="hidden" id="indentName" name="indentName" value="财神营销活动"/>
				<input type="hidden" name="indentSource" value="2">
				<input type="hidden" id="indent_recomment" name="indent_recomment" value="${recomment}"/>
				<div class="order-section">
					<div class="order-input-wrap">
					    <div id="label-message" class="errorMessage ">请输入正确的手机格式</div>
						<input class="btnborder" type="text" style="color:#333 !important" placeholder="输入手机号" id="indent_tele" name="indent_tele"/>
						<button type="button" id="order-btn" style="padding:0 2px;">立即领红包</button>
					</div>
				</div>
			</form>
			

			
		</div>
	</div>
</body>
</html>