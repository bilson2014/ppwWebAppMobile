<%@ page contentType="text/html;charset=UTF-8"%>
<%-- <%@ page import="com.panfeng.film.resource.model.User"%> --%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="r" uri="/mytaglib" %>

<%-- import CSS --%>
<spring:url value="/resources/css/payment/paylist.css" var="paylistCss"/>

<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js" var="jqueryJs"/>
<spring:url value="/resources/js/model.js" var="modelJs"/>
<spring:url value="/resources/js/common.js" var="commonJs"/>
<spring:url value="/resources/js/search-suggest.js" var="suggestJs"/>
<spring:url value="/resources/js/payment/paylist.js" var="paylistJs"/>

<!-- import img path -->
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
	<title>订单</title>
	<link rel="stylesheet" href="${paylistCss }">
	<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
	<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
</head>


<body>

		 <div class="header">
					<!-- logo -->
					<dl>
						<dd>
							<a >
								<div class=""></div>
							</a>
						</dd>
						<dd>
		
							<a href="<spring:url value="/salesman/${uniqueId }"/>" target="_self">
								<div class="logo"></div>
							</a>
						</dd>
						<dd>
						</dd>
					</dl>
				</div>
    
	<div class="autoDiv">
	      
	      
			       <div class="orderContent contentMarginBottom">
			             <div class="controlWidth">
			                    <div class="topBackground">
					             <div class="contentTop">
					                 <div class="contentTitle">${dealLog.billNo}</div>
					                 <div class="contentDate" style="color:#fff;font-size:1.4rem">${dealLog.orderTimeOut }</div>
					             </div>
					             </div>
					             
					              <div class="contentMargin">
					                <div class="contentTitle">项目名称：</div>
					                <div class="contentDate">${dealLog.projectName}</div>
					              </div> 
					                
					               <div class="contentMargin"> 
					                <div class="contentTitle">付款金额：</div>
					                <div class="contentDate"  style="color:#fe5453"><span style="font-size:2.0rem;vertical-align: middle">${dealLog.payPrice}</span>元</div>
					               </div>
					               
					                 <div class="contentMargin">
					                <div class="contentTitle">支付状态：</div>
					                <div class="contentDate" style="color:#fb9b6a"><c:if test="${dealLog.dealStatus == 0}">
			              			支付进行中
			              		</c:if>
			              		<c:if test="${dealLog.dealStatus == 1}">
			              			交易成功
			              		</c:if>
			              		<c:if test="${dealLog.dealStatus == 2}">
			              			支付已关闭
			              		</c:if></div>
					              </div>  
					      </div>         
			       </div>
	       
	       <div class="orderContent contentMarginBottom ">
	              <div class="controlWidth">
		              <div class="contentMargin">
			                <div class="contentTitle">收款方：</div>
			                <div class="contentDate">${dealLog.proceedsSide}</div>
		              </div> 
		                
		               <div class="contentMargin"> 
			                <div class="contentTitle">支付方：</div>
			                <div class="contentDate " >${dealLog.userName}</div>
		               </div> 
	               </div>
	       </div>
	       
	       
	       <div class="orderContent contentMarginBotTop ">
	            <div class="controlWidth">
		              <div>
			                <div class="contentTitle"><img class="imgBank" src="${imgPath }/icons/bankNo.png"/></div>
			                <div class="contentDate"><div class="imgDiv"><img class="imgSure" src="${imgPath }/icons/sure.png"/></div></div>
		              </div>
		         </div>      
	                 
	       </div>
	       <c:if test="${dealLog.dealStatus == 0 && dealLog.urlEffective }">
            	 <div class="contentRight">
            	 	<a href="?token=${dealLog.token}&csrftoken=${csrftoken}" id ="submit"><button class="btn-red botPos">确认</button></a>
            	 </div>
		   </c:if>
     </div>
     
		
	<script src="${jqueryJs }"></script>
	<script src="${paylistJs }"></script>


</body>
</html>