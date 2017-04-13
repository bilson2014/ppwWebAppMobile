<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="r" uri="/mytaglib"%>

<%-- import CSS --%>
<spring:url value="/resources/css/play.css" var="playCss"/>

<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js" var="jqueryJs"/>
<spring:url value="/resources/lib/jquery/plugins.js" var="pluginJs"/>
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js" var="jsonJs"/>
<spring:url value="/resources/js/common.js" var="commonJs"/>
<spring:url value="/resources/js/youku-player.js" var="ykJs" />
<spring:url value="/resources/js/play.js" var="playJs"/>
<!-- img path -->
<spring:url value="/resources/images" var="imgPath" />
<spring:url value="/resources/js/remSet.js" var="remSetJs" />
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=9,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
	<!-- iphone 手机默认全屏 -->
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<!-- 取消数字被识别为电话号码 -->
	<meta name="format-detection" content="telephone=no" />
	<meta name="keywords" content="拍片网,视频播放,视频详情,影片播放,影片介绍">
	<meta name="description" content="拍片网，汇聚千万影视行业创作者，是中国最大的视频交易平台。产品：宣传片、广告、微电影、动画、三维演示等视频，优势：创意免费、选择多、价格低、不满意无条件退款">
	<title>${product.productName }</title>
	
	<link rel="shortcut icon" href="${imgPath }/favicon.ico" >
	<link rel="stylesheet" href="${playCss }">
	<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
</head>
<body>
<div class="model menu" id="menu">
	           <img class="menuBack" src="${imgPath}/menu/menuBack.jpg">
	           <div class="menuTop">
	                 
	                   <r:noLogin>
	                       <a href="/loginSele"><img class="userLogo" src="${imgPath}/menu/defultLogin.png"></a>
	                   </r:noLogin>
	                   <r:identity role="provider">
	                   <a ><img class="userLogo" src="${imgPath}/menu/defultLogin.png"></a>
	                    <img class="close" id="editInfo" src="${imgPath}/menu/edit.png">
	                  </r:identity>
	                  <r:identity role="customer">
	                      <a ><img class="userLogo" src="${imgPath}/menu/defultLogin.png"></a>
	                       <img class="close" id="editInfo" src="${imgPath}/menu/edit.png">
	                  </r:identity>
	                  <a href="/userInfo" class="hide" ><img class="edit"  src="${imgPath}/menu/editMenu.png"></a>
	                  <r:identity role="provider">
	                     <div>provider.phoneNumber</div>
	                  </r:identity>
	                  <r:identity role="customer">
	                     <div>user.phoneNumber</div>
	                  </r:identity>
	                  <r:noLogin>
	                      <div>未登录</div>
	                  </r:noLogin>
	           </div>
	           <div class="menuContent">
	                 <a href="/">
		                  <div class="menuItem">
		                       <img src="${imgPath}/menu/menu.png">
		                       <div>首页</div>
		                  </div>
	                 </a>
	                 <r:identity role="provider">
		                 <a href="/provider/index">
			                  <div class="menuItem">
			                       <img src="${imgPath}/menu/myPro.png">
			                       <div>我的项目</div>
			                  </div>
		                 </a>
		             </r:identity>
		             <r:identity role="customer">
		                 <a href="">
			                  <div class="menuItem">
			                       <img src="${imgPath}/menu/myPro.png">
			                       <div>我的项目</div>
			                  </div>
		                 </a>
		             </r:identity> 
		             <r:identity role="employee">
		                 <a href="/mgr/index">
			                  <div class="menuItem">
			                       <img src="${imgPath}/menu/myPro.png">
			                       <div>我的项目</div>
			                  </div>
		                 </a>
		             </r:identity>     
	                 <a href="/search?q=*">
		                  <div class="menuItem">
		                       <img src="${imgPath}/menu/editMenu.png">
		                       <div>精品案例</div>
		                  </div>
	                 </a>
	                 <a href="/phoneCost">
		                  <div class="menuItem">
		                       <img src="${imgPath}/menu/cost.png">
		                       <div>成本估算</div>
		                  </div>
	                 </a>
	                 <a href="/order-flow.html">
		                  <div class="menuItem">
		                       <img src="${imgPath}/menu/order.png">
		                       <div>服务流程</div>
		                  </div>
	                 </a>
	                    <a href="/about">
		                  <div class="menuItem">
		                       <img src="${imgPath}/menu/about.png">
		                       <div>关于我们</div>
		                  </div>
	                    </a>
	                 <a href="/news-list.html">
		                  <div class="menuItem">
		                       <img src="${imgPath}/menu/newsInfo.png">
		                       <div>新闻资讯</div>
		                  </div>
	                 </a>
	                    <a href="/member.html">
		                  <div class="menuItem">
		                       <img src="${imgPath}/menu/member.png">
		                       <div>团队介绍</div>
		                  </div>
	                 </a>
	                    <a class='hide'>
		                  <div class="menuItem">
		                       <img src="${imgPath}/menu/help.png">
		                       <div>帮助</div>
		                  </div>
	                    </a> 
	           </div>
	           <img class="closeMenu" id="closeMenu" src="${imgPath}/menu/cMenu.png">
	           <div class="showMore" id="showMore">
	                                 <div class="hide" id="showSafeSet">安全设置</div>
	                              <a><div class="loginOut">退出登录</div></a>
	           </div>
	           <div class="safeSet">
	                   <div class="safeTitle">安全设置</div>
			           <div class="safeItem">    
					       <div class="title">请输入原密码</div>
			               <input id="repwd">
			               <img class="orTrue" src="${imgPath}/menu/psTrue.png">
			               <img class="orError" src="${imgPath}/menu/psError.png">
			               <div class="error"></div>
		           	   </div>
		           	   <div class="safeItem">    
					       <div class="title">请输入密码</div>
			               <input id="newpwd">
			               <img class="orTrue" src="${imgPath}/menu/psTrue.png">
			               <img class="orError" src="${imgPath}/menu/psError.png">
			               <div class="error"></div>
		           	   </div>
		           	   <div class="safeItem">    
					       <div class="title">再次输入密码</div>
			               <input id="cpwd">
			               <img class="orTrue" src="${imgPath}/menu/psTrue.png">
			               <img class="orError" src="${imgPath}/menu/psError.png">
			               <div class="error"></div>
		           	   </div>
		           	   <div class="cancleBtn">取消</div>
		           	   <img class="safeClose" id="safeClose" src="${imgPath}/menu/cMenu.png">
	           </div>
	    </div>  
</body>
</html>