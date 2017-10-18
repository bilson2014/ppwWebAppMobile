<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%-- import CSS --%>
<spring:url value="/resources/css/news/newsInfo.css" var="newsInfoCss" />
<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js"
	var="jqueryJs" />
<spring:url value="/resources/lib/jquery/plugins.js" var="pluginJs" />
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js"
	var="jsonJs" />
<spring:url value="/resources/js/common.js" var="commonJs" />
<spring:url value="/resources/js/news/newsInfo.js" var="newsInfoJs" />
<!-- img path -->
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
<!-- iphone 手机默认全屏 -->
<meta name="apple-mobile-web-app-capable" content="yes" />
<!-- 取消数字被识别为电话号码 -->
<meta name="format-detection" content="telephone=no" />
<meta name="keywords" content="${news.seoKeywords}">
<meta name="description"
	content="${news.seoDescription}">
<title>${news.seoTitle}－拍片网</title>

<link rel="shortcut icon" href="${imgPath }/favicon.ico">
<link rel="stylesheet" href="${newsInfoCss }">
<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
	<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
</head>
<body>

	<input type="hidden" id="storage_node" value="${file_locate_storage_path }" />

	<div class="phoneHeader">
		<a id="openMenu"><img src="${imgPath }/index/toMenu.png"></a> 
		<a class="hide" ><img src="${imgPath }/index/toSearch.png"></a>
		<a href="/"><img class="ppwLogo" src="${imgPath}/index/logoH.png"></a>
	</div>
	
	<jsp:include flush="true" page="../menu.jsp"></jsp:include>

	<div class="pagePhone">
		<img class="bannerImg" id="banner" src="${file_locate_storage_path}${news.picLDUrl}">
		<div class="infoContents">
			<div class="title">${news.title}</div>
			<div class="tags">
				<c:if test="${not empty fn:trim(news.tags) }">
					<c:forEach items="${fn:split(fn:trim(news.tags),' ') }" var="tag"
						end="2" varStatus="stat">
						<div>${tag}</div><c:if test="${!stat.last }"></c:if>
					</c:forEach>
				</c:if>
			</div>
			<div class="setContent">${news.content}</div>
		</div>
		
		<jsp:include flush="true" page="../foot.jsp"></jsp:include> 
		
	</div>

	<script src="${jqueryJs }"></script>
	<script src="${pluginJs }"></script>
	<script src="${jsonJs }"></script>
	<script src="${newsInfoJs }"></script>
	<script src="${commonJs }"></script>
</body>
</html>