<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%-- import CSS --%>
<spring:url value="/resources/css/salesman/mgActive.css" var="activeCss"/>

<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js" var="jqueryJs"/>
<spring:url value="/resources/lib/jquery/plugins.js" var="pluginJs"/>
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js" var="jsonJs"/>
<spring:url value="/resources/js/common.js" var="commonJs"/>
<spring:url value="/resources/js/salesman/mgActive.js" var="activeJs"/>
<!-- img path -->
<spring:url value="/resources/images" var="imgPath" />
<spring:url value="/resources/js/remSet.js" var="remSetJs" />
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
	<!-- 取消数字被识别为电话号码 -->
	<meta name="format-detection" content="telephone=no" />
	<meta name="keywords" content="拍片网,视频播放,视频详情,影片播放,影片介绍">
	<meta name="description" content="拍片网">
	<title>MG活动</title>
	
	<link rel="shortcut icon" href="${imgPath }/favicon.ico" >
	<link rel="stylesheet" href="${activeCss}">
	<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
</head>
<body>
	   <input type="hidden" id="storage_node" value="${file_locate_storage_path }" />

 
         <div class="pagePhone">
         
              <img src="${imgPath }/mg/mg1.jpg">
              <img src="${imgPath }/mg/mg2.jpg">
              <img src="${imgPath }/mg/mg3.jpg">
              <div class="info">免费策划MG动画创意方案</div>
              <div class="infos">免费定制MG动画脚本</div>
              <form id="order-form" role="form" method="post" autocomplete="off" accept-charset="UTF-8">
				<input type="hidden" id="csrftoken" name="csrftoken" value="${csrftoken}"/>
				<input type="hidden" id="token" name="token" value="${token}"/>
				<input type="hidden" id="indentName" name="indentName" value="活动下单"/>
				<input type="hidden" id="indent_recomment" name="indent_recomment" value="123"/>
	              <div class="order">
	                  <div class="title">您的姓名</div>
	                  <input type="text" maxlength="10" id="name"  />
	                  <div class="error" id="nameError">请填写您的姓名</div>
	                  <div class="title">您的手机号</div>
	                  <input type="number" oninput="if(value.length>11)value=value.slice(0,11)"  id="indent_tele" name="indent_tele" />
	                  <div class="error" id="phoneError">请填写手机号</div>
	                  <button type="button" class="btnSub">提   交</button>
	              </div>
              </form>
         </div>

<script src="${jqueryJs}"></script>
<script src="${pluginJs}"></script>
<script src="${jsonJs}"></script>
<script src="${commonJs}"></script>
<script src="${remSetJs}"></script>
<script src="${activeJs}"></script>
<!-- 加载Mob share 控件 -->
</body>
</html>