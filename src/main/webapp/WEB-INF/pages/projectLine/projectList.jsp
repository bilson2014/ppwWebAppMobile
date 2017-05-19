<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="r" uri="/mytaglib"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- import CSS --%>
<spring:url value="/resources/css/projectLine/projectList.css" var="projectListCss" />
<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js" var="jqueryJs" />
<spring:url value="/resources/js/common.js" var="commonJs" />
<spring:url value="/resources/js/projectLine/projectList.js" var="projectListJs" />
<spring:url value="/resources/lib/jquery.lazyload/lazysizes.min.js" var="lazyloadJs"/>
<spring:url value="/resources/images" var="imgPath" />
<spring:url value="/resources/js/projectLine/pCommon.js" var="pCommon" />
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
<title>${product.chanpinName}_拍片网标准产品线</title>
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
           	 <a href="/product/${product.englishName }/main"><div>产品概述</div></a>
	         <a href="/product/${product.englishName }/case"><div class="active">全部案例</div></a>
	         <a href="/product/${product.englishName }/set"><div  style="border:none">产品配置</div></a>
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
	     <div class="setMargin"></div>
	    <c:if test="${! empty caseList.rows}">
				<c:forEach items="${caseList.rows }" var="tag">
					<a href='/play/${tag.product.teamId }_${tag.productId }.html'>
						<div class="listCard">
				             <img class="cardImg" src="${file_locate_storage_path }${tag.product.picLDUrl}">
				             <div class="cardContent">
				                    <div class="contentTitle">${tag.pName}</div>
							        <div class="contentDes">${tag.customerRestimonial}</div>
							        <img src="${imgPath}/projectLine/projectList/knowMore.png">
				              </div>
						</div>
					</a>
				</c:forEach>
			  </c:if>
	</div>    
	   
		<jsp:include flush="true" page="../foot.jsp"></jsp:include> 
 
</body>

<script src="${jqueryJs }"></script>
<script src="${commonJs }"></script>
<script src="${projectListJs}"></script>
<script src="${lazyloadJs}"></script>
<script src="${pCommon}"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
</html>