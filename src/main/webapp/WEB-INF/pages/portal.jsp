<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="r" uri="/mytaglib"%>
<%-- import CSS --%>
<spring:url value="/resources/lib/mMenu/jquery.mmenu.all.css"
	var="mmenuCss" />
<spring:url value="/resources/css/portal.css" var="portalCss" />
<spring:url value="/resources/lib/swiper/swiper-3.3.1.min.css" var="swiperCss" />
<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js"
	var="jqueryJs" />
<spring:url value="/resources/lib/jquery/plugins.js" var="pluginJs" />
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js" var="jsonJs"/>
<spring:url value="/resources/lib/jquery/jquery.flexslider-min.js"
	var="flexsliderJs" />
<spring:url value="/resources/lib/mMenu/jquery.mmenu.min.js"
	var="mmenuJs" />
<spring:url value="/resources/js/imgLazyLoad.js" var="imgLazyLoadingJs" />
<spring:url value="/resources/js/common.js" var="commonJs" />
<spring:url value="/resources/js/portal.js" var="portalJs" />
<spring:url value="/resources/js/remSet.js" var="remSetJs" />
<spring:url value="/resources/lib/swiper/swiper.min.js" var="swiperJs" />
<spring:url value="/resources/lib/jquery/waypoints.min.js" var="waypointsJs" />
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
<meta name="keywords" content="宣传片制作,企业宣传片,拍片网,广告片制作,微电影制作,企业微电影">
<meta name="description" content="拍片网是一个视频内容制作服务平台，主营宣传片制作和微电影制作，三大优势：免费创意策划、72小时出片、不满意全额退款或重拍。拍片就上拍片网">
<title>宣传片制作_拍片网-企业视频内容制作平台</title>

<link rel="shortcut icon" href="${imgPath }/favicon.ico">
<link rel="stylesheet" href="${mmenuCss }">
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
<link rel="stylesheet" href="${portalCss }">
<link rel="stylesheet" href="${swiperCss }">


<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->

</head>
<body>
	<input type="hidden" id="storage_node" value="${file_locate_storage_path }" />
<%-- 	<img class="indexBack" src="${imgPath}/index/index.jpg"> --%>
	
	<div class="model" id="orderSuccess">
	         <div class="success">
	            <img src="${imgPath}/index/success.png">
	            <div>恭喜您下单成功</div>
	            <div>视频管家将会在两个小时内与您沟通</div>
	            <div><a href="/">返回首页</a></div>
	            <div id="checkSuccess">确认</div>
	         </div>
	</div>
	
		<div class="model" id="showVideo">
			<div class="closeVideo">
	     	  <button id="closeBtn" type="button" class="close" data-dismiss="modal" aria-label="Close"><span class="close-icon" aria-hidden="true">&times;</span></button>
	        </div>
			<div class="video-play-sections">
			      <%--  <video controls="" loop="" poster="${imgPath}/index/moreInfo.JPG" name="media" id="header3Video" class="active"> 
			         <source src="http://www.apaipian.com/product/video/paipianwangMovie.mp4" id="source" type="video/mp4">
			       </video> --%>
		    </div> 
	    </div>
	    
	    
	    <jsp:include flush="true" page="menu.jsp"></jsp:include> 
	    
	    <%-- <div class="model menu" id="menu">
	           <img class="menuBack" src="${imgPath}/menu/menuBack.jpg">
	           <div class="menuTop">
	                  <a href="/loginSele"><img class="userLogo" src="${imgPath}/menu/defultLogin.png"></a>
	                  <img class="close" id="editInfo" src="${imgPath}/menu/edit.png">
	                  <a href="/userInfo" ><img class="edit"  src="${imgPath}/menu/editMenu.png"></a>
	                  <div>昵称</div>
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
	                 <a href="/search?q=&sortord=0&item=*">
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
	                 <a href="/newsInfo">
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
	                    <a>
		                  <div class="menuItem">
		                       <img src="${imgPath}/menu/help.png">
		                       <div>帮助</div>
		                  </div>
	                    </a> 
	           </div>
	           <img class="closeMenu" id="closeMenu" src="${imgPath}/menu/cMenu.png">
	           <div class="showMore" id="showMore">
	                                 <div id="showSafeSet">安全设置</div>
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
	    </div>   --%>
	    
	 <div class="headerCom">
		<a>
		 <img id="openMenu" src="${imgPath}/index/toMenu.png">
		</a>
		<a href="/searchview">  
		 <img  src="${imgPath}/index/toSearch.png">
		</a> 
		<a>
		  <img class="ppwLogo" src="${imgPath}/index/logoW.png">
		</a>
	</div>

	<div class="backImg">
	        <img  id="img1" src="${imgPath}/index/back1.jpg">
	        <img  id="img2" src="${imgPath}/index/back2.jpg">
	        <img  id="img3" src="${imgPath}/index/back3.jpg">
	        <img  id="img4" src="${imgPath}/index/back4.jpg">
	        <img  id="img5" src="${imgPath}/index/back5.jpg">
	        <div></div>
	</div>
	
	<div class="pagePhone">
	
	<!--第一区域 -->
	<div class="firstContent">
	
	
<!-- 	<div class="Vidage" style="z-index:99">
    <div class="Vidage__image"></div>

    <video id="VidageVideo" style="display:none" class="Vidage__video" preload="metadata" loop autoplay muted>
        <source src="http://www.apaipian.com/product/video/paipianwangMovie.mp4" type="video/mp4">
    </video>

    <div class="Vidage__backdrop"></div>
</div> -->
		
		
		
		<div class="logo">
		  <img src="${imgPath}/index/logo.png">
		  <div id="logoPos" style="width:1px;"></div>
		</div>
			
		<div class="swiper-container">
	        <div class="swiper-wrapper">
	            <div class="swiper-slide">
		            <video style="width:0px;opacity:0" controls="" loop="" poster="${imgPath}/index/moreInfo.JPG" name="media" id="header3Video" class="active"> 
			          <source src="/resources/video/test.mov" id="source" type="video/mp4">
			        </video>
	                 <ul>
		                  <li class="title">专业商业视频服务</li>
		                  <li class="line"></li>
		                  <li class="desc">35800+导演/编剧/摄影师/影视专家为您服务</li>
		                  <li class="icon bannerAni playVideo" id="playVideo"><img src="${imgPath}/index/playIcon.png"></li>
	                 </ul>
	            </div>
	            <div class="swiper-slide">
	                  <ul>
		                  <li class="title">低预算拍大片 不满意全额退款</li>
		                  <li class="line"></li>
		                  <li class="desc">低于行业均价30%以上 平台托管制作费</li>
		                  <a  href="/phoneCost"> <li class="icon bannerAni"><img src="${imgPath}/index/calc.png"></li></a>
	                 </ul>
	             </div>
	            <div class="swiper-slide">
	                   <ul>
		                  <li class="title">免费创意策划 72小时极速出片</li>
		                  <li class="line"></li>
		                  <li class="desc">专业视频管家 一站式视频服务 全流程质量监管</li>
		                  <li class="icon bannerAni"><a href="tel:4006609728"><img src="${imgPath}/index/phone.png"></a></li>
	                 </ul>
	            </div>
	        </div>
    	</div>
    	
    	<form id="order-form" role="form" method="post" autocomplete="off" accept-charset="UTF-8">
				<c:if test="${activity == 1 }">
					<r:noLogin>
					<input type="hidden" id="indentName" name="indentName" value="新订单-手机下单"/>
					</r:noLogin>
					<r:identity role="provider">
						<input type="hidden" id="indentName" name="indentName" value="${sessionInfo.realName }-手机下单"/>
					</r:identity>
					<r:identity role="customer">
						<input type="hidden" id="indentName" name="indentName" value="${sessionInfo.realName }-手机下单"/>
					</r:identity>
					<r:identity role="employee">
						<input type="hidden" id="indentName" name="indentName" value="${sessionInfo.realName }-手机下单"/>
					</r:identity>
				</c:if>
				<c:if test="${activity != 1 }">
					<r:noLogin>
					<input type="hidden" id="indentName" name="indentName" value="微信底部广告"/>
					</r:noLogin>
					<r:identity role="provider">
						<input type="hidden" id="indentName" name="indentName" value="${sessionInfo.realName }-手机下单"/>
					</r:identity>
					<r:identity role="customer">
						<input type="hidden" id="indentName" name="indentName" value="${sessionInfo.realName }-手机下单"/>
					</r:identity>
					<r:identity role="employee">
						<input type="hidden" id="indentName" name="indentName" value="${sessionInfo.realName }-手机下单"/>
					</r:identity>
				</c:if>
				<input type="hidden" id="csrftoken" name="csrftoken" value="${csrftoken}"/>
				<input type="hidden" id="token" name="token" value="${token}"/>
    	<div class="getPhone">
    		<input type="number" maxlength="16" id="indent_tele"  placeholder="填写手机号">
    		<div class="error" id="error">手机号错误</div>
    	</div>
    	<div class="order" id="order-btn">预约拍片</div>
    	</form>
	</div>
	
	
	<div class="secondContent">
	      <div class="title">热门案例</div>
	      <div class="conDiv">
	              <a href='/search?q=&industry=宣传片'>
			          <div class="conItem leftItem">
			             <img src="${imgPath}/index/video.png">
			             <div class="type">宣传片</div>
			          </div>
		          </a>
		           <a href="/search?q=&industry=微电影">
			          <div class="conItem">
			             <img src="${imgPath}/index/sVideo.png">
			             <div class="type">微电影</div>
			          </div>
		          </a>
	      </div>
	       <div class="conDiv noBot">
	              <a href="/search?q=&industry=广告片">
			          <div class="conItem leftItem">
			             <img src="${imgPath}/index/ad.png">
			             <div class="type">广告片</div>
			          </div>
		          </a>
		           <a href="/search?q=&industry=病毒视频">
			          <div class="conItem">
			             <img src="${imgPath}/index/spread.png">
			             <div class="type">病毒视频</div>
			          </div>
		          </a>
	      </div>
	      <div class="service">服务流程</div>
	      <ul class="serviceItem">
	         <li>
	             <img src="${imgPath}/index/talk.png">
	             <div class="wordItem">
	                    <div>1</div>
	                    <div>沟通拍片需求</div>
	             </div>
	             <div class="wordItem">
	                    <div>2</div>
	                    <div>免费创意策划</div>
	             </div>
	         </li>
	         <li>
	             <img src="${imgPath}/index/help.png">
	             <div class="wordItem">
	                    <div>1</div>
	                    <div>平台托管制作费</div>
	             </div>
	             <div class="wordItem">
	                    <div>2</div>
	                    <div>甄选最佳导演&nbsp&nbsp&nbsp&nbsp</div>
	             </div>
	         </li>
	         <li>
	             <img src="${imgPath}/index/replay.png">
	             <div class="wordItem">
	                    <div>1</div>
	                    <div>拍摄制作全程监管</div>
	             </div>
	             <div class="wordItem">
	                    <div>2</div>
	                    <div>不满意免单或重拍</div>
	             </div>
	         </li>
	      </ul>
	      <a href="tel:4006609728"><div class="freeTel">免费咨询</div></a>
	</div>
	
	<div class="thirdContent">
	        <div class="ourCusTitle">导演工作室</div>
		    <div class="ourCus">

		        <div class="item">
		            <div class="proLogo">
		               <img src="${imgPath}/index/test.png">
		               <img src="${imgPath}/index/true.png">
		            </div>
		            <div class="proContent">
		                <div class="title">大大所大大多所大叔大叔大所大</div>
		                <div class="des">大大所大大多所大叔大叔大所大大大所大大多所大叔大叔大所</div>
		                <div class="tags">
		                      <div class="tagsItem">宣传片</div>
		                      <div class="tagsItem">宣传片</div>
		                      <div class="tagsItem">宣传片</div>
		                      <div class="tagsItem">宣传片</div>
		                      <div class="tagsItem">宣传片</div>
		                      <div class="tagsItem">宣传片</div>
		                </div>
		            </div>
		        </div>
		        <div class="item">
		            <div class="proLogo">
		               <img src="${imgPath}/index/test.png">
		               <img src="${imgPath}/index/true.png">
		            </div>
		            <div class="proContent">
		                <div class="title">大大所大大多所大叔大叔大所大</div>
		                <div class="des">大大所大大多所大叔大叔大所大大大所大大多所大叔大叔大所</div>
		                <div class="tags">
		                      <div class="tagsItem">宣传片</div>
		                      <div class="tagsItem">宣传片</div>
		                      <div class="tagsItem">宣传片</div>
		                      <div class="tagsItem">宣传片</div>
		                      <div class="tagsItem">宣传片</div>
		                      <div class="tagsItem">宣传片</div>
		                </div>
		            </div>
		        </div>
		        <div class="item">
		            <div class="proLogo">
		               <img src="${imgPath}/index/test.png">
		               <img src="${imgPath}/index/true.png">
		            </div>
		            <div class="proContent">
		                <div class="title">大大所大大多所大叔大叔大所大</div>
		                <div class="des">大大所大大多所大叔大叔大所大大大所大大多所大叔大叔大所</div>
		                <div class="tags">
		                      <div class="tagsItem">宣传片</div>
		                      <div class="tagsItem">宣传片</div>
		                      <div class="tagsItem">宣传片</div>
		                      <div class="tagsItem">宣传片</div>
		                      <div class="tagsItem">宣传片</div>
		                      <div class="tagsItem">宣传片</div>
		                </div>
		            </div>
		        </div>
		    </div>
		       
	       <a href="/proRegister">
	    		<div class="join">
                                                      加入我们
                </div>
           </a>
	               
		     <div class="ourCusTitle">我们的客户</div>
		     
		     <div class="showLogo">
		          <img src="${imgPath}/index/logo1.png">
		          <img src="${imgPath}/index/logo2.png">
		          <img src="${imgPath}/index/logo3.png">
		          <img src="${imgPath}/index/logo4.png">
		          <img src="${imgPath}/index/logo5.png">
		          <img src="${imgPath}/index/logo6.png">
		     </div>
		     
		     <jsp:include flush="true" page="foot.jsp"></jsp:include> 
		     
		     
	</div>	    
 </div>

</body>


<script src="${jqueryJs }"></script>
<script src="${waypointsJs}"></script>
<script src="${swiperJs}"></script>
<script src="${pluginJs }"></script>
<script src="${flexsliderJs }"></script>
<script src="${jsonJs }"></script>
<script src="${imgLazyLoadingJs }"></script>
<script src="${commonJs }"></script>
<script src="${portalJs }"></script>
<script src="${mmenuJs}"></script>
<script src="${remSetJs}"></script>



<!-- 加载Mob share 控件 -->
<script id="-mob-share"
	src="http://f1.webshare.mob.com/code/mob-share.js?appkey=8c49c537a706"></script>
</html>