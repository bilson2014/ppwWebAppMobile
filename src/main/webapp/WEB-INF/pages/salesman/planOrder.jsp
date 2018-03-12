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
	<meta name="description" content="拍片网-企业视频名片">
	<meta name="baidu-site-verification" content="dMz6jZpIwd" />
	<title>9999元拍企业视频名片</title>
   
	<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
	<script src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
	<link rel="stylesheet" href="/resources/lib/swiper/swiper.min.css">
	<link rel="stylesheet" href="/resources/css/salesman/planOrder.css">
</head>
<div class="hidden">  
      <img  src="/resources/images/salesMan/flyPlay/share.png">
</div>

<body>
    <div class="swiper-container swiperVertical swiper-container-vertical">
		 <div class="swiper-wrapper ">
			                     			  
		    
			 <div class="swiper-slide">
			    
			        <div class='top'>
			            <img class="pageThree" src="/resources/images/salesMan/flyPlay/dosl.png">
			        </div>
			        <div class='cen'>
				
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
	    <!--  <img id="icon" src="/resources/images/salesMan/flyPlay/gobotton.png"> -->
    </div>
    
    <script id="-mob-share" src="https://f1.webshare.mob.com/code/mob-share.js?appkey=8c49c537a706"></script>
    <script id="-mob-share" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script src="/resources/lib/jquery/jquery-2.0.3.min.js"></script>
    <script src="/resources/lib/jquery.json/jquery.json-2.4.min.js"></script> 
    <script src="/resources/lib/swiper/swiper.min.js"></script>
    <script src="/resources/js/common.js"></script>
    <script src="/resources/js/salesman/planOrder.js"></script>
   
  

</body>
</html>