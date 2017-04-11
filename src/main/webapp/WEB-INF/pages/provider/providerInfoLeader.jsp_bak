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
<title>信息填写</title>

<link rel="shortcut icon" href="${imgPath }/favicon.ico">
<link rel="stylesheet" href="${bootstrapAlertCss }">
<link rel="stylesheet" href="${bootstrapButtonCss }">
<link rel="stylesheet" href="${providerInfoLeaderCss}">
<link rel="stylesheet" href="${iosSelectCss}">

<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
<script src="${jqueryJs }"></script>
<script src="${pluginJs }"></script>
<script src="${jsonJs }"></script>
<script src="${commonJs }"></script>
<script src="${providerInfoLeaderJs }"></script>
<script src="${imgLazyLoadingJs }"></script>
<script src="${iosSelectJs }"></script>
</head>
<body>


       <div class="headerNew">
	             <a href="javascript:history.back(-1);">
		              <div class="leftHeader">
						 <div class="back"></div>
					  </div>	
				</a>	  
				
			  
			    <a href="<spring:url value="/"/>" target="_self">	  
			   	     <div class="midHeader">
						 <div class="logo"></div>
					 </div>
			    </a>		 
		     </div>
		     <div class="errorDiv"  id="errorDiv" style="display: none;">error</div>
		     <div class="stepImg"></div>
		     
		     <div class="step-bar" id="step-bar">
			      <div class="first">1.基本信息</div>
			      <div class="first">2.详细信息</div>
			      <div class="first">3.注册完成</div>
			  </div>
    
    <div class="step" id="step1">
	      <div class="contentInput">
		          <div class="firstDiv">
		              <span class="firstSpan">*</span>
		              <span class="secondSpan">公司名称</span>
		          </div>
		          <div class="secondDiv">
			            <input  id="company-name">
		          </div> 
		  </div>
		  <div class="contentInput">
		          <div class="firstDiv">
		              <span class="firstSpan">*</span>
		              <span class="secondSpan">联系人</span>
		          </div>
		          <div class="secondDiv">
			            <input id="company-linkman">
		          </div> 
		  </div> 
		  <div class="contentInput">
		          <div class="firstDiv">
		              <span class="firstSpan">*</span>
		              <span class="secondSpan">微信号</span>
		          </div>
		          <div class="secondDiv">
			            <input id="company-webchat">
		          </div> 
		  </div>
		    <div class="contentInput">
		          <div class="firstDiv">
		              <span class="firstSpan">*</span>
		              <span class="secondSpan">QQ</span>
		          </div>
		          <div class="secondDiv">
			            <input id="company-qq">
		          </div> 
		  </div> 
		    <div class="contentInput">
		          <div class="firstDiv">
		              <span class="firstSpan">*</span>
		              <span class="secondSpan">公司邮箱</span>
		          </div>
		          <div class="secondDiv">
			            <input id="company-email">
		          </div> 
		  </div>
		     <div class="contentInput contentHeight">
		          <div class="firstDiv">
		              <span class="firstSpan">*</span>
		              <span class="secondSpan">公司地址</span>
		          </div>
		          <div class="secondDiv">
			            <textarea id="company-address"></textarea>
		          </div> 
		  </div> 
		  
		  <div class="stepBtn1" id="stepBtn1">下一步</div>    
	</div>  
	
	   <div class="step hide" id="step2">
	      <div class="contentInput">
		          <div class="firstDiv">
		              <span class="firstSpan">*</span>
		              <span class="secondSpan" >所在省</span>
		          </div>
		          <div class="secondDiv">
			            <input readonly type="text" class="AddrSelector" id="sheng">
			            <input type="hidden" id="shengID">
			            <div class="up">
			              <img class="imgUD" src="${imgPath}/provider/select.png">
			            </div>
			           
		          </div> 
		  </div>
		  <div class="contentInput">
		          <div class="firstDiv">
		              <span class="firstSpan">*</span>
		              <span class="secondSpan">所在城市</span>
		          </div>
		          <div class="secondDiv">
			            <input readonly type="text" class="AddrSelector" id="shi">
			            <input type="hidden" id="shiID">
			             <div class="up">
			              <img class="imgUD" src="${imgPath}/provider/select.png">
			            </div>
		          </div> 
		  </div> 
		  <div class="contentInput">
		          <div class="firstDiv">
		              <span class="firstSpan">*</span>
		              <span class="secondSpan">价格区间</span>
		          </div>
		          <div class="secondDiv">
			            <input readonly type="text" data-id="10001" id="company-priceRange" value="看情况">
			            <div class="down">
			              <img class="imgUU" src="${imgPath}/manager/down.png">
			            </div>
		          </div> 
		  </div>
		    <div class="contentInput">
		          <div class="firstDiv">
		              <span class="firstSpan">*</span>
		              <span class="secondSpan">获知渠道</span>
		          </div>
		          <div class="secondDiv">
			            <input readonly type="text" data-id="1" id="company-infoResource" value="友情推荐">
			            <div class="down"><img class="imgUU" src="${imgPath }/manager/down.png"></div>
		          </div> 
		  </div> 
		  
		  
		    <div class="service">
		          <div class="firstDiv">
		              <span class="firstSpan">*</span>
		              <span class="secondSpan">业务范围</span>
		          </div>
		          <div class="content">
		             <div name="business" data-id="0">广告</div>	
		             <div name="business" data-id="7">MG动画</div>
		              <div name="business" data-id="10">VR拍摄</div>
		             <div name="business" data-id="1">宣传片</div>
		             <div name="business" data-id="2">真人秀</div>
		             <div name="business" data-id="5">电视栏目</div>	
		             <div name="business" data-id="6">三维动画</div>	
		             <div name="business" data-id="3">纪录片</div>	
		             <div name="business" data-id="9">专题片</div>	
		             <div name="business" data-id="4">病毒视频</div>
		             <div name="business" data-id="8">体育赛事</div>	
		             <div name="business" data-id="12">微电影</div>	
		             <div name="business" data-id="13">航拍</div>	
		             <div name="business" data-id="11">产品拍摄</div>	
		             <div name="business" data-id="14">活动视频</div>	
		             <div name="business" data-id="15">后期制作</div>	
		             <div name="business" data-id="16"> TVC</div>
		             <div name="business" data-id="17"> MV</div>
		             <div name="business" data-id="18"> 包装</div>
		             
		             			              
		          </div>
		    </div>
		  
		    <div class="contentInput contentHeight">
		          <div class="firstDiv">
		              <span class="firstSpan">*</span>
		              <span class="secondSpan">公司简介</span>
		          </div>
		          <div class="secondDiv">
			            <textarea id="company-teamDesc"></textarea>
		          </div> 
		  </div>
		  <div class="contentInput contentHeight">
		          <div class="firstDiv">
		              <span class="firstSpan">*</span>
		              <span class="secondSpan">公司规模</span>
		          </div>
		          <div class="secondDiv">
			            <textarea id="company-scale"></textarea>
		          </div> 
		  </div>
		 <div class="contentInput contentHeight">
		          <div class="firstDiv">
		              <span class="firstSpan">*</span>
		              <span class="secondSpan">对客户要求</span>
		          </div>
		          <div class="secondDiv">
			            <textarea id="company-demand"></textarea>
		          </div> 
		  </div> 
		  
		  <div class="bottomBot">
		     <div class="cancleBtn" id="cancleBtn">上一步</div>
		     <div class="sureBtn" id="sureBtn">确定</div>
		  </div>   
		  
		  <div style="width:100%;height:20px;"></div> 
	</div>  
	
	<div class="step hide" id="step3">
		<ul>
			<li><img src="/resources/images/provder/check.png" /></li>
			<li><span class="step-three-title">提交完成等待审核</span></li>
			<li class="stepThreeLi">登录网页端上传作品</li>	
			<li class="stepThreeLi" id="checkTo"><span class="step-three-time"
				id="lasttime">0</span> <span class="step-three-word">秒后自动到</span> <span
				class="step-three-word-top" id="to-top">供应商主页</span></li>
			
		</ul>
	</div>
	</div>

</body>
</html>