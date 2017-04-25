<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="r" uri="/mytaglib"%>
<%-- import CSS --%>
<spring:url value="/resources/lib/Bootstrap/css/bootstrap.min.css"
	var="bootstrapCss" />
<spring:url value="/resources/css/common.css" var="commonCss" />
<spring:url value="/resources/css/company/member.css" var="memberCss" />
<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js"
	var="jqueryJs" />
<spring:url value="/resources/lib/jquery/plugins.js" var="pluginJs" />
<spring:url value="/resources/js/common.js" var="commonJs" />
<spring:url value="/resources/js/company/member.js" var="memberJs" />

<spring:url value="/resources/lib/jquery.scrollstop/jquery.scrollstop.min.js" var="scrollstopJs"/>
<spring:url value="/resources/lib/jquery.lazyload/lazysizes.min.js" var="lazyloadJs"/>

<!-- imgPath -->
<spring:url value="/resources/images" var="imgPath" />
<!DOCTYPE html>
<html class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=9,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
<meta name="keywords" content="拍片网团队,团队介绍,拍片网怎么样">
<meta name="description"
	content="拍片网是一个温暖和谐的大家庭，成员全部来自于影视和互联网行业的精英，致力于打造“影视工业化”流程规范">
<title>团队介绍 | 拍片网</title>
<link rel="shortcut icon" href="${imgPath}/favicon.ico">
<link rel="stylesheet" href="${bootstrapCss}">
<link rel="stylesheet" href="${commonCss}">
<link rel="stylesheet" href="${memberCss}">
<link rel="stylesheet" href="${mmenuCss}">
<style>
html {
	font-size: 16px
}
</style>

</head>
<body>
	<input type="hidden" id="storage_node"
		value="${file_locate_storage_path }" />
	<div class="phoneHeader">
		<a id="openMenu"><img src="${imgPath }/index/toMenu.png"></a> <a
			href="/searchview"> <img src="${imgPath}/index/toSearch.png">
		</a> <a href="/"><img class="ppwLogo" src="${imgPath}/index/logoH.png"></a>
	</div>

	<jsp:include flush="true" page="menu.jsp"></jsp:include>

	<div class="pagePhone">

		<video id="setVideo" preload="auto" controls="controls"
			poster="${imgPath }/company/poster.jpg" id="setVideo" src="${file_locate_storage_path}group1/M00/00/20/CgqNZViiqe2ANmqIAZ-Ai8Au-R8971.mp4"></video>

		<c:if test="${!empty list}">
			<c:forEach items="${list}" var="staff" varStatus="status">
				<div class="memberInfo">
					<div class="memberCard open checkOpen" id="${staff.staffId}">
						<div class="infoHeadSide contentImg${status.index}">
							<img class="infoHead lazyload" width="79" height="79"
								alt="${staff.staffName}_拍片网"
								src="/resources/images/icons/lazyloading2.png"
								<%-- data-original="<spring:url value='/staff/img${staff.staffImageUrl }'/>"> --%>
								data-src="${file_locate_storage_path}${staff.staffImageUrl }">
						</div>
						<ul class="contentWord${status.index}">
							<li>${staff.staffName}</li>
							<li>${staff.staffPosition}</li>
						</ul>
					</div>

					<div class="memberContent">
						<div class="memberContentInfo">
							<div class="share" data-id="${staff.staffId}"
								data-flag="${staff.staffName}"
								data-img="${file_locate_storage_path}${staff.staffImageUrl }">
								<c:if test="${staff.staffName == '张立虎'}">
									<img class="shareWx" src="${imgPath}/company/wx.png">
									<div style="display: none" id="showShare">
										<img class="shareImg" src="${imgPath}/company/hu.png"
											id="showSun">
									</div>
								</c:if>
								<c:if test="${staff.staffName == '夏攀'}">
									<img class="shareWx" src="${imgPath}/company/wx.png">
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
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>
		<jsp:include flush="true" page="foot.jsp"></jsp:include>
	</div>
	<script src="${jqueryJs }"></script>
	<script src="${pluginJs }"></script>
	<script src="${jsonJs }"></script>
	<script src="${commonJs }"></script>
	<script src="${memberJs}"></script>
	<script src="${scrollstopJs}"></script>
    <script src="${lazyloadJs}"></script>
	<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
</body>
</html>