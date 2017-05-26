<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%-- import CSS --%>
<spring:url value="/resources/css/manager/collect.css" var="managerCss" />
<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js"
	var="jqueryJs" />
<spring:url value="/resources/lib/jquery/plugins.js" var="pluginJs" />
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js"
	var="jsonJs" />
<spring:url value="/resources/js/common.js" var="commonJs" />
<spring:url value="/resources/js/manager/collect.js" var="collectJs" />
<spring:url value="/resources/js/manager/hammer.min.js" var="hamJs" />
<spring:url value="/resources/js/manager/slide2del.js" var="delJs" />
<!-- img path -->
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
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
<!-- iphone 手机默认全屏 -->
<meta name="apple-mobile-web-app-capable" content="yes" />
<!-- 取消数字被识别为电话号码 -->
<meta name="format-detection" content="telephone=no" />
<meta name="keywords" content="${news.title}">
<meta name="description"
	content="新闻资讯频道将提供拍片网的案例分享、企业动态、行业资讯等影视行业资讯。">
<title>${news.title} | 拍片网</title>

<link rel="shortcut icon" href="${imgPath }/favicon.ico">
<link rel="stylesheet" href="${managerCss }">
<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
</head>
<body>

 	<input type="hidden" id="storage_node" value="${file_locate_storage_path }" />
	<div class="phoneHeader">
		<a id="openMenu"><img src="${imgPath }/index/toMenu.png"></a> 
		<a class="hide" ><img src="${imgPath }/index/toSearch.png"></a>
		<a href="/"><img class="ppwLogo" src="${imgPath}/index/logoH.png"></a>
	</div> 
	
	    <jsp:include flush="true" page="../menu.jsp"></jsp:include>
        	      <div class="pagePhone">
        	          <c:if test="${!empty productList}">
		                         <c:forEach items="${productList }" var="solr" varStatus="status">
							           <div class="contentItem session-box">
							                  	
										          <img class="lazyload" src="${file_locate_storage_path }${solr.picLDUrl }">
										     
					        					    <c:if test="${solr.indentProjectId < 0 }">
												          <img class="roleImg" src="${imgPath }/video/roleOur.png">
													 </c:if>
													 <c:if test="${solr.indentProjectId > 0 }">
													      <img class="roleImg" src="${imgPath }/video/rolePlay.png">
													 </c:if>
													 <c:if test="${solr.indentProjectId == 0 }">
													      <img class="roleImg" src="${imgPath }/video/rolePro.png">
													 </c:if>
										         <div class="itemS">
								                     <div class="itemTitle">${solr.productName }</div>
								                     <div class="itemTag">
								                        <c:if test="${not empty fn:trim(solr.tags) }">
																<c:forEach items="${fn:split(fn:trim(solr.tags),' ') }" var="tag" end="2" varStatus="stat">
																	${tag} <c:if test="${!stat.last }">/</c:if>
																</c:forEach>
													    </c:if>
								                     </div>
								                     <div class="toProvider" data-value="<spring:url value='/provider/info_${solr.teamId }.html'/>">
								                       <c:if test="${not empty solr.teamFlag && solr.teamFlag != 4 }"> 
														              <img src="${file_locate_storage_path }${solr.teamPhotoUrl }">
														              <div  class="proName">${solr.teamName}</div>
												        </c:if> 
								                     </div>
							                     </div>
							                   	
							                       <div class="itemBack" data-value="<spring:url value='/play/${solr.teamId }_${solr.productId }.html'/>" target="_blank"></div>
							                      
							                     <div class="itemDel del-btn" id="${solr.productId}">删除</div>
										   </div>
         	     				 </c:forEach>  
				     </c:if> 
				     		<jsp:include flush="true" page="../foot.jsp"></jsp:include> 
				  </div>   
 


	<script src="${jqueryJs }"></script>
	<script src="${pluginJs }"></script>
	<script src="${jsonJs}"></script>
	<script src="${hamJs}"></script>
	<script src="${delJs}"></script>
	<script src="${collectJs}"></script>
	<script src="${commonJs }"></script>
</body>
</html>