<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="r" uri="/mytaglib" %>
<%-- import CSS --%>
<spring:url value="/resources/lib/Bootstrap/css/bootstrap.min.css"
	var="bootstrapCss" />
<spring:url value="/resources/css/common.css" var="commonCss" />
<spring:url value="/resources/css/customer/customerInfo.css"
	var="customerInfoCss" />
<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js"
	var="jqueryJs" />
<spring:url value="/resources/lib/jquery/plugins.js" var="pluginJs" />
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js"
	var="jsonJs" />
<spring:url value="/resources/lib/Bootstrap/js/bootstrap.min.js"
	var="bootstrapJs" />
<spring:url value="/resources/js/commonCopy.js" var="commonJs" />
<spring:url value="/resources/js/customer/customerInfo.js"
	var="customerInfoJs" />
<!-- imgPath -->
<spring:url value="/resources/images" var="imgPath" />
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=9,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
<meta name="keywords" content="">
<meta name="description" content="">
<!-- iphone 手机默认全屏 -->
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<!-- 取消数字被识别为电话号码 -->
	<meta content="telephone=no" name="format-detection">
<title>个人信息－拍片网</title>
<link rel="shortcut icon" href="${imgPath}/favicon.ico">
<link rel="stylesheet" href="${bootstrapCss}">
<link rel="stylesheet" href="${commonCss}">
<link rel="stylesheet" href="${customerInfoCss}">
<link rel="stylesheet" href="${providerInfoPhoneCss}">

<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->

<script src="${jqueryJs }"></script>
<script src="${pluginJs }"></script>
<script src="${jsonJs }"></script>
<script src="${bootstrapJs }"></script>
<script src="${commonJs }"></script>
<script src="${customerInfoJs }"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>

</head>
<body>
<input type="hidden" id="storage_node" value="${file_locate_storage_path }" />
 <div class="errorDiv"  id="errorDiv" style="display: none;">error</div>
	<div class="headerNew">
		<a href="javascript:history.back(-1);">
			<div class="leftHeader">
				<div class="back"></div>
			</div>
		</a> <a href="/" target="_self">
			<div class="midHeader">
				<div class="logo"></div>
			</div>
		</a>
	</div>
     <input type="hidden" id="user_img" value="${userinfo.imgUrl}"/>
	<!--banner 区  -->
	<div class="topHeader">
		<ul>
			<li>
				<div class="infoHeadSide">
					<img class="infoHead" id="infoHead" src="">
				</div>
			</li>
			<li class="providerName">${userinfo.userName }</li>
			<c:if test="${userinfo.sex == 1}">
			<li class="providerPlace"><img class="place"
				src="${imgPath}/customer/femaleWhite.png"></li>
			</c:if>	
				<c:if test="${userinfo.sex == 0}">
			<li class="providerPlace"><img class="place"
				src="${imgPath}/customer/maleWhite.png"></li>
			</c:if>	
			<li class="provinceCity">${userinfo.userCompany }</li>
		</ul>
	</div>

	<!--信息区 -->

	<div class="infomation">

		<div class="cusInfo">
			<div class="infoTitle">
				<div class="baseImg"></div>
				<div class="baseTitle">基本信息</div>
			</div>
			<div class="infoContent">
				<ul>
					<li>
						<div class="titleWord">真实姓名</div>
						<div id="realName">${userinfo.realName}</div>
					</li>
					<li>
						<div class="titleWord">电子邮件</div>
						<div id="email">${userinfo.email }</div>
					</li>
					<li>
						<div class="titleWord">QQ</div>
						<div id="qq">${userinfo.qq }</div>
					</li>
				</ul>
			</div>
			<div class="line"></div>
			<div class="infoSet">
				<div class="baseImg"></div>
				<div class="baseTitle">安全设置</div>
			</div>
			<div class="infoContent">
				<ul>
					<li>
						<div class="titleWord">用户名</div>
						<div id="loginName">${userinfo.loginName}</div>
					</li>
					<li>
						<div class="titleWord">手机号码</div>
						<div id="telephone">${userinfo.telephone }</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<a href="/login/loginout">
		<div class="btn-gray-common">登出</div>
	</a>
</body>
</html>