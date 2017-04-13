<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="r" uri="/mytaglib"%>
<%@ page import="java.lang.Integer"%>
<%@ page import="java.util.List"%>
<%-- <%@ page import="com.panfeng.film.resource.model.Solr"%> --%>

<%-- import CSS --%>
<spring:url value="/resources/lib/Bootstrap/css/bootstrap.min.css"
	var="bootstrapCss" />
<spring:url value="/resources/lib/mMenu/jquery.mmenu.all.css"
	var="mmenuCss" />
<spring:url value="/resources/css/search.css" var="searchCss" />

<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js"
	var="jqueryJs" />
<spring:url value="/resources/lib/jquery/plugins.js" var="pluginJs" />
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js"
	var="jsonJs" />
<spring:url value="/resources/lib/mMenu/jquery.mmenu.min.js"
	var="mmenuJs" />
<spring:url value="/resources/js/imgLazyLoad.js" var="imgLazyLoadingJs" />
<spring:url value="/resources/js/common.js" var="commonJs" />
<spring:url value="/resources/js/search.js" var="searchJs" />
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
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
<!-- iphone 手机默认全屏 -->
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="keywords" content="拍片网下单,视频交易,广告购买,导演制作费,拍片下单">
<meta name="description"
	content="拍片网，汇聚千万影视行业创作者，是中国最大的视频交易平台。产品：宣传片、广告、微电影、动画、三维演示等视频，优势：创意免费、选择多、价格低、不满意无条件退款">
<title>精品案例</title>

<link rel="shortcut icon" href="${imgPath }/favicon.ico">
<link rel="stylesheet" href="${bootstrapCss }">
<link rel="stylesheet" href="${mmenuCss }">
<link rel="stylesheet" href="${searchCss }">
<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
<%-- 
<script src="${imgLazyLoadingJs }"></script>
<script src="${pluginJs }"></script>
<script src="${jsonJs }"></script>
<script src="${mmenuJs }"></script>
<script src="${commonJs }"></script>
 --%>
</head>
<body>


	<input type="hidden" id="storage_node" value="${file_locate_storage_path }" />
	<div class="phoneHeader">
	     <a id="openMenu"><img src="${imgPath }/index/toMenu.png"></a>
	     <a href="/searchview">  
		  <img  src="${imgPath}/index/toSearch.png">
		 </a> 
	     <img class="searchType" src="${imgPath }/index/searchBox.png">
	     <div>精品案例</div>
	</div>
	
	 <jsp:include flush="true" page="menu.jsp"></jsp:include> 
	
	
	
	
	
	<div class="pagePhone">
	
	 <div class="searchBoxInit searchInit"> 
	 <div class="hideBox"></div>	
	<div class="searchBox searchInit">
	    <div class="searchItem">
		     <div class="typeTitle" id="typeTags">
		        <div>类型 :</div>
		        <img id="qType" src="${imgPath }/index/flow.png">
		     </div>
		     <div class="itemTags" id="typeTagsItem">
		    </div>    
		     <div class="itemTags noShow" id="typeTagsShow">
		    </div>   
	     </div>
	     
	     <div class="searchItem">
		     <div class="typeTitle" id="workTags">
		        <div>行业 :</div>
		        <img src="${imgPath }/index/flow.png" id="wType">
		     </div>
		     <div class="itemTags" id="workTagsItem">
		     </div>
		     <div class="itemTags noShow" id="workTagsShow">
		        
		    </div>
	     </div>
	     
	     <div class="searchItem noborder">
		     <div class="typeTitle">
		        <div>价格区间(元) :</div>
		     </div>
		     <div class="priceTags">
		           <div class="priceRate">
		               <input placeholder="最低价"  id="lowPrice" >最低价</input>
		               <div>  -  </div>
		               <input placeholder="最高价" id="heightPrice">最高价</input>
		           </div>
		           <div class="price">
		               <div data-low="0" data-content="30000" class="tagsPrice">0 ~ 3万</div>
		               <div data-low="30000" data-content="60000" class="tagsPrice">3 ~ 6万 </div>
		               <div data-low="60000" data-content="100000" class="tagsPrice">6 ~ 10万</div>
		               <div data-low="100000" class="tagsPrice">10万以上</div>
		           </div>
		     </div>
	     </div>
	</div>
	    <div class="checkBtn" id="checkBtn">
	        <div id="cancle">取消</div>
	        <div id="toSearch">完成</div>
	     </div>
</div>
	<div class="hideMenu">
    <c:if test="${!empty list}">
					<!-- not empty -->
	    <c:forEach items="${list }" var="solr" varStatus="status">
	     	<a href="<spring:url value='/play/${solr.teamId}_${solr.productId }.html'/>">
			   <div class="contentItem" style="background:url(${file_locate_storage_path }${solr.picLDUrl }) no-repeat">
			                     <div class="itemTitle">${solr.productName} / ${solr.productName}</div>
			                     <div class="itemTag">${solr.tags}</div>
			   </div>
		    </a>
	    </c:forEach>
	</c:if>
		    
    <jsp:include flush="true" page="foot.jsp"></jsp:include> 
	</div>	  
	</div>
	
 	
	
	 
	
	
	<script src="${jqueryJs}"></script>
	<script src="${remSetJs}"></script>
	<script src="${searchJs}"></script>
    <script src="${commonJs}"></script>
</body>
</html>