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
	<meta name="keywords" content="发布会短视频,产品宣传片,发布会开场视频,会议暖场片">
	<meta name="description" content="新产品发布会怎么少得了短视频，优秀的产品宣传片能让您的新品先声夺人、光芒四射。发布会开场视频、会议暖场片、产品广告片制作，尽在拍片网！">
	<meta name="baidu-site-verification" content="dMz6jZpIwd" />
	<title>发布会短视频-产品宣传片-发布会开场视频-会议暖场片-拍片网</title>
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
   
	<div class="phoneHeader">
	     <a id="openMenu"><img src="${imgPath }/index/toMenu.png" alt='菜单'></a>
	     <a class='hide'><img src="${imgPath }/index/toSearch.png"></a>
	     <a href="/"><img class="ppwLogo" src="${imgPath}/index/logoH.png" alt='logo'></a>
	</div>
	<jsp:include flush="true" page="../../menu.jsp"></jsp:include>
	
	<div class="pagePhone">
			
		  <div class="setBanner">
		     <img src="${imgPath}/salesMan/special/channel03/banner.jpg" alt='发布会'>
		     <!-- <div class="product">产品详情</div>
		     <div class="showVideo">观看视频</div> -->
		  </div>
		  <div class="title">
		      新品发布就应该光彩夺目
		  </div>
		  <div class="videoArea">
		       <a href="https://m.apaipian.com/play/1318_17436.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='传祺GS8' src="${image}/group1/M00/00/F4/Cgpw7FqxuwyAa5K7AAJGbN9aN5o072.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">传祺GS8</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1169_3510.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='坚果G1家庭影院' src="${image}/group1/M00/00/F4/Cgpw7FqxwcyAGHaTAAGfAQwJXBQ378.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">坚果G1家庭影院</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1151_19385.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='OPPO-R11 红蓝之夜' src="${image}/group1/M00/00/F4/Cgpw7FqxwtqALO7CAAJfbHtodQE101.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">OPPO-R11 红蓝之夜</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		        <a href="https://m.apaipian.com/play/1910_22582.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='米娅新品颜料盒' src="${image}/group1/M00/00/C7/Cgpw7FoqXZWAYBQ3AAD9bma2v2M870.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">米娅新品颜料盒</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1910_4522.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='索尼 Sony - Made for Bond' src="${image}/group1/M00/00/F6/CgpmTlqxyFWAS5iFAAIhkPiowTU667.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">索尼 Sony - Made for Bond</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1151_17953.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='英特尔 Intel-众创加速 智胜未来' src="${image}/group1/M00/00/F4/Cgpw7FqxyiqAClGxAAIwSSOASv8652.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">英特尔 Intel-众创加速 智胜未来</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1910_23354.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='中国黄金钻石' src="${image}/group1/M00/00/BC/CgptuFqxy42AeEBHAANZc4Y0MKk677.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">中国黄金钻石</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1910_23994.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='昆山君磊电器' src="${image}/group1/M00/00/F4/Cgpw7FqxzKSARqfyAAHQ4ePOF6A037.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">昆山君磊电器</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1113_9454.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='welcomebank' src="${image}/group1/M00/00/BC/CgptuFqxzSKAOfswAAGsZB-Wvsk040.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">welcomebank</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1002_7604.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='悟空保' src="${image}/group1/M00/00/BC/CgptuFqxzaeARCQ0AAGFXnP4NoU224.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">悟空保</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		        <a href="https://m.apaipian.com/play/948_13363.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='土曼 TOMOON' src="${image}/group1/M00/00/BB/CgpsbFqxzh2AUfMzAAMlpitWfXs437.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">土曼 TOMOON</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		        <a href="https://m.apaipian.com/play/1117_10667.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='曼秀雷敦 Mentholatum' src="${image}/group1/M00/00/F6/CgpmTlqxzrGABEhhAAI1Ex5xqBg083.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">曼秀雷敦 Mentholatum</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		        <a href="https://m.apaipian.com/play/1910_22924.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='大疆创新DJI-Crystal Sky' src="${image}/group1/M00/00/BC/CgptuFqxzwOAfgWXAALCfe3dSY0819.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">大疆创新DJI-Crystal Sky</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1910_26519.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='飞宇科技-Vimble2' src="${image}/group1/M00/00/BB/CgpsbFqxz2SAblFtAAGwOoDkztI292.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">飞宇科技-Vimble2</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1117_10066.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='六神 - 清凉沐浴露' src="${image}/group1/M00/00/F6/CgpmTlqx0D2AUyfvAAI3gct03AU263.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">六神 - 清凉沐浴露</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1324_13816.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='京都念慈庵-润喉糖' src="${image}/group1/M00/00/BC/CgptuFqx0J2APsjCAAK893a7IXQ718.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">京都念慈庵-润喉糖</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1201_13080.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='长安CX70T' src="${image}/group1/M00/00/F4/Cgpw7Fqx0viAa56rAAJ2TqkqC64217.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">长安CX70T</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/300_868.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='东方微点 micropoint' src="${image}/group1/M00/00/BC/CgptuFqx09KAdF-uAAFyD4iXaVY634.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">东方微点 micropoint</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		        <a href="https://m.apaipian.com/play/1910_24854.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='蔚来 NIO-ES8亮相' src="${image}/group1/M00/00/BC/CgptuFqx1JOAF_0hAAFAPObjLm0621.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">蔚来 NIO-ES8亮相</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		        <a href="https://m.apaipian.com/play/1514_17502.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='FFC新生力量' src="${image}/group1/M00/00/F6/CgpmTlqx1UyAaGJwAAHwLTiUyLQ677.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">FFC新生力量</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		  </div>
	<jsp:include flush="true" page="../../foot.jsp"></jsp:include> 
	 
	 
    <script src="/resources/lib/jquery/jquery-2.0.3.min.js"></script>
    <script src="/resources/js/common.js"></script>	
    <script src="/resources/js/salesman/special/channel03.js"></script>

</body>
</html>