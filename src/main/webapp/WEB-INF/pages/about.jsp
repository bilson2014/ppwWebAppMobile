<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%-- import CSS --%>
<spring:url value="/resources/css/company/about.css" var="aboutCss"/>

<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js" var="jqueryJs"/>
<spring:url value="/resources/lib/jquery/plugins.js" var="pluginJs"/>
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js" var="jsonJs"/>
<spring:url value="/resources/js/common.js" var="commonJs"/>

<!-- img path -->
<spring:url value="/resources/images" var="imgPath" />
<spring:url value="/resources/js/remSet.js" var="remSetJs" />
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=9,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
	<!-- iphone 手机默认全屏 -->
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<!-- 取消数字被识别为电话号码 -->
	<meta name="format-detection" content="telephone=no" />
	<meta name="keywords" content="拍片网,视频播放,视频详情,影片播放,影片介绍">
	<meta name="description" content="拍片网，汇聚千万影视行业创作者，是中国最大的视频交易平台。产品：宣传片、广告、微电影、动画、三维演示等视频，优势：创意免费、选择多、价格低、不满意无条件退款">
	<title>关于我们|拍片网</title>
	
	<link rel="shortcut icon" href="${imgPath }/favicon.ico" >
	<link rel="stylesheet" href="${aboutCss}">
	<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
</head>
<body>
	<input type="hidden" id="storage_node" value="${file_locate_storage_path }" />
	
	<div class="phoneHeader">
	     <a id="openMenu"><img src="${imgPath }/index/toMenu.png"></a>
	     <a href="/searchview">  
		  <img  src="${imgPath}/index/toSearch.png">
		 </a> 

	     <a href="/"><img class="ppwLogo" src="${imgPath}/index/logoH.png"></a>

	   

	</div>
	
	<jsp:include flush="true" page="menu.jsp"></jsp:include> 
	
       <div class="pagePhone">
	       <div class="videoShow">
				<video id="showVideo" class="setVideo" poster="${imgPath}/company/2017.png" controls>
			        <source src="${file_locate_storage_path}group1/M00/00/60/CgpmTlib2EaAbOOdAQ1EMav8_P0022.mp4" type="video/mp4">
			    </video> 
	       </div>
	       <div class="timeLine">
	            
	            <div class="stepTop">
	                <img src="${imgPath }/company/aboutUs.png">
	                <div>2016</div>
	            </div>
	            
	            <div class="stepItem">
	                    <div class="item">
	                      <div></div>
	                      <div>11月获得国泰君安力鼎投资A轮投资</div>
	                    </div>
	                    <div class="item">
	                      <div></div>
	                      <div>10月举办中国首届视频营销大会</div>
	                    </div>
	                    <div class="item">
	                      <div></div>
	                      <div>3月拍片网2.0迭代上线，签约客户超过100家</div>
	                    </div>
	            </div>
	            <div class="stepCircle">
	                <div></div>
	                <div>2015</div>
	            </div>
	            <div class="stepItem">
	                    <div class="item">
	                      <div></div>
	                      <div>12月获得老鹰基金Pre-A轮投资，投资人刘小鹰</div>
	                    </div>
	                    <div class="item">
	                      <div></div>
	                      <div>11月拍片网微信客户端上线</div>
	                    </div>
	                    <div class="item">
	                      <div></div>
	                      <div>10月签约用友集团</div>
	                    </div>
	                    <div class="item">
	                      <div></div>
	                      <div>9月承接中国铁塔2015国际通信展览视频展示全案</div>
	                    </div>
	                    <div class="item">
	                      <div></div>
	                      <div>7月拍片网正式版上线，入驻导演团队三百多家</div>
	                    </div>
	                    <div class="item">
	                      <div></div>
	                      <div>5月拍片网Demo版上线测试</div>
	                    </div>
	                    <div class="item">
	                      <div></div>
	                      <div>2月获得洪泰基金投资人俞敏洪、盛希泰天使轮追加投资</div>
	                    </div>
	            </div>
	            
	             <div class="stepCircle">
	                <div></div>
	                <div>2014</div>
	            </div>
	            
	             <div class="stepItem">
	                    <div class="item">
	                      <div></div>
	                      <div>10月成立获得PreAngel王利杰、顾浩天使轮投资</div>
	                    </div>
	             </div>
	       </div>
	       
	       
	       <jsp:include flush="true" page="foot.jsp"></jsp:include> 
		     
	       
       </div>


<script src="${jqueryJs }"></script>
<script src="${pluginJs }"></script>
<script src="${jsonJs }"></script>
<script src="${commonJs }"></script>
<script src="${remSetJs}"></script>
<!-- 加载Mob share 控件 -->
<script id="-mob-share" src="http://f1.webshare.mob.com/code/mob-share.js?appkey=8c49c537a706"></script>
<script type="text/javascript" src="http://player.youku.com/jsapi"></script>
</body>
</html>