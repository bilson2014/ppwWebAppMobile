<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%-- import CSS --%>
<spring:url value="/resources/css/common.css" var="commonCss"/>
<spring:url value="/resources/css/company/service.css" var="serviceCss"/>

<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js" var="jqueryJs"/>
<spring:url value="/resources/lib/jquery/plugins.js" var="pluginJs"/>
<spring:url value="/resources/js/common.js" var="commonJs"/>
<spring:url value="/resources/js/company/service.js" var="serviceJs" />

<!-- imgPath -->
<spring:url value="/resources/images" var="imgPath" />
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=9,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
	<meta name="keywords" content="宣传片制作流程,拍片服务流程">
	<meta name="description" content="拍片网平台上的宣传片制作流程以及整个拍片服务流程。拍片就上拍片网！">
	<title>服务流程 | 拍片网</title>
	<link rel="shortcut icon" href="${imgPath}/favicon.ico" >
	<link rel="stylesheet" href="${commonCss}">
	<link rel="stylesheet" href="${serviceCss}">
	<link rel="stylesheet" href="${mmenuCss}">
	
	<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
	
	<script src="${jqueryJs }"></script>
	<script src="${pluginJs }"></script>
	<script src="${commonJs }"></script>
	<script src="${imgLazyLoadingJs }"></script>
	<script src="${mmenuJs }"></script>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<style>

 html{
 font-size:16px}
</style>

</head>
<body>
	<div class="phoneHeader">
	     <a id="openMenu"><img src="${imgPath }/index/toMenu.png"></a>
	     <a href="/searchview">  
		  <img  src="${imgPath}/index/toSearch.png">
		 </a> 
	     <a href="/"><img class="ppwLogo" src="${imgPath}/index/logoH.png"></a>
	</div>
	
	<jsp:include flush="true" page="menu.jsp"></jsp:include>
		
	<div class="pagePhone">
		<video id="setVideo" controls poster="/resources/images/banner/moreInfo.JPG" src="" ></video>
		<img class="stepImg" src="${imgPath }/company/step.png">
		
    <jsp:include flush="true" page="foot.jsp"></jsp:include> 
		     
	</div>

	<script src="${serviceJs }"></script>

</body>
</html>