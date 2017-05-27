<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="r" uri="/mytaglib" %><%-- import CSS --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<spring:url value="/resources/lib/hwSlider/css/hwslider.css" var="hwsliderCss"/>
<spring:url value="/resources/css/activity/activity.css" var="activityCss"/>
<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js" var="jqueryJs"/>
<spring:url value="/resources/js/activity.js" var="activityJs"/>
<spring:url value="/resources/lib/swiper/swiper.min.js" var="swiperJs"/>
<spring:url value="/resources/lib/swiper/swiper-3.3.1.min.css" var="swiperCss"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>双十拍片节－拍片网</title>
<meta name="keywords"
	content="hwSlider滑动图片插件,jQuery触屏滑动轮播图片,hwSlider滑动焦点图演示" />
<meta name="description"
	content="hwSlider是一款支持移动设备轮播图片插件，支持的图片效果有焦点图轮播、图片和文字混搭。和我们之前分享的多图相册滑动flexslider插件http://www.sucaihuo.com/js/6.html类似。" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	
	<link type="text/css" rel="stylesheet" href="${activityCss}" />
    <link type="text/css" rel="stylesheet" href="${swiperCss}" />
    <script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
</head>
<body>

<div class="upload-window" id="toolbar-modal">      
     	 <div class="closeVideo">
     	  <button id="closeBtn" type="button" class="close" data-dismiss="modal" aria-label="Close"><span class="close-icon" aria-hidden="true">&times;</span></button>
        </div>
	         <div class="video-play-sections">
	        	<video controls id="recomment-video" autoplay src="" poster="" preload="auto" ></video>
	        </div>
        <div class="closeVideoBot" id="closeVideoBot"></div>
</div>

	<img src="/resources/images/activity/gr1.jpg"> 
	<a href='<spring:url value="/" />'>
		<img class="imgLeft" src="/resources/images/activity/btnLeft.jpg"></a> 
		<a href='<spring:url value="/order-flow.html" />'>
		<img class="imgRight" src="/resources/images/activity/btnRight.jpg"></a>
	<div class="swiper-container">
        <div class="swiper-wrapper" id="setHeight">
          <c:if test="${!empty products}">
                    <c:forEach items="${products }" var="product" varStatus="status">
                    	<c:if test="${status.index == 0 }">
                    		<div class="swiper-slide"id="ulHeight">
                    	</c:if>
                    	<c:if test="${status.index != 0 }">
                    		<div class="swiper-slide">
                    	</c:if>
		                    <div class="card">
		                        <div class="cardOutSide">
		                            <img class="cardImg" data-video-url="<spring:url value="${fn:substringAfter(product.videoUrl,'/portal') }"/>" src="<spring:url value="${fn:replace(fn:substringAfter(product.picLDUrl,'/portal'),'image','img') }"/>" name="openVideo" data-value="222">
		                                <div class="cardInfo">
		                                    <div class="title" name="title">${product.productName }</div>
		                                    <div class="content">${product.pDescription }</div>
		                                    <div class="price">
		                                        <label>特惠:￥<fmt:formatNumber type="number" value="${product.serviceRealPrice }" maxFractionDigits="0"/>  </label>
		                                        <span><span class="reprice">原价</span>:￥<fmt:formatNumber type="number" value="${product.servicePrice }" maxFractionDigits="0"/>  </span>
		                                    </div>
		                                    <a href='<spring:url value="/activity/order/${product.productId }" />'>
		                                    <div class="toFind">立即下单</div>
		                                    </a>
		                                </div>
		                        </div>
		                    </div>
		                </div>
                    </c:forEach>
                </c:if> 
        </div>
         <div class="swiper-pagination"></div>
    </div>
		
		<div class="info">
           <label>活动说明&nbsp&nbsp:<br></label>
           <label>"双十"拍片节是拍片网2016年力度最大的促销活动,所有符合以下条件的客户都将获得拍片<span>8折优惠</span>&nbsp&nbsp:<br></label>
           <label class="position"><div></div>在2016年10月10日当天通过系统下单<br></label>
		   <label class="position"><div></div>在2016年10月18日之前完成付款<br></label>
		   <label class="position"><div></div>每个客户只有一次优惠机会<br></label>
		   <label class="position"><div></div>此优惠不与其他任何促销优惠同享<br></label>
		   <label class="position">*以上最终解释权归拍片网所有<br></label>
		</div>
</body>
</html>
	<script type="text/javascript" src="${jqueryJs }"></script>
	<script type="text/javascript" src="${swiperJs }"></script>
	<script type="text/javascript" src="${activityJs }"></script>

