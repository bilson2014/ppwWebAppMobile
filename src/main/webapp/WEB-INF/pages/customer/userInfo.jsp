<%@page import="com.google.gson.JsonArray"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="r" uri="/mytaglib"%>

<%-- import CSS --%>
<spring:url value="/resources/lib/Bootstrap/css/bootstrap-alert.min.css"
	var="bootstrapAlertCss" />
<spring:url
	value="/resources/lib/Bootstrap/css/bootstrap-button.min.css"
	var="bootstrapButtonCss" />
<spring:url value="/resources/css/customer/userInfo.css"
	var="userInfoCss" />
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
<spring:url value="/resources/js/customer/userInfo.js"
	var="userInfoJs" />
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
<title>信息填写</title>

<link rel="shortcut icon" href="${imgPath }/favicon.ico">
<link rel="stylesheet" href="${bootstrapAlertCss }">
<link rel="stylesheet" href="${bootstrapButtonCss }">
<link rel="stylesheet" href="${userInfoCss}">
<link rel="stylesheet" href="${iosSelectCss}">

<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
	
<script src="${jqueryJs}"></script>
<script src="${commonJs}"></script>
<script src="${jsonJs}"></script>
<script src="${iosSelectJs}"></script>
<script src="${userInfoJs}"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
</head>
<body>

    <div class="errorDiv"  id="errorDiv" style="display: none;">error</div>

	<div class="model" id="orderSuccess">
	         <div class="success">
	            <img src="${imgPath}/index/success.png">
	            <div>提交完成审核</div>
	            <div><span id="lasttime">3</span>秒后跳转到供应商主页</div>
	            <div id="checkSuccess">确认</div>
	         </div>
	</div>

    <div class="phoneHeader">
	     <a><img src="${imgPath }/index/toMenu.png"></a>
	     <a href="/searchview">  
		 <img  src="${imgPath}/index/toSearch.png">
		</a> 
	     <div>个人信息</div>
	</div>
	
	 <jsp:include flush="true" page="../menu.jsp"></jsp:include> 
    
    <div class="pagePhone">
    
            <div class="pageheader">
                <div>
                   <img src="${imgPath}/menu/defultLogin.png">
                </div>   
                  <div href="javascript:;" class="file">选择文件
                      <input type="file" name="" id="">
                  </div>
            </div>
            
            <div class="stepTopDiv">
              <div class="titleTop">
                    <img src="${imgPath}/menu/info.png"><label id="titleInfo">基本信息</label>
               </div> 
            </div>
           
           <div class="stepOne">    
               <div class="item">    
			       <div class="title">昵称</div>
	               <input  id="userName" value="${user.userName }">
           	   </div>
           	   <div class="item">    
			       <div class="title">公司名称</div>
	               <input  id="company-name" value="${user.userCompany }">
           	   </div>
           	   <div class="item">    
			       <div class="title">真实姓名</div>
	               <input  id="realName" value="${userinfo.realName}">
           	   </div>
           	   <div class="item">    
			       <div class="title">电子邮件</div>
	               <input  id="company-email" value="${userinfo.email}">
           	   </div>
           	   <div class="item">    
			       <div class="title">QQ</div>
	               <input  id="company-qq" vale="${userinfo.qq}">
           	   </div>
           	   
           	   <div class="titleTop">
                    <img src="${imgPath}/menu/def.png"><label id="titleInfo">安全信息</label>
               </div> 
               
                <div class="item">    
			       <div class="title">用户名</div>
	               <input  id="loginName" value="${userinfo.loginName}">
           	   </div>
           	   
           	    <div class="item">    
			       <div class="title">手机号码</div>
	               <input  id="telephone" value="${userinfo.telephone }">
           	   </div>
           	   
           	   <div class="nextBtn" id="upDateInfo">保存</div>
           </div>
        </div>
</body>
</html>