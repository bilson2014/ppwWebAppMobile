<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=9,chrome=1">
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0,minimum-scale=1.0, user-scalable=no" name="viewport" />
	<meta name="keywords" content="小鲜肉pk老腊肉,明星广告片">
	<meta name="description" content="#小鲜肉PK老腊肉#明星广告片，你更喜欢哪一款？小鲜肉的演技一直备受争议，是否真相网上传言的那样演技和颜值不成正比呢？与其人云亦云不如看几个明星广告片短片用心感受一下。">
	<meta name="baidu-site-verification" content="dMz6jZpIwd" />
	<title>小鲜肉PK老腊肉_明星广告片-拍片网</title>
	<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
	<script src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
	<link rel="stylesheet" href="/resources/lib/swiper/swiper.min.css">
	<link rel="stylesheet" href="/resources/css/salesman/special/channel.css">


	<!-- imgPath -->
	<spring:url value="/resources/images" var="imgPath" />
	<spring:url value="file_locate_storage_path" var="image" />
	<link rel="shortcut icon" href="/resources/images/favicon.ico">
</head>


<body>
   
	<div class="phoneHeader">
	     <a id="openMenu"><img src="${imgPath }/index/toMenu.png" alt='菜单'></a>
	     <a class='hide'><img src="${imgPath }/index/toSearch.png"></a>
	     <a href="/"><img class="ppwLogo" src="${imgPath}/index/logoH.png" alt='logo'></a>
	</div>
	<jsp:include flush="true" page="../../menu.jsp"></jsp:include>
	

	<div class="pagePhone">			
		  <div class="setBanner">
		     <img src="${imgPath}/salesMan/special/page/page13.jpg" alt='小鲜肉PK老腊肉'>
		<!--    	 <a class="product" href='https://m.apaipian.com/product/EnterpriseMotionGraphics/main'>产品详情</a>
		     <div class="showVideo">视频介绍</div>  -->
		  </div>
		  <div class="title">
		       主题视频区
		  </div>
		  <div class="videoArea">
		       <a href="https://m.apaipian.com/play/1114_5674.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='吴亦凡-阿迪达斯' src="${image}/group1/M00/00/F9/CgpmTlq56r6AMxeyAAK0nBJ6Alo816.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">吴亦凡-阿迪达斯</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1910_20629.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='吴亦凡-72层奇楼' src="${image}/group1/M00/00/F7/Cgpw7Fq56x6ADWzcAAICvid1pHw089.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">吴亦凡-72层奇楼</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1115_5287.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='吴亦凡-有货Yoho' src="${image}/group1/M00/00/FA/CgpmTlq561CAGcKjAAGs2NNGEFs215.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">吴亦凡-有货Yoho</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1110_12243.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='李易峰-OPPO' src="${image}/group1/M00/00/C0/CgptuFq566OAbOZVAAF5ku60lN8930.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">李易峰-OPPO</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1116_10170.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='李易峰-QQ浏览器' src="${image}/group1/M00/00/F7/Cgpw7Fq569GAEVooAAGgHXip910254.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">李易峰-QQ浏览器</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1151_19613.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='李易峰-宜信' src="${image}/group1/M00/00/FA/CgpmTlq56_2AU1XuAAG-uC4tHgE585.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">李易峰-宜信</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1114_4675.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='胡歌-伯爵PIAGET' src="${image}/group1/M00/00/C0/CgptuFq57FOALywyAAC-Zm8vxFs128.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">胡歌-伯爵PIAGET</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1110_12297.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='胡歌-Sony' src="${image}/group1/M00/00/F7/Cgpw7Fq57HyAJLqkAAD14oIWuo0928.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">胡歌-Sony</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1113_7331.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='胡歌-Hyundai' src="${image}/group1/M00/00/C0/CgptuFq57NSAHPp7AAEo71PX5KE311.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">胡歌-Hyundai</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1114_6154.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='彭于晏-LEE 牛仔裤' src="${image}/group1/M00/00/F7/Cgpw7Fq57SSAXlyJAADv024pLfg699.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">彭于晏-LEE 牛仔裤</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1110_11818.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='彭于晏-Nikon' src="${image}/group1/M00/00/C0/CgptuFq57U-Aa1ckAAE6lVAJAyU837.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">彭于晏-Nikon</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1110_10975.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='彭于晏-伊利谷粒多' src="${image}/group1/M00/00/F7/Cgpw7Fq57YyASEIZAAEbDSTzgDM853.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">彭于晏-伊利谷粒多</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1169_3480.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='吴秀波-安居客' src="${image}/group1/M00/00/BE/CgpsbFq57cyAaGzXAAHS81kVYko802.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">吴秀波-安居客</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1110_12591.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='吴秀波-Dell' src="${image}/group1/M00/00/F7/Cgpw7Fq57haAW6mEAAErdQcmelo675.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">吴秀波-Dell</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		       <a href="https://m.apaipian.com/play/1325_15376.html"> 
		             <div class="videoCard">
		                  <img class="videoBanner" alt='吴秀波-因情圆缺' src="${image}/group1/M00/00/F7/Cgpw7Fq57pKAWqs7AAEYqOiIxQw398.jpg">
		                  <div class="modelG"></div>
		                  <div class="cardTitle">吴秀波-因情圆缺</div>
		                  <div class="cardDes"></div>
		             </div>
		       </a>
		      
		  </div>

  
    <jsp:include flush="true" page="../../foot.jsp"></jsp:include> 
    <script src="/resources/lib/jquery/jquery-2.0.3.min.js"></script>
    <script src="/resources/js/common.js"></script>	
    <script src="/resources/js/salesman/special/channel05.js"></script>
    

    

</body>
</html>