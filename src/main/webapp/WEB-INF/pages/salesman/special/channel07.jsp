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
	<meta name="keywords" content="淘宝视频制作,淘宝视频拍摄,淘宝主图视频,淘宝主图视频制作,产品主图视频,电商视频拍摄,淘宝短视频制作,淘宝视频官方拍摄基地">
	<meta name="description" content="拍片网于2018年3月被淘宝指定为官方拍摄基地，视频制作服务覆盖98%类目，品质遥遥领先。淘宝主图视频制作，电商产品视频拍摄，官方授权，价格公道，极速出片。淘宝短视频制作就上拍片网！">
	<meta name="baidu-site-verification" content="dMz6jZpIwd" />
	<title>淘宝短视频制作-产品主图视频-电商视频拍摄-淘宝视频官方拍摄基地-拍片网</title>
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
	<div class='boxs'>
		<div class='showtime'>分类</div>
		<div class='floating'>
			<div  class='all'>全部</div>
			<div class='live'>家居</div>
			<div class='skin'>护肤</div>
			<div class='cosmetics'>彩妆</div>
			<div class='electronic'>数码</div>
			<div class='parent'>亲子</div>
			<!-- <div class='car'>车品</div> -->
			<div class='ele'>电器</div>
			<div class='make'>手作</div>
			<div class='culture'>文化</div>
			<div class='build'>匠人</div>
			<div class='sports'>运动</div>
			<div class='travel'>旅行</div>
			<div class='comic'>动漫</div>
			<div class='other'>其他</div>
		</div>
	</div>
	<div class="pagePhone">			
		  <div class="setBanner">
		     <img src="${imgPath}/salesMan/special/channel07/banner.jpg" alt='电商视频'>
		     <a href='https://m.apaipian.com/product/EcommerceProductVideo/main'><div style="left: 2.2rem;bottom: 34%;width: 6.4rem;" class="product">产品详情</div></a>
		   	<!-- <a href='http://m.apaipian.com/product/EnterprisePromotionalVideo/main'><div style="left: 3.6rem;bottom: 2.1rem;" class="product">产品详情</div></a> -->
		     <!--   <div class="showVideo">观看视频</div> -->
		  </div>
		  <div class="title" id='title'>
		        电商内容化时代已到来
		  </div>
		   <!--生活  -->
		  <div class="videoArea" id='live'>
		  		
		       <a href="http://m.apaipian.com/play/1910_29748.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='苍山 Cangshan-刀具' src="${image}group1/M00/00/CD/CgptuFrpneyAE6zBAAGD43_4XRQ641.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">苍山 Cangshan-刀具</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="http://m.apaipian.com/play/1910_29797.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='Teabox-茶壶' src="${image}group1/M01/01/06/CgpmTlrqjqGAWLYIAADzDmS44gs253.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">Teabox-茶壶</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="http://m.apaipian.com/play/1910_29754.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='OXO-炒锅' src="${image}group1/M01/00/CD/CgptuFrppF-ASsazAAEAyAsvh1Y641.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">OXO-炒锅</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       
		       <a href="https://m.apaipian.com/play/1910_29795.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='OXO-储物罐' src="${image}group1/M01/00/CD/CgptuFrqj6iAD_enAAKzx7A_1fQ577.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">OXO-储物罐</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1910_29791.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='VARIDESK-地垫' src="${image}group1/M00/00/CD/CgptuFrqkQaAK_Z3AAEn6-VGnY0542.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">VARIDESK-地垫</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		     
		       <a href="https://m.apaipian.com/play/1910_29753.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='Zestkit-饭盒' src="${image}group1/M01/00/CB/CgpsbFrpo06AXglLAAH-vMHndGg370.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">Zestkit-饭盒</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		     
		       <a href="https://m.apaipian.com/play/1910_29766.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='Sterline-蔬菜切片机' src="${image}group1/M00/00/CD/CgptuFrprjmAQmV0AAEyIZAsEAQ765.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">Sterline-蔬菜切片机</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		        <a href="https://m.apaipian.com/play/1910_29784.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='simplehuman-纸巾架' src="${image}group1/M01/01/04/Cgpw7Frqk_qAE9I9AADDuhqAHKA951.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">simplehuman-纸巾架</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		      
		     
		  </div>
		  <!--护肤  -->
		  <div class="videoArea" id='skin'>
		       <a href="http://m.apaipian.com/play/1910_29775.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='薇姿 Vichy-护肤套装' src="${image}group1/M00/00/CB/CgpsbFrqi4-ASqUuAAD_yG4uI3I432.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">薇姿 Vichy-护肤套装</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="http://m.apaipian.com/play/1910_29777.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='薇姿 Vichy-爽肤水' src="${image}group1/M01/01/06/CgpmTlrqjH-AcVyFAAGYMZl4s-A247.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">薇姿 Vichy-爽肤水</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="http://m.apaipian.com/play/1910_29774.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='理肤泉 La Roche-儿童防嗮霜' src="${image}group1/M00/00/CB/CgpsbFrptxSAa6U2AAGSaVBiPK8883.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">理肤泉 La Roche-儿童防嗮霜</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="http://m.apaipian.com/play/1910_29771.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='理肤泉 La Roche-防嗮霜' src="${image}group1/M01/00/CD/CgptuFrpsquANun2AAFj9KiMShA288.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">理肤泉 La Roche-防嗮霜</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		     
		  </div>
		  <!--彩妆  -->
		  <div class="videoArea" id='cosmetics'>
		       <a href="http://m.apaipian.com/play/1910_29737.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt="欧莱雅 L'OREAL-睫毛膏" src="${image}group1/M01/00/CB/CgpsbFrpikKACTOdAAE9L4rEe2g975.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">欧莱雅 L'OREAL-睫毛膏</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="http://m.apaipian.com/play/1910_29738.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='美宝莲 Maybelline-粉底' src="${image}group1/M01/01/04/Cgpw7FrpiveAb0-1AAETgd-XUFk617.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">美宝莲 Maybelline-粉底</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="http://m.apaipian.com/play/1910_29739.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='Wunder2 Wunderbrow-男化妆师' src="${image}group1/M00/01/04/Cgpw7FrpjruAc8VxAADjRwfa51Q061.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">Wunder2 Wunderbrow-男化妆师</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="http://m.apaipian.com/play/1910_29740.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='Wunder2 Wunderbrow-女化妆师' src="${image}group1/M00/01/04/Cgpw7Frpj6SAL0Z9AAF_zho8VSE975.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">Wunder2 Wunderbrow-女化妆师</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		     
		  </div>
		  <!--数码  -->
		  <div class="videoArea" id='electronic'>
		       <a href="http://m.apaipian.com/play/9_29726.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='明基 BenQ-投影仪' src="${image}group1/M01/00/CA/CgpsbFrdiSiAWhmKAAE4pvn92H0971.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">明基 BenQ-投影仪</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="http://m.apaipian.com/play/1910_29838.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='Nest-摄像头' src="${image}group1/M01/00/CB/CgpsbFrqqbaAeofwAADkWGKZEtc461.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">Nest-摄像头</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="http://m.apaipian.com/play/1910_29852.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='三星 Samsung-平板电脑' src="${image}group1/M01/01/04/Cgpw7FrqzPuAZNUvAADmGT3oErk393.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">三星 Samsung-平板电脑</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="http://m.apaipian.com/play/1910_29853.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='华硕 ASUS-路由器' src="${image}group1/M01/00/CB/CgpsbFrqzj6AbdqKAAFczrAPMsA183.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">华硕 ASUS-路由器</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="http://m.apaipian.com/play/1910_29854.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='华硕 ASUS-电脑' src="${image}group1/M01/01/06/CgpmTlrqz0SALfRRAAIelivp6Z0670.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">华硕 ASUS-电脑</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="http://m.apaipian.com/play/1910_29855.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='AmazonBasics-无线蓝牙音响' src="${image}group1/M00/01/06/CgpmTlrq0NuAGPkSAAG_9JnHgyw673.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">AmazonBasics-无线蓝牙音响</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="http://m.apaipian.com/play/1910_29857.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='佳能 Canon-办公打印机' src="${image}group1/M00/00/CB/CgpsbFrq0U2ACfzUAADlA7dw0vs853.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">佳能 Canon-办公打印机</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="http://m.apaipian.com/play/1910_29858.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='佳能 Canon-照片打印机' src="${image}group1/M00/00/CD/CgptuFrq0cqAWzy5AADNw3REFF4865.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">佳能 Canon-照片打印机</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		     
		  </div>
		  <!--亲子  -->
		  <div class="videoArea" id='parent'>
		       <a href="http://m.apaipian.com/play/1910_29820.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='费雪 Fisher-Price - 多功能座椅' src="${image}group1/M00/00/CB/CgpsbFrqlk2AJNojAAGrv3pd630925.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">费雪 Fisher-Price - 多功能座椅</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="http://m.apaipian.com/play/1910_29821.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='Moonlite-投影仪' src="${image}group1/M00/01/06/CgpmTlrql4uAFqAxAAHaIMZ8IOE132.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">Moonlite-投影仪</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="http://m.apaipian.com/play/1910_29822.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='Step2-多功能水塘' src="${image}group1/M00/01/04/Cgpw7FrqmeOAMkZuAAHGbN04oUE463.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">Step2-多功能水塘</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="http://m.apaipian.com/play/1910_29823.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='伟易达 VTech-手推车' src="${image}group1/M00/00/CD/CgptuFrqmv6AYaQUAAISt7p1tkI092.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">伟易达 VTech-手推车</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		     
		  </div>
		  <!--车品  -->
		 <%--  <div class="videoArea" id='car'>
		       <a href="http://m.apaipian.com/play/1910_29815.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='Mpow 车载支架-评测教学' src="${image}group1/M01/01/04/Cgpw7FrqpPGAArFCAAGvqshOZco150.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">Mpow 车载支架-评测教学</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="http://m.apaipian.com/play/1910_29812.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='VicTsing 车载发射器-评测教学' src="${image}group1/M00/01/06/CgpmTlrqpXaAa-6QAAHhGcI-vf4442.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">VicTsing 车载发射器-评测教学</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="http://m.apaipian.com/play/1910_29811.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='VicTsing 车载发射器-功能讲解' src="${image}group1/M00/00/CD/CgptuFrqpoiAWuXTAAFZTjgH5Ug782.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">VicTsing 车载发射器-功能讲解</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="http://m.apaipian.com/play/1910_29810.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='WizGear 车载支架-外观与工艺' src="${image}group1/M00/01/04/Cgpw7Frqp3WAPlqFAAF6EwVNfCM091.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">WizGear 车载支架-外观与工艺</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		     
		  </div> --%>
		  <!--电器  -->
		  <div class="videoArea" id='ele'>
		       <a href="http://m.apaipian.com/play/9_29731.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='美的 Midea-B3除螨仪' src="${image}group1/M01/01/04/CgpmTlre6vOADBeuAAFL48xaCSk898.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">美的 Midea-B3除螨仪</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="http://m.apaipian.com/play/9_29732.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='美的 Midea-B5除螨仪' src="${image}group1/M01/00/CA/CgpsbFre6vmARxR1AAGN9YgiwAA272.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">美的 Midea-B5除螨仪</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		         <a href="https://m.apaipian.com/play/1910_29789.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='Chefman-电茶壶' src="${image}group1/M01/01/06/CgpmTlrqkcmAQAu-AAGGmcyex5I921.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">Chefman-电茶壶</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1910_29751.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='Zojirushi-电压力锅' src="${image}group1/M01/00/CD/CgptuFrpoROAexYSAAHllTsayIU063.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">Zojirushi-电压力锅</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		        <a href="https://m.apaipian.com/play/1910_29763.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='Behmor-咖啡机' src="${image}group1/M00/00/CB/CgpsbFrprA2ADGi1AAGEjZ5gMEg743.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">Behmor-咖啡机</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		        <a href="https://m.apaipian.com/play/1910_29765.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='Comfee-电水壶' src="${image}group1/M01/01/06/CgpmTlrprZyAFZZHAAFwNxrX-GE735.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">Comfee-电水壶</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		        <a href="https://m.apaipian.com/play/1910_29752.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='NutriBullet-料理机' src="${image}group1/M01/01/04/Cgpw7FrpomyAQ80RAAHHSt5KsEc797.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">NutriBullet-料理机</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1910_29756.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='完美烘烤 Perfect Bake-智能厨房秤' src="${image}group1/M00/00/CD/CgptuFrppnCAXcvvAAIaDwYpf7M109.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">完美烘烤 Perfect Bake-智能厨房秤</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="http://m.apaipian.com/play/1910_29743.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='肯莫尔 Kenmore-冰箱' src="${image}group1/M00/00/CB/CgpsbFrpl2iAQVlyAAFwp_GwC0U235.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">肯莫尔 Kenmore-冰箱</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="http://m.apaipian.com/play/1910_29762.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='霍尼韦尔 Honeywell-空气净化扇' src="${image}group1/M01/01/04/Cgpw7Frpq5aANUSZAAHO0c0GcvY132.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">霍尼韦尔 Honeywell-空气净化扇</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="http://m.apaipian.com/play/1910_29749.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='肯莫尔 Kenmore-洗衣机' src="${image}group1/M00/01/04/Cgpw7FrpnqWAA3csAAHxnLD1LA4014.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">肯莫尔 Kenmore-洗衣机</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="http://m.apaipian.com/play/1910_29851.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt=' 霍尼韦尔 Honeywell-空气净化器' src="${image}group1/M00/01/06/CgpmTlrqzBiAMJTjAAEOrYGod6U794.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle"> 霍尼韦尔 Honeywell-空气净化器</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		     
		  </div>
		  
		  <!--手作 -->
		  <div class="videoArea" id='make'>
		      <a href="https://m.apaipian.com/play/2185_30819.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='RELIQUIAE ESPAÑA-手工包' src="${image}group1/M00/00/D4/CgptuFr-q8WARDKiAAFkwgiQJZA538.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle"> RELIQUIAE ESPAÑA-手工包</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/2185_30815.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='Butcher and Baker-手工衣服' src="${image}group1/M00/01/0B/Cgpw7Fr-qA2ASj9OAAIcWkkylxc014.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">Butcher and Baker-手工衣服</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/2185_30816.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='Cambria-手工皮革' src="${image}group1/M01/00/D2/CgpsbFr-qPyAGwCdAAGO87nbzoY819.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">Cambria-手工皮革</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/2185_30815.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='Butcher and Baker-手工衣服' src="${image}group1/M00/01/0B/Cgpw7Fr-qA2ASj9OAAIcWkkylxc014.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">Butcher and Baker-手工衣服</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		        <a href="https://www.apaipian.com/play/2185_29816.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='Curver-手工储物篮' src="${image}group1/M00/01/0C/CgpmTlr7rI-AepfjAAJ458si7ig270.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">Curver-手工储物篮</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/2185_30818.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='VamShoes-手工鞋' src="${image}group1/M01/01/0B/Cgpw7Fr-qwiAEQB3AAF96ASznlw825.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">VamShoes-手工鞋</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://www.apaipian.com/play/2185_30822.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='Mandarinas-手工玩偶' src="${image}group1/M00/00/D2/CgpsbFr-rSmABrl-AAJuX7AEQBA081.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">Mandarinas-手工玩偶</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://www.apaipian.com/play/2185_30823.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='Guitar Man-手工吉他' src="${image}group1/M01/01/0B/Cgpw7Fr-reCAHi8XAAIIkMfL9-c589.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">Guitar Man-手工吉他</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		  </div>
		  
		   <!--文化 -->
		  <div class="videoArea" id='culture'>
		       <a href="https://www.apaipian.com/play/9_29798.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='吉他-弹奏篇' src="${image}group1/M00/00/CA/CgpsbFrhVMeAFjXUAAJK5WbJRCg857.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">吉他-弹奏篇</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://www.apaipian.com/play/2185_30834.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='物外设计-红铜钢笔' src="${image}group1/M01/00/D4/CgptuFr-sOuAcf08AAEQik4X9MM273.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">物外设计-红铜钢笔</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		        <a href="https://www.apaipian.com/play/2185_30827.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='Pentagon-钢笔' src="${image}group1/M01/00/D2/CgpsbFr-s-6ACl6GAAELAsXKzJA445.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">Pentagon-钢笔</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		        <a href="https://www.apaipian.com/play/2185_30828.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='笔墨文明-汉字六体书' src="${image}group1/M01/00/D4/CgptuFr-tNKADUn7AAE1JM8iKn0315.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">笔墨文明-汉字六体书</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		        <a href="https://www.apaipian.com/play/2185_30826.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='钢笔绘画技巧' src="${image}group1/M01/01/0B/Cgpw7Fr-sv-AAevrAAHT-snm3i8500.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">钢笔绘画技巧</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		        <a href="https://www.apaipian.com/play/2185_30825.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='Pilot Vanishing Point-钢笔' src="${image}group1/M01/01/0B/Cgpw7Fr-sXyADEeAAAExmWMZ5tY732.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">Pilot Vanishing Point-钢笔</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://www.apaipian.com/play/2185_30825.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='艺术博物馆' src="${image}group1/M01/00/D4/CgptuFr-r9SAPlkqAAG0IqGn4v8523.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">艺术博物馆</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		        <a href="https://www.apaipian.com/play/2185_30829.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='蓝色烟熏鲸鱼-插图工艺' src="${image}group1/M00/00/D4/CgptuFr-tiyAR161AAItAYcbWWg462.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">蓝色烟熏鲸鱼-插图工艺</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		  </div>
		  
		  <!--匠人 -->
		  <div class="videoArea" id='build'>
					  <a href="https://www.apaipian.com/play/2185_30807.html"> 
					             <div class="videoCard">
					                  <img class="videoBanner" alt='Stephen Webster-珠宝匠' src="${image}group1/M01/00/D2/CgpsbFr-nIaATffYAAELXWnnNwk654.jpg">
					                  <div class="modelG"></div>
					                  <div class="cardTitle">Stephen Webster-珠宝匠</div>
					                  <div class="cardDes"></div>
					             </div>
					  </a>
					  <a href="https://www.apaipian.com/play/2185_30808.html"> 
					             <div class="videoCard">
					                  <img class="videoBanner" alt='Mohitos-青石匠' src="${image}group1/M00/00/D2/CgpsbFr-nqOALXGOAAFaSFKgHaU194.jpg">
					                  <div class="modelG"></div>
					                  <div class="cardTitle">Mohitos-青石匠</div>
					                  <div class="cardDes"></div>
					             </div>
					  </a>
					  <a href="https://www.apaipian.com/play/2185_30809.html"> 
					             <div class="videoCard">
					                  <img class="videoBanner" alt='MEMBER-乐器工匠' src="${image}group1/M00/01/0D/CgpmTlr-oBSAT3B6AAJTY4CR7s8391.jpg">
					                  <div class="modelG"></div>
					                  <div class="cardTitle">MEMBER-乐器工匠</div>
					                  <div class="cardDes"></div>
					             </div>
					  </a>
					  <a href="https://www.apaipian.com/play/2185_30820.html"> 
					             <div class="videoCard">
					                  <img class="videoBanner" alt='STITCH-缝纫工匠' src="${image}group1/M01/00/D4/CgptuFr-oZeAR1YbAAFH9MuZe9U589.jpg">
					                  <div class="modelG"></div>
					                  <div class="cardTitle">STITCH-缝纫工匠</div>
					                  <div class="cardDes"></div>
					             </div>
					  </a>
					  </div>
					  
					   
					   			    <!--运动 -->
		  <div class="videoArea" id='sports'>
		         <a href="https://www.apaipian.com/play/2185_30848.html"> 
					             <div class="videoCard">
					                  <img class="videoBanner" alt='TriggerPoint-按摩滚筒' src="${image}group1/M01/01/0B/Cgpw7FsCjR6AefBLAAF1P7QqgVY236.jpg">
					                  <div class="modelG"></div>
					                  <div class="cardTitle">TriggerPoint-按摩滚筒</div>
					                  <div class="cardDes"></div>
					             </div>
					  </a>
					  <a href="https://www.apaipian.com/play/2185_30846.html"> 
					             <div class="videoCard">
					                  <img class="videoBanner" alt='施文 Schwinn-自行车' src="${image}group1/M01/00/D2/CgpsbFsCij6ATdq5AAJof-xsvMQ697.jpg">
					                  <div class="modelG"></div>
					                  <div class="cardTitle">施文 Schwinn-自行车</div>
					                  <div class="cardDes"></div>
					             </div>
					  </a>
					  <a href="https://www.apaipian.com/play/2185_30847.html"> 
					             <div class="videoCard">
					                  <img class="videoBanner" alt='Core-健身组合' src="${image}group1/M01/00/D4/CgptuFsCjEWAV70QAADz_xV1dhc205.jpg">
					                  <div class="modelG"></div>
					                  <div class="cardTitle">Core-健身组合</div>
					                  <div class="cardDes"></div>
					             </div>
					  </a>
					    <a href="https://www.apaipian.com/play/2185_29828.html"> 
					             <div class="videoCard">
					                  <img class="videoBanner" alt='Razor-滑板车' src="${image}group1/M01/01/0C/CgpmTlr7rkSAafrJAAFif2xLz78487.jpg">
					                  <div class="modelG"></div>
					                  <div class="cardTitle">Razor-滑板车</div>
					                  <div class="cardDes"></div>
					             </div>
					  </a>
		  
		  
		  </div>
					  
					    <!--旅行 -->
		  <div class="videoArea" id='travel'>
					   <a href="https://www.apaipian.com/play/2185_30810.html"> 
					             <div class="videoCard">
					                  <img class="videoBanner" alt='日默瓦 RIMOWA-Salsa 行李箱' src="${image}group1/M00/00/D4/CgptuFr-o1uAJVRKAAFXLjSxjBg777.jpg">
					                  <div class="modelG"></div>
					                  <div class="cardTitle">日默瓦 RIMOWA-Salsa 行李箱</div>
					                  <div class="cardDes"></div>
					             </div>
					  </a>
					  <a href="https://www.apaipian.com/play/2185_30811.html"> 
					             <div class="videoCard">
					                  <img class="videoBanner" alt='日默瓦 RIMOWA-Topas 行李箱' src="${image}group1/M00/01/0D/CgpmTlr-o_mAe4_7AAG8maMmT7w607.jpg">
					                  <div class="modelG"></div>
					                  <div class="cardTitle">日默瓦 RIMOWA-Topas 行李箱</div>
					                  <div class="cardDes"></div>
					             </div>
					  </a>
					  <a href="https://www.apaipian.com/play/2185_30813.html"> 
					             <div class="videoCard">
					                  <img class="videoBanner" alt='日默瓦 RIMOWA-白色款行李箱' src="${image}group1/M01/01/0D/CgpmTlr-ptuARjeZAAHjVSxfA88985.jpg">
					                  <div class="modelG"></div>
					                  <div class="cardTitle">日默瓦 RIMOWA-白色款行李箱</div>
					                  <div class="cardDes"></div>
					             </div>
					  </a>
					  <a href="https://www.apaipian.com/play/2185_30812.html"> 
					             <div class="videoCard">
					                  <img class="videoBanner" alt='日默瓦 RIMOWA-黑色款行李箱' src="${image}group1/M01/00/D4/CgptuFr-pwGAPJiWAAE7Bw7QAxI526.jpg">
					                  <div class="modelG"></div>
					                  <div class="cardTitle">日默瓦 RIMOWA-黑色款行李箱</div>
					                  <div class="cardDes"></div>
					             </div>
					  </a>
		  </div>
		  
		   <!--动漫 -->
		  <div class="videoArea" id='comic'>
		      <a href="https://www.apaipian.com/play/2185_30806.html"> 
					             <div class="videoCard">
					                  <img class="videoBanner" alt='麦当劳  McDonalds-小黄人' src="${image}group1/M01/00/D4/CgptuFr-mveAQs4tAAHm8a1LRWI891.jpg">
					                  <div class="modelG"></div>
					                  <div class="cardTitle">麦当劳  McDonald's-小黄人</div>
					                  <div class="cardDes"></div>
					             </div>
					  </a>
					   <a href="https://www.apaipian.com/play/2185_30805.html"> 
					             <div class="videoCard">
					                  <img class="videoBanner" alt='The Toys Asia-钢铁侠' src="${image}group1/M01/01/0D/CgpmTlr-mGSAFjsiAAHBJqqBVHg179.jpg">
					                  <div class="modelG"></div>
					                  <div class="cardTitle">The Toys Asia-钢铁侠</div>
					                  <div class="cardDes"></div>
					             </div>
					  </a>
					  <a href="https://www.apaipian.com/play/2185_30803.html"> 
					             <div class="videoCard">
					                  <img class="videoBanner" alt='金属炼魂-Ex-S Gundam型' src="${image}group1/M01/01/0B/Cgpw7Fr-lY2AD_5_AAFcDozjZks530.jpg">
					                  <div class="modelG"></div>
					                  <div class="cardTitle">金属炼魂-Ex-S Gundam型</div>
					                  <div class="cardDes"></div>
					             </div>
					  </a>
					  <a href="https://www.apaipian.com/play/2185_30804.html"> 
					             <div class="videoCard">
					                  <img class="videoBanner" alt='Kamibot and Gundam' src="${image}group1/M01/00/D2/CgpsbFr-luyAFWybAAG7Xne3HfQ737.jpg">
					                  <div class="modelG"></div>
					                  <div class="cardTitle">Kamibot and Gundam</div>
					                  <div class="cardDes"></div>
					             </div>
					  </a>
		                
		  
		  </div>
		  
		    <!--其它-->
		  <div class="videoArea" id='other'>
		  
		  <a href="https://www.apaipian.com/play/2185_30831.html"> 
					             <div class="videoCard">
					                  <img class="videoBanner" alt='Qunol-辅酶Q10' src="${image}group1/M01/00/D2/CgpsbFr-t7mAL4t_AAJ8UXed2R0360.jpg">
					                  <div class="modelG"></div>
					                  <div class="cardTitle">Qunol-辅酶Q10</div>
					                  <div class="cardDes"></div>
					             </div>
					  </a>
					  
			<a href="https://www.apaipian.com/play/2185_30830.html"> 
					             <div class="videoCard">
					                  <img class="videoBanner" alt='爱乐维 Elevit-澳洲版' src="${image}group1/M01/00/D4/CgptuFr-txyAc6zeAAG-qefSK6I891.jpg">
					                  <div class="modelG"></div>
					                  <div class="cardTitle">爱乐维 Elevit-澳洲版</div>
					                  <div class="cardDes"></div>
					             </div>
			</a>	
			<a href="https://www.apaipian.com/play/2185_30832.html"> 
					             <div class="videoCard">
					                  <img class="videoBanner" alt='花卉-多肉植物' src="${image}group1/M01/00/D2/CgpsbFr-uE-AEPwuAAI-hAeDyFE554.jpg">
					                  <div class="modelG"></div>
					                  <div class="cardTitle">花卉-多肉植物</div>
					                  <div class="cardDes"></div>
					             </div>
			</a>	
			<a href="https://www.apaipian.com/play/2185_30833.html"> 
					             <div class="videoCard">
					                  <img class="videoBanner" alt='花卉-西海岸花园' src="${image}group1/M00/00/D2/CgpsbFr-uSOAUaoOAAM9fU8N3T4544.jpg">
					                  <div class="modelG"></div>
					                  <div class="cardTitle">花卉-西海岸花园</div>
					                  <div class="cardDes"></div>
					             </div>
			</a>  
		  </div>
		  
		  
  
  

  
    <jsp:include flush="true" page="../../foot.jsp"></jsp:include> 
    <div style="height: 1.5rem;"></div>
    <script src="/resources/lib/jquery/jquery-2.0.3.min.js"></script>
    <script src="/resources/js/common.js"></script>	
    <script src="/resources/js/salesman/special/channel07.js"></script>
    
    
    <script id="-mob-share" src="https://f1.webshare.mob.com/code/mob-share.js?appkey=8c49c537a706"></script>

    

</body>
</html>