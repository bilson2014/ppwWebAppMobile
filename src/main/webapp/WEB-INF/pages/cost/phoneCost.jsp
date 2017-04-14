<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="r" uri="/mytaglib"%>
<%-- import CSS --%>

<spring:url value="/resources/css/cost/phoneCost.css" var="phoneCost" />
<spring:url value="/resources/lib/swiper/swiper-3.3.1.min.css" var="swiperCss" />
<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js"
	var="jqueryJs" />
<spring:url value="/resources/lib/jquery/plugins.js" var="pluginJs" />
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js" var="jsonJs"/>
<spring:url value="/resources/js/imgLazyLoad.js" var="imgLazyLoadingJs" />
<spring:url value="/resources/js/common.js" var="commonJs" />
<spring:url value="/resources/js/cost/phoneCost.js" var="phoneCostJs" />
<spring:url value="/resources/js/remSet.js" var="remSetJs" />
<spring:url value="/resources/lib/swiper/swiper.min.js" var="swiperJs" />
<spring:url value="/resources/lib/Bootstrap/css/bootstrap.min.css" var="bootstrapCss" />
<!-- imgPath -->
<spring:url value="/resources/images" var="imgPath" />
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
<meta name="keywords" content="拍片成本报价,拍片陈本估算,拍片计算器,宣传片制作报价">
<meta name="description" content="拍片网平台致力于打造“影视工业化”行业标准，首家模块化成本定价，推出拍片成本计算器，随时了解视频制作价格。拍片就上拍片网！">
<title>成本计算 | 拍片网</title>

<link rel="shortcut icon" href="${imgPath }/favicon.ico">
<link rel="stylesheet" href="${phoneCost }">
<link rel="stylesheet" href="${swiperCss }">
<link rel="stylesheet" href="${bootstrapCss }">



<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->

</head>
<body>
	<input type="hidden" id="storage_node" value="${file_locate_storage_path }" />

	<div class="phoneHeader">
	     <a id="openMenu"><img src="${imgPath }/index/toMenu.png"></a>
	     <a href="/searchview"><img src="${imgPath }/index/toSearch.png"></a>
	     <img class="ppwLogo" src="${imgPath}/index/logoH.png">
	</div>
	
	 <jsp:include flush="true" page="../menu.jsp"></jsp:include> 
	
<div class="modalShow" id="noInfo">       
      <div class="noInfo closeInfo">
              <div class="noInfoF">您没有选择需求哦</div>
              <div class="justDoIt closeInfo" >现在选择！</div>
      </div>
</div>

	<div class="pagePhone">
          <div class="swiper-container">
	        <div class="swiper-wrapper">
	            <div class="swiper-slide">
	                 <img class="slideBg" src="${imgPath}/cost/gPhone1.png">
	                 <div class="title">1/5.  您想拍个什么片子？</div>
	                 <div class="line"></div>
	                 <div class="tags">
	                    <div class="tags1" data-content="0">A.活动视频</div>
	                    <div class="tags1" data-content="3">D.微电影</div>
	                    <div class="tags1" data-content="1">B.TVC广告</div>
	                    <div class="tags1" data-content="4">E.融资路演</div>
	                    <div class="tags1" data-content="2">C.宣传片</div>
	                    <div class="tags1" data-content="5">F.众筹视频</div>
	                 </div>
	            </div>
	            <div class="swiper-slide">
	                 <img class="slideBg2" src="${imgPath}/cost/gPhone2.png">
	                 <div class="title">2/5.  您想选用哪个导演？</div>
	                 <div class="line"></div>
	                 <div class="tags">
                           <div class="tags2" data-content="0">A.专业级导演</div>
                           <div class="tags2Desc">三年工作经验,拥有十部以上成功作品案例</div>
                           <div class="tags2" data-content="1">B.广告级导演</div>
                           <div class="tags2Desc">五年工作经验,拥有几十部知名品牌的成功案例</div>
                           <div class="tags2" data-content="2">C.电影级导演</div>
                           <div class="tags2Desc">十年工作经验,拥有国际知名品牌的成功作品案例</div>
	                 </div>
	            </div>
	            <div class="swiper-slide">
	                 <img class="slideBg3" src="${imgPath}/cost/gPhone3.png">
	                 <div class="title">3/5.  您想选用哪种档次的</div>
	                 <div class="title topT">拍摄设备？</div>
	                 <div class="line"></div>
	                 <div class="tags">
                           <div class="tags3" data-content="0">A.专业级设备(HD)</div>
                           <div class="tags3Desc">清晰色彩表现和画面锐度</div>
                           <div class="tags3" data-content="1">B.广告级设备(2K)</div>
                           <div class="tags3Desc">品牌广告级设备呈现超细腻,生动画质</div>
                           <div class="tags3" data-content="2">C.电影级设备(4K)</div>
                           <div class="tags3Desc">缔造电影级视觉冲击力的震撼画质</div>
	                 </div>
	            </div>
	            <div class="swiper-slide">
	                 <img class="slideBg4" src="${imgPath}/cost/gPhone4.png">
	                 <div class="title">4/5.  选演员当然要选专业的！</div>
	                 <div class="title topT">您需要的是？</div>
	                 <div class="line"></div>
	                 <div class="tags">
                           <div class="tags4" data-content="0">A.自有演员</div>
                           <div class="tags4" data-content="1">B.普通演员</div>
                           <div class="tags4" data-content="2">C.专业演员</div>
                           <div class="tags4" data-content="3">D.不需要演员</div>
	                 </div>
	            </div>
	            <div class="swiper-slide">
	                 <img class="slideBg5" src="${imgPath}/cost/gPhone5.png">
	                 <div class="title">5/5.  您偏爱哪种动画效果</div>
	                 <div class="title topT">您需要的是？</div>
	                 <div class="line"></div>
	                 <div class="tags">
                           <div class="tags5" data-content="0">A.没有也行</div>
                           <div class="tags5" data-content="1">B.二维动画</div>
                           <div class="tags5" data-content="2">C.三维动画</div>
                           <div class="tags5" data-content="3">D.MG图形动画</div>
	                 </div>
	            </div>
	            <div class="swiper-slide swiper-no-swiping" >
	                <div id="step1">
		                  <img class="slideBg6" src="${imgPath}/cost/gPhone6.png">
		                  <div class="item">
		                     <input placeholder="您的手机号" id="phone" data-content="0">
		                     <div class="error" id="phoneError">error</div>
		                  </div>
		                  <div class="item">
		                     <input placeholder="输入您的验证码" id="phoneCode">
		                     <div class="checkCode" id="checkCode">发送验证码</div>
		                     <div class="error" id="codeError">error</div>
		                  </div>
		                  <div class="start">开始计算</div>
	                </div>  
	                <div id="step2">
	                    <img class="slideBg7" src="${imgPath}/cost/gPhone7.png">
	                    <div class="info">小拍正在努力计算中...</div>
	                    <div class="progress progress-striped active">
							<div class="progress-bar progress-bar-success" role="progressbar"
								aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"
								style="width:0;" id="bar"></div>
		                </div>
	                </div>
	                <div id="step3">
	                      <div class="resultDiv">
	                          <div class="price">¥<span id="price">29800</span></div>
	                          <div class="priceInfo">按照您的需求,拍片大概会花费</div>
	                          <div class="priceLine"></div>
	                          <div class="reCost">再次计算</div>
	                          <div class="returnBack"  onclick="JavaScript:history.back(-1);">返回上一级</div>
	                      </div>
	                </div>
	            </div>
	            <div class="swiper-slide" style="width:100% !important;opacity:0"></div>
	        </div>
          </div>	
	</div>
	<div class="costResult">
	 
	</div>
	
</body>


<script src="${jqueryJs }"></script>
<script src="${swiperJs}"></script>
<script src="${pluginJs }"></script>
<script src="${jsonJs }"></script>
<script src="${commonJs }"></script>
<script src="${phoneCostJs }"></script>
<script src="${remSetJs}"></script>



<!-- 加载Mob share 控件 -->
<script id="-mob-share"
	src="http://f1.webshare.mob.com/code/mob-share.js?appkey=8c49c537a706"></script>
</html>