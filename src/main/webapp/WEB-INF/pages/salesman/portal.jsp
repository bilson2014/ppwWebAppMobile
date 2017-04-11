<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%-- import CSS --%>
<spring:url value="/resources/css/play.css" var="playCss"/>
<spring:url value="/resources/css/salesman/portal.css" var="portalCss"/>

<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js" var="jqueryJs"/>
<spring:url value="/resources/lib/jquery/plugins.js" var="pluginJs"/>
<spring:url value="/resources/lib/jquery/waypoints.min.js" var="waypoints"/>
<spring:url value="/resources/js/common.js" var="commonJs"/>
<spring:url value="/resources/js/salesman/portal.js" var="portalJs"/>
<!-- imgPath -->
<spring:url value="/resources/images" var="imgPath"/>
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
	<meta content="telephone=no" name="format-detection">
	<title>财神送红包-拍片网</title>
	<link rel="shortcut icon" href="${imgPath}/favicon.ico" >
	<link rel="stylesheet" href="${portalCss}">
	<script src="${jqueryJs }"></script>
</head>
<body>
<input type="hidden" id="storage_node" value="${file_locate_storage_path }" />
<div class="upload-window" id="toolbar-modal">      
     	 <div class="closeVideo">
     	  <button id="closeBtn" type="button" class="close" data-dismiss="modal" aria-label="Close"><span class="close-icon" aria-hidden="true">&times;</span></button>
        </div>
	         <div class="video-play-sections">
	        	<video controls id="recomment-video" src="" poster="" preload="auto" "></video>
	        </div>
        <div class="closeVideoBot" id="closeVideoBot"></div>
</div>

<div class="wrap">
	<input type="hidden" id="uniqueId" value="${uniqueId }"/>
	
	<div class="header hide">
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
            
            <div class="botImg bannerAni" id="topImg">
                <img src="/resources/images/goodGod/icon.png">
            </div>
             <img style="width:100%" src="/resources/images/goodGod/bigRedTop.png">
         <div class="bigBackGround">
        
            <div class="topImg example-basic" >
            	<img src="/resources/images/goodGod/topOne.png"> 
            </div>  
            <div class="outside-div" >
	            <div class="top-div">
		               <div class="title-word">经济实惠:</div>
					               <div class="title-content" id="top">
					               	    <div class="left-content">
					               	    	<label class="left-price" id="firstPrice"></label><label class="left-desc">元套餐</lable>
					                    </div>
					                     <div class="right-content">
					               	    	<label class="right-price"><span class="right-desc">适用于种子轮</span></label>
					               	    	<label class="right-price"><span class="right-desc">企业初创期</span></label>
					                    </div>
					               </div>
			              </div> 
	            
			             <div class="inside-div"  id="first-video-section" >
				        </div>
	   		</div>
	   		 <div class="topImg">
            	<img src="/resources/images/goodGod/topBottom.png"> 
            </div>  
	   
	   
	     <div class="topImg margin-div">
            	<img src="/resources/images/goodGod/topTwo.png"> 
            </div>  
	   	   <div class="outside-div " >
	            <div class="top-div">
		               <div class="title-word">高性价比:</div>
					               <div class="title-content">
					               	    <div class="left-content">
					               	    	<label class="left-price" id="secondPrice"></label><label class="left-desc">元套餐</lable>
					                    </div>
					                     <div class="right-content">
					               	    	<label class="right-price"><span class="right-desc">适用于天使轮</span></label>
					               	    	<label class="right-price"><span class="right-desc">A轮,企业攀登期</span></label>
					                    </div>
					               </div>
			              </div> 
	            
			             <div class="inside-div"  id="second-video-section" >
				        </div>
	   		</div>
	   		  <div class="topImg">
            	<img src="/resources/images/goodGod/topBottom.png"> 
            </div>  
              <div class="topImg margin-div">
            	<img src="/resources/images/goodGod/topThree.png"> 
            </div>  
	   
	   	   <div class="outside-div " >
            		<div class="top-div">
		               		<div class="title-word">高端精致:</div>
					               <div class="title-content">
					               	    <div class="left-content">
					               	    	<label class="left-price" id="thirdPrice"></label><label class="left-desc">元套餐</lable>
					                    </div>
					                     <div class="right-content">
					               	    	<label class="right-price"><span class="right-desc">适用于B轮预算</span></label>
					               	    	<label class="right-price"><span class="right-desc">充足企业动力期</span></label>
					                    </div>
					               </div>
		              </div> 
            
		             <div class="inside-div"  id="third-video-section" >
          			</div> 
	       </div>
	         <div class="topImg ">
            	<img src="/resources/images/goodGod/topBottom.png"> 
            </div>  
            
           
	       
	     </div> 
	
	</div>
	
	  <img style="width:100%" src="/resources/images/goodGod/bigRedBot.png">
	
</body>


<script src="${pluginJs }"></script>
<script src="${commonJs }"></script>
<script src="${portalJs}"></script>


</html>
