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
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0,minimum-scale=1.0, user-scalable=0" name="viewport" />
	<meta name="keywords" content="">
	<meta name="description" content="精准覆盖10000+用户">
	<meta name="baidu-site-verification" content="dMz6jZpIwd" />
	<title>9999元拍企业视频名片</title>
   
	<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
	<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
	<link rel="stylesheet" href="/resources/lib/swiper/swiper.min.css">
	<link rel="stylesheet" href="/resources/css/salesman/pbCard.css">
</head>
<div class="hidden">
      <img  src="/resources/images/employee/em1.png">
</div>

<body>
    <div class="swiper-container swiperVertical swiper-container-vertical">
		 <div class="swiper-wrapper ">
			 <div class="swiper-slide banner stepBtn-1">
				 <div class="mpa-video" id="playVideo" data-type-id="61" data-type="mpa-video" style="margin: 0rem; display: block; width:100%"> 
				      <span class="mpa-video-play-icon"></span> 
				      <video  playsinline="true" webkit-playsinline="true"  id="toPlayVideo"  loop="loop" x-webkit-airplay="true" webkit-playsinline="" playsinline="true" preload="auto" poster="/resources/images/salesMan/pbCard/pageOneVideo.jpg" style="width:100%;  margin-top: -1px;"> 
				           <source type="video/mp4" src="http://106.75.77.53:8888/group1/M00/00/78/CgpsbFnwLOOAIZKwAA7fUpvV37A429.mp4"> 
				      </video>  
				 </div>  
				<!--  <img class="pageOneIcon" src="/resources/images/salesMan/pbCard/pageOneIcon.png"> -->
				 <img class="pageOne" src="/resources/images/salesMan/pbCard/pageOne.jpg">
		     </div>                     			  
		     <div class="swiper-slide twoSlide">
			       <div class="full-video" id="playFullVideo" data-type-id="61" data-type="mpa-video" style="margin: 0rem; display: block; width:100%"> 
				                 <span class="mpa-video-play-icon"></span> 
				                 <video  playsinline="true" webkit-playsinline="true"   id="toPlayFullVideo"  loop="loop" x-webkit-airplay="true" webkit-playsinline="" playsinline="true" preload="auto" poster="/resources/images/salesMan/pbCard/pageTwoVideo.jpg"> 
				                     <source type="video/mp4" src="http://106.75.77.53:8888/group1/M00/00/7A/CgptuFnwXceAQW53AD5DNbwVtYA150.mp4"> 
				                 </video> 
					         </div> 
	          </div> 
			 <div class="swiper-slide">
			       <!--  <div class='top'>
			            <a href="tel:400-660-9728"> 
			             	 <img src="/resources/images/publicity/publicity33.png">
			             	<img src="/resources/images/publicity/aa.png">
			             </a>
			        </div> -->
			        <div class='top'>
			            <img class="pageThree" src="/resources/images/salesMan/pbCard/pageThree.jpg">
			        </div>
			        <div class='cen'>
				<%-- 		<form id="order-form" role="form"  method="post" autocomplete="off" accept-charset="UTF-8">
						    <input type="hidden" id="csrftoken" name="csrftoken" value="${csrftoken}"/>
						    <input type="hidden" id="token" name="token" value="${token}"/>
						    <input type="hidden" id="indentName" name="indentName" value="线上-活动"/>
							<input type="hidden" id="indent_recomment" name="indent_recomment" value="123"/> --%>
					        <div class="order">
					             <div class='phone'>
					                  <input class="input" type="text" maxlength="20" id="phone" placeholder='请输入您的手机号'/>
					                  <div class="var" id='varnum' >获取验证码</div>
					                  <p class="error" id='phoneerror'></p>
					              </div>
					              <div class='phone'>
					                   <input class="input"  type="text" maxlength="10"  id="num"  placeholder='请输入验证码'/>
					                   <p class="error" id='numerror'></p>
					              </div>  
					               <div class='phone'>
					                   <input type="button" class="btnSub"  id='btnSub' value="现在下单"></input>
					               </div>   			                  
					         </div>					             
				         <!--  </form> -->
			          </div>  
			        <div class='model' id='orderSuccess'>
					        <div class='success'>
					            <img data-src='/resources/images/index/success.png' class=' lazyloaded' src='/resources/images/index/success.png'>
					            <div id='showStatues'>提交成功!</div>
					            <div id='showText'>客服人员会尽快和您取得联系</div>
					            <div id='checkSuccess'>确认</div>					             
					         </div>
					  </div>
			          <!-- <img class='bto' src="/resources/images/publicity/publicity3.png">     -->
			  </div>          
         </div>  
         <div class="icon spIcon">
	     <img id="icon" src="/resources/images/salesMan/pbCard/pageOneGo.png">
    </div>
    
    <script id="-mob-share" src="http://f1.webshare.mob.com/code/mob-share.js?appkey=8c49c537a706"></script>
    <script id="-mob-share" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script src="/resources/lib/jquery/jquery-2.0.3.min.js"></script>
    <script src="/resources/lib/jquery.json/jquery.json-2.4.min.js"></script> 
    <script src="/resources/lib/swiper/swiper.min.js"></script>
    <script src="/resources/js/common.js"></script>
    <script src="/resources/js/salesman/pbCard.js"></script>
   
  

</body>
</html>