<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%-- <%@ page import="com.panfeng.film.resource.model.User"%> --%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="r" uri="/mytaglib" %>
<%-- import CSS --%>
<spring:url value="/resources/lib/Bootstrap/css/bootstrap.min.css" var="bootstrapCss"/>
<spring:url value="/resources/css/common.css" var="commonCss"/>
<spring:url value="/resources/css/company/service.css" var="serviceCss"/>
<spring:url value="/resources/lib/mMenu/jquery.mmenu.all.css" var="mmenuCss"/>



<%-- import JS --%>

<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js" var="jqueryJs"/>
<spring:url value="/resources/lib/jquery/plugins.js" var="pluginJs"/>
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js" var="jsonJs"/>
<spring:url value="/resources/lib/Bootstrap/js/bootstrap.min.js" var="bootstrapJs"/>
<spring:url value="/resources/lib/mMenu/jquery.mmenu.min.js" var="mmenuJs"/>
<spring:url value="/resources/js/common.js" var="commonJs"/>
<spring:url value="/resources/js/imgLazyLoad.js" var="imgLazyLoadingJs"/>
<spring:url value="/resources/js/remSet.js" var="remSetJs" />


<!-- imgPath -->
<spring:url value="/resources/images" var="imgPath" />
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=9,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
	<meta name="keywords" content="">
	<meta name="description" content="">
	<title>服务流程</title>
	<link rel="shortcut icon" href="${imgPath}/favicon.ico" >
	<link rel="stylesheet" href="${bootstrapCss}">
	<link rel="stylesheet" href="${commonCss}">
	<link rel="stylesheet" href="${serviceCss}">
	<link rel="stylesheet" href="${mmenuCss}">
  


	<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->

	
	<script src="${jqueryJs }"></script>
	<script src="${remSetJs }"></script>
	<script src="${pluginJs }"></script>
	<script src="${jsonJs }"></script>
	<script src="${bootstrapJs }"></script>
	<script src="${commonJs }"></script>
	<script src="${imgLazyLoadingJs }"></script>
	<script src="${mmenuJs }"></script>
    
   
<style>

 html{
 font-size:16px}
</style>



<!-- 加载Mob share 控件 -->
<script id="-mob-share" src="http://f1.webshare.mob.com/code/mob-share.js?appkey=8c49c537a706"></script>
<script type="text/javascript" src="http://player.youku.com/jsapi"></script>
</head>
<body>


		
	<div class="phoneHeader">
	     <a id="openMenu"><img src="${imgPath }/index/toMenu.png"></a>
	     <a href="/searchview">  
		  <img  src="${imgPath}/index/toSearch.png">
		 </a> 
	     <div>服务流程</div>
	</div>
	
	<jsp:include flush="true" page="menu.jsp"></jsp:include>
		
	<div class="pagePhone">
		<video controls poster="/resources/images/banner/moreInfo.JPG">
		   <source  src="http://www.apaipian.com/product/video/paipianwangMovie.mp4"  id="source" type="video/mp4">
		</video>
<%-- 	<img src="${imgPath }/company/step1.png">
		<img src="${imgPath }/company/step2.png">
		<img src="${imgPath }/company/step3.png">
		<img src="${imgPath }/company/step4.png">
		<img src="${imgPath }/company/step5.png">
		<img src="${imgPath }/company/step6.png">
		<img src="${imgPath }/company/step7.png">
		<img src="${imgPath }/company/step8.png">
		<img src="${imgPath }/company/step9.png"> --%>
		<img class="stepImg" src="${imgPath }/company/step.png">
		
   
   
    <jsp:include flush="true" page="foot.jsp"></jsp:include> 
		     
	</div>	     
		
		
		
		
			 
		

</body>
</html>