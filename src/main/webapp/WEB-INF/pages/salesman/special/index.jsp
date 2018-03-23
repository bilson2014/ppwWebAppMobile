<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="r" uri="/mytaglib"%>
<%-- import CSS --%>

<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js" var="jqueryJs" />
<spring:url value="/resources/js/common.js" var="commonJs" />
<spring:url value="/resources/lib/swiper/swiper.min.js" var="swiperJs" />
<spring:url value="/resources/js/salesman/special/index.js" var="indexJs" />

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
<script src="${jqueryJs }"></script>
<script src="${commonJs }"></script>
<script src="${swiperJs}"></script>



<spring:url value="/resources/images" var="imgPath" />
<link rel="stylesheet" href="/resources/css/salesman/special/index.css">
<link rel="stylesheet" href="/resources/lib/swiper/swiper.min.css">
<link rel="shortcut icon" href="/resources/images/favicon.ico">


<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->

</head>
<body>

    <div class="phoneHeader">
	     <a id="openMenu"><img src="${imgPath }/index/toMenu.png"></a>
	     <a href="/"><img class="ppwLogo" src="${imgPath}/index/logoH.png"></a>
	</div>
	<jsp:include flush="true" page="../../menu.jsp"></jsp:include>
	
	<div class="pagePhone" style="opacity:0">
	
			<<div class='first'>
				 <div class="swiper-container" id="firstSwiper"  style="height: auto;width: 100%;">
					<div class="swiper-wrapper">
			    		<div class="swiper-slide">
				    		<a href='#'><img src="${imgPath}/salesMan/special/index/banner01.jpg" alt="互联网金融"/></a>  
			        	</div>
			        	<div class="swiper-slide">
							<a href='#'><img src="${imgPath}/salesMan/special/index/banner02.jpg" alt="区块链项目"/></a>
			        	</div>
			        	<div class="swiper-slide">
				    		<a href='#'><img src="${imgPath}/salesMan/special/index/banner03.jpg" alt="宣传片"/></a> 
			        	</div>
			    	</div>
		   		</div> 
			</div>
		 	
		   	<div class='biao'>
		   		<div class='hot'>热门频道</div>
		   		<a href='https://m.apaipian.com/special/indexs.html'>更多   <img src="${imgPath}/salesMan/special/index/more.png" alt="更多"/> </a>
		   	</div>
   	
   	<div class='hots'>
   		<div class="swiper-container" id="secondSwiper"  style="height: auto;width: 100%;">
			<div class="swiper-wrapper">
	    		<div class="swiper-slide">
		    		<a href='https://m.apaipian.com/special/channel01.html'><img src="${imgPath}/salesMan/special/index/page1.png" alt="区块链"/></a>  
	        	</div>
	        	<div class="swiper-slide">
					<a href='https://m.apaipian.com/special/channel02.html'><img src="${imgPath}/salesMan/special/index/page2.png" alt="互联网金融"/></a>
	        	</div>
	        	<div class="swiper-slide">
		    		<a href='https://m.apaipian.com/special/channel03.html'><img src="${imgPath}/salesMan/special/index/page3.png" alt="发布会"/></a>  
	        	</div>
	        	<div class="swiper-slide">
					<a href='https://m.apaipian.com/special/channel04.html'><img src="${imgPath}/salesMan/special/index/page4.png" alt="投资"/></a>
	        	</div>
	        	<div class="swiper-slide">
		    		<a href='https://m.apaipian.com/special/channel05.html'><img src="${imgPath}/salesMan/special/index/page5.png" alt="医美"/></a>  
	        	</div>
	    	</div>
   		</div>
   		
   		<div class='block'>
   			<ul>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=%E4%BC%81%E4%B8%9A%E5%AE%A3%E4%BC%A0%E7%89%87'>企业宣传片</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=%E4%BA%A7%E5%93%81%E5%B9%BF%E5%91%8A'>产品广告</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&production=MG%E5%8A%A8%E7%94%BB'>MG动画</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=%E8%B7%AF%E6%BC%94%E8%A7%86%E9%A2%91'>路演视频</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=%E5%BE%AE%E7%94%B5%E5%BD%B1'>微电影</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=TVC'>TVC</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=%E7%97%85%E6%AF%92%E8%A7%86%E9%A2%91'>病毒视频</a></li>
   			</ul>
   		</div> 
   		<div class='block'>
   			<ul>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=%E4%BC%81%E4%B8%9A%E5%AE%A3%E4%BC%A0%E7%89%87'>企业宣传片</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=%E4%BA%A7%E5%93%81%E5%B9%BF%E5%91%8A'>产品广告</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&production=MG%E5%8A%A8%E7%94%BB'>MG动画</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=%E8%B7%AF%E6%BC%94%E8%A7%86%E9%A2%91'>路演视频</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=%E5%BE%AE%E7%94%B5%E5%BD%B1'>微电影</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=TVC'>TVC</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=%E7%97%85%E6%AF%92%E8%A7%86%E9%A2%91'>病毒视频</a></li>
   			</ul>
   		</div> 
   		<div class='block'>
   			<ul>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=%E4%BC%81%E4%B8%9A%E5%AE%A3%E4%BC%A0%E7%89%87'>企业宣传片</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=%E4%BA%A7%E5%93%81%E5%B9%BF%E5%91%8A'>产品广告</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&production=MG%E5%8A%A8%E7%94%BB'>MG动画</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=%E8%B7%AF%E6%BC%94%E8%A7%86%E9%A2%91'>路演视频</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=%E5%BE%AE%E7%94%B5%E5%BD%B1'>微电影</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=TVC'>TVC</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=%E7%97%85%E6%AF%92%E8%A7%86%E9%A2%91'>病毒视频</a></li>
   			</ul>
   		</div> 
   		<div class='block'>
   			<ul>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=%E4%BC%81%E4%B8%9A%E5%AE%A3%E4%BC%A0%E7%89%87'>企业宣传片</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=%E4%BA%A7%E5%93%81%E5%B9%BF%E5%91%8A'>产品广告</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&production=MG%E5%8A%A8%E7%94%BB'>MG动画</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=%E8%B7%AF%E6%BC%94%E8%A7%86%E9%A2%91'>路演视频</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=%E5%BE%AE%E7%94%B5%E5%BD%B1'>微电影</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=TVC'>TVC</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=%E7%97%85%E6%AF%92%E8%A7%86%E9%A2%91'>病毒视频</a></li>
   			</ul>
   		</div> 
   		<div class='block'>
   			<ul>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=%E4%BC%81%E4%B8%9A%E5%AE%A3%E4%BC%A0%E7%89%87'>企业宣传片</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=%E4%BA%A7%E5%93%81%E5%B9%BF%E5%91%8A'>产品广告</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&production=MG%E5%8A%A8%E7%94%BB'>MG动画</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=%E8%B7%AF%E6%BC%94%E8%A7%86%E9%A2%91'>路演视频</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=%E5%BE%AE%E7%94%B5%E5%BD%B1'>微电影</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=TVC'>TVC</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=%E7%97%85%E6%AF%92%E8%A7%86%E9%A2%91'>病毒视频</a></li>
   			</ul>
   		</div> 
   	</div>

     <jsp:include flush="true" page="../../foot.jsp"></jsp:include>
	    
	      	    
    </div>
 
</body>



<script src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<script src="${indexJs}"></script>
</html>