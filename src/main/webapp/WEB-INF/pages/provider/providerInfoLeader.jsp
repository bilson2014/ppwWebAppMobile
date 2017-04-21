<%@page import="com.google.gson.JsonArray"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%-- import CSS --%>
<spring:url value="/resources/lib/Bootstrap/css/bootstrap-alert.min.css"
	var="bootstrapAlertCss" />
<spring:url
	value="/resources/lib/Bootstrap/css/bootstrap-button.min.css"
	var="bootstrapButtonCss" />
<spring:url value="/resources/css/provider/providerInfoLeader.css"
	var="providerInfoLeaderCss" />
<spring:url value="/resources/lib/merge/iosSelect.css"
	var="iosSelectCss" />

<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js"
	var="jqueryJs" />
<spring:url value="/resources/lib/jquery/plugins.js" var="pluginJs" />
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js"
	var="jsonJs" />
<spring:url value="/resources/js/common.js" var="commonJs" />
<spring:url value="/resources/js/imgLazyLoad.js" var="imgLazyLoadingJs" />
<spring:url value="/resources/js/provider/providerInfoLeader.js"
	var="providerInfoLeaderJs" />
<spring:url value="/resources/lib/jquery/waypoints.min.js"
	var="waypoints" />
<spring:url value="/resources/lib/merge/iosSelect.js" var="iosSelectJs" />

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
<!-- iphone 手机默认全屏 -->
<meta name="apple-mobile-web-app-capable" content="yes" />
<!-- 取消数字被识别为电话号码 -->
<meta content="telephone=no" name="format-detection">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="keywords" content="拍片网下单,视频交易,广告购买,导演制作费,拍片下单">
<meta name="description"
	content="拍片网，汇聚千万影视行业创作者，是中国最大的视频交易平台。产品：宣传片、广告、微电影、动画、三维演示等视频，优势：创意免费、选择多、价格低、不满意无条件退款">
<title>导演注册流程 | 拍片网</title>

<link rel="shortcut icon" href="${imgPath }/favicon.ico">
<link rel="stylesheet" href="${bootstrapAlertCss }">
<link rel="stylesheet" href="${bootstrapButtonCss }">
<link rel="stylesheet" href="${providerInfoLeaderCss}">
<link rel="stylesheet" href="${iosSelectCss}">

<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
<script src="${jqueryJs }"></script>
<%-- <script src="${pluginJs }"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<script src="${imgLazyLoadingJs }"></script> --%>
<script src="${commonJs }"></script>
<script src="${jsonJs }"></script>
<script src="${iosSelectJs }"></script>
<script src="${providerInfoLeaderJs }"></script>

</head>
<body>

    <div class="errorDiv"  id="errorDiv" style="display: none;">error</div>

	<div class="model" id="orderSuccess">
	         <div class="success">
	            <img src="${imgPath}/index/success.png">
	            <div>提交完成等待审核</div>
	            <div><span id="lasttime">3</span>秒后跳转到导演主页</div>
	            <div id="checkSuccess">确认</div>
	         </div>
	</div>

    <div class="phoneHeader">
	     <a><img src="${imgPath }/index/toMenu.png"></a>
	     <a class="hide"><img src="${imgPath }/index/toMenu.png"></a>
	      <a href="/"><img class="ppwLogo" src="${imgPath}/index/logoH.png"></a>
	</div>
    
     <jsp:include flush="true" page="../menu.jsp"></jsp:include> 
    
    <div class="pagePhone">
    
            <div class="stepTopDiv">
              <div class="titleTop">
                    <span>*</span><label id="titleInfo">基本信息</label>
               </div> 
            </div>   
           <div class="stepOne">
               
               <div class="item">    
			       <div class="title">公司名称</div>
	               <input  id="company-name">
           	   </div>
           	   <div class="item">    
			       <div class="title">联系人</div>
	               <input  id="company-linkman">
           	   </div>
           	   <div class="item">    
			       <div class="title">微信号</div>
	               <input  id="company-webchat">
           	   </div>
           	   <div class="item">    
			       <div class="title">QQ</div>
	               <input  id="company-qq">
           	   </div>
           	   <div class="item">    
			       <div class="title">公司邮箱</div>
	               <input  id="company-email">
           	   </div>
           	   <div class="item area">    
			      	<div class="title">公司地址</div>
	                <textarea id="company-address"></textarea>
           	   </div>
           	   
           	   <div class="nextBtn" id="step1">下一步</div>
           </div>
           
           <div class="stepTwo hide">
                <div class="item">    
			      	<div class="title">所在省</div>
	                <div class="secondDiv">
			            <input readonly type="text" class="AddrSelector" id="sheng">
			            <input type="hidden" id="shengID">
			            <div class="up">
			              <img class="imgUD" src="${imgPath}/provider/select.png">
			            </div>
		          </div> 
           	   </div>
           	   
           	   <div class="item">    
			      	<div class="title">所在城市</div>
	                <div class="secondDiv">
			            <input readonly type="text" class="AddrSelector" id="shi">
			            <input type="hidden" id="shiID">
			            <div class="up">
			              <img class="imgUD" src="${imgPath}/provider/select.png">
			            </div>
		          </div> 
           	   </div>
           	   
           	    <div class="item">    
			      	<div class="title">价格区间</div>
	                <div class="secondDiv">
			            <input readonly type="text" data-id="10001" id="company-priceRange" value="看情况">
			            <input type="hidden" id="shiID">
			            <div class="up">
			              <img class="imgUD" src="${imgPath}/provider/select.png">
			            </div>
		          </div> 
           	   </div>
           	   
           	   <div class="item">    
			      	<div class="title">获知渠道</div>
	                <div class="secondDiv">
			            <input readonly type="text" data-id="1" id="company-infoResource" value="友情推荐">
			            <input type="hidden" id="shiID">
			            <div class="up">
			              <img class="imgUD" src="${imgPath}/provider/select.png">
			            </div>
		          </div> 
           	   </div>
               
               
		           <div class="step2BtnDiv">
		             <div id="returnStep">上一步</div>
		             <div id="step2">提交</div>
		          </div>
           
           </div>
    </div>
</body>
</html>