<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0,minimum-scale=1.0, user-scalable=0"
	name="viewport" />
<meta name="keywords" content="">
<meta name="description" content="无人机一站式电力飞巡服务">
<meta name="baidu-site-verification" content="dMz6jZpIwd" />
<title>中飞艾维-电力巡检领导者</title>

<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<link rel="stylesheet" href="/resources/lib/swiper/swiper.min.css">
<link rel="stylesheet" href="/resources/css/salesman/flyPlay.css">
</head>
<div class="hidden">
	<img src="/resources/images/salesMan/flyPlay/share.png">
</div>

<body>
	<div class="swiper-container swiperVertical swiper-container-vertical">
		<div class="swiper-wrapper ">
			<div class="swiper-slide banner stepBtn-1">
				<div class="mpa-video" id="playVideo" data-type-id="61"
					data-type="mpa-video"
					style="margin: 0rem; display: block; width: 100%">
					<span class="mpa-video-play-icon"></span>
					<video playsinline="true" webkit-playsinline="true"
						id="toPlayVideo" loop="loop" x-webkit-airplay="true"
						webkit-playsinline="" playsinline="true" preload="auto"
						poster="/resources/images/salesMan/flyPlay/small.jpg"
						style="width: 100%; margin-top: -1px;">
						<source type="video/mp4"
							src="http://106.75.14.109:8888/group1/M00/00/B3/CgpmTlnxZn-AO7iUABZysWYDWwA861.mp4">
					</video>
				</div>
				<img class="pageOne"
					src="/resources/images/salesMan/flyPlay/fly1.png">
			</div>
			<div class="swiper-slide twoSlide">
				<div class="full-video" id="playFullVideo" data-type-id="61"
					data-type="mpa-video"
					style="margin: 0rem; display: block; width: 100%">
					<span class="mpa-video-play-icon"></span>
					<video playsinline="true" webkit-playsinline="true"
						id="toPlayFullVideo" loop="loop" x-webkit-airplay="true"
						webkit-playsinline="" playsinline="true" preload="auto"
						poster="/resources/images/salesMan/flyPlay/big.jpg">
						<source type="video/mp4"
							src="http://106.75.14.109:8888/group1/M00/00/B3/CgpmTlnxZreASZOpAEQ3sBnAyxU783.mp4">
					</video>
				</div>
			</div>
			<div class="swiper-slide">
				<img class='one' src="/resources/images/salesMan/flyPlay/fly3.png">
				<img class='two' id='two' src="/resources/images/salesMan/flyPlay/fly33.png">
				<a href='/activity/order' class='three'>你也需要一条企业视频名片？</a>
			</div>
		</div>
		<div class="icon spIcon">
			<img id="icon" src="/resources/images/salesMan/flyPlay/gobotton.png">
		</div>
	</div>
	<script id="-mob-share"
		src="http://f1.webshare.mob.com/code/mob-share.js?appkey=8c49c537a706"></script>
	<script id="-mob-share"
		src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	<script src="/resources/lib/jquery/jquery-2.0.3.min.js"></script>
	<script src="/resources/lib/jquery.json/jquery.json-2.4.min.js"></script>
	<script src="/resources/lib/swiper/swiper.min.js"></script>
	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/salesman/flyPlay.js"></script>
</body>
</html>