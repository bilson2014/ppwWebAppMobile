<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="r" uri="/mytaglib"%>
<spring:url value="/resources/images" var="imgPath" />
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js" var="jqueryJs" />
<spring:url value="/resources/css/modelTool.css" var="modelTool"/>
<spring:url value="/resources/js/modelTool.js" var="modelToolJs"/>



<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>

	<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
<link rel="stylesheet" href="${modelTool}">
<script type="text/javascript" src="${jqueryJs}"></script>
<script type="text/javascript" src="${modelToolJs}"></script>
</head>
<body>
      
	<div class="modelTool" id="showInfo">
	         <div class="success">
	            <div id="setInfo">恭喜您下单成功</div>
	            <div id="closeInfo">确认</div>
	         </div>
	</div>
      
</body>
</html>