<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="r" uri="/mytaglib"%>
<%-- import CSS --%>
<spring:url value="/resources/lib/mMenu/jquery.mmenu.all.css"
	var="mmenuCss" />
<spring:url value="/resources/css/portal.css" var="portalCss" />

<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js"
	var="jqueryJs" />
<spring:url value="/resources/lib/jquery/plugins.js" var="pluginJs" />
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js" var="jsonJs"/>
<spring:url value="/resources/lib/jquery/jquery.flexslider-min.js" var="flexsliderJs" />
<spring:url value="/resources/lib/mMenu/jquery.mmenu.min.js"
	var="mmenuJs" />
<spring:url value="/resources/js/imgLazyLoad.js" var="imgLazyLoadingJs" />
<spring:url value="/resources/js/common.js" var="commonJs" />
<spring:url value="/resources/js/portal.js" var="portalJs" />
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
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<!-- iphone 手机默认全屏 -->
<meta name="apple-mobile-web-app-capable" content="yes" />
<!-- 取消数字被识别为电话号码 -->
<meta content="telephone=no" name="format-detection">
<meta name="keywords" content="拍片网,视频制作,手机拍片,手机视频,拍片">
<meta name="description"
	content="拍片网，汇聚千万影视行业创作者，是中国最大的视频交易平台。产品：宣传片、广告、微电影、动画、三维演示等视频，优势：创意免费、选择多、价格低、不满意无条件退款">
<title>拍片网</title>

<link rel="shortcut icon" href="${imgPath }/favicon.ico">
<link rel="stylesheet" href="${mmenuCss }">
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
<link rel="stylesheet" href="${portalCss }">
<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
<spring:url value="/resources/lib/requireJs/require.js" var="requireJs"/>
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
</head>
<body >
	<input type="hidden" id="storage_node" value="${file_locate_storage_path }" />
	<div class="footerBar">
		<div class="commonDiv">
			<r:noLogin>
				<a href="/login" target="_self">
					<ul>
						<li>
							<img src="/resources/images/portal/mySelf.png">
						</li>
						<li class="wordLeftRight"
							style="font-size:12px; text-shadow: none">登录
						</li>
					</ul>
				</a>
			</r:noLogin>
			<r:identity role="provider">
			
				<a href="<spring:url value='/provider/info_${sessionInfo.reqiureId}.html'/>">
					<ul>
						<li>
							<img src="/resources/images/portal/mySelf.png">
						</li>
						<li class="wordLeftRight"
							style="font-size:12px; text-shadow: none">我的</li>
					</ul>
				</a>
			</r:identity>
			<r:identity role="customer">
				<a href="/phone/user/index" target="_self">
					<ul>
						<li>
							<img src="/resources/images/portal/mySelf.png">
						</li>
						<li class="wordLeftRight"
							style="font-size:12px; text-shadow: none">我的</li>
					</ul>
				</a>
			</r:identity>
			<r:identity role="employee">
				<a href="/login/mgr/loginout" target="_self">
					<ul>
						<li>
							<img src="/resources/images/portal/loginOut.png">
						</li>
						<li class="wordLeftRight"
							style="font-size:12px; text-shadow: none">登出</li>
					</ul>
				</a>
			</r:identity>
		</div>


		<div class="commonDiv">

			<r:identity role="provider">
				
				<%-- <a href="<spring:url value='/provider/info_0.html'/>"> --%>
				<%-- <a href="<spring:url value='/author/${product.teamId}'/>"> --%>
				<a href="/provider/index" target="_self">
					<ul>
						<li><img src="/resources/images/portal/project.png"></li>
						<li class="wordMid" style="font-size: 12px; text-shadow: none">我的项目</li>
					</ul>
				</a>
			</r:identity>

			<r:identity role="employee">
				<a href="/mgr/index" target="_self">
					<ul>
						<li><img src="/resources/images/portal/project.png"></li>
						<li class="wordMid" style="font-size: 12px; text-shadow: none">我的项目</li>
					</ul>
				</a>
			</r:identity>

			<r:identity role="customer">
				<a href="<spring:url value="/direct/order"/>" target="_self">
					<ul>
						<li><img src="/resources/images/portal/order.png"></li>
						<li class="wordMid" style="font-size: 12px; text-shadow: none">我要拍片</li>
					</ul>
				</a>
			</r:identity>
			<r:noLogin>
				<a href="<spring:url value="/direct/order"/>" target="_self">
					<ul>
						<li><img src="/resources/images/portal/order.png"></li>
						<li class="wordMid" style="font-size: 12px; text-shadow: none">我要拍片</li>
					</ul>
				</a>
			</r:noLogin>
		</div>


		<div class="commonDiv">
		
			<a href="<spring:url value="/"/>" target="_self">
				<ul>
					<li><img src="/resources/images/portal/portalBg.png"></li>
					<li class="wordLeftRight"
						style="font-size: 12px; color:#fe5453; text-shadow: none">首页</li>
				</ul>
			</a> 
		</div>
	</div>


	<div class="wrap" >

		<div class="header" id="top">
			<!-- logo -->
			<dl class="header-ul">
				<dd>
					<a href="#menu">
						<div class="classify"></div>
					</a>
				</dd>
				<dd>
					<a href="/" target="_self">
						<div class="logo"></div>
					</a>
				</dd>
				<dd>
					<a href="/searchview" target="_self">
						<div class="search"></div>
					</a>
				</dd>
			</dl>
		</div>
		<nav id="menu">
			<ul id="menu-ul">
				<!-- <li><a href="javascript:void(0);">Home</a></li>
				<li><a href="#contact">Contact</a></li> -->
			</ul>
		</nav>

		<div class="flexslider-section" >
			<div class="flexslider-wrap">
				<!-- 轮播图 -->
				<div class="flexslider">
					<a href='<spring:url value="/direct/order"/>'>
						<ul class="slides">
							<li></li>
							<li></li>
							<li></li>
						</ul>
					</a>
				</div>
			</div>
		</div>

		<!-- 活动会场 -->
		<%-- <div class="activity-section">
			<div class="activity-guide">
				<h3>热门活动</h3>
				<div class="spilt-line"></div>
			</div>

			<div class="activity-content">
				<!-- 活动页面 -->
				<img src="${imgPath }/portal/activity.png" alt="活动专场_拍片网">
				<a href='<spring:url value="/active/12" />' target="_self">
					<img src="${imgPath }/active/d12/active-phone-12-entry.png" alt="双12专场_拍片网">
				</a>
			</div>
		</div> --%>

		<div class="video-section">
			<!-- 视频列表 -->
			<div class="recomment-line">
				<a href="javascript: void(0);">热门爆款</a>
			</div>

			<!-- 第一块视频区域 -->
			<div class="video-content" id="first-video-section">
				<%-- <div class="contain-row">
					<a href="<spring:url value='/play/7'/>">
						<div class="video-col">
							<div class="video-post">
								<img src="http://www.apaipian.com/product/img/product7-201510281611495342.jpg" alt="智能硬件专场_拍片网">
							</div>
							
							<div class="video-desc">
								<dl>
									<dt><h2>精致的智能硬件宣传影片</h2></dt>
									<dd>逼真的工业级渲染，家庭的使用场景展示，通过高科技的视觉元素渲染产品特点，完美呈现产品精致的一面，国际市场取得了惊人的销量。</dd>
									<dt><label>￥</label>56,880元<label class="doraction">113,760</label></dt>
									<dd><a href="<spring:url value='/play/7'/>"><div class="detail-btn">查看详情</div></a></dd>
								</dl>
							</div>
						</div>
					</a>
				</div> --%>
			</div>
			<div class="recomment-line">
				<a href="javascript: void(0);">经济型创业视频</a>
			</div>

			<!-- 第二块视频 -->
			<div class="video-content" id="second-video-section"></div>

			<div class="recomment-line">
				<a href="javascript: void(0);">高性价比企业视频</a>
			</div>

			<!-- 第三块视频区域 -->
			<div class="video-content" id="third-video-section"></div>
			
			<div class="recomment-line">
				<a href="javascript: void(0);">定制原创视频</a>
			</div>
			
			<!-- 第四块视频区域 -->
			<div class="video-content" id="forth-video-section"></div>
		</div>

		<div class="footer" style="height:200px" >
			<div class="footer-content">
				<div class="content-header" style="border-bottom: none;">
					<ul style="width:80%;margin:0 auto">
						<li style="text-align: left;"><a href="/member.html#0" style="text-aligin:left">关于我们</a></li>
						<li><a href="/order-flow.html">流程步骤</a></li>
						<li style="text-align: right;"><a href="/company-service.html" style="text-aligin:right">服务协议</a></li>
					</ul>
				</div>
					<div class="content-header" style="height:40px;">
					<ul style="width:80%;margin:0 auto">
						<li style="width:48%;text-align:left"> <a href="/mgr/login">视频管家登录</a></li>
						<li style="width:48%;text-align:right"><a href="tel:4006609728"><img src='/resources/images/portal/phone.png' style="width: 15px;position: relative;top: 3px;right: 5px;">400-660-9728</a></li>
					</ul>
				</div>
				<div class="content-footer" id="footer">
					<label>&copy; 2014 攀峰文化 京ICP备 14036662号-1</label>
				</div>
			</div>
		</div>
				
		<div class="checkPos">
		    <a class="hide" href="/#top" id="toTop">
		       <img src="/resources/images/portal/toTop.png">
		    </a>
		     <a href="/#footer" id="toFooter">
		        <img src="/resources/images/portal/toBot.png">
		    </a>
		</div>
	</div>
	

	 
	
</body>
<%-- <script src="${jqueryJs }"></script>
<script src="${pluginJs }"></script>
<script src="${flexsliderJs }"></script>
<script src="${jsonJs }"></script>
<script src="${imgLazyLoadingJs }"></script>
<script src="${commonJs }"></script>
<script src="${portalJs }"></script>
<script src="${mmenuJs }"></script> --%>
<!-- 加载Mob share 控件 -->
<!-- <script id="-mob-share"
	src="http://f1.webshare.mob.com/code/mob-share.js?appkey=8c49c537a706"></script> -->
	<script type="text/javascript" defer async="true" src="${requireJs }" data-main="resources/js/test/test"></script>
</html>