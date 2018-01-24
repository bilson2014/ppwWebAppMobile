<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="r" uri="/mytaglib" %>
<%-- import CSS --%>
<spring:url value="/resources/css/index.css" var="indexCss" />
<spring:url value="/resources/lib/Bootstrap/css/bootstrap.min.css" var="bootstrapCss" />
<spring:url value="/resources/lib/swiper/swiper.min.css" var="swiperCss" />
<%-- import JS --%>
<spring:url value="/resources/images" var="imgPath" />
<spring:url value="/resources/lib/requireJs/require.js" var="requireJs" />
<spring:url value="/resources/lib/swiper/swiper.min.js" var="swiperJs" />
<spring:url value="/resources/js/grally/grally.js" var="grallyJs" />
<spring:url value="/resources/js/grally/prefixfree.min.js" var="prefixfreeJs" />
<spring:url value="/resources/js/homePage.js" var="homePageJs" />
<spring:url value="/resources/js/common.js" var="commonJs" />
<spring:url value="/resources/js/testRem.js" var="testRemJs" />
<spring:url value="/resources/js/activity/caculate/cost.js" var="costJs" />
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js" var="jqueryJs" />
<spring:url value="/resources/lib/Bootstrap/js/bootstrap.min.js" var="bootstrapJs" />
<spring:url value="/resources/images" var="imgPath" />
<spring:url value="/resources/lib/swiper/swiper-3.3.1.min.css" var="swiperCss" />
<spring:url value="/resources/lib/swiper/swiper.min.js" var="swiperJs" />
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
	<meta name="keywords" content="拍片网-成本计算器">
	<meta name="description" content="">
	<meta name="baidu-site-verification" content="dMz6jZpIwd" />
	<title>拍片网－成本计算器</title>
    <link rel="stylesheet" href="/resources/css/costCalculator.css">
    <link rel="stylesheet" href="/resources/lib/swiper/swiper-3.3.1.min.css">
    <link rel="stylesheet" href="/resources/lib/Bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="/resources/lib/jquery/jquery-2.0.3.min.js"></script>
    
	<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
	<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
</head>
<body>
	<input type="hidden" id="target" value="${uniqueId }">
<audio controls="controls" hidden="hidden" autoplay="autoplay" loop="loop">
  <source src="/resources/music/music.mp3" type="audio/mpeg" />
</audio> 

<div class="modalShow" id="showOrder">
       
       <div id="sOrder" class="sOrder">
           <div class="progress progress-striped active">
							<div class="progress-bar progress-bar-success" role="progressbar"
								aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"
								style="width: 0;" id="bar"></div>
		   </div>
       </div>
       
</div>

<div class="modalShow" id="code">       
       <img id="sCode" class="sCode" src="/resources/images/cost/code.jpg">
</div>

<div class="modalShow" id="showWeixin">  
      <div class="showWeixin">     
       <img  src="/resources/images/cost/shareWeChat.png">
      </div> 
</div>

<div class="modalShow" id="noInfo">       
      <div class="noInfo closeInfo">
              <div class="noInfoF">您没有选择需求哦</div>
              <div class="justDoIt closeInfo" >现在选择！</div>
      </div>
</div>

  
   <div class="swiper-container">
        <div class="swiper-wrapper">
              
        
             <div class="swiper-slide banner stepBtn-1">
              <div class="bLogoDiv">
               <img class="bLogo"  src="/resources/images/cost/bannerLogo.png">
             </div>  
               <img class="bWord" src="/resources/images/cost/bannerWord.png">
               <img class="bInfo" src="/resources/images/cost/bannerInfo.png">
               <img  class="bBtn bannerAni" src="/resources/images/cost/bannerBtn.png">
	           <div class="icon spIcon">
	            <img id="icon" src="/resources/images/cost/icon.png">
	         </div>   
            </div> 
            <div class="swiper-slide step2">
                <img style="width:100%" src="/resources/images/cost/step2TB.png">
                <img class="step2Ani" style="width:100%" src="/resources/images/cost/step2Ani.png">
                <div class="stepBtn-2 step2A anA" data-content="0">
                    <div class="" data-content="0" data-text="活动视频"></div>
                </div>
               <div class="stepBtn-2 step2B anB" data-content="0">
                    <div data-content="1" data-text="TVC广告"></div>
                </div>
                <div class="stepBtn-2 step2C anC" data-content="0">
                    <div data-content="2" data-text="宣传片"></div>
                </div>
                <div class="stepBtn-2 step2D anD" data-content="0">
                    <div data-content="3" data-text="微电影"></div>
                </div>
                <div class="stepBtn-2 step2E anE" data-content="0">
                    <div data-content="4" data-text="融资路演"></div>
                </div>
                <div class="stepBtn-2 step2F anF" data-content="0">
                    <div data-content="5" data-text="众筹视频"></div>
                </div>
                
		         <div class="icon spIcon">
		            <img id="icon" src="/resources/images/cost/icon.png">
		         </div>   
				
            </div>
            
            <div class="swiper-slide step3">
		             <img class="rotate" style="width:100%" src="/resources/images/cost/step3TB.png">
		             <img style="width:100%; position: absolute;top: 0rem;left: 0rem;z-index:1" src="/resources/images/cost/step3Logo.png">
		             
		             <div class="step3Q"></div>
		                <div class="stepBtn-3 step3A anA" >
		                     <div class="" data-content="0" data-text="专业级导演"></div>
		                </div>
		                <div class="step3AI"></div>
		                  <div class="stepBtn-3 step3B anB" >
		                     <div class="" data-content="1" data-text="广告级导演"></div>
		                </div>
		                 <div class="step3BI"></div>
		                  <div class="stepBtn-3 step3C anC" >
		                     <div class="" data-content="2" data-text="电影级导演"></div>
		                </div>
		                 <div class="step3CI"></div>
		                          <div class="icon">
            <img src="/resources/images/cost/icon.png">
         </div>   
            </div>
            <div class="swiper-slide step4">
                <img style="width:100%" src="/resources/images/cost/step4TB.png">
                <img class="step2Ani" style="width:100%" src="/resources/images/cost/step4Video.png">
		             <div class="step4Q"></div>
		                <div class="stepBtn-4 step4A anA" data-content="0">
		                     <div class="" data-content="0" data-text="专业级设备"></div>
		                </div>
		                <div class="step4AI"></div>
		                  <div class="stepBtn-4 step4B anB" data-content="0">
		                     <div class="" data-content="1" data-text="广告级设备"></div>
		                </div>
		                 <div class="step4BI"></div>
		                  <div class="stepBtn-4 step4C anC" data-content="0">
		                     <div class="" data-content="2" data-text="电影级设备"></div>
		                </div>
		                 <div class="step4CI"></div>
		                          <div class="icon">
            <img src="/resources/images/cost/icon.png">
         </div>   
            </div>
            <div class="swiper-slide step5">
                          <img style="width:100%;position:relative;z-index:1" src="/resources/images/cost/step5TB.png">
                           <img class="step5L" style="width:100%" src="/resources/images/cost/step5L.png">
                         
		                 <div class="step5Q"></div>
		                <div class="stepBtn-5 step5A anA">
		                     <div class="" data-content="1" data-text="自有演员"></div>
		                </div>
		               
		                  <div class="stepBtn-5 step5B anB">
		                     <div class="" data-content="2" data-text="普通演员"></div>
		                </div>
		               
		                  <div class="stepBtn-5 step5C anC">
		                     <div class="" data-content="3" data-text="专业演员"></div>
		                </div>
		                
		                  <div class="stepBtn-5 step5D anD">
		                     <div class="" data-content="0" data-text="不需要演员"></div>
		                </div>
		                         <div class="icon spIcon">
            <img src="/resources/images/cost/icon.png">
         </div>   
		                
            </div>
            <div class="swiper-slide step6">
                  <img class="tb" style="width:100%" src="/resources/images/cost/step6TB.png">
                  <img class="tt" style="width:100%" src="/resources/images/cost/step6tt.png">
                  <img style="width:100%; position: absolute;top: 0rem;left: 0rem;z-index:1" src="/resources/images/cost/step3Logo.png">
		                 <div class="step6Q"></div>
		                <div class="stepBtn-6 step6A anA">
		                     <div class="" data-content="0" data-text="没有也行"></div>
		                </div>
		               
		                  <div class="stepBtn-6 step6B anB">
		                     <div class="" data-content="2" data-text="二维动画"></div>
		                </div>
		               
		                  <div class="stepBtn-6 step6C anC">
		                     <div class="" data-content="1" data-text="三维动画"></div>
		                </div>
		                
		                  <div class="stepBtn-6 step6D anD">
		                     <div class="" data-content="3" data-text="MG图形动画"></div>
		                </div>
          <div class="icon">
            <img src="/resources/images/cost/icon.png">
         </div>   

            </div>
            
            <div class="swiper-slide step6">
			       <div class="phoneCard cardBack" id="phoneCard">
			            <div class="errorPhone">
			               <input placeholder="输入您的手机号" id="phone">
			            </div>
			            <div class="errorInfo" id="errorInfo"></div>
			            <div class="errorPhone codePhone" id="codePhone">
			               <input placeholder="输入您的验证码" maxlength="10" id="phoneCode" data-content="0">
			               <button class="setCode" id='getPhoneCode' >发送验证码</button>
			            </div>
			            <div class="errorInfo" id="errorCode"></div>
			            <div class="toOrderDiv">
			            <img class="toOrder" id="showSuccessImg" src="/resources/images/cost/tepFinish.png">
			            </div>
			       </div>
            </div>
            
             <div class="swiper-slide backGround swiper-no-swiping ">
                          <img style="width:100%" src="/resources/images/cost/f1.jpg">
                          <div class="f2">
                            <div class="priceResult">
                                   <div class="priceInfo">
					                   <img src="/resources/images/cost/priceInfo.png">
					               </div>
							        <div class="getPrice"><span>￥</span><span id="getPriceSpan"></span></div>
							          <div class="time">
							           <img id="" src="/resources/images/cost/time.png">
							        </div>
							       
							        <div class="shareTo reCost">
							           <img id="" src="/resources/images/cost/reCost.png">
							        </div>
					        
					         </div>
					     
                          </div>
                        
                          <img style="width:100%" src="/resources/images/cost/f3.jpg">
             </div>
            
        </div>
       
    </div> 
    <a href="javascript:void(0);">
		<div class="-mob-share-ui -mob-share-ui-theme -mob-share-ui-theme-slide-bottom" style="display: none">
			<ul class="-mob-share-list">
				<li class="-mob-share-weixin" id="weixin"><p>微信</p></li>
				<li class="-mob-share-qzone"><p>QQ空间</p></li>
				<li class="-mob-share-qq" id="qq"><p>QQ好友</p></li>
				<li class="-mob-share-weibo"><p>新浪微博</p></li>
			</ul>
			<div class="-mob-share-close">取消</div>
		</div>
		<div class="-mob-share-ui-bg"></div>
	</a>     

    <script src="${jqueryJs }"></script>
    <script src="${testRemJs }"></script>
    <script src="${commonJs }"></script>
    <script src="${swiperJs }"></script>
    <script src="${costJs }"></script>
    <script id="-mob-share" src="http://f1.webshare.mob.com/code/mob-share.js?appkey=8c49c537a706"></script>
    
    
    
</body>
</html>