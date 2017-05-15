<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="r" uri="/mytaglib"%>
<%-- import CSS --%>
<spring:url value="/resources/css/projectLine/projectList.css" var="projectListCss" />
<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js" var="jqueryJs" />
<spring:url value="/resources/js/common.js" var="commonJs" />
<spring:url value="/resources/js/projectLine/projectList.js" var="projectListJs" />
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
<meta name="keywords" content="宣传片制作,产品宣传片制作,企业宣传片制作,微电影制作,MG动画制作">
<meta name="description" content="拍片网主营宣传片制作、微电影制作、MG动画制作等各种视频内容制作，拍片网是最大的企业视频内容制作平台。拍片就上拍片网！">
<title>拍片网  专业商业视频服务</title>
<link rel="stylesheet" href="${projectListCss}">
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
	    
	    <jsp:include flush="true" page="../menu.jsp"></jsp:include> 
			 <div class="headerCom">
				<a>
				 <img id="openMenu"  class="lazyload" data-src="/resources/images/index/toMenu.png">
				</a>
				<a href="/searchview">  
				 <img  class="lazyload" data-src="/resources/images/index/toSearch.png">
				</a> 
				<a>
				  <img class="ppwLogos lazyload" data-src="/resources/images/index/logoW.png">
				</a>
			</div>
		<jsp:include flush="true" page="../foot.jsp"></jsp:include> 
 
</body>

<script src="${jqueryJs }"></script>
<script src="${commonJs }"></script>
<script src="${projectListJs}"></script>
<script src="${lazyloadJs}"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
</html>