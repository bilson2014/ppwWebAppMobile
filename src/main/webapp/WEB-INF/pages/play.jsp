<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="r" uri="/mytaglib"%>
<%-- import CSS --%>
<spring:url value="/resources/css/play.css" var="playCss" />
<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js"
	var="jqueryJs" />
<spring:url value="/resources/lib/jquery/plugins.js" var="pluginJs" />
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js"
	var="jsonJs" />
<spring:url value="/resources/js/common.js" var="commonJs" />

<spring:url value="/resources/js/play.js" var="playJs" />
<!-- img path -->
<spring:url value="/resources/images" var="imgPath" />
<!DOCTYPE html>

<html class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=9,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
<!-- iphone 手机默认全屏 -->
<meta name="apple-mobile-web-app-capable" content="yes" />
<!-- 取消数字被识别为电话号码 -->
<meta name="format-detection" content="telephone=no" />
<meta name="keywords" content="${product.tags }">
<meta name="description"
	content="拍片网平台上覆盖企业形象宣传片、产品tvc广告片、品牌微电影、病毒视频、mg动画、专题片等各种视频。${product.pDescription }">
<title>${product.productName }-拍片网</title>

<link rel="shortcut icon" href="${imgPath }/favicon.ico">
<link rel="stylesheet" href="${playCss }">

<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
	
</head>
<script src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<body>
	 
	 <r:identity role="provider">
	    <input type="hidden" id="rolephone" value="1314520ppw" />
	    <input type="hidden" id="role" value="创作团队" />  
	    <input type="hidden" id="roletype" value="provider">                
	 </r:identity>
	 <r:identity role="customer">
	    <input type="hidden" id="rolephone" value="1314520ppw" />
	    <input type="hidden" id="role" value="客户" /> 
	    <input type="hidden" id="roletype" value="customer">        
	 </r:identity>
	 <r:identity role="employee">
	    <input type="hidden" id="role" value="内部员工" />
	    <input type="hidden" id="rolephone" value="1314520ppw" />
	    <input type="hidden" id="rolephoneImg" value="1314520ppw" />
	    <input type="hidden" id="roletype" value="employee">
	 </r:identity>
	 
	<input type="hidden" id="storage_node" value="${file_locate_storage_path }" />
	<input type="hidden" id="videoId" value="${product.productId }" />
	<input type="hidden" id="videoName" value="${product.productName }" />
	<input type="hidden" id="videoUrl" value="${product.videoUrl }" />
	<input type="hidden" id="videoPoster" value="${product.picLDUrl }" />
	<input type="hidden" id="videoDesc" value="${product.pDescription }" />
	<input type="hidden" id="videoHret" value="${product.hret }" />
	<input type="hidden" id="teamId" value="${product.teamId }" />
	<input type="hidden" id="teamPhotoUrl" value="${product.teamPhotoUrl }" />
	<input type="hidden" id="serviceId" value="${product.serviceId }" />
	<input type="hidden" id="realPrice" value="${product.servicePrice }" />
	<input type="hidden" id="originalPrice" value="${product.serviceRealPrice }" />
	<input type="hidden" id="second" value="${product.mcoms }" />
	<input type="hidden" id="tags" value="${product.tags }">
	<input type="hidden" id="csrftoken" name="csrftoken" value="${csrftoken}" />


	<div class="phoneHeader">
		<a id="openMenu"><img src="${imgPath }/index/toMenu.png"></a> 
		<a href="/list.html"> <img src="${imgPath}/index/toSearch.png"></a>
		<a href="/"><img class="ppwLogo" src="${imgPath}/index/logoH.png"></a>
	</div>

	<jsp:include flush="true" page="menu.jsp"></jsp:include>
	 <jsp:include flush="true" page="modelTool.jsp"></jsp:include> 

	<div class="model" id="orderSuccess">
		<div class="success">
			<img src="${imgPath}/index/success.png">
			<div id="showStatues">恭喜您下单成功</div>
			<div>视频管家将会在两个小时内与您沟通</div>
			<div><a href="/">返回首页</a></div>
			<div id="checkSuccess">确认</div>
		</div>
	</div>

	<div class="model" id="orderTo">
		<div class="showOrder">
			<div class="title">立即下单,对接制作团队</div>
			 <r:noLogin>
					<div class="orderItem">
						<input placeholder="填写手机号" id="phoneNumber"
							style="height: 40px; width: 250px;">
						<div class="error" id="phoneCode">错误</div>
					</div>
					<div class="orderItem">
						<input placeholder="填写验证码" id="verificationCodeValue" type="text"
							style="height: 40px; width: 250px;">
						<div class="getCode" id="verification_code_recover_btn"
							style="height: 40px; width: 70px; font-size: 12px">发送验证码</div>
						<div class="error" id="codeError">错误</div>
					</div>
			</r:noLogin>
			<div class="submitOrder" style="height: 40px; width: 70px; font-size: 12px" id="submitOrder">确认提交</div>
				<img class="closeOrder" id="closeOrder" src="${imgPath }/index/close.png">
		</div>
	</div>

	<div class="pagePhone">
		<div class="videoShow">
			<video  controls id="recomment-video" class="setVideo"> 
				 <source src="" id="playVideo" type="video/mp4">
			</video>
		</div>
		<div class="videoSet">
		   <div class="videoTitle">${product.productName }</div>
		   <r:identity role="employee">
			   <div class="videoSave" id="managerCollect">
			      <div id="showSave">已收藏</div>
			   </div>
		   </r:identity>
		</div>  
		<div class="videoTag">
			<c:if test="${not empty product.tags }">
				<c:forEach items="${fn:split(product.tags,' ') }" var="tag">
					<div>${tag}</div>
				</c:forEach>
			</c:if>
		</div>
		<r:identity role="employee">
			<c:if test="${product.serviceRealPrice != 0}">
		                    	<div class="videoPrice">￥${product.serviceRealPrice}</div>
		     </c:if>
			 <c:if test="${product.servicePrice == 0}">
		                    	<div class="videoPrice">￥欢迎询价</div>
		     </c:if>
	     </r:identity>
	     	             <r:identity role="provider">
	                	   <div class="videoPrice">￥欢迎询价</div>
	                	</r:identity>   
	                	<r:identity role="provider">
	                	   <div class="videoPrice">￥欢迎询价</div>
	                	</r:identity>
	                    <r:noLogin>
	                	   <div class="videoPrice">￥欢迎询价</div>
	                	</r:noLogin>

		<!-- 影片简介 -->
		<div class="videoInfo">影片简介 </div>
		<div class="videoEn">Project Summary</div>
		<div class="videoContent">
			<div class="content">${product.pDescription }</div>
			<div class="orderVideo">预约拍片</div>
			<c:if test="${teamFlag == 1 }">
				<a href="<spring:url value='/provider/info_${product.teamId }.html'/>">
					<div class="videoCompany">
						<div class="cLogo">
							<img id="teamPhoto" src="${imgPath}/index/test.png"> 
							<img src="${imgPath}/index/true.png">
						</div>
						<div>${product.teamName}</div>
						<div>更多作品</div>
					</div>
				</a>
			</c:if>
		</div>

		<!-- 相关推荐-->
		<div class="videoInfo">相关推荐 </div>
		<div class="videoEn">Recommended for you</div>
        <div class="videoLines"></div>
		<div class="anliContent" id="anliContent"></div>
		<a href="/search?q=*&industry=${product.tags}">
			<div class="moreAnli">更多相关推荐</div>
		</a>
		<jsp:include flush="true" page="foot.jsp"></jsp:include>
	</div>

	<script src="${jqueryJs }"></script>
	<script src="${pluginJs }"></script>
	<script src="${jsonJs }"></script>
	<script src="${commonJs }"></script>
	<script src="${playJs }"></script>

</body>
</html>