<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=9,chrome=1">
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0,minimum-scale=1.0, user-scalable=no" name="viewport" />
	<meta name="keywords" content="汽车宣传片制作,汽车广告片拍摄,新车发布会视频">
	<meta name="description" content="汽车宣传片制作，就上拍片网。对于汽车行业而言图文时代逐渐老去，低品质UGC视频让受众烦透了不走心的态度，制作的宣传片才是一款好车的标配。拍摄汽车广告片、新车发布会视频，我们更专业。">
	<meta name="baidu-site-verification" content="dMz6jZpIwd" />
	<title>汽车宣传片制作-汽车广告片拍摄-新车发布会视频-拍片网</title>
	<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
	<script src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
	<link rel="stylesheet" href="/resources/lib/swiper/swiper.min.css">
	<link rel="stylesheet" href="/resources/css/salesman/special/channel.css">


	<!-- imgPath -->
	<spring:url value="/resources/images" var="imgPath" />
	<spring:url value="${file_locate_storage_path}" var="image" />
	<link rel="shortcut icon" href="/resources/images/favicon.ico">
</head>


<body>

 <input id="imgPath" type="hidden" value="${file_locate_storage_path}"> 
<!-- <input id="imgPath" type="hidden" value="http://resource.apaipian.com/resource/"> -->
   
	<div class="phoneHeader">
	     <a id="openMenu"><img src="${imgPath }/index/toMenu.png" alt='菜单'></a>
	     <a class='hide'><img src="${imgPath }/index/toSearch.png"></a>
	     <a href="/"><img class="ppwLogo" src="${imgPath}/index/logoH.png" alt='logo'></a>
	</div>
	<jsp:include flush="true" page="../../menu.jsp"></jsp:include>
	<div class='boxs'>
		<div class='showtime'>分类</div>
		<div class='floating'>
			<div class='all add' data-id="*">全部</div>
			<div class='all' data-id="0">轿车</div>
			<div class='all' data-id="1">轿跑车</div>
			<div class='all' data-id="2">SUV</div>
			<div class='all' data-id="3">商务车</div>
			<div class='all' data-id="4">轻卡</div>
			<div class='all' data-id="5">重卡</div>
			<div class='all' data-id="6">皮卡</div>
			<div class='all' data-id="7">客车</div>
		</div>
	</div>
	<div class="pagePhone">			
		  <div class="setBanner">
		     <img src="${imgPath}/salesMan/special/channel09/banner.jpg" alt='汽车行业'>
		     <!-- <a href='https://m.apaipian.com/product/EcommerceProductVideo/main'><div style="left: 2.2rem;bottom: 34%;width: 6.4rem;" class="product">产品详情</div></a> -->
		   	<!-- <a href='http://m.apaipian.com/product/EnterprisePromotionalVideo/main'><div style="left: 3.6rem;bottom: 2.1rem;" class="product">产品详情</div></a> -->
		     <!--   <div class="showVideo">观看视频</div> -->
		  </div>
		  <div class="title" id='title'>
		        汽车内容“人格化”将重塑品牌形象
		  </div>
		  <!--家居  -->
		  <div class="videoArea" id='live'>

		      
		  </div>
    <jsp:include flush="true" page="../../foot.jsp"></jsp:include> 
    <div style="height: 1.5rem;"></div>
    <script src="/resources/lib/jquery/jquery-2.0.3.min.js"></script>
    <script src="/resources/js/common.js"></script>	
    <script src="/resources/js/salesman/special/channel09.js"></script>
    
    
    <script id="-mob-share" src="https://f1.webshare.mob.com/code/mob-share.js?appkey=8c49c537a706"></script>

    

</body>
</html>