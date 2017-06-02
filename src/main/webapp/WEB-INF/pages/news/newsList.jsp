<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.paipianwang.pat.facade.information.entity.PmsNewsSolr"%> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="r" uri="/mytaglib" %>

<%-- import CSS --%>
<spring:url value="/resources/css/news/newsList.css" var="newsListCss"/>

<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js" var="jqueryJs"/>
<spring:url value="/resources/lib/jquery/plugins.js" var="pluginJs"/>
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js" var="jsonJs"/>
<spring:url value="/resources/js/common.js" var="commonJs"/>
<spring:url value="/resources/js/news/newsList.js" var="newsListJs"/>
<spring:url value="/resources/lib/jquery.scrollstop/jquery.scrollstop.min.js" var="scrollstopJs"/>
<!-- img path -->
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
	<!-- iphone 手机默认全屏 -->
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<!-- 取消数字被识别为电话号码 -->
	<meta name="format-detection" content="telephone=no" />
	<meta name="keywords" content="拍片网资讯,拍片网动态">
	<meta name="description" content="新闻资讯频道将提供拍片网的案例分享、企业动态、行业资讯等影视行业资讯。">
	<title>新闻资讯 －拍片网</title>
	
	<link rel="shortcut icon" href="${imgPath }/favicon.ico" >
	<link rel="stylesheet" href="${newsListCss }">
	<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
	<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
</head>
<body>
	<input type="hidden" id="storage_node" value="${file_locate_storage_path }" />
	<input type="hidden" value="${total }" id="total"/>
	<input type="hidden" id="q" value="${q}" />

	<div class="phoneHeader">
	     <a id="openMenu"><img src="${imgPath }/index/toMenu.png"></a>
	     <a class="hide"><img src="${imgPath }/index/toSearch.png"></a>
         <a href="/"><img class="ppwLogo" src="${imgPath}/index/logoH.png"></a>
	</div>
	
	<jsp:include flush="true" page="../menu.jsp"></jsp:include> 
	
	 <div class="newsTags">
	     <a href="/news-list.html"><div class="category active">全部</div></a>
	     <a href="/news-list.html?q=最热资讯"><div class="category" data-value="最热资讯">最热资讯</div></a>
	     <a href="/news-list.html?q=案例花絮"><div class="category" data-value="案例花絮">案例花絮</div></a>
	     <a href="/news-list.html?q=企业动态"><div class="category" data-value="企业动态">企业动态</div></a>
	     <a href="/news-list.html?q=行业资讯"><div class="category" data-value="行业资讯">行业资讯</div></a>
	     <a href="/news-list.html?q=佳片赏析"><div class="category" data-value="佳片赏析">佳片赏析</div></a>
	 </div>
	
       <div class="pagePhone">
	       
	       <div class='newsContent'>
	              <c:if test="${!empty list}">
	                    <c:forEach items="${list }" var="newsSolr">
	                        <a href="/news/article-${newsSolr.id}.html">
					             <div class="newsItem">
					                <img src="${file_locate_storage_path}${newsSolr.picLDUrl}" alt="${newsSolr.title}_拍片网" >
					                <div class="itemContent">
					                     <div>${newsSolr.title}</div>
					                     <div><fmt:parseDate value="${newsSolr.creationTime}" var="yearMonth" pattern="yyyy-MM-dd"/>
		                   					<fmt:formatDate value="${yearMonth}" pattern="yyyy年MM月dd日" />
		                   				</div>
					                </div>
					             </div>
				            </a> 
	                    </c:forEach>
	             </c:if>  
	             
	             <c:if test="${empty list}">
	                  <div class="noImg">
					         <img src="${imgPath }/index/noVideo.png">
					         <div>您找的新闻遗落在外星球了！</div>
	    			 </div>
	             </c:if>     
	            
	       </div>
	       <jsp:include flush="true" page="../foot.jsp"></jsp:include> 
       </div>

<script src="${jqueryJs }"></script>
<script src="${pluginJs }"></script>
<script src="${jsonJs }"></script>
<script src="${commonJs }"></script>
<script src="${scrollstopJs}"></script>
<script src="${newsListJs}"></script>

<!-- 加载Mob share 控件 -->
<script id="-mob-share" src="http://f1.webshare.mob.com/code/mob-share.js?appkey=8c49c537a706"></script>
</body>
</html>