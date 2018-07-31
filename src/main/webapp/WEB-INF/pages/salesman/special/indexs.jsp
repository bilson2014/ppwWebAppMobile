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
	<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0,minimum-scale=1.0, user-scalable=no" name="viewport" />
	<meta name="keywords" content="热门频道,短视频合集">
	<meta name="description" content="拍片网最新整理热门商业短视频合集，宣传片、广告片、MG动画、微电影等高清样片。">
	<meta name="baidu-site-verification" content="dMz6jZpIwd" />
	<title>热门频道_短视频合集_拍片网</title>
   
	<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
		<script src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
	<link rel="stylesheet" href="/resources/lib/swiper/swiper.min.css">
	<link rel="stylesheet" href="/resources/css/salesman/special/index.css">

	<!-- imgPath -->
	<spring:url value="/resources/images" var="imgPath" />
	<link rel="shortcut icon" href="/resources/images/favicon.ico">
</head>


<body style="background: #1C1A34;">
	<div class="phoneHeader">
	     <a id="openMenu"><img src="${imgPath }/index/toMenu.png"></a>	    
	     <a class='hide'><img src="${imgPath }/index/toSearch.png"></a>
	     <a href="/"><img class="ppwLogo" src="${imgPath}/index/logoH.png"></a>
	</div>
	<jsp:include flush="true" page="../../menu.jsp"></jsp:include>

<div class="pagePhone">
    <div class='biao' style="margin-top: 1.5rem;background: #1C1A34;">
   		<div class='hot'>热门频道</div>
   	</div>
   	
   	<div class='selection'>
   	
   		<a class='models' href='https://m.apaipian.com/special/channel08.html'>
   			<img class='eye' src="${imgPath}/salesMan/special/index/p8.jpg" alt="校园招聘"/>
   			<div class='font'>
   				<span>千万曝光量 校招从此水到渠成</span>
   			</div>
   		</a>
   		<a class='models' href='https://m.apaipian.com/special/channel07.html'>
   			<img class='eye' src="${imgPath}/salesMan/special/index/p7.jpg" alt="电商视频"/>
   			<div class='font'>
   				<span>电商视频引爆内容流量 作品品质遥遥领先</span>
   			</div>
   		</a>
   		<a class='models' href='https://m.apaipian.com/special/channel01.html'>
   			<img class='eye' src="${imgPath}/salesMan/special/index/p1.png" alt="三分钟说清区块链"/>
   			<div class='font'>
   				<span>三分钟说清区块链 这样的视频正是你所需要的</span>
   			</div>
   		</a>
   		<a class='models' href='https://m.apaipian.com/special/channel02.html'>
   			<img class='eye' src="${imgPath}/salesMan/special/index/p2.jpg" alt="互联网金融"/>
   			<div class='font'>
   				<span>视频让互联网金融宣传更精彩 </span>
   			</div>
   		</a>
   		<a class='models' href='https://m.apaipian.com/special/channel03.html'>
   			<img class='eye' src="${imgPath}/salesMan/special/index/p3.jpg" alt="新品发布会"/>
   			<div class='font'>
   				<span>极致惊艳 燃爆发布会现场</span>				
   			</div>
   		</a>
   		<a class='models' href='https://m.apaipian.com/special/channel04.html'>
   			<img class='eye' src="${imgPath}/salesMan/special/index/p4.jpg" alt="创业 · 融资 · 路演"/>
   			<div class='font'>
   				<span>创业融资 视频更能打动投资人</span>
   			</div>
   		</a>
   		<a class='models' href='https://m.apaipian.com/special/channel05.html'>
   			<img class='eye' src="${imgPath}/salesMan/special/index/p5.jpg" alt="医疗 · 美容"/>
   			<div class='font'>
   				<span>医美行业宣传片 绽放极致诱惑</span>
   			</div>
   		</a>
   		<a class='models' href='https://m.apaipian.com/special/channel06.html'>
   			<img class='eye' src="${imgPath}/salesMan/special/index/p6.jpg" alt="互联网教育/网校"/>
   			<div class='font'>
   				<span>互联网教育/网校</span>
   			</div>
   		</a>	
   	</div>
   	<jsp:include flush="true" page="../../foot.jsp"></jsp:include>
 
 </div>  	 
   	
   
     <script src="/resources/lib/jquery/jquery-2.0.3.min.js"></script>
 	<!-- <script src="/resources/lib/swiper/swiper.min.js"></script> -->
    <script src="/resources/js/common.js"></script>	
    <script src="/resources/js/salesman/special/swiper.min.js"></script> 
	<script src="/resources/js/salesman/special/jquery.SuperSlide.2.1.1.js"></script> 
    <script src="/resources/js/salesman/special/index.js"></script>

</body>
</html>