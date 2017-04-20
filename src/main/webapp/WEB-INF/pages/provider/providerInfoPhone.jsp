<%@page import="com.google.gson.JsonArray"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="r" uri="/mytaglib"%>

<%-- import CSS --%>
<spring:url value="/resources/lib/Bootstrap/css/bootstrap-alert.min.css"
	var="bootstrapAlertCss" />
<spring:url
	value="/resources/lib/Bootstrap/css/bootstrap-button.min.css"
	var="bootstrapButtonCss" />
<spring:url value="/resources/css/provider/providerInfoPhone.css"
	var="providerInfoPhoneCss" />

<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js"
	var="jqueryJs" />
<spring:url value="/resources/lib/jquery/plugins.js" var="pluginJs" />
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js"
	var="jsonJs" />
<spring:url value="/resources/js/common.js" var="commonJs" />
<spring:url value="/resources/js/imgLazyLoad.js" var="imgLazyLoadingJs" />
<spring:url value="/resources/js/provider/providerInfoPhone.js"
	var="providerInfoPhoneJs" />
<spring:url value="/resources/lib/jquery/waypoints.min.js"
	var="waypoints" />
<spring:url value="/resources/js/remSet.js" var="remSetJs" />

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
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
<!-- iphone 手机默认全屏 -->
<!-- iphone 手机默认全屏 -->
<meta name="apple-mobile-web-app-capable" content="yes" />
<!-- 取消数字被识别为电话号码 -->
<meta content="telephone=no" name="format-detection">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="keywords" content="拍片网,供应商">
<meta name="description"
	content="${provider.teamDescription}">
<title>${provider.teamName} | 拍片网</title>

<link rel="shortcut icon" href="${imgPath }/favicon.ico">
<link rel="stylesheet" href="${bootstrapAlertCss }">
<link rel="stylesheet" href="${bootstrapButtonCss }">
<link rel="stylesheet" href="${providerInfoPhoneCss}">

<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->


<!-- 加载Mob share 控件 -->
<script id="-mob-share"
	src="http://f1.webshare.mob.com/code/mob-share.js?appkey=8c49c537a706"></script>
<script type="text/javascript" src="http://player.youku.com/jsapi"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>

</head>
<body>
	<input type="hidden" id="storage_node" value="${file_locate_storage_path }" />
	<input type="hidden" id="action" value="${action}" />
	<input type="hidden" id="thirdLoginType" value="${thirdLoginType}" />
	<input type="hidden" id="uniqueId" value="${uniqueId}" />
	<input type="hidden" id="user_img" value="${provider.teamPhotoUrl}" />
	<input type="hidden" id="teamName" value="${provider.teamName }">

	

	<!--banner 区  -->
	<input type="hidden" id="teamId" value="${provider.teamId }">
	<input type="hidden" id="masterWorkProductId" value="${product.productId }">
	
	<div class="phoneHeader">
	     <a id="openMenu"><img src="${imgPath }/index/toMenu.png"></a>
	     <a id="toSearch"><img src="${imgPath }/index/toSearch.png"></a>
	      <a href="/"><img class="ppwLogo" src="${imgPath}/index/logoH.png"></a>
	</div>
	
	<jsp:include flush="true" page="../menu.jsp"></jsp:include>
	
   <div class="pagePhone">
	<div class="topHeader headAnimation">
		<ul>
			<li>
				<div class="infoHeadSide">
					<img class="infoHead" id="infoHead" src="">
				</div>
			</li>
			<li class="providerName">
			  <div class="nameSize">
				<div class="providerNames">${provider.teamName }</div> 
				<c:if test="${provider.flag == 2}">
					<div class="providerStatesRed states">未通过审核</div>
				</c:if> 
				<c:if test="${provider.flag == 0}">
					<div class="providerStatesRed states">审核中</div>
				</c:if> 
				<c:if test="${provider.flag == 1}">
					<div class="providerStates states">已认证</div>
				</c:if>
			 </div>	
			</li>
			<li class="providerPlace"><img class="place"
				src="${imgPath}/provder/place.png"></li>
			<li class="provinceCity"><div id="province">${provider.teamProvinceName }</div>
				<div class="circle"></div>
				<div id="city">${provider.teamCityName }</div></li>
		</ul>

	</div>

	 <!--说明区  -->

	<div class="introduce contentAnimation">
	    <div class="titleDes">导演简介</div> 
	    <div class="titleDesEn">Director profile</div> 
		<div class="introduceTitle">
		</div>
		
		<div class="introduceLine"></div>
	</div>

	<!-- 介绍区 -->

	<div class="providerInfo contentAnimation">
		${provider.teamDescription}</div>
<%-- 
	<%
		//add by wanglc 添加前段标签处理
		String providerTags = request.getAttribute("providerTags").toString();
		request.setAttribute("providerTag", providerTags.replaceAll("[\"\\[\\]]", ""));
	%>
	<!--标签区  -->
	<div class="tagBody contentAnimation">
		<c:forEach var="tags" items="${providerTag}" varStatus="status">
			<div class="card">
				<div class="controlCard">
					<div class="pencil"></div>
					<div class="cardWord">${tags}</div>
				</div>
			</div>
		</c:forEach>
	</div> --%>

	<div class="tagBody contentAnimation adb">
		<input type="hidden" id="id_tags" value='${providerTags}'>
	</div>

	<!--代表说明  -->
<%-- <c:if test="${! empty product}"> --%>
	<div class="introduce contentCard" >
	    <div class="titleDes">代表作</div> 
	    <div class="titleDesEn">Best-known Work</div> 
		<div class="introduceTitle"></div>
		<div class="introduceLine"></div>
	</div>
	 <c:if test="${product.teamId >0}">
		<a href="/play/${product.teamId}_${product.productId }.html">
			<div class="contentItem contentAnimation" style="background:url(${file_locate_storage_path}${product.picHDUrl}) no-repeat">
				                     <div class="itemTitle">${product.productName}</div>
				                     <div class="itemTag">
				                       <c:forEach items="${fn:split(fn:trim(product.tags),' ') }" var="tag" end="2" varStatus="stat">
												${tag} <c:if test="${!stat.last }">/</c:if>
									   </c:forEach>
				                     </div>
				                     <div class="itemBack"></div>
		    </div>
	    </a>
	 </c:if>   





	 <!--代表说明  -->
	<div class="introduce" >
		<div class="titleDes">更多作品</div> 
	    <div class="titleDesEn">Other works</div> 
		<div class="introduceTitle"></div>
		<div class="introduceLine"></div>
	</div>
	
	<div class="moreProduct" id="moreProduct">
<!-- 	<a>
		<div class="contentItem" style="background:url(/resources/images/index/index.jpg) no-repeat">
			                     <div class="itemTitle">介影片简介标题要介影片简介标题要长介影片简介标题要长介影片简介标题要长介影片简介标题要长介影片简介标题要长介影片简介标题要长长</div>
			                     <div class="itemTag">大大</div>
	    </div>
    </a> -->
        
	</div>
	
	<div class="findMore">
	    <div>查看更多视频</div>
	    <img src="${imgPath}/index/getMore.png">
	</div>
	
	
<!-- 	<div class="timeLine" id="timeLine" >
		<div id="productContent"></div>
		<div class="videoCardMore" id="redadMore">
			<div class="readMore">Read More</div>
		</div>
	</div> -->
<%-- </c:if>	 --%>
	<div class="bottomDiv" >
		<div class="infoTitle" id="description">
		来自全球56个城市,1562名导演已经加入
		</div>
		<div class="infoTitle" id="description">
		汇聚世界作品100000+
		</div>
		<div class="infoTitle" id="description">
		2000+客户在这里发布拍片需求
		</div>

		<div id="btn"> 
		
		
		<a href="/proRegister">
					<div class="checkBtn">
						加入我们
					</div>
	    </a>
		<%-- 	<r:noLogin>
				<a href="/proRegister">
					<div class="checkBtn">
						加入我们
					</div>
				</a>
			</r:noLogin>  --%>
<%-- 			<r:identity role="provider">
				<a href="/login/loginout">
					<div class="checkBtn">
						退出登录
					</div>
				</a>
			</r:identity> 
			<r:identity role="customer">
				<a href="/login">
					<div class="checkBtn">
						加入我们
					</div>
				</a>
			</r:identity> 
			<r:identity role="employee">
				<a href="/loginSele">
					<div class="checkBtn">
						加入我们
					</div>
				</a>
			</r:identity> --%>
		</div>
	</div>
	<jsp:include flush="true" page="../foot.jsp"></jsp:include> 
	
</div>	

<script src="${jqueryJs }"></script>
<script src="${pluginJs }"></script>
<script src="${jsonJs }"></script>
<script src="${waypoints }"></script>
<script src="${commonJs }"></script>
<script src="${providerInfoPhoneJs }"></script>
<script src="${imgLazyLoadingJs }"></script>
<script src="${remSetJs}"></script>

</body>
</html>