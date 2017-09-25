<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="r" uri="/mytaglib"%>
<%-- import CSS --%>
<spring:url value="/resources/lib/mMenu/jquery.mmenu.all.css"
	var="mmenuCss" />
<spring:url value="/resources/css/flow/flowList.css" var="flowListCss" />
<spring:url value="/resources/lib/swiper/swiper-3.3.1.min.css" var="swiperCss" />
<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js" var="jqueryJs" />
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js" var="jsonJs"/>
<spring:url value="/resources/js/common.js" var="commonJs" />
<spring:url value="/resources/lib/jquery.lazyload/lazysizes.min.js" var="lazyloadJs"/>
<spring:url value="/resources/js/flow/flowList.js" var="flowListJs"/>
<!-- imgPath -->
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
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<!-- iphone 手机默认全屏 -->
<meta name="apple-mobile-web-app-capable" content="yes" />
<!-- 取消数字被识别为电话号码 -->
<meta content="telephone=no" name="format-detection">
<meta name="keywords" content="宣传片,宣传片制作, 品牌微电影,tvc广告片,广告片拍摄, mg动画,短视频,商业视频">
<meta name="description" content="拍片网是专业的商业视频服务平台，提供：宣传片、产品tvc广告拍摄、品牌微电影、mg动画等短视频内容制作。成本托管，免费创意策划，海量样片，价格透明。拍片就上拍片网！">
<title>拍片网_商业视频制作平台, 宣传片,tvc广告拍摄,品牌微电影, mg动画,短视频</title>


<link rel="stylesheet" href="${flowListCss }">
<link rel="shortcut icon" href="/resources/images/favicon.ico">
<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->

</head>
<body>

	    <jsp:include flush="true" page="../modelTool.jsp"></jsp:include> 
	    <jsp:include flush="true" page="../menu.jsp"></jsp:include> 
	    
	 <div class="headerCom">
		<a>
		 <img id="openMenu"  class="lazyload" data-src="/resources/images/index/toMenu.png">
		</a>
		<a href="/list.html">  
		 <img  class="lazyload" data-src="/resources/images/index/toSearch.png">
		</a> 
		<a>
		  <img class="ppwLogos lazyload" data-src="/resources/images/index/logoW.png">
		</a>
	</div>
	
	<div class="footBot">
	         <div class="item" id="toMission">
	              <div class="mission"></div>
	              <div>任务</div>
	         </div>
	         <div class="item" id="toInfo">
	              <div class="info"></div>
	              <div>信息</div>
	         </div>
	         <div class="item" id="toFlow">
	              <div class="flow"></div>
	              <div>流程</div>
	         </div>
	         <div class="item" id="toMessage">
	              <div class="talk"></div>
	              <div>留言</div>
	         </div>
	         <div class="item" id="toFile">
	              <div class="file"></div>
	              <div>文件</div>
	         </div>
	</div>

	<div class="pagePhone" style="opacity:0">
		     <div class="productListArea">
<<<<<<< HEAD
		               <iframe class="frame" id="content-frame" class="iframe" src=""></iframe>
=======
		             <iframe class="frame" id="content-frame" class="iframe" src=""></iframe>
>>>>>>> 7779074c6ca0e4be9619d63bf5fc9cae8158d4c4
		     </div>	
	</div>	    

</body>


<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<script src="${jqueryJs }"></script>
<script src="${commonJs }"></script>
<script src="${scrollstopJs}"></script>
<script src="${lazyloadJs}"></script>
<script src="${flowListJs}"></script>
</html>