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
	<meta name="keywords" content="">
	<meta name="description" content="">
	<meta name="baidu-site-verification" content="dMz6jZpIwd" />
	<title></title>
	<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
	<script src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
	<link rel="stylesheet" href="/resources/lib/swiper/swiper.min.css">
	<link rel="stylesheet" href="/resources/css/salesman/special/channel03.css">


	<!-- imgPath -->
	<spring:url value="/resources/images" var="imgPath" />
	<link rel="shortcut icon" href="/resources/images/favicon.ico">
</head>


<body>
   
	<div class="phoneHeader">
	     <a id="openMenu"><img src="${imgPath }/index/toMenu.png" alt='菜单'></a>
	     <a href="">  
		  <img  src="">
		 </a>
	     <a href="/"><img class="ppwLogo" src="${imgPath}/index/logoH.png" alt='logo'></a>
	</div>
	<jsp:include flush="true" page="../../menu.jsp"></jsp:include>
	
	<div class="pagePhone">
			
		  <div class="setBanner">
		     <img src="channel03/images/banner.jpg" >
		     <!-- <div class="product">产品详情</div>
		     <div class="showVideo">观看视频</div> -->
		  </div>
		  <div class="title">
		       主题视频区
		  </div>
		  <div class="videoArea">
		       <a href="https://m.apaipian.com/play/1318_17436.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='传祺GS8' src="https://fileb.apaipian.com/group1/M00/00/81/CgpmTlkuKLOAIvEgAAFpE0gMJLo573.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">传祺GS8</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1169_3510.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='坚果G1家庭影院' src="https://filed.apaipian.com/group1/M00/00/2C/CgptuFiu_puAEvEKAAI1ai1QrwY539.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">坚果G1家庭影院</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1151_19385.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='OPPO-R11 红蓝之夜' src="https://filed.apaipian.com/group1/M00/00/70/CgpsbFnCTR2ABU9RAADfk5SjL1Y538.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">OPPO-R11 红蓝之夜</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		        <a href="https://m.apaipian.com/play/1910_22582.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='米娅新品颜料盒' src="https://filec.apaipian.com/group1/M00/00/C7/Cgpw7FoqXZWAYBQ3AAD9bma2v2M870.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">米娅新品颜料盒</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1910_4522.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='索尼 Sony - Made for Bond' src="https://filec.apaipian.com/group1/M00/00/BC/CgptuFqvhu2AWbotAAC0p0_tg5o439.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">索尼 Sony - Made for Bond</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1151_17953.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='英特尔 Intel-众创加速 智胜未来' src="https://filed.apaipian.com/group1/M00/00/60/CgptuFlu9i6AQuXbAADbnFRM9Uc276.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">英特尔 Intel-众创加速 智胜未来</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1910_23354.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='中国黄金钻石' src="https://filed.apaipian.com/group1/M00/00/D0/CgpmTlozeM-AbWTbAAMHQ-KsNes563.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">中国黄金钻石</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1910_23994.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='昆山君磊电器' src="https://fileb.apaipian.com/group1/M00/00/D9/Cgpw7FpEsJqAXz7gAAVxub76WDA455.png">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">昆山君磊电器</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1113_9454.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='welcomebank' src="https://filea.apaipian.com/group1/M00/00/19/CgpsbFh8uYmAQEpyAAFKROU6hwc928.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">welcomebank</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1002_7604.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='悟空保' src="https://fileb.apaipian.com/group1/M00/00/4C/CgpmTlh1p2eAZLQjAAESd7f92DY864.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">悟空保</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		        <a href="https://m.apaipian.com/play/948_13363.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='土曼 TOMOON' src="https://filed.apaipian.com/group1/M00/00/25/Cgp_JVi2Zr2ALbnsAAGNMGyxu5I740.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">土曼 TOMOON</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		        <a href="https://m.apaipian.com/play/1117_10667.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='曼秀雷敦 Mentholatum' src="https://filea.apaipian.com/group1/M00/00/1A/CgqNZViFjEWAbQBxAAE04qek1P0685.JPG">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">曼秀雷敦 Mentholatum</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		        <a href="https://m.apaipian.com/play/1910_22924.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='大疆创新DJI-Crystal Sky' src="https://filea.apaipian.com/group1/M00/00/93/CgptuFownNeAAyiVAAHOFcDnQ_8805.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">大疆创新DJI-Crystal Sky</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1910_26519.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='飞宇科技-Vimble2' src="https://filec.apaipian.com/group1/M00/00/ED/CgpmTlp7viGAXbRWAAEst0CDyxM496.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">飞宇科技-Vimble2</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1117_10066.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='六神 - 清凉沐浴露' src="https://filed.apaipian.com/group1/M00/00/55/Cgpw7FiBr3uAVddkAADyMKyFsdc113.JPG">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">六神 - 清凉沐浴露</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1324_13816.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='京都念慈庵-润喉糖' src="https://filed.apaipian.com/group1/M00/00/34/CgptuFjTvGaATK2sAANhcLEWo5o312.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">京都念慈庵-润喉糖</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1201_13080.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='长安CX70T' src="https://filed.apaipian.com/group1/M00/00/60/CgpmTlidPGCALsZsAACkD-5nT_8291.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">长安CX70T</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/300_868.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='东方微点 micropoint' src="https://filec.apaipian.com/group1/M00/00/17/CgpmTlgZ1rWAIbJlAAA4suRj8g0230.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">东方微点 micropoint</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		        <a href="https://m.apaipian.com/play/1910_24854.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='蔚来 NIO-ES8亮相' src="https://filec.apaipian.com/group1/M00/00/B2/CgpsbFpydHqADZVfAABsG_lzkao834.jpg">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">蔚来 NIO-ES8亮相</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		        <a href="https://m.apaipian.com/play/1514_17502.html">
		             <div class="videoCard">
		                  <img class="videoBanner" alt='FFC新生力量' src="https://fileb.apaipian.com/group1/M00/00/48/CgptuFk2beCAMAn5AANh4hRLu7Q446.png">
		                   <div class="modelG"></div>
		                  <div class="cardTitle">FFC新生力量</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		  </div>


	<div class="footPhone">
		<div class="leftContent">
			<img class="logoFoot" src="${imgPath}/index/logoH.png">
			<div class="footItem">
		    	<div class="service">服务热线  : </div>
		    	<div>400-660-9728</div>
			</div>
			<div class="footItem">
				<div class="cMail">公司邮箱  : </div>
		    	<div>bdmarket@paipianwang.cn</div>
			</div>
			<div class="footItem">
		     	<div class="cAddress">公司地址  : </div>
		    	<div class="differentItem">北京市朝阳区国贸建外SOHO东区6号楼25层</div>
			</div>
		</div>
		<div class="rightContent">
		    <img src="${imgPath}/index/footCode.png">
		    <div>拍片网官微</div>
		</div>
		<div class="footBottom">
			 © 2016 北京拍片乐科技有限公司 京ICP备16066831号-1  
			<br>百度统计 站长统计
		</div>
	</div>
    

    <script src="/resources/lib/jquery/jquery-2.0.3.min.js"></script>
    <script src="/resources/js/common.js"></script>	
    <script src="/resources/js/salesman/special/channel03.js"></script>

</body>
</html>