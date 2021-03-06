<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="r" uri="/mytaglib"%>
<%@ page import="java.lang.Integer"%>
<%@ page import="java.util.List"%>

<%-- import CSS --%>
<spring:url value="/resources/lib/Bootstrap/css/bootstrap.min.css"
	var="bootstrapCss" />
<spring:url value="/resources/lib/mMenu/jquery.mmenu.all.css"
	var="mmenuCss" />
<spring:url value="/resources/css/search.css" var="searchCss" />

<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js"
	var="jqueryJs" />
<spring:url value="/resources/lib/jquery/plugins.js" var="pluginJs" />
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js"
	var="jsonJs" />
<spring:url value="/resources/lib/mMenu/jquery.mmenu.min.js"
	var="mmenuJs" />
<spring:url value="/resources/js/imgLazyLoad.js" var="imgLazyLoadingJs" />
<spring:url value="/resources/js/common.js" var="commonJs" />
<spring:url value="/resources/js/search.js" var="searchJs" />
<spring:url value="/resources/lib/jquery.json/jquery.json-2.4.min.js"
	var="jsonJs" />

<spring:url
	value="/resources/lib/jquery.scrollstop/jquery.scrollstop.min.js"
	var="scrollstopJs" />
<spring:url value="/resources/lib/jquery.lazyload/lazysizes.min.js"
	var="lazyloadJs" />

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
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
<!-- iphone 手机默认全屏 -->
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="keywords"	 content="宣传片制作报价,宣传片制作成本,宣传片脚本,宣传片策划,宣传片创意">
<meta name="description" content="宣传片创意策划免费分享平台，正在找企业宣传片制作公司？想了解产品宣传片制作成本及报价？上拍片网，彻底解决您的烦恼！品牌商业宣传片等更多有价值的信息等你来发现。">

<title>宣传片制作报价_宣传片制作成本_宣传片脚本_宣传片创意策划-拍片网</title>


<link rel="shortcut icon" href="${imgPath }/favicon.ico">
<link rel="stylesheet" href="${bootstrapCss }">
<link rel="stylesheet" href="${mmenuCss }">
<link rel="stylesheet" href="${searchCss }">
<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
</head>
<body>
	<input type="hidden" id="storage_node"
		value="${file_locate_storage_path }" />
	<input type="hidden" value='${q }' id="q" />
	<input type="hidden" value="${industry }" id="industry" />
	<input type="hidden" value="${genre }" id="genre" />
	<input type="hidden" value="${production}" id="production" />
	<input type="hidden" value="${price }" id="price" />
	<input type="hidden" value="${total }" id="total" />
	<input type="hidden" value="${isMore }" id="isMore" />
	<input type="hidden" value="${source }" id="source" />
	
	<r:identity role="employee">
		<input type="hidden" id="rolephone" value="1314520ppw" />
		<input type="hidden" id="rolephoneImg" value="1314520ppw" />
	</r:identity>


	<input type="hidden" id="storage_node"
		value="${file_locate_storage_path }" />
	<div class="phoneHeader">
		<a id="openMenu"><img src="${imgPath }/index/toMenu.png"></a> <a
			href="/list.html"> <img src="${imgPath}/index/toSearch.png">
		</a> <img class="searchType" src="${imgPath }/index/searchBox.png">
		<a href="/"><img class="ppwLogo" src="${imgPath}/index/logoH.png"></a>
	</div>

	<jsp:include flush="true" page="menu.jsp"></jsp:include>

	<div class="searchBoxInit searchInit">
		<div class="hideBox"></div>
		<div class="searchBox searchInit">
			<div class="searchItem">
				<div class="typeTitle" id="typeTags">
					<div>类型 :</div>
					<img id="qType" src="${imgPath }/index/flow.png">
				</div>
				<div class="itemTags" id="typeTagsItem"></div>
				<div class="itemTags noShow" id="typeTagsShow"></div>
			</div>

			<div class="searchItem">
				<div class="typeTitle" id="workTags">
					<div>行业 :</div>
					<img src="${imgPath }/index/flow.png" id="wType">
				</div>
				<div class="itemTags" id="workTagsItem"></div>
				<div class="itemTags noShow" id="workTagsShow"></div>
			</div>

			<div class="searchItem">
				<div class="typeTitle" id="dimension">
					<div>维度:</div>
					<img src="${imgPath }/index/flow.png" id="wDimension">
				</div>
				<div class="itemTags" id="dimensionItem"></div>
				<div class="itemTags noShow" id="dimensionShow"></div>
			</div>


<r:identity role="employee">
			<div class="searchItem noborder">
				<div class="typeTitle">
					<div>价格区间(元) :</div>
				</div>
				<div class="priceTags">
					<div class="priceRate">
						<input placeholder="最低价" id="lowPrice">最低价</input>
						<div>-</div>
						<input placeholder="最高价" id="heightPrice">最高价</input>
					</div>
					<div class="price">
						<div data-low="0" data-content="30000" class="tagsPrice">0 ~
							3万</div>
						<div data-low="30000" data-content="60000" class="tagsPrice">3
							~ 6万</div>
						<div data-low="60000" data-content="100000" class="tagsPrice">6
							~ 10万</div>
						<div data-low="100000" class="tagsPrice">10万以上</div>
					</div>
				</div>
				<div class="itemTags noShow" id="dimensionShow"></div>
			</div>
			
			<div class="searchItem noborder">
				<div class="typeTitle">
					<div>来源:</div>
				</div>
				<div class="itemTags" id="tagsSourceItem">
						<div class="tagsSource" data-id="&source=paipianwang" id="pai">拍片网</div>
						<div class="tagsSource" data-id="&source=team" id="team">供应商</div>
						<div class="tagsSource" data-id="&source=case" id="case">案例</div>
				</div>
				<div class="itemTags noShow" id="dimensionShow"></div>
			</div>	
		</r:identity>		
		</div>

		<div class="checkBtn" id="checkBtn">
			<div id="cancle">取消</div>
			<div id="toSearch">完成</div>
		</div>
	</div>



	<div class="pagePhone">

		<div class="hideMenu">
			<c:if test="${!empty list}">
				<!-- not empty -->
				<c:forEach items="${list }" var="solr" varStatus="status">

					<div class="contentItem">

						<img class="lazyload"
							data-src="${file_locate_storage_path }${solr.picLDUrl }">
						<r:identity role="employee">
							<c:if test="${solr.teamFlag == 1 && solr.indentProjectId != 0 }">
								<img class="roleImg" src="${imgPath }/video/roleOur.png">
							</c:if>
							<c:if test="${solr.teamFlag == 4 }">
								<img class="roleImg" src="${imgPath }/video/rolePlay.png">
							</c:if>
							<c:if test="${solr.teamFlag == 1 && solr.indentProjectId == 0 }">
								<img class="roleImg" src="${imgPath }/video/rolePro.png">
							</c:if>
						</r:identity>
						<div class="itemS">
                           <a href="<spring:url value='/provider/info_${solr.teamId }.html'/>">
								<div class="itemTitle">${solr.productName}</div>
								<div class="itemTag">
									<c:forEach items="${fn:split(fn:trim(solr.tags),' ') }"
										var="tag" end="2" varStatus="stat">
										<c:if test="${stat.index < 5}">
											<c:if test="${stat.index > 0}">/</c:if>${tag} 
												   </c:if>
									</c:forEach>
								</div>
							</a>
							<div class="toProvider">
								<c:if test="${not empty solr.teamFlag && solr.teamFlag != 4 }">
									<a href="<spring:url value='/provider/info_${solr.teamId }.html'/>">
										<img src="${file_locate_storage_path }${solr.teamPhotoUrl }">
										<div class="proName">${solr.teamName }</div>
									</a>
								</c:if>
							</div>
						</div>
						<a class="videoItem"
							href="<spring:url value='/play/${solr.teamId}_${solr.productId }.html'/>">
							<div class="itemBack"></div>
						</a>
					</div>
				</c:forEach>
			</c:if>

			<c:if test="${ empty list}">
				<div class="noImg">
					<img src="${imgPath }/index/noVideo.png">
					<div>很抱歉,没有找到相关影片</div>
					<div>请尝试用其它关键词搜索</div>
				</div>
			</c:if>

		</div>
		<jsp:include flush="true" page="foot.jsp"></jsp:include>

	</div>
	<script src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
	<script src="${jqueryJs}"></script>
	<script src="${searchJs}"></script>
	<script src="${commonJs}"></script>
	<script src="${jsonJs}"></script>
	<script src="${scrollstopJs}"></script>
	<script src="${lazyloadJs}"></script>
</body>
</html>