<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%-- import CSS --%>
<spring:url value="/resources/lib/Bootstrap/css/bootstrap.min.css" var="bootstrapCss"/>
<spring:url value="/resources/css/searchView.css" var="searchViewCss"/>

<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js" var="jqueryJs"/>
<spring:url value="/resources/lib/jquery/plugins.js" var="pluginJs"/>
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js" var="jsonJs"/>
<spring:url value="/resources/js/common.js" var="commonJs"/>
<spring:url value="/resources/js/searchView.js" var="searchViewJs"/>
<spring:url value="/resources/js/remSet.js" var="remSetJs" />

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
	<meta name="keywords" content="拍片网下单,视频交易,广告购买,导演制作费,拍片下单">
	<meta name="description" content="拍片网，汇聚千万影视行业创作者，是中国最大的视频交易平台。产品：宣传片、广告、微电影、动画、三维演示等视频，优势：创意免费、选择多、价格低、不满意无条件退款">
	<title>案例搜索 | 拍片网</title>

	<link rel="shortcut icon" href="${imgPath }/favicon.ico" >
	<link rel="stylesheet" href="${bootstrapCss }">
	<link rel="stylesheet" href="${searchViewCss }">
	<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
	<script src="${jqueryJs }"></script>
	<script src="${pluginJs }"></script>
	<script src="${jsonJs }"></script>
	<script src="${commonJs }"></script>
	<script src="${searchViewJs }"></script>
	<script src="${remSetJs }"></script>
	
</head>
<body>

	<div class="phoneHeader">
	     <a id="openMenu"><img src="${imgPath }/index/toMenu.png"></a>
	     <a></a>
	     <a href="/"><img class="ppwLogo" src="${imgPath}/index/logoH.png"></a>
	</div>
	 <jsp:include flush="true" page="menu.jsp"></jsp:include>
	 
	<div class="wrap">
		<div class="content-wrap">
			<div class="search-section">
				<div class="header-search-wrap">
					<form method="get" action="/search" id="s-form" accept-charset="utf-8">
						<input type="text" size="16" autocomplete="off" id="search-q" name="q" placeholder="搜索" />
						<a href="javascript:void(0);" class="go bk_gray" onclick="return false;" id="s-btn"></a>
					</form>
				</div>
				<div class="cancleInput">取消</div>
			</div>
			
			<div class="title">您可能感兴趣</div>
			
			<div class="recomment-section">
				<div class="recomment-section-wrap">
					<div class="row">
						<label>宣传片</label><label>广告片</label><label>动画</label><label>病毒视频</label>
						<label>纪录片</label><label>微电影</label><label>智能硬件</label>
						<label>电商</label><label>互联网</label><label>医疗保健</label><label>教育</label> 
						<label>旅游</label><label>餐饮美食</label><label>美容</label><label>APP</label>
					</div>
					<div class="row hide">
						<label>电子商务</label><label>社交</label><label>消费生活</label>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>