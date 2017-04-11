<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="r" uri="/mytaglib"%>
<%-- import CSS --%>
<spring:url value="/resources/lib/Bootstrap/css/bootstrap.min.css" var="bootstrapCss"/>
<spring:url value="/resources/css/common.css" var="commonCss"/>
<spring:url value="/resources/css/manager/updateProjectInfo.css" var="updateProjectInfoCss"/>
<%-- <spring:url value="/resources/lib/AirDatepicker/dist/css/datepicker.min.css" var="datepickerCss" /> --%>
<spring:url value="/resources/lib/DateTimePicker/DateTimePicker.css" var="datepickerCss" />


<%-- import JS --%>

<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js" var="jqueryJs"/>
<spring:url value="/resources/lib/jquery/plugins.js" var="pluginJs"/>
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js" var="jsonJs"/>
<spring:url value="/resources/lib/Bootstrap/js/bootstrap.min.js" var="bootstrapJs"/>
<spring:url value="/resources/js/common.js" var="commonJs"/>
<spring:url value="/resources/js/manager/updateProjectInfo.js" var="updateProjectInfoJs"/>
<%-- <spring:url value="/resources/lib/AirDatepicker/dist/js/datepicker.min.js" var="datepickerJs" /> --%>
<spring:url value="/resources/lib/DateTimePicker/DateTimePicker.js" var="datepickerJs" />
<%-- <spring:url value="/resources/lib/AirDatepicker/dist/js/i18n/datepicker.zh.js" var="datepickerZhJs" /> --%>
<spring:url value="/resources/lib/DateTimePicker/i18n/DateTimePicker-i18n.js" var="datepickerZhJs" />
<!-- imgPath -->
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
	<meta name="keywords" content="">
	<meta name="description" content="">
	<title>项目信息</title>
	<link rel="shortcut icon" href="${imgPath}/favicon.ico" >
	<link rel="stylesheet" href="${bootstrapCss}">
	<link rel="stylesheet" href="${commonCss}">
    <link rel="stylesheet" href="${updateProjectInfoCss}">
    <link rel="stylesheet" href="${datepickerCss}">
   
    
	<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->

	
	<script src="${jqueryJs }"></script>
	<script src="${pluginJs }"></script>
	<script src="${jsonJs }"></script>
	<script src="${bootstrapJs }"></script>
	<script src="${commonJs }"></script>
    <script src="${updateProjectInfoJs }"></script>
    <script src="${datepickerJs }"></script>
    <script src="${datepickerZhJs }"></script>


</head>
<body>
<div class="gifImgDiv hide" id="showImg">
<img class="gifImg" src="${imgPath}/wait.gif">
</div>

<input type="hidden" value="<r:outName />"  id="logiNname">

	          <div class="headerNew">
	             <a href="javascript:history.back(-1);">
		              <div class="leftHeader">
						 <div class="back"></div>
					  </div>	
				</a>	  
				
					  <div class="rightHeader" id="topSubmit">
						 <div class="commit"></div>
					  </div>
			  
			    <a href="<spring:url value="/"/>" target="_self">	  
			   	     <div class="midHeader">
						 <div class="logo"></div>
					 </div>
			    </a>		 
		     </div>
		     	
		     
		    <div class="errorDiv"  id="errorDiv" style="display: none;">error</div>
		     
		      <div class="updateContent"> 
		      
			      <div class="contentInput">
			          
			           <div class="firstDiv">
			              <span class="firstSpan">*</span>
			              <span class="secondSpan">项目编号</span>
			          </div>
			          <div class="secondDiv">
			            <input readonly="readonly" class="projectId">
			           </div> 
			     </div>

 
			     
			      <div class="contentInput">
			          
			           <div class="firstDiv">
			              <span class="firstSpan">*</span>
			              <span class="secondSpan">项目名称</span>
			          </div>
			          <div class="secondDiv">
			            <input value="" placeholder="项目名称" id="projectName">
			           </div> 
			     </div>
			     
			      <div class="contentInput">
			          <div class="firstDiv">
			              <span class="firstSpan">*</span>
			              <span class="secondSpan">来源信息</span>
			          </div>
			          <div class="secondDiv">
			            <div class="form-group">
			            <select class="form-control" id="projectSource">
			            </select>
			            </div>
			           </div> 
			           <div class="down hide"><img src="${imgPath }/manager/down.png"></div>
			     </div>
			     
			      <div class="contentInput hide" id="referrer">
			          <div class="firstDiv">
			              <span class="firstSpan">*</span>
			              <span class="secondSpan">推荐人</span>
			          </div>
			          <div class="secondDiv">
			            <input value="" id="input-referrer">
			            <input value="" id="referrer-Id-hidden" type="hidden">
			            	<ul class="ul-option-source hide"  style="display: block;" id="ul-select-referrer"></ul>
			           </div> 
			     </div>
			<!-- 协同人 -->     
			    <div class="keBianShiDiv" id="synergyInfo">
				     <div class="borderLine" id="synergyTopLine"></div> 
					       <div class="contentInput newInput" id="addSynergy">
					          <div class="firstDiv">
					              <span class="firstSpan" style="opacity:0">*</span>
					              <span class="secondSpan">协同人信息</span>
					          </div>
					          <div class="secondDiv">
					                 <div class="positionAdd">
						               <div class="addPeople">添加协同人</div>
						               <div class="add" id="addSynergyIcon"></div>
						             </div>  
					          </div> 
					     </div>
					    <div class="borderLine" id="synergyBottomLine"></div>   
				    
				     <div class="autoDiv hide" id="synergy">
				     </div>
			     
		        </div> 
		     <!-- 客户信息 --> 
		         <div class="keBianShiDiv" id="userInfo">
		         
					      <div class="contentInput newInput" id="userOpen">
					          
					          <div class="firstDiv">
					              <span class="firstSpan">*</span>
					              <span class="secondSpan">客户信息</span>
					          </div>
					          
					          <div class="secondDiv">
				                 <div class="positionAdd">
					               		<div class="openDiv" id="userOpenIcon"></div>
					             </div>  
					          </div> 
					     </div>
					    <div class="borderLine" id="userBottomLine"></div>   
				    
				     <div class="autoDiv hide" id="user" style="border-color:#e3e3e3 !important">
				         <div class="autoContent">
				         <input type="hidden" class="userId" id="userId">
									<div class="divPosition">
									        <div>客户名称</div>
											<input  class="infos" id="userName">
											<ul class="ul-option hide" id="ul-select" style="display: block;">
											</ul>
									</div>
									<div class="divPosition">
									        <div>客户联系人</div>
											<input  class="infos" id="userContact">
									</div>
									<div class="divPosition">
									        <div>客户电话</div>
											<input  class="infos" id="userPhone">
									</div>
						</div>
				     </div>
		        </div>   
		        
		             <!-- 供应商信息 --> 
		         <div class="keBianShiDiv" id="providerInfo">
		         
					      <div class="contentInput newInput" id="providerOpen">
					          <div class="firstDiv">
					              <span class="firstSpan">&nbsp&nbsp</span>
					              <span class="secondSpan">供应商信息</span>
					          </div>
					          
					          <div class="secondDiv">
				                 <div class="positionAdd">
					               		<div class="openDiv" id="providerOpenIcon"></div>
					             </div>  
					          </div> 
					     </div>
					    <div class="borderLine" id="providerBottomLine"></div>   
				    
				     <div class="autoDiv hide" id="provider">
				         <input type="hidden" class="teamId" id="teamId">
				         <div class="autoContent">
									<div class="divPosition">
									        <div>供应商名称</div>
											<input placeholder="供应商名称" class="infos" id="teamName">
											<ul class="ul-option hide" id="ul-select-team" style="display: block;">
											</ul>
									</div>
									<div class="divPosition">
									        <div>联系人姓名</div>
											<input  class="infos" id="teamContact">
									</div>
									<div class="divPosition">
									        <div>供应商电话</div>
											<input  class="infos" id="teamPhone">
									</div>
						</div>
				     </div>
		        </div>  
		        
		         <!-- 项目价格 --> 
		         <div class="keBianShiDiv" id="priceInfo">
		         
					      <div class="contentInput newInput" id="priceOpen">
					          <div class="firstDiv">
					               <span class="firstSpan">&nbsp&nbsp</span>
					              <span class="secondSpan">项目价格</span>
					          </div>
					          
					          <div class="secondDiv">
				                 <div class="positionAdd">
					               		<div class="openDiv" id="priceOpenIcon"></div>
					             </div>  
					          </div> 
					     </div>
					    <div class="borderLine" id="priceBottomLine"></div>   
				    
				     <div class="autoDiv hide" id="price">
				         <div class="autoContent">
				                    <div class="divPosition">
				                            <div>项目预算</div>
											<input  class="leftPrice" id="firstinput">
											<div   class="midPrice">~</div>
											<input class="rightPrice" id="lastinput">
											<span style="top:13px">元</span>
									</div>
									<div class="divPosition">
									        <div>项目最终价</div>
											<input  class="info" id="finishInput">
											<span style="top:13px">元</span>
									</div>
									<div class="divPosition">
									        <div>客户支付价</div>
											<input  class="info" id="userinput">
											<span style="top:13px">元</span>
									</div>
									<div class="divPosition">
									        <div>支付供应商</div>
											<input class="info" id='providerInput'>
											<span style="top:13px">元</span>
									</div>
						</div>
				     </div>
		        </div>  
		        
		           <!-- 项目描述 --> 
		           <div class="keBianShiDiv">
				         <div class="contentTextArea">
					          <div class="firstDiv">
					              <span class="firstSpan">&nbsp&nbsp</span>
					              <span class="secondSpan">项目描述</span>
					          </div>
					          <div class="secondDiv">
					              <textarea id="description" class="textareaSize"></textarea>
					          </div> 
					     </div>
				  </div>
				  
				    <!-- 项目时间表 --> 
		         <div class="keBianShiDiv" id="timeInfo" >
		               <div class="borderLine" id="timetopLine"></div>   
					      <div class="contentInput divPosition newInput" id="timeOpen" >
					          <div class="firstDiv">
					              <span class="secondSpan">项目时间表</span>
					          </div>
					          
					          <div class="secondDiv">
				                 <div class="positionAdd">
					               		<div class="openDiv" id="timeOpenIcon"></div>
					             </div>  
					          </div> 
					     </div>
					    <div class="borderLine" id="timeBottomLine"></div>   
				    
				     <div class="autoDiv hide" id="time">
				         <div class="autoContent">
				            <div class="timeContent">
				              	<div class="title">预算时间</div>
				              	<div id="dtBox"></div>
				              	<ul class="timeInput">
				              	     <li><input data-field="date" readonly class="" id="gtstarttime"></li>
				              	     <li><input data-field="date" readonly class="" id="fastarttime"></li>
				              	     <li><input data-field="date" readonly class="" id="swstarttime"></li>
				              	     <li><input data-field="date" readonly class="" id="zzstarttime"></li>
				              	     <li><input data-field="date" readonly class="" id="jfstarttime"></li>
				              	</ul>
				              	
				              	<div class="timeImg">
				              	      <img src="${imgPath }/manager/time.png">
				              	      <img src="${imgPath }/manager/time.png">
				              	      <img src="${imgPath }/manager/time.png">
				              	      <img src="${imgPath }/manager/time.png">
				              	      <img src="${imgPath }/manager/timeEnd.png">
				              	       <div class="vLine"></div>
				              	</div>
				              	<ul class="timeWord">
				              	     <li>沟通</li>
				              	     <li>方案</li>
				              	     <li>商务</li>
				              	     <li>制作</li>
				              	     <li>交付</li>
				              	</ul>
				              	
				             </div> 
									
						</div>
				     </div>
		        </div>  
		       
		         <div class="completeDiv">
		          <a href="javascript:history.back(-1);">
		               <div class="cancle">取消</div>
		           </a>    
		               <div class="save" id="indent-btn">保存</div>
		         </div>      
		         
		         <input type="hidden" id="key" style="display: none;" value="${key}">
		         <label class="state hide" >${state}</label>
		    </div>
		   

</body>
</html>