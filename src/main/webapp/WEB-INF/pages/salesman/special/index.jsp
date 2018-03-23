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
	<meta name="keywords" content="营销视频合集,宣传片样片,MG动画广告,品牌微电影">
	<meta name="description" content="拍片网特色专题，汇集营销视频合集、宣传片样片、MG动画广告、品牌微电影等优秀商业短视频。宣传片制作，广告片拍摄，MG动画视频尽在拍片网。">
	<meta name="baidu-site-verification" content="dMz6jZpIwd" />
	<title>营销视频合集-宣传片样片-MG动画广告-品牌微电影-拍片网</title>
	<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
	<script src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
	<link rel="stylesheet" href="/resources/lib/swiper/swiper.min.css">
	
	<link rel="stylesheet" href="/resources/css/salesman/special/index.css">

	<!-- imgPath -->
	<spring:url value="/resources/images" var="imgPath" />
	<link rel="shortcut icon" href="/resources/images/favicon.ico">
</head>


<body>
	<div class="phoneHeader">
	     <a id="openMenu"><img src="${imgPath }/index/toMenu.png"></a>
	     <a class='hide'><img src="${imgPath }/index/toSearch.png"></a>
	     <a href="/"><img class="ppwLogo" src="${imgPath}/index/logoH.png"></a>
	</div>
	<jsp:include flush="true" page="../../menu.jsp"></jsp:include>

<div class="pagePhone">

	<div class='first'>
		 <div class="swiper-container"  style="height: auto;width: 100%;">
			<div class="swiper-wrapper">
	    		<div class="swiper-slide">
		    		<a href='#'><img src="${imgPath}/salesMan/special/index/banner01.jpg" alt="互联网金融"/></a>  
	        	</div>
	        	<div class="swiper-slide">
					<a href='#'><img src="${imgPath}/salesMan/special/index/banner02.jpg" alt="区块链项目"/></a>
	        	</div>
	        	<div class="swiper-slide">
		    		<a href='#'><img src="${imgPath}/salesMan/special/index/banner03.jpg" alt="宣传片"/></a> 
	        	</div>
	    	</div>
   		</div> 
	</div>
 	
   	<div class='biao'>
   		<div class='hot'>热门频道</div>
   		<a href='https://m.apaipian.com/special/indexs.html'>更多   <img src="${imgPath}/salesMan/special/index/more.png" alt="更多"/> </a>
   	</div>
   	
   	<div class='hots'>
   		<div class="swiper-container"  style="height: auto;width: 100%;">
			<div class="swiper-wrapper">
	    		<div class="swiper-slide">
		    		<a href='https://m.apaipian.com/special/channel01.html'><img src="${imgPath}/salesMan/special/index/page1.png" alt="区块链"/></a>  
	        	</div>
	        	<div class="swiper-slide">
					<a href='https://m.apaipian.com/special/channel02.html'><img src="${imgPath}/salesMan/special/index/page2.png" alt="互联网金融"/></a>
	        	</div>
	        	<div class="swiper-slide">
		    		<a href='https://m.apaipian.com/special/channel03.html'><img src="${imgPath}/salesMan/special/index/page3.png" alt="发布会"/></a>  
	        	</div>
	        	<div class="swiper-slide">
					<a href='https://m.apaipian.com/special/channel04.html'><img src="${imgPath}/salesMan/special/index/page4.png" alt="投资"/></a>
	        	</div>
	        	<div class="swiper-slide">
		    		<a href='https://m.apaipian.com/special/channel05.html'><img src="${imgPath}/salesMan/special/index/page5.png" alt="医美"/></a>  
	        	</div>
	    	</div>
   		</div>
   		
   		<div class='block'>
   			<ul>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=%E4%BC%81%E4%B8%9A%E5%AE%A3%E4%BC%A0%E7%89%87'>企业宣传片</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=%E4%BA%A7%E5%93%81%E5%B9%BF%E5%91%8A'>产品广告</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&production=MG%E5%8A%A8%E7%94%BB'>MG动画</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=%E8%B7%AF%E6%BC%94%E8%A7%86%E9%A2%91'>路演视频</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=%E5%BE%AE%E7%94%B5%E5%BD%B1'>微电影</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=TVC'>TVC</a></li>
   				<li><a href='https://m.apaipian.com/search?q=*&industry=%E7%97%85%E6%AF%92%E8%A7%86%E9%A2%91'>病毒视频</a></li>
   			</ul>
   		</div> 
   	</div>

</div>

   	<!-- <div class='biao' style="background: #1C1A34;">
   		<div class='hot'>专题精选</div>
   		
   	</div> -->
   	
   	<!-- <div class='selection'>
   		<a class='models' href='#'>
   			<img class='eye' src="special/images/hot1.jpg" alt="一段故事一座城"/>
   			<div class='font'>
   				<span>一段故事一座城</span>
   			</div>
   		</a>
   		<a class='models' href='#'>
   			<img class='eye' src="special/images/hot2.jpg" alt="你，应当得到更多关注"/>
   			<div class='font'>
   				<span>你，应当得到更多关注</span>
   			</div>
   		</a>
   		<a class='models' href='#'>
   			<img class='eye' src="special/images/hot3.png" alt="温暖到快融化 圣诞节广告合集"/>
   			<div class='font'>
   				<span>温暖到快融化 圣诞节广告合集</span>
   			</div>
   		</a>
   		<a class='models' href='#'>
   			<img class='eye' src="special/images/hot4.jpg" alt="执着的心 笑着流泪"/>
   			<div class='font'>
   				<span>执着的心 笑着流泪</span>
   			</div>
   		</a>
   		<a class='models' href='#'>
   			<img class='eye' src="special/images/hot5.jpg" alt="搞笑，我们是认真的"/>
   			<div class='font'>
   				<span>搞笑，我们是认真的</span>
   			</div>
   		</a>
   		<a class='models' href='#'>
   			<img class='eye' src="special/images/hot6.jpg" alt="小鲜肉PK老腊肉"/>
   			<div class='font'>
   				<span>小鲜肉PK老腊肉</span>
   			</div>
   		</a>
   		<a class='models' href='#'>
   			<img class='eye' src="special/images/hot7.jpg" alt="一镜到底 | 玩的是炫酷 要的是惊艳"/>
   			<div class='font'>
   				<span>一镜到底 | 玩的是炫酷 要的是惊艳</span>
   			</div>
   		</a>
   		<a class='models' href='#'>
   			<img class='eye' src="special/images/hot8.jpg" alt="人生易老天难老 | 重阳节温情短片合集"/>
   			<div class='font'>
   				<span>人生易老天难老 | 重阳节温情短片合集</span>
   			</div>
   		</a>
   		<a class='models' href='#'>
   			<img class='eye' src="special/images/hot9.jpg" alt="恐怖短片合集 够胆你就来"/>
   			<div class='font'>
   				<span>恐怖短片合集 够胆你就来</span>
   			</div>
   		</a>
   		<a class='models' href='#'>
   			<img class='eye' src="special/images/hot10.jpg" alt="有一种情怀叫NBA"/>
   			<div class='font'>
   				<span>有一种情怀叫NBA</span>
   			</div>
   		</a>
   		<a class='models' href='#'>
   			<img class='eye' src="special/images/hot11.jpg" alt="决战双十一 电商视频大合集"/>
   			<div class='font'>
   				<span>决战双十一 电商视频大合集</span>
   			</div>
   		</a>
   		<a class='models' href='#'>
   			<img class='eye' src="special/images/hot12.jpg" alt="月满中秋夜 温暖异乡人"/>
   			<div class='font'>
   				<span>月满中秋夜 温暖异乡人</span>
   			</div>
   		</a>
   		<a class='models' href='#'>
   			<img class='eye' src="special/images/hot13.jpg" alt="居然还有这种操作"/>
   			<div class='font'>
   				<span>居然还有这种操作</span>
   			</div>
   		</a>
   		<a class='models' href='#'>
   			<img class='eye' src="special/images/hot14.jpg" alt="那些开出天际的脑洞"/>
   			<div class='font'>
   				<span>那些开出天际的脑洞</span>
   			</div>
   		</a>
   		<a class='model' href='#'>
   			<img class='eye' src="special/images/hot15.jpg" alt="一千零一夜"/>
   			<div class='font'>
   				<span>一千零一夜</span>
   			</div>
   		</a>
   		<a class='models' href='#'>
   			<img class='eye' src="special/images/hot16.jpg" alt="就按耍大牌 奢侈品广告视觉盛宴"/>
   			<div class='font'>
   				<span>就按耍大牌 奢侈品广告视觉盛宴</span>
   			</div>
   		</a>
   		<a class='models' href='#'>
   			<img class='eye' src="special/images/hot17.jpg" alt="老司机 带带我 放肆开车撩起来"/>
   			<div class='font'>
   				<span>老司机 带带我 放肆开车撩起来</span>
   			</div>
   		</a>
   		<a class='models' href='#'>
   			<img class='eye' src="special/images/hot18.jpg" alt="差点就信了 满满的全是套路"/>
   			<div class='font'>
   				<span>差点就信了 满满的全是套路</span>
   			</div>
   		</a>
   		
   	</div>
 -->
	 <jsp:include flush="true" page="../../foot.jsp"></jsp:include> 

    <script src="/resources/lib/jquery/jquery-2.0.3.min.js"></script>
 	 <script src="/resources/lib/swiper/swiper.min.js"></script> 
    <script src="/resources/js/common.js"></script>	
  
	<script src="/resources/js/salesman/special/jquery.SuperSlide.2.1.1.js"></script> 
    <script src="/resources/js/salesman/special/index.js"></script>
<!--     <script src="/resources/lib/swiper/swiper.animate1.0.2.min.js"></script> -->


</body>
</html>