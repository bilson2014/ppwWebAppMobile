<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%-- import CSS --%>
<spring:url value="/resources/lib/Bootstrap/css/bootstrap.min.css" var="bootstrapCss"/>
<spring:url value="/resources/css/common.css" var="commonCss"/>
<spring:url value="/resources/css/login/register.css" var="registerCss"/>

<%-- import JS --%>
<spring:url value="/resources/js/login/proRegister.js" var="proRegisterJs"/>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js" var="jqueryJs"/>
<spring:url value="/resources/lib/jquery/plugins.js" var="pluginJs"/>
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js" var="jsonJs"/>
<spring:url value="/resources/lib/Bootstrap/js/bootstrap.min.js" var="bootstrapJs"/>
<spring:url value="/resources/lib/cripto/aes.js" var="aesJs"/>
<spring:url value="/resources/lib/cripto/pad-zeropadding.js" var="padJs"/>
<spring:url value="/resources/js/common.js" var="commonJs"/>
<spring:url value="/resources/js/remSet.js" var="remSetJs" />
<spring:url value="/resources/js/login/proRegister.js" var="proRegisterJs" />


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
	<meta name="keywords" content="拍片网,视频制作,拍广告,找导演,拍片">
	<meta name="description" content="拍片网，汇聚千万影视行业创作者，是中国最大的视频交易平台。产品：宣传片、广告、微电影、动画、三维演示等视频，优势：创意免费、选择多、价格低、不满意无条件退款">
	<title>导演注册|拍片网</title>
	<link rel="shortcut icon" href="${imgPath}/favicon.ico" >
	<link rel="stylesheet" href="${bootstrapCss}">
	<link rel="stylesheet" href="${commonCss}">
	<link rel="stylesheet" href="${registerCss}">

	
	<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
	<script src="${jqueryJs}"></script>
	<script src="${remSetJs}"></script>
	<script src="${pluginJs}"></script>
	<script src="${jsonJs}"></script>
	<script src="${bootstrapJs}"></script>
	<script src="${aesJs}"></script>
	<script src="${padJs}"></script>
	<script src="${commonJs}"></script>
	<script src="${proRegisterJs}"></script>

</head>
<body>

	<div class="phoneHeader">
	     <a id="openMenu"><img src="${imgPath }/index/toMenu.png"></a>
	     <a href="/searchview">  
		 <img  src="${imgPath}/index/toSearch.png">
		</a> 
	          <a href="/"><img class="ppwLogo" src="${imgPath}/index/logoH.png"></a>
	</div>
	
	 <jsp:include flush="true" page="../menu.jsp"></jsp:include> 
	
	<div class="errorDiv"  id="errorDiv" style="display: none;">error</div>
	
	  <div class="pagePhone">
	         <div class="cusLogin">
	              <div class="loginPhone " id="phoneLoginDiv">
			              <div class="loginItemPhone">
			                  <input placeholder="手机号"  id="user_phoneNumber">
			              </div>
			              <div class="loginItemPhone">
			                  <input id="kaptcha_code_user"  placeholder="图片验证码">
			                  <div class="image"><img alt="图片验证码" src="/login/kaptcha.png?41" id="kaptcha_pic_user" class="btn-validation"/></div> 
			              </div>
			               <div class="loginItemPhone">
			                  <input id="verification_code_user" placeholder="短信验证码">
			                  <div class="code"><button type="button" id="get_code_user" class="btn-get-validation" >点击获取</button></div>
			              </div>
			              <div class="loginIng" id="submitBtn-user">注册</div>
			              <a href="/loginSele"><div class="noLogin">已有账号? 请<span>登录</span></div></a>
	              </div>
	         </div>
	  </div>
		
	
</body>
</html>