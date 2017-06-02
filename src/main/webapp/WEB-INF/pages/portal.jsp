<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="r" uri="/mytaglib"%>
<%-- import CSS --%>
<spring:url value="/resources/lib/mMenu/jquery.mmenu.all.css"
	var="mmenuCss" />
<spring:url value="/resources/css/portal.css" var="portalCss" />
<spring:url value="/resources/lib/swiper/swiper-3.3.1.min.css" var="swiperCss" />
<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js"
	var="jqueryJs" />
<spring:url value="/resources/lib/jquery/plugins.js" var="pluginJs" />
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js" var="jsonJs"/>
<spring:url value="/resources/lib/jquery/jquery.flexslider-min.js"
	var="flexsliderJs" />
<spring:url value="/resources/js/common.js" var="commonJs" />
<spring:url value="/resources/js/portal.js" var="portalJs" />
<spring:url value="/resources/lib/swiper/swiper.min.js" var="swiperJs" />
<spring:url value="/resources/lib/jquery/waypoints.min.js" var="waypointsJs" />
<spring:url value="/resources/lib/jquery.scrollstop/jquery.scrollstop.min.js" var="scrollstopJs"/>
<spring:url value="/resources/lib/jquery.lazyload/lazysizes.min.js" var="lazyloadJs"/>
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
<meta name="keywords" content="企业形象宣传片,宣传片制作,产品宣传片制作,北京宣传片拍摄,tvc广告片,品牌微电影,mg动画制作公司">
<meta name="description" content="拍片网是专业的商业视频服务平台,主要为中小企业提供:企业形象宣传片,宣传片制作,产品tvc广告片拍摄,品牌微电影制作,mg动画制作等视频内容。拍片就上拍片网！">
<title>拍片网－最大的互联网影视内容制作服务平台</title>
<script src="${jqueryJs }"></script>
<script src="${commonJs }"></script>
<script src="${scrollstopJs}"></script>
<script src="${lazyloadJs}"></script>

<link rel="stylesheet" href="${portalCss }">
<link rel="stylesheet" href="${swiperCss }">
<link rel="stylesheet" href="${mmenuCss }">
<link rel="shortcut icon" href="/resources/images/favicon.ico">
<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->

</head>
<body>

     <r:identity role="provider">
	    <input type="hidden" id="rolephone" value="1314520ppw" />              
	 </r:identity>
	 <r:identity role="customer">
	    <input type="hidden" id="rolephone" value="1314520ppw" />
	 </r:identity>
	 <r:identity role="employee">
	    <input type="hidden" id="rolephone" value="1314520ppw" />
	 </r:identity>
	            
	<input type="hidden" id="storage_node" value="${file_locate_storage_path }" />
	<div class="model" id="orderSuccess">
	         <div class="success">
	            <img data-src="/resources/images/index/success.png" class="lazyload">
	            <div id="showStatues">恭喜您下单成功</div>
	            <div>视频管家将会在两个小时内与您沟通</div>
	            <div><a href="/">返回首页</a></div>
	            <div id="checkSuccess">确认</div>
	         </div>
	</div>
	
		<div class="model" id="showVideo">
			<div class="closeVideo">
	     	  <button id="closeBtn" type="button" class="close" data-dismiss="modal" aria-label="Close"><span class="close-icon" aria-hidden="true">&times;</span></button>
	        </div>
			<div class="video-play-sections">
		    </div> 
	    </div>
	    
	    <jsp:include flush="true" page="menu.jsp"></jsp:include> 
	    
	 <div class="headerCom">
		<a>
		 <img id="openMenu"  class="lazyload" data-src="/resources/images/index/toMenu.png">
		</a>
		<a href="/list.html">  
		 <img  class="lazyload" data-src="/resources/images/index/toSearch.png">
		</a> 
		<a>
		  <img class="ppwLogos lazyload" data-src="/resources/images/index/logoW.png">
		</a>
	</div>

	<div class="backImg">
	        <img  id="img1" class="lazyload" data-src="/resources/images/index/back1.jpg">
	        <img  id="img2" class="lazyload" data-src="/resources/images/index/back2.jpg">
	        <img  id="img3" class="lazyload" data-src="/resources/images/index/back3.jpg">
	        <img  id="img4" class="lazyload" data-src="/resources/images/index/back4.jpg">
	        <img  id="img5" class="lazyload" data-src="/resources/images/index/back5.jpg">
	        <div></div>
	</div>
	
	<div class="pagePhone" style="opacity:0">
	
	<!--第一区域 -->
	<div class="firstContent">
	
		<div class="logo">
		  <img class="lazyload" data-src="/resources/images/index/logo.png">
		  <div id="logoPos" style="width:1px;"></div>
		</div>
			
		<div class="swiper-container">
	        <div class="swiper-wrapper">
	            <div class="swiper-slide">
		            <video style="width:0px;opacity:0" controls="" loop="" poster="/resources/images/index/moreInfo.JPG" name="media" id="header3Video" class="active"> 
			         <!--  <source src="/resources/video/test.mov" id="source" type="video/mp4"> -->
			         <source src="" id="source" type="video/mp4">
			        </video>
	                 <ul>
		                  <li class="title">专业商业视频服务</li>
		                  <li class="line"></li>
		                  <li class="desc">35800+导演/编剧/摄影师/影视专家为您服务</li>
		                  <li class="icon bannerAni playVideo" id="playVideo"><img class="lazyload" data-src="/resources/images/index/playIcon.png"></li>
	                 </ul>
	            </div>
	            <div class="swiper-slide">
	                  <ul>
		                  <li class="title">低预算拍大片 不满意全额退款</li>
		                  <li class="line"></li>
		                  <li class="desc">低于行业均价30%以上 平台托管制作费</li>
		                  <a  href="/cost/cal"> <li class="icon bannerAni"><img src="/resources/images/index/calc.png"></li></a>
	                 </ul>
	             </div>
	            <div class="swiper-slide">
	                   <ul>
		                  <li class="title">免费创意策划 72小时极速出片</li>
		                  <li class="line"></li>
		                  <li class="desc">专业视频管家 一站式视频服务 全流程质量监管</li>
		                  <li class="icon bannerAni"><a href="tel:4006609728"><img src="/resources/images/index/phone.png"></a></li>
	                 </ul>
	            </div>
	        </div>
    	</div>
    	
    	<form id="order-form" role="form" method="post" autocomplete="off" accept-charset="UTF-8">
				<c:if test="${activity == 1 }">
					<r:noLogin>
					<input type="hidden" id="indentName" name="indentName" value="新订单-手机下单"/>
					</r:noLogin>
					<r:identity role="provider">
						<input type="hidden" id="indentName" name="indentName" value="${sessionInfo.realName }-手机下单"/>
					</r:identity>
					<r:identity role="customer">
						<input type="hidden" id="indentName" name="indentName" value="${sessionInfo.realName }-手机下单"/>
					</r:identity>
					<r:identity role="employee">
						<input type="hidden" id="indentName" name="indentName" value="${sessionInfo.realName }-手机下单"/>
					</r:identity>
				</c:if>
				<c:if test="${activity != 1 }">
					<r:noLogin>
					<input type="hidden" id="indentName" name="indentName" value="微信底部广告"/>
					</r:noLogin>
					<r:identity role="provider">
						<input type="hidden" id="indentName" name="indentName" value="${sessionInfo.realName }-手机下单"/>
					</r:identity>
					<r:identity role="customer">
						<input type="hidden" id="indentName" name="indentName" value="${sessionInfo.realName }-手机下单"/>
					</r:identity>
					<r:identity role="employee">
						<input type="hidden" id="indentName" name="indentName" value="${sessionInfo.realName }-手机下单"/>
					</r:identity>
				</c:if>
				<input type="hidden" id="csrftoken" name="csrftoken" value="${csrftoken}"/>
				<input type="hidden" id="token" name="token" value="${token}"/>
				       		
			<r:noLogin>			
		    	<div class="getPhone">
		    		<input type="number" maxlength="16" id="indent_tele"  placeholder="填写手机号">
		    		<div class="error" id="error">手机号错误</div>
		    		<div class="getPhoneItem">
			    		<input type="number" maxlength="16" id="phoneCode"  placeholder="输入验证码">
			    		<div class="getCode" id="getPhoneCode">发送验证码</div>
			    		<div class="error" id="codeError">错误</div>
		    		</div>
		    	</div>
		   </r:noLogin> 	
    	<div class="order" id="subPaipian">预约拍片</div>
    	</form>
	</div>
	
	
	<div class="secondContent">
	      <div class="title">热门案例</div>
	      <div class="conDiv">
	              <a href='/search?q=&industry=*宣传片'>
			          <div class="conItem leftItem">
			             <img class="lazyload" data-src="/resources/images/index/video.png">
			             <div class="type">宣传片</div>
			          </div>
		          </a>
		           <a href="/search?q=&industry=微电影">
			          <div class="conItem">
			             <img class="lazyload" data-src="/resources/images/index/sVideo.png">
			             <div class="type">微电影</div>
			          </div>
		          </a>
	      </div>
	       <div class="conDiv noBot">
	              <a href="/search?q=广告">
			          <div class="conItem leftItem">
			             <img class="lazyload" data-src="/resources/images/index/ad.png">
			             <div class="type">广告片</div>
			          </div>
		          </a>
		           <a href="/search?q=&industry=病毒视频">
			          <div class="conItem">
			             <img class="lazyload" data-src="/resources/images/index/spread.png">
			             <div class="type">病毒视频</div>
			          </div>
		          </a>
	      </div>
	      <div class="service">服务流程</div>
	      <ul class="serviceItem">
	         <li>
	             <img class="lazyload" data-src="/resources/images/index/talk.png">
	             <div class="wordItem">
	                    <div>1</div>
	                    <div>沟通拍片需求</div>
	             </div>
	             <div class="wordItem">
	                    <div>2</div>
	                    <div>免费创意策划</div>
	             </div>
	         </li>
	         <li>
	             <img class="lazyload" data-src="/resources/images/index/help.png">
	             <div class="wordItem">
	                    <div>3</div>
	                    <div>平台托管制作费</div>
	             </div>
	             <div class="wordItem">
	                    <div>4</div>
	                    <div>甄选最佳的导演</div>
	             </div>
	         </li>
	         <li>
	             <img class="lazyload" data-src="/resources/images/index/replay.png">
	             <div class="wordItem">
	                    <div>5</div>
	                    <div>拍摄制作全程监管</div>
	             </div>
	             <div class="wordItem">
	                    <div>6</div>
	                    <div>不满意免单或重拍</div>
	             </div>
	         </li>
	      </ul>
	      <a href="tel:4006609728"><div class="freeTel">免费咨询</div></a>
	</div>
	
	<div class="thirdContent">
	        <div class="ourCusTitle">导演工作室</div>
		    <div class="ourCus"></div>
	       <a href="/proRegister">
	    		<div class="join">
                                                      加入我们
                </div>
           </a>
	               
		     <div class="ourCusTitle">我们的客户</div>
		     
		     <div class="showLogo">
		          <img class="lazyload" data-src="/resources/images/index/logo1.png">
		          <img class="lazyload" data-src="/resources/images/index/logo2.png">
		          <img class="lazyload" data-src="/resources/images/index/logo3.png">
		          <img class="lazyload" data-src="/resources/images/index/logo4.png">
		          <img class="lazyload" data-src="/resources/images/index/logo5.png">
		          <img class="lazyload" data-src="/resources/images/index/logo6.png">
		          <img class="lazyload" data-src="/resources/images/index/logo7.png">
		          <img class="lazyload" data-src="/resources/images/index/logo8.png">
		          <img class="lazyload" data-src="/resources/images/index/logo9.png">
		          <img class="lazyload" data-src="/resources/images/index/logo10.png">
		          <img class="lazyload" data-src="/resources/images/index/logo11.png">
		          <img class="lazyload" data-src="/resources/images/index/logo12.png">
		          <img class="lazyload" data-src="/resources/images/index/logo13.png">
		          <img class="lazyload" data-src="/resources/images/index/logo14.png">
		     </div>
		     
		     <jsp:include flush="true" page="foot.jsp"></jsp:include> 
		     
	</div>	    
 </div>
 
</body>

<script src="${waypointsJs}"></script>
<script src="${swiperJs}"></script>
<script src="${pluginJs }"></script>
<script src="${flexsliderJs }"></script>
<script src="${jsonJs }"></script>
<script src="${portalJs }"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
</html>