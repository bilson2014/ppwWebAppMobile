<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="r" uri="/mytaglib" %><%-- import CSS --%>
<spring:url value="/resources/css/projectLine/projectSetting.css" var="pSetCss" />
<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js" var="jqueryJs" />
<spring:url value="/resources/js/common.js" var="commonJs" />
<spring:url value="/resources/js/projectLine/projectSetting.js" var="pSetJs" />
<spring:url value="/resources/js/projectLine/pCommon.js" var="pCommon" />
<spring:url value="/resources/lib/jquery.lazyload/lazysizes.min.js" var="lazyloadJs"/>
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
<meta name="keywords" content="宣传片制作,产品宣传片制作,企业宣传片制作,微电影制作,MG动画制作">
<meta name="description" content="拍片网主营宣传片制作、微电影制作、MG动画制作等各种视频内容制作，拍片网是最大的企业视频内容制作平台。拍片就上拍片网！">
<title>${product.chanpinName}|拍片网标准产品线</title>
<link rel="stylesheet" href="${pSetCss }">
<link rel="shortcut icon" href="/resources/images/favicon.ico">
<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
<script src="${jqueryJs}"></script>
<script src="${commonJs}"></script>
<script src="${pCommon}"></script>
<script type="text/javascript" src="/resources/lib/jquery.json/jquery.json-2.4.min.js"></script>
</head>
<body>

     <r:identity role="provider">
	    <input type="hidden" id="rolephone" value="1314520ppw" />              
	 </r:identity>
	 <r:identity role="customer">
	    <input type="hidden" id="rolephone" value="1314520ppw" />
	 </r:identity>
	 <r:identity role="employee">
	    <input type="hidden" id="rolephone" value="1314520ppw" />
	 </r:identity>
	            
	<input type="hidden" id="storage_node" value="${file_locate_storage_path }" />
	<input type="hidden" id="productId" value="${product.chanpinId }">
	<input type="hidden" id="CSubjoinID">
	<input type="hidden" id="CTimeID">
	<input type="hidden" id="CConfigId"> 
	
	<div class="model" id="orderCheck">
	         <div class="success">
	            <img src="/resources/images/index/success.png" class="lazyload">
	            <div id="showStatues">确认下单</div>
	            <div class="checkSuccess" id="checkSuccess">确认</div>
	            <div class="checkBack" id="checkFlase">取消</div>
	         </div>
	</div>
	
	<div class="model" id="orderSuccess">
	         <div class="success">
	            <img src="/resources/images/index/success.png" class="lazyload">
	            <div id="showStatues">下单成功</div>
	            <div class="desc">已生成订单并发送邮件到您的邮箱</div>
	            <a href="/"><div class="checkSuccess" id="checkSuccess">确认</div></a>
	         </div>
	</div>
	
	    
	    <jsp:include flush="true" page="../menu.jsp"></jsp:include>
	    <div class="phoneHeader">
		     <a id="openMenu"><img src="${imgPath }/index/toMenu.png"></a>
		     <img class="searchType choose" src="${imgPath}/projectLine/projectSet/moreChoose.png">
		     <div class="choose">${product.chanpinName}</div>
		     <div class="toBuy hide">购买</div>
	    </div>
	    
	    <div class="headerTags">
	         	<c:if test="${! empty productList}">
							<c:forEach items="${productList }" var="tag">
								 <c:if test="${product.chanpinName == tag.chanpinName }">
										<a><div class="active">${tag.chanpinName}</div></a>
								 </c:if>
								 <c:if test="${product.chanpinName != tag.chanpinName }">
										<a href="/product/${tag.englishName }/main"><div>${tag.chanpinName}</div></a>
								 </c:if>
							</c:forEach>
				</c:if>
	    </div>
	    <div class="showType">
	         <a href="/product/${product.englishName }/main"><div>产品概述</div></a>
	         <a href="/product/${product.englishName }/case"><div>全部案例</div></a>
	         <a href="/product/${product.englishName }/set"><div style="border:none">产品配置</div></a>
	    </div> 
	  
        <div class="pagePhone" id="pagePhone">
          <div id="step1">
              <div class="title">寻找适合你的${product.chanpinName}</div>
              <div class="typeMod">
                    <div class="modItem active" id="normal">
                        <div class="info">标准版产品</div>
                        <div class="price"><span id="normal_prive"></span>元</div>
                    </div>
                    <div class="modItem" id="k2">
                        <div class="info">增强版产品</div>
                        <div class="price"><span id="k2_prive"></span>元</div>
                    </div>
                    <div class="modItem" id="k4">
                        <div class="info">尊享版产品</div>
                        <div class="price"><span id="k4_prive"></span>元</div>
                    </div>
              </div>
           <div class="setCard">   
                <div class="cardItem low">
		              <div class="showProduct">
		                  <img src="${imgPath }/projectLine/motion/test.jpg">
		              </div>
		              <div class="des">
		                                                  这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容
		              </div>
		              <div class="setTags">
		                      <div class="tItem">这个是标签</div>
		                      <div class="tItem">这个是标签</div> 
		                      <div class="tItem">这个是标签</div>                           
		              </div>
	            </div>  
           </div>   
              <div class="showMoreDiv">
                   <div>展开了解详情</div>
                   <img src="${imgPath}/index/getMore.png">
              </div>
              
              <div class="setInfo">
                     <div class="setInfoWidth">
                         <div class="close" id="closeInfo">
                             <img src="${imgPath}/projectLine/projectSet/closeBtn.png">
                         </div>
                         <div class="sTitle ">
                             <div>服务套餐<span>Service Packages</span></div>
                         </div>
                         <div class="sContent setPack">
                         <!--<div class="cItem">
                                  <div class="cTitle">这个是标题</div>
                                  <div class="info">这个是内容这个是内容这个是内容这个是内容这个是内容这个是内容</div>
                                  <div class="other">(赠送)</div>
                             </div>   -->                        
                         </div>
                     </div>
              </div>
              <div class="toNext">下一步</div>
           </div>
           <!--时长 附加服务  -->
           <div id="step2" class="setMargin">
               
          <div class="titleTime ">时长<span>Length</span></div>
	        <div class="timeContent timeSet">
<!-- 	            <div class="tItem active">
	                 <span>1分钟</span>
	                 <div>39800<span>元</span></div>
	            </div> -->
	        </div>
	        <div class="titleTime">附加服务<span>Additional Services</span></div>
	        <div class="additional addSet">
	             <%-- <div class="aItem">
	                 <img src="${imgPath}/projectLine/motion/test.jpg">
	                 <div class="itemContent">
	                      <div>打算打打三</div>
	                      <div>大叔大叔大</div>
	                      <div>打算打打三大所多大叔大婶大大所多</div>
	                 </div>
	            </div> --%>
	        </div>
	        
	        <div class="line"></div>
	            
	            <div class="showDes">
	            </div>
	            <div class="showPrice">
	                 <span>总价格</span>
	                 <span>¥</span>
	                 <span id="setTotalPrice"></span>
	            </div>
	            <div class="btnDiv">
	                   <div class="goBefore">上一步</div>
	                   <div id="confirm">确认下单</div>
	            </div>
           </div>
              
		      <jsp:include flush="true" page="../foot.jsp"></jsp:include> 
		</div>
</body>

<script src="${pSetJs}"></script>
</html>