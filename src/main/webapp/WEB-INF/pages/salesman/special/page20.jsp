<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<spring:url value="/resources/js/common.js" var="commonJs" />

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=9,chrome=1">
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0,minimum-scale=1.0, user-scalable=no" name="viewport" />
	<meta name="keywords" content="世界杯宣传片,世界杯广告片,世界杯主题曲MV,世界杯进球集锦,世界杯短片,世界杯视频回放">
	<meta name="description" content="2018俄罗斯世界杯即将开赛，在这世界狂欢的时刻，拍片网整理了世界杯主题曲MV、世界杯宣传片、体育品牌广告片、世界杯视频回放等一系列短片，满满的激情与回忆，让你一次high个够。">
	<meta name="baidu-site-verification" content="dMz6jZpIwd" />
	<title>世界杯宣传片-世界杯广告片-世界杯主题曲MV-世界杯进球集锦-世界杯短片-世界杯视频回放</title>
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
		     <img src="${imgPath}/salesMan/special/page/page20.jpg" alt='这世界，总有人偷偷爱着你'>
		<!--    	 <a class="product" href='https://m.apaipian.com/product/EnterpriseMotionGraphics/main'>产品详情</a>
		     <div class="showVideo">视频介绍</div>  -->
		  </div>
		  <div class="title">
		       主题视频区
		  </div>
		  <div class="videoArea">
		       <a href="https://m.apaipian.com/play/2198_30856.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='2018俄罗斯-官方主题曲' src="${image}group1/M01/00/D5/CgptuFsEAt6AGZsJAAEIGhdKswM110.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">2018俄罗斯-官方主题曲</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/2198_30857.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='2018俄罗斯-莫斯科欢迎你' src="${image}group1/M00/01/0C/Cgpw7FsEBZOARokEAAKVFWcpU1U772.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">2018俄罗斯-莫斯科欢迎你</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/2198_30855.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='2018俄罗斯-FIFA宣传片' src="${image}group1/M00/01/0C/Cgpw7FsEBmiAMr22AAIOezyHHzc756.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">2018俄罗斯-FIFA宣传片</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/2198_30858.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='2018俄罗斯-震撼时刻大集合' src="${image}group1/M01/01/0C/Cgpw7FsEB2iAXprVAAHTZe3bE80842.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">2018俄罗斯-震撼时刻大集合</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/2198_30877.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='2018俄罗斯世界杯-Fox Sports' src="${image}group1/M00/00/D5/CgptuFsE1cSAReiTAAKcRP-eVgM361.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">2018俄罗斯世界杯-Fox Sports</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/2198_30859.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='2022卡塔尔世界杯-场馆宣传片' src="${image}group1/M00/00/D5/CgptuFsEB_aAeWJPAAGnDEFT40w037.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">2022卡塔尔世界杯-场馆宣传片</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/2198_30872.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='2014巴西-We are one' src="${image}group1/M00/01/0D/CgpmTlsEAUiAJ_zHAAFW0IQt4TY478.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">2014巴西-We are one</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/2198_30873.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='2014巴西-Verde e Amarelo' src="${image}group1/M00/00/D5/CgptuFsE3HWAM_TBAAHmR4BnhXg578.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">2014巴西-Verde e Amarelo</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/2198_30852.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='2014巴西-The Beautiful Game' src="${image}group1/M01/01/0C/Cgpw7FsD_yeAejIaAAIu3BG3fTw603.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">2014巴西-The Beautiful Game</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/2198_30850.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='2014巴西-ESPN' src="${image}group1/M01/01/0D/CgpmTlsD_PuAOgeLAAHPQD7nmXM413.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">2014巴西-ESPN</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/2198_30854.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='2014巴西-预热' src="${image}group1/M00/00/D2/CgpsbFsEADOAAxShAAF8l8tFfmE985.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">2014巴西-预热</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/2198_30867.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='2010南非-WAKA WAKA' src="${image}group1/M00/00/D5/CgptuFsD91WAMo8iAAHzqFmUOv0118.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">2010南非-WAKA WAKA</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/2198_30871.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='2010年南非-Wavin Flag' src="${image}group1/M00/00/D2/CgpsbFsD_AOAHYOxAAILeYqaXNQ653.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">2010年南非-Wavin Flag</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/2198_30869.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='2010南非-10大金球' src="${image}group1/M00/01/0C/Cgpw7FsD-cCATly4AAHgJvt8uKw658.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">2010南非-10大金球</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="http://www.apaipian.com/play/2198_30870.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='2010南非世界杯-高光时刻' src="${image}group1/M00/00/D2/CgpsbFsD-0SAXEHpAAKK4odu18E336.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">2010南非世界杯-高光时刻</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/2198_30851.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='梦想，从心出发' src="${image}group1/M01/00/D5/CgptuFsE9UaAEWDAAAHoxbEePyI387.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">梦想，从心出发</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/2198_30853.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='足坛传奇巨星少年时' src="${image}group1/M01/00/D3/CgpsbFsE-k6ANmPtAAHPiMqvXhI776.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">足坛传奇巨星少年时</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/2198_30861.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='奔驰 Mercedes Benz' src="${image}group1/M00/01/0C/Cgpw7FsE216AYqTVAAHFzWgsZFw081.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">奔驰 Mercedes Benz</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/2198_30868.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='哈尔滨啤酒 HAPI' src="${image}group1/M01/00/D5/CgptuFsE7W-ASohTAAK9AR9cC8E117.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">哈尔滨啤酒 HAPI</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/2198_30864.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='百事可乐 Pepsi' src="${image}group1/M01/01/0D/CgpmTlsE5o2AG_8-AAL9KQSeqns794.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">百事可乐 Pepsi</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/2198_30866.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='蒙牛 Mengniu' src="${image}group1/M01/01/0D/CgpmTlsE5DOADCitAAIVm03xmXs974.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">蒙牛 Mengniu</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/2198_30862.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='VIVO X21' src="${image}group1/M01/01/0D/CgpmTlsE1q-AdBbcAAKBuio7KjU277.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">VIVO X21</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/2198_30865.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='耐克 Nike' src="${image}group1/M01/00/D5/CgptuFsE3cGAGHpzAAFjdv4oCwU168.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">耐克 Nike</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		      <a href="https://m.apaipian.com/play/2198_30874.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='阿迪达斯 adidas' src="${image}group1/M01/01/0D/CgpmTlsE0mOAPtK5AAHzfC7FPN4633.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">阿迪达斯 adidas</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		      
		      
		  </div>

  
    <jsp:include flush="true" page="../../foot.jsp"></jsp:include> 
    <script src="/resources/lib/jquery/jquery-2.0.3.min.js"></script>
    <!-- <script src="/resources/js/common.js"></script>	 -->
    <script src="/resources/js/salesman/special/channel05.js"></script>
    

    <script src="${commonJs }"></script>

</body>
</html>