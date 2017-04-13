<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%-- import CSS --%>
<spring:url value="/resources/css/play.css" var="playCss" />

<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js"
	var="jqueryJs" />
<spring:url value="/resources/lib/jquery/plugins.js" var="pluginJs" />
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js"
	var="jsonJs" />
<spring:url value="/resources/js/common.js" var="commonJs" />
<spring:url value="/resources/js/youku-player.js" var="ykJs" />
<spring:url value="/resources/js/play.js" var="playJs" />
<!-- img path -->
<spring:url value="/resources/images" var="imgPath" />
<spring:url value="/resources/js/remSet.js" var="remSetJs" />
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
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
<!-- iphone 手机默认全屏 -->
<meta name="apple-mobile-web-app-capable" content="yes" />
<!-- 取消数字被识别为电话号码 -->
<meta name="format-detection" content="telephone=no" />
<meta name="keywords" content="拍片网,视频播放,视频详情,影片播放,影片介绍">
<meta name="description"
	content="拍片网，汇聚千万影视行业创作者，是中国最大的视频交易平台。产品：宣传片、广告、微电影、动画、三维演示等视频，优势：创意免费、选择多、价格低、不满意无条件退款">
<title>${product.productName }|拍片网</title>

<link rel="shortcut icon" href="${imgPath }/favicon.ico">
<link rel="stylesheet" href="${playCss }">
<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
</head>
<body>
	<input type="hidden" id="storage_node"
		value="${file_locate_storage_path }" />
	<input type="hidden" id="videoId" value="${product.productId }" />
	<input type="hidden" id="videoName" value="${product.productName }" />
	<input type="hidden" id="videoUrl" value="${product.videoUrl }" />
	<input type="hidden" id="videoPoster" value="${product.picLDUrl }" />
	<input type="hidden" id="videoDesc" value="${product.pDescription }" />
	<input type="hidden" id="videoHret" value="${product.hret }" />
	<input type="hidden" id="teamId" value="${product.teamId }" />
	<input type="hidden" id="teamPhotoUrl" value="${product.teamPhotoUrl }" />
	<input type="hidden" id="serviceId" value="${product.serviceId }" />
	<input type="hidden" id="realPrice" value="${product.servicePrice }" />
	<input type="hidden" id="originalPrice"
		value="${product.serviceRealPrice }" />
	<input type="hidden" id="second" value="${product.mcoms }" />
	<input type="hidden" id="yk-play"
		value="<spring:url value="${product.hret}"/>" />
	<input type="hidden" id="tags" value="${product.tags }">
	<input type="hidden" id="csrftoken" name="csrftoken"
		value="${csrftoken}" />

	<div class="phoneHeader">
		<a id="openMenu"><img src="${imgPath }/index/toMenu.png"></a> 
		<a href="/searchview"> <img src="${imgPath}/index/toSearch.png"></a>
		<div>${product.productName}</div>
	</div>

	<jsp:include flush="true" page="menu.jsp"></jsp:include>

	<div class="model" id="orderSuccess">
		<div class="success">
			<img src="${imgPath}/index/success.png">
			<div>恭喜您下单成功</div>
			<div>视频管家将会在两个小时内与您沟通</div>
			<div>
				<a href="/">返回首页</a>
			</div>
			<div id="checkSuccess">确认</div>
		</div>
	</div>

	<div class="model" id="orderTo">
		<div class="showOrder">
			<div class="title">立即下单,对接制作团队</div>
			<div class="orderItem">
				<input placeholder="填写手机号" id="phoneNumber"
					style="height: 40px; width: 250px;">
				<div class="error" id="phoneCode">错误</div>
			</div>
			<div class="orderItem">
				<input placeholder="填写验证码" id="verificationCodeValue" type="text"
					style="height: 40px; width: 250px;">
				<div class="getCode" id="verification_code_recover_btn"
					style="height: 40px; width: 70px; font-size: 12px">发送验证码</div>
				<div class="error" id="codeError">错误</div>
			</div>
			<div class="submitOrder"
				style="height: 40px; width: 70px; font-size: 12px" id="submitOrder">确认提交</div>
				<img class="closeOrder" id="closeOrder" src="${imgPath }/index/close.png">
		</div>
	</div>



	<div class="pagePhone">
		<div class="videoShow">
			<video id="recomment-video" class="setVideo"
				preload="${imgPath}/index/index.jpg" muted>
				<source src="" id="playVideo" type="video/mp4">
			</video>
			<div id="video-play" class="video-play">
				<!-- video play -->
			</div>
		</div>
		<div class="videoTitle">${product.productName }</div>
		<div class="videoTag">
			<c:if test="${not empty product.tags }">
				<c:forEach items="${fn:split(product.tags,' ') }" var="tag">
					<div>${tag}</div>
				</c:forEach>
			</c:if>
		</div>
		<div class="videoPrice">¥${product.serviceRealPrice}</div>

		<!-- 影片简介 -->
		<div class="videoInfo">影片简介 Project Summary</div>
		<div class="videoContent">
			<div class="content">${product.teamDescription }</div>
			<div class="orderVideo">预约拍片</div>
			<a
				href="<spring:url value='/provider/info_${product.teamId }.html'/>">
				<div class="videoCompany">
					<div class="cLogo">
						<img id="teamPhoto" src="${imgPath}/index/test.png"> <img
							src="${imgPath}/index/true.png">
					</div>
					<div>${product.teamName}</div>
					<div>更多作品</div>
				</div>
			</a>
		</div>

		<!-- 相关推荐-->

		<div class="anli">
			<div class="title"></div>
			<div class="line"></div>
		</div>
		<div class="anliContent" id="anliContent">
			<!--       <div class="contentItem" style="background:url(/resources/images/index/index.jpg) no-repeat">
	                	 <div class="itemTitle">介影片简介标题要介影片简介标题要长介影片简介标题要长介影片简介标题要长介影片简介标题要长介影片简介标题要长介影片简介标题要长长</div>
	                     <div class="itemTag">介影片简介</div>
	             </div> -->

		</div>
		<a href="/search?q=*&industry=${product.tags}">
			<div class="moreAnli">更多相关推荐</div>
		</a>

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
	<script id="-mob-share"
		src="http://f1.webshare.mob.com/code/mob-share.js?appkey=8c49c537a706"></script>
	<script type="text/javascript" src="http://player.youku.com/jsapi"></script>
</body>
</html>