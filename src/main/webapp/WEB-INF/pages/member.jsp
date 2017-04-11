<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.paipianwang.pat.facade.user.entity.PmsUser"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="r" uri="/mytaglib"%>
<%-- import CSS --%>
<spring:url value="/resources/lib/Bootstrap/css/bootstrap.min.css"
	var="bootstrapCss" />
<spring:url value="/resources/css/common.css" var="commonCss" />
<spring:url value="/resources/css/company/member.css"
	var="memberCss" />
<spring:url value="/resources/lib/mMenu/jquery.mmenu.all.css"
	var="mmenuCss" />


<%-- import JS --%>

<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js"
	var="jqueryJs" />
<spring:url value="/resources/lib/jquery/plugins.js" var="pluginJs" />
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js"
	var="jsonJs" />
<spring:url value="/resources/lib/Bootstrap/js/bootstrap.min.js"
	var="bootstrapJs" />
<spring:url value="/resources/lib/mMenu/jquery.mmenu.min.js"
	var="mmenuJs" />
<spring:url value="/resources/js/imgLazyLoad.js" var="imgLazyLoadingJs" />
<spring:url value="/resources/js/common.js" var="commonJs" />
<spring:url value="/resources/js/company/member.js" var="memberJs" />





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
<meta name="keywords" content="">
<meta name="description" content="">
<title>拍片网团队</title>
<link rel="shortcut icon" href="${imgPath}/favicon.ico">
<link rel="stylesheet" href="${bootstrapCss}">
<link rel="stylesheet" href="${commonCss}">
<link rel="stylesheet" href="${memberCss}">
<link rel="stylesheet" href="${mmenuCss}">



<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->


<script src="${jqueryJs }"></script>
<script src="${imgLazyLoadingJs }"></script>
<script src="${pluginJs }"></script>
<script src="${jsonJs }"></script>
<script src="${bootstrapJs }"></script>
<script src="${commonJs }"></script>
<script src="${memberJs}"></script>
<script src="${mmenuJs }"></script>

<style>
html {
	font-size: 16px
}
</style>



<!-- 加载Mob share 控件 -->
<script id="-mob-share"
	src="http://f1.webshare.mob.com/code/mob-share.js?appkey=8c49c537a706"></script>
<script type="text/javascript" src="http://player.youku.com/jsapi"></script>
</head>
<body>
<input type="hidden" id="storage_node" value="${file_locate_storage_path }" />
	<div class="wrap">
		<div class="header">
			<!-- logo -->
			<dl class="header-ul">
				<dd>
					<a href="javascript:history.back(-1);">
						<div class="back"></div>
					</a>
				</dd>
				<dd>
					<a href="<spring:url value="/"/>" target="_self">
						<div class="logo"></div>
					</a>
				</dd>
				<dd>
					<a href="<spring:url value="/searchview"/>" target="_self">
						<div class="search"></div>
					</a>
				</dd>
			</dl>
		</div>




		<div class="title">关于我们</div>
		<c:if test="${!empty list}">
			<c:forEach items="${list}" var="staff" varStatus="status">
				<div class="memberInfo">

					<div class="memberCard open checkOpen" id="${staff.staffId}">


						<div class="infoHeadSide contentImg${status.index}">
							<img class="infoHead lazy" width="79" height="79"
								alt="${staff.staffName}_拍片网"
								src="/resources/images/icons/lazyloading2.png"
								<%-- data-original="<spring:url value='/staff/img${staff.staffImageUrl }'/>"> --%>
								data-original="${file_locate_storage_path}${staff.staffImageUrl }">
						</div>
						<ul class="contentWord${status.index}">
							<li>${staff.staffName}</li>
							<li>${staff.staffPosition}</li>
						</ul>
					</div>

					<div class="memberContent">
						<div class="memberContentInfo">
							<div class="text">${staff.staffDescription}</div>
							<div class="share" data-id="${staff.staffId}"
								data-flag="${staff.staffName}"
								data-img="${file_locate_storage_path}${staff.staffImageUrl }">
								<%--  <img class="-mob-share-qq" src="${imgPath}/company/qq.png"> --%>
								<c:if test="${staff.staffName == '张立虎'}">
									<img class="shareWx" src="${imgPath}/company/wx.png">
									<%--  <a href="https://www.linkedin.com/in/bin-sun-a3109018">
						                 	<img src="${imgPath}/company/in.png">
						                 </a> --%>
									<div style="display: none" id="showShare">
										<img class="shareImg" src="${imgPath}/company/hu.png"
											id="showSun">
									</div>
								</c:if>
								<c:if test="${staff.staffName == '夏攀'}">
									<img class="shareWx" src="${imgPath}/company/wx.png">
									<%--  <a href="https://www.linkedin.com/in/bin-sun-a3109018">
							                 	<img src="${imgPath}/company/in.png">
							                 </a> --%>
									<div style="display: none" id="showShare">
										<img class="shareImg" src="${imgPath}/company/xia.png"
											id="showSun">
									</div>
								</c:if>
								<c:if test="${staff.staffName == '孙彬'}">
									<img class="shareWx" src="${imgPath}/company/wx.png">
									<a href="https://www.linkedin.com/in/bin-sun-a3109018"> <img
										src="${imgPath}/company/in.png">
									</a>
									<div style="display: none" id="showShare">
										<img class="shareImg" src="${imgPath}/company/sun.png"
											id="showSun">
									</div>
								</c:if>
								<%--  <img class="-mob-share-weibo" src="${imgPath}/company/wb.png">
					                 <img class="-mob-share-qzone" src="${imgPath}/company/qqzone.png"> --%>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>

		<div class="topHeader">
			<ul>
				<li>作品如人品</li>
				<li><a href="<spring:url value='/order-flow.html'/>">
						<div class="btn-red-common">服务流程</div>
				</a></li>
			</ul>
		</div>
		<div class="topHeaderBottom"></div>


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
			
				<a href="<spring:url value='/provider/info_0.html'/>">
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
					<li><img src="/resources/images/portal/portal.png"></li>
					<li class="wordLeftRight"
						style="font-size: 12px;text-shadow: none">首页</li>
				</ul>
			</a> 
		</div>
	</div>
</body>
</html>