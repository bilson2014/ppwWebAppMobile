<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="r" uri="/mytaglib" %>

<%-- import CSS --%>
<spring:url value="/resources/css/news/newsList.css" var="newsListCss"/>

<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js" var="jqueryJs"/>
<spring:url value="/resources/lib/jquery/plugins.js" var="pluginJs"/>
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js" var="jsonJs"/>
<spring:url value="/resources/js/common.js" var="commonJs"/>
<spring:url value="/resources/js/youku-player.js" var="ykJs" />
<spring:url value="/resources/js/news/newsList.js" var="newsListJs"/>
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
	<link rel="stylesheet" href="${newsListCss }">
	<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
</head>
<body>
	<input type="hidden" id="storage_node" value="${file_locate_storage_path }" />
	<input type="hidden" value="${total }" id="total"/>
	<input type="hidden" id="q" value="${q}" />

	
	<div class="phoneHeader">
	     <a id="openMenu"><img src="${imgPath }/index/toMenu.png"></a>
	     <a><img src="${imgPath }/index/toSearch.png"></a>
	     <div>新闻页</div>
	</div>
	
	<jsp:include flush="true" page="../menu.jsp"></jsp:include> 
	
	 <div class="newsTags">
	     <a href="/newsList"><div class="category active">推荐</div></a>
	     <a href="/newsList?q=最新资讯"><div class="category" data-value="最新资讯">最新资讯</div></a>
	     <a href="/newsList?q=案例花絮"><div class="category" data-value="案例花絮">案例花絮</div></a>
	     <a href="/newsList?q=企业动态"><div class="category" data-value="企业动态">企业动态</div></a>
	     <a href="/newsList?q=行业资讯"><div class="category" data-value="行业资讯">行业资讯</div></a>
	     <a href="/newsList?q=佳片赏析"><div class="category" data-value="佳片赏析">佳片赏析</div></a>
	 </div>
	
	
	
       <div class="pagePhone">
	       
	       <div class='newsContent'>
	       
	<%--              <c:if test="${!empty list}">
	                    <c:forEach items="${list }" var="newsSolr">
				             <div class="newsItem">
				                <img src="${file_locate_storage_path}${newsSolr.picLDUrl}" alt="${newsSolr.title}_拍片网" >
				                <div class="itemContent">
				                     <div>${newsSolr.title}</div>
				                     <div><fmt:parseDate value="${newsSolr.creationTime}" var="yearMonth" pattern="yyyy-MM-dd"/>
	                   					<fmt:formatDate value="${yearMonth}" pattern="yyyy年MM月dd日" />
	                   				</div>
				                </div>
				             </div>
	                    </c:forEach>
	             </c:if>   --%>     
	            
	             <div class="newsItem">
	                   <img src="${imgPath }/index/back1.png">
	                <div class="itemContent">
	                     <div>我是标题</div>
	                     <div>2016年3月23日</div>
	                </div>
	             </div>
	             <div class="newsItem">
	                   <img src="${imgPath }/index/back2.png">
	                <div class="itemContent">
	                     <div>我是标题</div>
	                     <div>2016年3月23日</div>
	                </div>
	             </div>
	             <div class="newsItem">
	                   <img src="${imgPath }/index/back3.png">
		                <div class="itemContent">
		                     <div>我是标题</div>
		                     <div>2016年3月23日</div>
		                </div>
	             </div>
	       </div>
	       
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
		                 <div>北京市朝阳区国贸建外SOHO东区6号楼25层</div>
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
		     
	       
       </div>


<script src="${jqueryJs }"></script>
<script src="${pluginJs }"></script>
<script src="${jsonJs }"></script>
<script src="${commonJs }"></script>
<script src="${remSetJs}"></script>
<script src="${newsListJs}"></script>

<!-- 加载Mob share 控件 -->
<script id="-mob-share" src="http://f1.webshare.mob.com/code/mob-share.js?appkey=8c49c537a706"></script>
<script type="text/javascript" src="http://player.youku.com/jsapi"></script>
</body>
</html>