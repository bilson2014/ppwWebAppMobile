<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- img path -->
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
	<!-- iphone 手机默认全屏 -->
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<!-- 取消数字被识别为电话号码 -->
	<meta name="format-detection" content="telephone=no" />
	<meta name="keywords" content="拍片网,视频播放,视频详情,影片播放,影片介绍">
	<meta name="description" content="拍片网，汇聚千万影视行业创作者，是中国最大的视频交易平台。产品：宣传片、广告、微电影、动画、三维演示等视频，优势：创意免费、选择多、价格低、不满意无条件退款">
	<link rel="shortcut icon" href="${imgPath }/favicon.ico" >
	<link rel="stylesheet" href="${playCss }">
	<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
	<script src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
</head>
<body>

  <div class="footPhone">
		         <div class="leftContent">
		              <img class="logoFoot" src="${imgPath}/index/logoH.png">
		              <div class="footItem">
		                 <div class="service">服务热线  : </div>
		                 <div>400-660-9728</div>
		              </div>
		               <div class="footItem">
		                 <div class="cMail">公司邮箱  : </div>
		                 <div>bdmarket@paipianwang.cn</div>
		              </div>
		               <div class="footItem">
		                 <div class="cAddress">公司地址  : </div>
		                 <div class="differentItem">北京市朝阳区国贸建外SOHO东区6号楼25层</div>
		              </div>
		         </div>
		         <div class="rightContent">
		              <img src="${imgPath}/index/footCode.png">
		              <div>拍片网官微</div>
		         </div>
		         <div class="footBottom">
		              © 2016 北京拍片乐科技有限公司 京ICP备16066831号-1  
		              <br>百度统计 站长统计
		         </div>
  </div>
   
</body>
</html>