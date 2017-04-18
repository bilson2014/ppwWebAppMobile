<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%-- <%@ page import="com.panfeng.film.resource.model.User"%> --%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="r" uri="/mytaglib" %>
<%-- import CSS --%>
<spring:url value="/resources/lib/Bootstrap/css/bootstrap.min.css" var="bootstrapCss"/>
<spring:url value="/resources/css/common.css" var="commonCss"/>
<spring:url value="/resources/css/testRem/testRem.css" var="serviceCss"/>
<spring:url value="/resources/lib/mMenu/jquery.mmenu.all.css" var="mmenuCss"/>

<%-- import JS --%>

<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js" var="jqueryJs"/>
<spring:url value="/resources/lib/jquery/plugins.js" var="pluginJs"/>
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js" var="jsonJs"/>
<spring:url value="/resources/lib/Bootstrap/js/bootstrap.min.js" var="bootstrapJs"/>
<spring:url value="/resources/lib/mMenu/jquery.mmenu.min.js" var="mmenuJs"/>
<spring:url value="/resources/js/common.js" var="commonJs"/>
<spring:url value="/resources/js/testRem.js" var="testRemJs"/>
<spring:url value="/resources/js/imgLazyLoad.js" var="imgLazyLoadingJs"/>
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
	<meta name="keywords" content="">
	<meta name="description" content="">
	<title>移动端&&测试</title>
	<link rel="shortcut icon" href="${imgPath}/favicon.ico" >
	<link rel="stylesheet" href="${bootstrapCss}">
	<link rel="stylesheet" href="${commonCss}">
	<link rel="stylesheet" href="${serviceCss}">
	<link rel="stylesheet" href="${mmenuCss}">
	<script src="${jqueryJs }"></script>
	<script src="${memberJs}"></script> 
	<script src="${pluginJs }"></script>
	<script src="${jsonJs }"></script>
	<script src="${bootstrapJs }"></script>
	<script src="${commonJs }"></script>
	<script src="${imgLazyLoadingJs }"></script>
	<script src="${mmenuJs }"></script>
	<script src="${testRemJs }"></script>
   
<style type="text/css">
html {font-size:100px}
</style>
</head>

<body>
     <div></div>
</body>
</html>