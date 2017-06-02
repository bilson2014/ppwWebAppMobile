<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="r" uri="/mytaglib"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- import CSS --%>
<spring:url value="/resources/css/projectLine/motion.css" var="motionCss" />
<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js"
	var="jqueryJs" />
<spring:url value="/resources/lib/jquery/plugins.js" var="pluginJs" />
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js" var="jsonJs"/>
<spring:url value="/resources/js/common.js" var="commonJs" />
<spring:url value="/resources/lib/jquery.lazyload/lazysizes.min.js" var="lazyloadJs"/>
<spring:url value="/resources/js/projectLine/motion.js" var="motionJs"/>
<spring:url value="/resources/js/projectLine/pCommon.js" var="pCommonJs"/>
<spring:url value="/resources/images" var="imgPath" />
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js" var="jsonJs"/>

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
<meta name="keywords" content="宣传片制作,产品宣传片制作,企业宣传片制作,微电影制作,MG动画制作">
<meta name="description" content="拍片网主营宣传片制作、微电影制作、MG动画制作等各种视频内容制作，拍片网是最大的企业视频内容制作平台。拍片就上拍片网！">
<title>${product.chanpinName}_拍片网标准产品线－拍片网</title>

<link rel="stylesheet" href="${motionCss}">
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
	<input type="hidden" id="productId" value="${product.chanpinId }">
	<jsp:include flush="true" page="../menu.jsp"></jsp:include> 
		<div class="phoneHeader">
		     <a id="openMenu"><img src="${imgPath }/index/toMenu.png"></a>
		     <img class="searchType choose" src="${imgPath}/projectLine/projectSet/moreChoose.png">
		     <div class="choose">${product.chanpinName}</div>
		     <a href="/product/${product.englishName }/set"><div class="toBuy">产品配置</div></a>
	    </div>
	    
	      <div class="headerTags">
           	 <a href="/product/${product.englishName }/main"><div class="active">产品概述</div></a>
	         <a href="/product/${product.englishName }/case"><div>全部案例</div></a>
	         <a href="/product/${product.englishName }/set"><div style="border:none">产品配置</div></a>
	  </div>
	    <div class="showType">
	         	<c:if test="${! empty productList}">
							<c:forEach items="${productList }" var="tag">
								 <c:if test="${product.chanpinName == tag.chanpinName }">
										<a><div class="active">${tag.chanpinName}</div></a>
								 </c:if>
								 <c:if test="${product.chanpinName != tag.chanpinName }">
										<a href="/product/${tag.englishName }/main"><div>${tag.chanpinName}</div></a>
								 </c:if>
							</c:forEach>
				</c:if>
	    </div> 
	    
	<div class="pagePhone" id="pagePhone">
		<div  id="bannerArray" class="hide">${product.chanpinBannerUrl }</div>
	    <div class="setImg"></div>
	    <div class="motion">
	          <div class="title">应用场景</div>    
	          <div class="mContent"  id="sceneView">
	          </div>
	    </div>
	    <!-- 优势 -->
	 <%--    <div class="pGood">
	         <div class="title">产品优势</div>
	         <div id="featureArray" class="hide">${product.chanpinFeature }</div>
	         <div class="pContent" id="featureView">
	               <div class="pItem">
	                   <img src='${imgPath }/projectLine/motion/test.jpg'>
	                   <div>大大大声道大大大声道大大大声道大大大声道</div>
	                   <div>大大大声道</div>
	               </div>
	               <div class="pItem">
	                   <img src='${imgPath }/projectLine/motion/test.jpg'>
	                   <div>大大大声道</div>
	                   <div>大大大声道</div>
	               </div>
	               <div class="pItem">
	                   <img src='${imgPath }/projectLine/motion/test.jpg'>
	                   <div>大大大声道</div>
	                   <div>大大大声道</div>
	               </div>
	               <div class="pItem">
	                   <img src='${imgPath }/projectLine/motion/test.jpg'>
	                   <div>大大大声道</div>
	                   <div>大大大声道</div>
	               </div>
	          </div>
	    </div> --%>
	    <!-- 应用案例 -->
	     <div class="exam">
	         <div class="title">应用案例</div>
	         <div class="eContent">
		     </div>    
	    </div>
	    	
		<jsp:include flush="true" page="../foot.jsp"></jsp:include> 
	</div>	
	
</body>

<script src="${jqueryJs}"></script>
<script src="${jsonJs}"></script>
<script src="${commonJs}"></script>
<script src="${pCommonJs}"></script>
<script src="${motionJs}"></script>
<script src="${lazyloadJs}"></script>

</html>