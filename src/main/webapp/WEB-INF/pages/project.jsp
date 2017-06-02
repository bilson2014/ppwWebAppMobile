<%@ page contentType="text/html;charset=UTF-8"%>
<%-- <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="r" uri="/mytaglib"%> --%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="r" uri="/mytaglib" %>

<%-- import CSS --%>
<spring:url value="/resources/lib/Bootstrap/css/bootstrap.min.css"
	var="bootstrapCss" />
<spring:url value="/resources/css/common.css" var="commonCss" />
<spring:url value="/resources/css/customer/customerProject.css"
	var="customerInfoCss" />
<%-- import JS --%>

<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js"
	var="jqueryJs" />
<spring:url value="/resources/lib/jquery/plugins.js" var="pluginJs" />
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js"
	var="jsonJs" />
<spring:url value="/resources/lib/Bootstrap/js/bootstrap.min.js"
	var="bootstrapJs" />
<spring:url value="/resources/js/commonCopy.js" var="commonJs" />
<spring:url value="/resources/js/project.js" var="customerInfoJs" />
<spring:url value="/resources/js/flowView.js" var="flowViewJs" />

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
<meta content="telephone=no" name="format-detection" />
<meta http-equiv="X-UA-Compatible" content="IE=9,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
<meta name="keywords" content="">
<meta name="description" content="">
<title>我的项目－拍片网</title>
<link rel="shortcut icon" href="${imgPath}/favicon.ico">
<link rel="stylesheet" href="${bootstrapCss}">
<link rel="stylesheet" href="${commonCss}">
<link rel="stylesheet" href="${customerInfoCss}">

<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->

<script src="${jqueryJs }"></script>
<script src="${pluginJs }"></script>
<script src="${jsonJs }"></script>
<script src="${bootstrapJs }"></script>
<script src="${commonJs }"></script>
<script src="${customerInfoJs }"></script>
<script src="${flowViewJs }"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<style type="text/css">
/* 进行中样式控制 */
body {
	overflow: scroll;
	overflow-x: hidden;
}
.index{
 display: inline-block;
}
.info{
display: inline-block;
}
.infoimgG{
display: inline-block;
}
.infoimgR{
display: inline-block;
}
</style>
</head>
<body>
<input type="hidden" id="storage_node" value="${file_locate_storage_path }" />
 <div class="errorDiv"  id="errorDiv" style="display: none;">error</div>
 <input type="hidden" id="user_img" value="${userInfo.photo}"/>
	<div class="headerNew">
		<a href="javascript:history.back(-1);">
			<div class="leftHeader">
				<div class="back"></div>
			</div>
		</a>
	<r:permission uri="/add-view">
		<div class="rightHeader" id="add-project">
			<div class="add"></div>
		</div>
   </r:permission>
		<a href="/" target="_self">
			<div class="midHeader">
				<div class="logo"></div>
			</div>
		</a>
	</div>
	<r:identity role="customer">
		<input type="hidden" id="role" value="customer">
		<!--banner 区  -->
		<a href="/user/info">
			<div class="topHeader">
				<div class="topContent">
					<div class="infoHeadSide sameLine ">
						<img class="infoHead" id="infoHead" src="">
					</div>
					<ul class="topInfo sameLine ">
						<li>
							<div id="loginName">${userInfo.loginName }</div> 
						</li>
						<li id="realName">${userInfo.realName }</li>
					</ul>
					<div class="toInfo">
						<img src="${imgPath}/customer/noOpen.png">
					</div>
				</div>
			</div>
		</a>
		<!--选项卡 区  -->
		<div class="row">
			<div class="optionCard col-xs-12">
				<div class="col-xs-6 doProject">
					<div class="doing" id="doingProject">进行项目</div>
				</div>
				<div class="col-xs-6 historyProject">
					<div class="noDoing" id="historyProject">历史项目</div>
				</div>
			</div>
		</div>
	</r:identity>
	<r:identity role="employee">
		<input type="hidden" id="role" value="employee">
		<div class="row">
			<div class="optionCard col-xs-12" style="margin-top: 48px">
				<div class="col-xs-4 doProject">
					<div class="noDoing" id="pauseProject">暂停项目</div>
				</div>
				<div class="col-xs-4 doProject">
					<div class="doing" id="doingProject">进行项目</div>
				</div>
				<div class="col-xs-4 historyProject">
					<div class="noDoing" id="historyProject">历史项目</div>
				</div>
			</div>
		</div>
	</r:identity>
	<r:identity role="provider">
		<input type="hidden" id="role" value="provider">
		<div class="row">
			<div class="optionCard col-xs-12" style="margin-top: 48px">
				<div class="col-xs-4 doProject">
					<div class="noDoing" id="pauseProject">暂停项目</div>
				</div>
				<div class="col-xs-4 doProject">
					<div class="doing" id="doingProject">进行项目</div>
				</div>
				<div class="col-xs-4 historyProject">
					<div class="noDoing" id="historyProject">历史项目</div>
				</div>
			</div>
		</div>
	</r:identity>

	<div>
		<div class="" id="projectCard"></div>
		<div class="hide"  id="projectCardHistory"></div>
		<div class="hide"  id="projectCardPause"></div>
	</div>

	<!-- model -->
	<div class="phoneModel hide" id="onLine">
		<div class="modelContent">
			<img class="cancle" src="${imgPath}/customer/cancle.png">
			<div class="topModal">
				<ul>
					<li>线上收款信息</li>
					<li id="onLineDate"></li>
					<li><img src="${imgPath}/customer/bank.png"></li>
				</ul>
			</div>

			<div class="modalInfo">
				<ul>
					<li><div>项目名称</div> <input type="text" id="onLinePName"></li>
					<li><div>支付单号</div> <input type="text" id="onLineBillNo"></li>
					<li><div>付款方</div> <input type="text" id="onLineExpenditure"></li>
					<li><div>支付金额</div>
					<span>元</span><input type="text" id="onLinePayPrice"></li>
				</ul>
			</div>
			<div class="onLineSubBtn btn-red-common">提交</div>
		</div>
	</div>
	
	<div class="phoneModel hide" id="nextcheckListModel">
		<div class="top modelContent ">
			<img class="cancle" src="${imgPath}/customer/cancle.png">
			<div>
				<ul id="checkListUL">
				</ul>
				<label class="checkModel"  id="checkListLabel">加载中.....</label>
				<div class="bottom-btn">
					<button class="buttonLeft" id="nextflowbtn">确定</button>
					<button class="buttonRight" id="checkListULcancle" >取消</button>
				</div>
			</div>
		</div>
	</div>
	

	<div class="phoneModel hide" id="outLine">
		<div class="modelContent">
			<img class="cancle" src="${imgPath}/customer/cancle.png">

			<div class="topModal">
				<ul>
					<li>线下收款信息</li>
					<li id="outLineDateTitle"></li>
					<li><img src="${imgPath}/customer/offBank.png"></li>
				</ul>
			</div>

			<div class="modalInfo">
				<ul>
					<li><div>银行流水号</div> <input type="text" id="outLineBillNo"></li>
					<li><div>项目名称</div> <input type="text" id="outLinePName"></li>
					<li><div>客户名称</div> <input type="text" id="outLineExpenditure"></li>
					<li><div>支付时间</div> <input type="text" id="outLineDate"></li>
					<li>
						<div>支付金额</div> 
						<span>元</span><input type="text" id="outLinePayPrice">
					</li>
				</ul>
			</div>

			<div class="outLineSubBtn btn-red-common">提交</div>

		</div>
	</div>
	
	<div class="gifImgDiv" id="showImg">
		<img class="gifImg" src="${imgPath}/wait.gif">
	</div>

	<div class="phoneModel hide" id="waring">
		<div class="top modelContent ">
			<img class="cancle" src="${imgPath}/customer/cancle.png">
			<div class="modalError" id="infoModel"></div>
			<div class="bottom-btn">
				<div class="btn-red-common red" id = "phoneModelConfirm">确定</div>
				<div class="btn-gray-common" id = "phoneModelCancel">取消</div>
			</div>
		</div>
	</div>
	
	<div class="phoneModel hide" id="waring2">
		<div class="top modelContent ">
			<img class="cancle" src="${imgPath}/customer/cancle.png">
			<div class="modalError" id="infoModel">确定进行下一步吗？</div>
			<textarea id="msg"></textarea>
			<div id="errorMsg" class="hide errorMsg"></div>
			<div class="bottom-btn">
				<div class=" btn-red-common red" id = "phoneModelConfirm2">确定</div>
				<div class=" btn-gray-common" id = "phoneModelCancel2">取消</div>
			</div>
		</div>
	</div>

	<div class="phoneModel hide" id="checkList">
		<div class="top modelContent " >
			<img class="cancle" id="checkListCancel" src="${imgPath}/customer/cancle.png">
			<div class="checkList">
				<input type="hidden" id="inID">
				<ul id = "phoneModelErrorList">
					<li><span>确认一下</span><span class="green">√</span></li>
					<li><span>确认一下</span><span class="redWord">X</span></li>
				</ul>
			</div>
			<div style="width:100%;text-align:center;color:#fe5453;font-size:1.6rem;padding-bottom:5px">请在pc端确认更改</div>
			<div class="bottom-btn">
				<div class="btn-red-common" id="checkListConfirm">确认</div>
			</div>
		</div>
	</div>

  <a class="hide" id="toOrder"> 
   <div class="toOreder">
      当前没有项目
   </div>
  </a> 
	<r:multPermission uri3="/completeTask" uri2="/suspendProcess"
		uri="/project/cancelProject">
		<div class="stepBtn hide btndiv-id">
			<r:permission uri="/completeTask">
				<button class="flowbtn btn-gray-common ">下一步</button>
			</r:permission>
			<r:permission uri="/suspendProcess">
				<button class="pausebtn btn-gray-common">暂停</button>
			</r:permission>
			<r:permission uri="/resumeProcess">
				<button class="resumeBtn btn-gray-common">恢复</button>
			</r:permission>
			<r:permission uri="/project/cancelProject">
				<button class="cancelbtn btn-gray-common">取消</button>
			</r:permission>
			<r:permission uri="/jumpPrevTask">
				<button class="prev-task btn-gray-common">上一步</button>
			</r:permission>
		</div>
	</r:multPermission>
	<!-- webshare -->
	<div class="-mob-share-ui-button -mob-share-open" id="share-open"
		style="visibility: hidden;"></div>
	<div class="-mob-share-ui" style="display: none">
		<ul class="-mob-share-list">
			<li class="-mob-share-weixin share"><p>微信</p></li>
			<li class="-mob-share-qq"><p>QQ</p></li>
			<li class="-mob-share-weibo share"><p>新浪微博</p></li>
			<li class="-mob-share-qzone"><p>QQ空间</p></li>
		</ul>
		<div class="-mob-share-close">取消</div>
	</div>
	<div class="-mob-share-ui-bg"></div>
	<script id="-mob-share"
		src="https://f1.webshare.mob.com/code/mob-share.js?appkey=8c49c537a706"></script>
</body>
</html>