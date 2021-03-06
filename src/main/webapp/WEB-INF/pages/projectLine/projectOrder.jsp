<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="r" uri="/mytaglib"%>
<%-- import CSS --%>
<spring:url value="/resources/css/projectLine/projectOrder.css" var="projectOrderCss" />
<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js" var="jqueryJs" />
<spring:url value="/resources/js/common.js" var="commonJs" />
<spring:url value="/resources/js/projectLine/projectOrder.js" var="projectOrderJs" />
<spring:url value="/resources/lib/jquery.lazyload/lazysizes.min.js" var="lazyloadJs"/>
<spring:url value="/resources/images" var="imgPath" />

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
<title>专业商业视频服务－拍片网</title>
<script src="${jqueryJs }"></script>
<script src="${commonJs }"></script>
<script src="${scrollstopJs}"></script>
<script src="${lazyloadJs}"></script>

<link rel="stylesheet" href="${projectOrderCss}">
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
	    
	    <div class="phoneHeader">
		     <a id="openMenu"><img src="${imgPath }/index/toMenu.png"></a>
		     <img class="searchType" src="${imgPath}/projectLine/projectSet/moreChoose.png">
		     <div>图形动画</div>
	    </div>
			
	    <jsp:include flush="true" page="pTags.jsp"></jsp:include> 
	    
	    <div class="pagePhone" id="pagePhone">
	        <div class="title setMargin">时长<span>Length</span></div>
	        <div class="timeContent">
	            <div class="tItem active">
	                 <span>1分钟</span>
	                 <div>39800<span>元</span></div>
	            </div>
	            <div class="tItem">
	                 <span>1分钟</span>
	                 <div>39800<span>元</span></div>
	            </div>
	            <div class="tItem">
	                 <span>1分钟</span>
	                 <div>39800<span>元</span></div>
	            </div>
	             <div class="tItem">
	                 <span>1分钟</span>
	                 <div>39800<span>元</span></div>
	            </div>
	             <div class="tItem">
	                 <span>1分钟</span>
	                 <div>39800<span>元</span></div>
	            </div>
	             <div class="tItem ">
	                 <span>1分钟</span>
	                 <div>39800<span>元</span></div>
	            </div>
	        </div>
	        <div class="title">附加服务<span>Additional Services</span></div>
	        <div class="additional">
	             <div class="aItem">
	                 <img src="${imgPath}/projectLine/motion/test.jpg">
	                 <div class="itemContent">
	                      <div>打算打打三</div>
	                      <div>大叔大叔大</div>
	                      <div>打算打打三大所多大叔大婶大大所多</div>
	                 </div>
	            </div>
	            <div class="aItem">
	                 <img src="${imgPath}/projectLine/motion/test.jpg">
	                 <div class="itemContent">
	                      <div>打算打打三</div>
	                      <div>大叔大叔大</div>
	                      <div>打算打打三大所多大叔大婶大大所多</div>
	                 </div>
	            </div>
	            <div class="aItem">
	                 <img src="${imgPath}/projectLine/motion/test.jpg">
	                 <div class="itemContent">
	                      <div>打算打打三</div>
	                      <div>大叔大叔大</div>
	                      <div>打算打打三大所多大叔大婶大大所多</div>
	                 </div>
	            </div>
	            
	        </div>
	        
	        <div class="line"></div>
	            
	            <div class="showDes">
	              您选择了:[ dasda ]+[ dasda ]+[ dasda ]+[ dasda ]
	            </div>
	            <div class="showPrice">
	                 <span>总价格</span>
	                 <span>¥</span>
	                 <span>96800</span>
	            </div>
	            <div class="btnDiv">
	                   <div>上一步</div>
	                   <div>确认下单</div>
	            </div>
		    <jsp:include flush="true" page="../foot.jsp"></jsp:include> 
		    
	    </div>

 
</body>

<script src="${jqueryJs}"></script>
<script src="${projectOrderJs}"></script>

</html>