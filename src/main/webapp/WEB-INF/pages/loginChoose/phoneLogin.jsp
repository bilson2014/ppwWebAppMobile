<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%-- import CSS --%>
<spring:url value="/resources/lib/Bootstrap/css/bootstrap.min.css" var="bootstrapCss"/>
<spring:url value="/resources/css/common.css" var="commonCss"/>
<spring:url value="/resources/css/login/phoneLogin.css" var="phoneLoginCss"/>

<%-- import JS --%>
<spring:url value="/resources/js/login/phoneLogin.js" var="phoneLoginJs"/>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js" var="jqueryJs"/>
<spring:url value="/resources/lib/jquery/plugins.js" var="pluginJs"/>
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js" var="jsonJs"/>
<spring:url value="/resources/lib/Bootstrap/js/bootstrap.min.js" var="bootstrapJs"/>
<spring:url value="/resources/lib/cripto/aes.js" var="aesJs"/>
<spring:url value="/resources/lib/cripto/pad-zeropadding.js" var="padJs"/>
<spring:url value="/resources/js/common.js" var="commonJs"/>
<spring:url value="/resources/js/remSet.js" var="remSetJs" />


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
	<title>客户登录 | 拍片网</title>
	<link rel="shortcut icon" href="${imgPath}/favicon.ico" >
	<link rel="stylesheet" href="${bootstrapCss}">
	<link rel="stylesheet" href="${commonCss}">
	<link rel="stylesheet" href="${phoneLoginCss}">

	
	<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->

	
	
	<script src="${jqueryJs }"></script>
	<script src="${remSetJs }"></script>
	<script src="${pluginJs }"></script>
	<script src="${jsonJs }"></script>
	<script src="${bootstrapJs }"></script>
	<script src="${aesJs }"></script>
	<script src="${padJs }"></script>
	<script src="${commonJs }"></script>
	<script src="${phoneLoginJs }"></script>


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
	              
	          <div class="loginImg" >
	             <img src="${imgPath}/login/cus.png">
	         </div>
	         
	              <div class="loginTop" id="loginTop">
	                  <div id="phoneLogin">手机号登录</div>
	                  <div id="noPhoneLogin">账号登录</div>
	                  <div></div>
	              </div>
	              <div class="loginPhone " id="phoneLoginDiv">
			              <div class="loginItemPhone">
			                  <input placeholder="手机号"  id="user_phoneNumber">
			              </div>
			               <div class="loginItemPhone">
			                  <input id="kaptcha_code_user"  placeholder="图片验证码">
			                  <div class="image"><img alt="图片验证码" src="/login/kaptcha.png?41" id="kaptcha_pic" class="btn-validation"/></div> 
			              </div>
			               <div class="loginItemPhone">
			                  <input id="verification_code_user" placeholder="短信验证码">
			                  <div class="code"><button type="button" id="get_code_user" class="btn-get-validation" >点击获取</button></div>
			              </div>
			              <!-- <a href="/repwd" class="forgetPw"><div>忘记了密码?</div></a> -->
			              <div class="loginIng" id="submitBtn-user">登录</div>
			               <a href="/regSele"><div class="noLogin">还没有账号? 请<span>注册</span></div></a>
			         <%-- <div class="loginTitle">
			                   <div></div>
			                   <div>第三方登录</div>
			                   <div></div>
			              </div>
			              <div class="loginIcon">
			                 <img src="${imgPath}/login/qqp.png">
			                 <img src="${imgPath}/login/wbp.png">
			                 <img src="${imgPath}/login/wechatp.png">
			              </div> --%>
	              </div>
	              
	               <div class="loginPhone active" id="useLoginDiv">
			              <div class="loginItemPhone">
			                  <input placeholder="用户名" id="user_name">
			              </div>
			              <div class="loginItemPhone">
			                  <input placeholder="密码" type="password" id="user_pwd">
			              </div>
			             <!--  <a class="forgetPw"><div>忘记了密码?</div></a> -->
			              <div class="loginIng" id="submitBtn_user_name">登录</div>
			              <div class="noLogin">还没有账号? 请<span>注册</span></div>
	              </div>
	              
	         </div>
	         
	         
	         
	  </div>
		
	
</body>
</html>