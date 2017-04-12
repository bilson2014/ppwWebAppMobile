<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%-- import CSS --%>
<spring:url value="/resources/css/play.css" var="playCss"/>

<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js" var="jqueryJs"/>
<spring:url value="/resources/lib/jquery/plugins.js" var="pluginJs"/>
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js" var="jsonJs"/>
<spring:url value="/resources/js/common.js" var="commonJs"/>
<spring:url value="/resources/js/youku-player.js" var="ykJs" />
<spring:url value="/resources/js/play.js" var="playJs"/>
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
	<title>${product.productName }</title>
	
	<link rel="shortcut icon" href="${imgPath }/favicon.ico" >
	<link rel="stylesheet" href="${playCss }">
	<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
</head>
<body>
	<input type="hidden" id="storage_node" value="${file_locate_storage_path }" />
	<input type="hidden" id="videoId" value="${product.productId }"/>
	<input type="hidden" id="videoName" value="${product.productName }"/>
	<input type="hidden" id="videoUrl" value="${product.videoUrl }"/>
	<input type="hidden" id="videoPoster" value="${product.picLDUrl }"/>
	<input type="hidden" id="videoDesc" value="${product.pDescription }"/>
	<input type="hidden" id="videoHret" value="${product.hret }"/>
	<input type="hidden" id="teamId" value="${product.teamId }"/>
	<input type="hidden" id="teamPhotoUrl" value="${product.teamPhotoUrl }"/>
	<input type="hidden" id="serviceId" value="${product.serviceId }"/>
	<input type="hidden" id="realPrice" value="${product.servicePrice }"/>
	<input type="hidden" id="originalPrice" value="${product.serviceRealPrice }"/>
	<input type="hidden" id="second" value="${product.mcoms }"/>
	<input type="hidden" id="yk-play" value="<spring:url value="${product.hret}"/>" />
	
	<div class="phoneHeader">
	     <a><img src="${imgPath }/index/toMenu.png"></a>
	     <a href="/searchview">  
		 <img  src="${imgPath}/index/toSearch.png">
		 </a> 
	     <div>案例</div>
	</div>
	
	 <jsp:include flush="true" page="menu.jsp"></jsp:include> 
	
       <div class="pagePhone">
	       <div class="videoShow">
				<video id="showVideo" class="setVideo" preload="${imgPath}/index/index.jpg" muted>
			        <source src="http://www.apaipian.com/product/video/paipianwangMovie.mp4" type="video/mp4">
			    </video> 
	       </div>
	       <div class="videoTitle">
	           ${product.productName }
	       </div>
	       <div class="videoTag">
	           <div>标签</div>
	           <div>一个标签</div>
	           <div>超级大标签</div>
	           <div>超级大标签</div>
	       </div>
	       <div class="videoPrice">
	              ￥369900
	       </div>
	       
	       <!-- 影片简介 -->
	       <div class="videoInfo">影片简介 Project Summary</div>
	       <div class="videoContent">
	            <div class="content">影片简介影片简介影片简介影片简介影片简介影片简介影片简介影片简介影片简介</div>
	            <div class="orderVideo">预约拍片</div>
	            <div class="videoCompany">
	                 <div class="cLogo">
	                       <img src="${imgPath}/index/test.png">
	                       <img src="${imgPath}/index/true.png">
	                 </div>
	                 <div>某某影视单位</div>
	                 <div>更多作品</div>
	            </div>
	       </div>
	       
	       <!-- 相关推荐-->
	       
	       <div class="anli">
	            <div class="title"></div>
	            <div class="line"></div>
	       </div>
	       <div class="anliContent">
	             <div class="contentItem" style="background:url(/resources/images/index/index.jpg) no-repeat">
	                	 <div class="itemTitle">介影片简介标题要介影片简介标题要长介影片简介标题要长介影片简介标题要长介影片简介标题要长介影片简介标题要长介影片简介标题要长长</div>
	                     <div class="itemTag">介影片简介</div>
	             </div>
	             <div class="contentItem" style="background:url(/resources/images/index/index.jpg) no-repeat">
	                     <div class="itemTitle">介影片简介标题要介影片简介标题要长介影片简介标题要</div>
	                     <div class="itemTag">介影片简介</div>
	             </div>
	             <div class="contentItem" style="background:url(/resources/images/index/index.jpg) no-repeat">
	                     <div class="itemTitle">介影片简介标题要介影片简介标题要长介影片简介标题要长介影片简介标题要长介影片简介标题要长介影片简介标题要长介影片简介标题要长长</div>
	                     <div class="itemTag">介影片简介</div>
	             </div>
	             <div class="moreAnli">
	                                                更多相关推荐
	             </div>
	       </div>
	       
	       <jsp:include flush="true" page="foot.jsp"></jsp:include> 
		     
	       
       </div>


<script src="${jqueryJs }"></script>
<script src="${pluginJs }"></script>
<script src="${jsonJs }"></script>
<script src="${commonJs }"></script>
<script src="${ykJs }"></script>
<script src="${playJs }"></script>
<script src="${remSetJs}"></script>
<!-- 加载Mob share 控件 -->
<script id="-mob-share" src="http://f1.webshare.mob.com/code/mob-share.js?appkey=8c49c537a706"></script>
<script type="text/javascript" src="http://player.youku.com/jsapi"></script>
</body>
</html>