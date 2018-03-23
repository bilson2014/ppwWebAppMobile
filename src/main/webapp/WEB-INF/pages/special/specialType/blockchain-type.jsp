<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="r" uri="/mytaglib"%>
<%-- import CSS --%>
<spring:url value="/resources/css/special/specialType/blockchain-type.css" var="blockchain" />
<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js" var="jqueryJs" />
<spring:url value="/resources/js/common.js" var="commonJs" />

<!-- imgPath -->
<spring:url value="/resources/images" var="imgPath" />
<spring:url value="/resources/images/special/specialType/blockchain-type" var="imgPathBt" />
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
<meta name="keywords" content="拍片成本报价,拍片陈本估算,拍片计算器,宣传片制作报价">
<meta name="description" content="拍片网平台致力于打造“影视工业化”行业标准，首家模块化成本定价，推出拍片成本计算器，随时了解视频制作价格。拍片就上拍片网！">
<title>成本计算 －拍片网</title>

<link rel="shortcut icon" href="${imgPath }/favicon.ico">
<link rel="stylesheet" href="${blockchain}">

<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
<script src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
</head>
<body>
    
	<div class="pagePhone">
			<div class="headerCom">
					<a>
					 <img src="${imgPathBt}/back.png">
					</a>				
					<a>
					  <img src="/resources/images/index/logoW.png">
					</a>
			</div>
	</div>
	
</body>


<script src="${jqueryJs }"></script>
<script src="${commonJs }"></script>
<script src="${phoneCostJs }"></script>

<!-- 加载Mob share 控件 -->
<script id="-mob-share"
	src="http://f1.webshare.mob.com/code/mob-share.js?appkey=8c49c537a706"></script>
</html>