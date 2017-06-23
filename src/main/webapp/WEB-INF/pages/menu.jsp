<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="r" uri="/mytaglib"%>

<spring:url value="/resources/images" var="imgPath" />

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>

	<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
	
	<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
</head>
<body>
<div class="model menu" id="menu">
	           <img class="menuBack" src="${imgPath}/menu/menuBack.jpg">
	           <div class="menuTop">
	                   <r:noLogin>
	                       <a href="/loginSele"><img class="userLogo" src="${imgPath}/menu/defultLogin.png"></a>
	                   </r:noLogin>
	                   <r:identity role="provider">
	                    <a href="<spring:url value='/provider/info_${sessionScope.sessionInfo.reqiureId }.html'/>" ><img class="userLogo" id="getImgUrl" src="${file_locate_storage_path }${sessionScope.sessionInfo.photo}"></a>
	                    <img class="close" id="editInfo" src="${imgPath}/menu/edit.png">
	                  </r:identity>
	                  <r:identity role="customer">
	                       <a href="/mgr/index"><img class="userLogo" id="getImgUrl" src="${file_locate_storage_path }${sessionScope.sessionInfo.photo}"></a> 
	                       <img class="close" id="editInfo" src="${imgPath}/menu/edit.png">
	                  </r:identity>
	                  <r:identity role="employee">
	                       <a href="/mgr/index"><img class="userLogo" id="getImgUrl" src="${file_locate_storage_path }${sessionScope.sessionInfo.photo}"></a> 
	                       <img class="close" id="editInfo" src="${imgPath}/menu/edit.png">
	                  </r:identity>
	                  <a href="/userInfo" class="hide" ><img class="edit"  src="${imgPath}/menu/editMenu.png"></a>
	                  <r:identity role="provider">
	                     <div>${sessionScope.sessionInfo.telephone}</div>
	                  </r:identity>
	                  <r:identity role="customer">
	                     <div>${sessionScope.sessionInfo.telephone}</div>
	                  </r:identity>
	                  <r:identity role="employee">
	                     <div>${sessionScope.sessionInfo.loginName}</div>
	                  </r:identity>
	                  <r:noLogin>
	                      <div>未登录</div>
	                  </r:noLogin>
	           </div>
	           <div class="menuContent">
	                 <a href="/">
		                  <div class="menuItem">
		                       <img src="${imgPath}/menu/menu.png">
		                       <div>首页</div>
		                  </div>
	                 </a>
	                 <r:identity role="provider">
		                 <a href="/mgr/index">
			                  <div class="menuItem">
			                       <img src="${imgPath}/menu/myPro.png">
			                       <div>我的项目</div>
			                  </div>
		                 </a>
		             </r:identity>
		             <r:identity role="customer">
		                 <a href="/mgr/index">
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
		             <r:identity role="employee">    
		                 <a href="/product/EnterprisePromotionalVideo/main">
			                  <div class="menuItem">
			                       <img src="${imgPath}/menu/product.png">
			                       <div>视频产品</div>
			                  </div>
		                 </a>
	                  </r:identity> 
	                  <r:identity role="employee">  
	                     <a href="/mgr/favourites">
			                  <div class="menuItem">
			                       <img src="${imgPath}/menu/favorite.png">
			                       <div>我的收藏</div>
			                  </div>
		                 </a>
		               </r:identity>  
	                 <a href="/search?q=*">
		                  <div class="menuItem">
		                       <img src="${imgPath}/menu/editMenu.png">
		                       <div>精品案例</div>
		                  </div>
	                 </a>
	                 <a href="/cost/cal">
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
	                    <a href="/about-us.html">
		                  <div class="menuItem">
		                       <img src="${imgPath}/menu/about.png">
		                       <div>关于我们</div>
		                  </div>
	                    </a>
	                 <a href="/news-list.html">
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
	                    <a class='hide'>
		                  <div class="menuItem">
		                       <img src="${imgPath}/menu/help.png">
		                       <div>帮助</div>
		                  </div>
	                    </a> 
	           </div>
	           <img class="closeMenu" id="closeMenu" src="${imgPath}/menu/cMenu.png">
	           <div class="showMore" id="showMore">
	                                 <div class="hide" id="showSafeSet">安全设置</div>
	                                 <a href="/login/loginout"><div class="loginOut">退出登录</div></a>
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
	    </div>  
</body>
</html>