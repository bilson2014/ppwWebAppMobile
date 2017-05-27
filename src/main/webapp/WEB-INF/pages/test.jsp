<%@ page contentType="text/html;charset=UTF-8"%>
<%-- <%@ page import="com.panfeng.film.resource.model.User"%> --%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="r" uri="/mytaglib" %>

<%-- import CSS --%>
<spring:url value="/resources/css/error.css" var="errorCss"/>

<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js" var="jqueryJs"/>
<spring:url value="/resources/js/model.js" var="modelJs"/>
<spring:url value="/resources/js/common.js" var="commonJs"/>
<spring:url value="/resources/js/search-suggest.js" var="suggestJs"/>
<spring:url value="/resources/js/error.js" var="errorJs"/>

<!-- import img path -->
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
	<title>服务器去拍404电影啦－拍片网</title>
	<link rel="stylesheet" href="${errorCss}">
	<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
	<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
</head>
<body>

    <input type="file">
	
    
    
		
	<script src="${jqueryJs }"></script>
	<script src="${modelJs }"></script>
	<script src="${commonJs }"></script>
	<script src="${paylistSuccessCss}"></script>
</body>
</html>