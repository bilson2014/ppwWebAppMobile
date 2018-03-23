<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="r" uri="/mytaglib" %>
<%-- import CSS --%>
<spring:url value="/resources/css/special/home.css" var="homeCss" />
<%-- <spring:url value="/resources/lib/Bootstrap/css/bootstrap.min.css" var="bootstrapCss" /> --%>
<spring:url value="/resources/lib/swiper/swiper.min.css" var="swiperCss" />
<spring:url value="/resources/lib/swiper/swiper-3.3.1.min.css" var="swiperCss" />
<%-- import JS --%>
<spring:url value="/resources/images" var="imgPath" />
<spring:url value="/resources/lib/swiper/swiper.min.js" var="swiperJs" />
<%-- <spring:url value="/resources/js/grally/grally.js" var="grallyJs" /> --%>
<%-- <spring:url value="/resources/js/grally/prefixfree.min.js" var="prefixfreeJs" />
<spring:url value="/resources/js/homePage.js" var="homePageJs" /> --%>
<spring:url value="/resources/js/common.js" var="commonJs" />
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js" var="jqueryJs" />
<spring:url value="/resources/lib/Bootstrap/js/bootstrap.min.js" var="bootstrapJs" />

<spring:url value="/resources/js/special/home.js" var="homeJs" />


<spring:url value="/resources/images" var="imgPath" />

<spring:url value="/resources/lib/swiper/swiper.min.js" var="swiperJs" />

<!DOCTYPE html>

<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=9,chrome=1">
	<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
	<meta name="keywords" content="拍宣传片要花多少钱?">
	<meta name="description" content="">
	<meta name="baidu-site-verification" content="dMz6jZpIwd" />
	<title>拍宣传片多少钱，上拍片网算成本-拍片网</title>
    <link rel="stylesheet" href="/resources/css/cost/costCalculator.css">
    <link rel="stylesheet" href="/resources/lib/swiper/swiper-3.3.1.min.css">
    <link rel="stylesheet" href="/resources/lib/Bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="/resources/lib/jquery/jquery-2.0.3.min.js"></script>
	<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
	<script src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
</head>

<img class="hidden" src="/resources/images/cost/costImg.png">

<body>

	<div>
		<div class="swiper-container">
	        <div class="swiper-wrapper">
	            <div class="swiper-slide">
	            	<img class="lazyload" src="/resources/images/special/home/banner01.jpg">
		          
	                 
	            </div>
	            <div class="swiper-slide">
	                <img class="lazyload" src="/resources/images/special/home/banner01.jpg">
		          
	            </div>
	            <div class="swiper-slide">
	                <img class="lazyload" src="/resources/images/special/home/banner01.jpg">
		            
	            </div>
	        </div>
    	</div>
	</div>

<%-- 
<!-- 	<input type="hidden" id='target'> -->
	
		<input type="hidden" id="target" value="${uniqueId }">
<audio controls="controls" hidden="hidden" autoplay="autoplay" loop="loop">
	<source src="/resources/music/music.mp3" type="audio/mpeg" />
</audio>
 --%>





   

    <script src="${jqueryJs }"></script>
    <script src="${testRemJs }"></script>
    <script src="${commonJs }"></script>
    <script src="${swiperJs }"></script>
    <script src="${costJs }"></script>
    <script id="-mob-share" src="http://f1.webshare.mob.com/code/mob-share.js?appkey=8c49c537a706"></script>
    

    
</body>
</html>