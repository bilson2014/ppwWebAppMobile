<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="r" uri="/mytaglib" %>
<%-- import CSS --%>
<%-- import JS --%>
<spring:url value="/resources/css/salesman/cosmetic.css" var="cosmeticCss"/>
<spring:url value="/resources/lib/swiper/swiper.min.css" var="swiperCss" />
<spring:url value="/resources/lib/swiper/swiper.min.js" var="swiperJs" />
<spring:url value="/resources/js/salesman/cosmetic.js" var="costJs" />
<spring:url value="/resources/lib/swiper/swiper.min.js" var="swiperJs" />
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js"  var="jqueryJs"/>
<spring:url value="/resources/images" var="imgPath" />

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
   
	<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
	<script src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
	<link rel="stylesheet" href="${swiperCss }">
	<link rel="stylesheet" href="${cosmeticCss }">
</head>

<img class="hidden" src="${imgPath }/cosmetic/share.jpg">

<body>

    <div class="swiper-container swiperVertical swiper-container-vertical">
		 <div class="swiper-wrapper ">
			          <div class="swiper-slide banner stepBtn-1">
				             <div class="mpa-video" id="playVideo" data-type-id="61" data-type="mpa-video" style="margin: 0rem; display: block; width:100%"> 
				                 <span class="mpa-video-play-icon"></span> 
				                 <video  autoplay id="toPlayVideo"  loop="loop" x-webkit-airplay="true" webkit-playsinline="" playsinline="true" preload="auto" poster="${imgPath }/cosmetic/poster.jpg" style="width:100%;  margin-top: -1px;"> 
				                     <source type="video/mp4" src="${imgPath}/w.mp4"> 
				                 </video> 
					         </div>   
					         <img src="${imgPath }/cosmetic/1.jpg">
			         </div>
			         <div class="swiper-slide"><img src="${imgPath }/cosmetic/2t1.jpg"></div>     
			         <div class="swiper-slide">     
			                  <div class="swiper-container step3 swiper-container-horizontal">
							      <div class="swiper-wrapper">
								         <div class="swiper-slide" ><img src="${imgPath }/cosmetic/2t2t1.jpg"></div>
								         <div class="swiper-slide" ><img src="${imgPath }/cosmetic/2t2t2.jpg"></div>
							      </div>   
							       <div class="swiper-pagination swiper-pagination-H"></div>       
							  </div>  
			         </div>
			          <div class="swiper-slide">     
			                  <div class="swiper-container step4 swiper-container-horizontal">
							      <div class="swiper-wrapper">
								         <div class="swiper-slide" ><img src="${imgPath }/cosmetic/2t3t1.jpg"></div>
								         <div class="swiper-slide" ><img src="${imgPath }/cosmetic/2t3t2.jpg"></div>
								         <div class="swiper-slide" ><img src="${imgPath }/cosmetic/2t3t3.jpg"></div>
							      </div>   
							       <div class="swiper-pagination swiper-pagination-H"></div>       
							  </div>  
			         </div>
			         <div class="swiper-slide">
						 <img src="${imgPath }/cosmetic/2t4.jpg">
					 </div>
					 <div class="swiper-slide">     
			                  <div class="swiper-container step6 swiper-container-horizontal">
							      <div class="swiper-wrapper">
								         <div class="swiper-slide" ><img src="${imgPath }/cosmetic/2t5t1.jpg"></div>
								         <div class="swiper-slide" ><img src="${imgPath }/cosmetic/2t5t2.jpg"></div>
							      </div>   
							       <div class="swiper-pagination swiper-pagination-H"></div>       
							  </div>  
			         </div>
			           <div class="swiper-slide">
						 <img src="${imgPath }/cosmetic/2t6.jpg">
					 </div>
					   <div class="swiper-slide">
						 <img src="${imgPath }/cosmetic/2t7.jpg">
					 </div>
					  <div class="swiper-slide">
						 <img src="${imgPath }/cosmetic/2t8.jpg">
					 </div>
		  </div> 
		   <div class="swiper-pagination swiper-pagination-v"></div>
   </div>  
   
    <script src="${jqueryJs }"></script>
    <script src="${testRemJs }"></script>
    <script src="${commonJs }"></script>
    <script src="${swiperJs }"></script>
    <script src="${costJs }"></script>
</body>
</html>