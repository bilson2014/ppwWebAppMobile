<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%-- import CSS --%>

<spring:url value="/resources/css/salesman/taobao/index.css" var="indexCss"/>
<%-- import JS --%>
<spring:url value="/resources/lib/jquery/jquery-2.0.3.min.js" var="jqueryJs"/>
<spring:url value="/resources/js/common.js" var="commonJs"/>
<spring:url value="/resources/js/salesman/taobao/index.js" var="indexJs"/>

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
	<title>拼团半价抢淘宝主图短视频</title>
	<meta name="keywords" content="淘宝主图视频,电商短视频,淘宝短视频官方拍摄基地">
	<meta name="description" content="淘宝短视频官方拍摄基地致力于主图视频、电商短视频精工制作，增加店铺流量，提升转化率，瓜分内容营销红利。主图短视频制作，上拍片网拼团更便宜。">
	
	<link rel="shortcut icon" href="${imgPath }/favicon.ico" >
	<link rel="stylesheet" href="${indexCss}">
	<link rel="stylesheet" href="/resources/lib/swiper/swiper.min.css">
	
	<!--[if lt IE 9]>
		<script>window.html5 || document.write('<script src="html5shivJs"><\/script>')</script>
	<![endif]-->
	<script src="${jqueryJs }"></script>
	<script src="${indexJs }"></script>
	<script src="${commonJs }"></script>
	<script src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
	<script src="/resources/lib/swiper/swiper.min.js"></script>
</head>
<body>
	
<input type="hidden" id="uniqueId" value="${uniqueId}">
     <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide one">
                      <img src="${imgPath}/salesMan/taobao/index1up.jpg">
                      <img src="${imgPath}/salesMan/taobao/index1down.png">
            </div>
            <div class="swiper-slide" style="overflow: hidden;">
					<video id="video" src="https://filec.apaipian.com/group1/M00/00/CD/CgptuFrkU-SAAbibABwWV1aeolI289.mp4" controls="controls" poster="${imgPath}/salesMan/taobao/videoBanner.jpg"></video>
					<div class="price">
					     <div class="setPrice">
					             <div class="realPrice">￥   2588</div>
					             <div class="oldPrice">￥5188</div>
					     </div>
					     <div class="lastDay">剩余 <span id="time">3</span></div>
					</div>
					
					<div class="describe">
					        <img src="${imgPath}/salesMan/taobao/logo.png">
					        <div class="newTitle">淘宝短视频官方拍摄基地 </div>
					        <div class="desTitle">
					                   <div> 类型说明：功能讲解类</div>
					        </div>
					        <div class="proDes">
					                <div>
						                                                               产品类型：数码<br>
												1、展示外观与内部结构展示<br>
												2、主要功能与亮点讲解并且试用<br>
												3、同类商品或者同款商品中不同色号之间对比<br>
					                </div>
					        </div>					      
					</div>
					
					  <div class="line"></div>
					  
			          <div class="btnDes">
			                   <div class="btnItem">
			                         <div class="title" id="openWay">拼团玩法</div>
			                         <img src="${imgPath}/salesMan/taobao/right.png">
			                         <div class="bottomLine"></div>
			                   </div>
			                    <div class="btnItem" id="openOrder">
			                         <div class="title">规则说明</div>
			                         <img src="${imgPath}/salesMan/taobao/right.png">
			                         <div class="bottomLine"></div>
			                   </div>
			                    <div class="btnItem" id="openOur">
			                         <div class="title">官方基地介绍</div>
			                         <img src="${imgPath}/salesMan/taobao/right.png">
			                   </div>
			          </div>
			          <div class="line"></div>
			          
			          
			          <!-- 弹出窗 -->
			          
			           <div class="setBackground"></div>
    
        <div class="modelType" id="orderUse">
			                <div class="setContent">
			                       <div class="topContent">
				                        <div class="contentTitle">
				                                                                              规则说明			                        
				                             <div class="closeBtn"></div>
				                        </div>
				                   </div>      
				                        
							            <div class="slide3Title">
			                                  <div></div>
			                                  <div>视频标准</div>
			                                  <div></div>
			                         	 </div>
			                         	 
			                         	 <div class="areaOne">
				                                 <div class="content">
				                                      <div class="item" style="line-height: 0.7rem;">
				                                             <div>1. 清晰度  >  720 * 480 建议: <span>1024x1024 / 1920 x 1080 / 810 x 1080 </span></div>
				                                      </div>
				                                      <div class="item">
				                                             <div>2.   画面比例： <span>1:1   or   16:9   or 3:4</span></div>
				                                      </div>
				                                      <div class="item">
				                                             <div>3.   无黑边、无二维码、无水印、非幻灯片视频、无片头</div>
				                                      </div>
				                                 </div>
				                          </div>
				                          
				                         <div class="slide3Title">
			                                  <div></div>
			                                  <div>视频使用</div>
			                                  <div></div>
			                         	 </div>
							             <div class="areaOne">
				                              <div class="moreLine">
				                                     	重点围绕该单品的 <span>外观与工艺\穿搭节拍\评测教学\功能展示 </span>等视频介绍，更多丰富信息激发消费者兴趣和购买力。
				                              </div>
				                          </div>
			                </div>			          
			          </div>
			          
			          <div class="modelType" id="orderOur"  >
			                <div class="setContent">
			                       <div class="topContent">
				                        <div class="contentTitle">
				                                                                             官方基地介绍			                        
				                             <div class="closeBtn"></div>
				                        </div>
				                   </div> 
					               <div class="setPaiZhao">
					             		<img src="${imgPath}/salesMan/taobao/our.jpg"> 
					             </div> 
				             </div> 
			          </div> 
			          
			          
			           <div class="modelType" id="orderWay"  >
			                <div class="setContent">
			                       <div class="topContent">
				                        <div class="contentTitle">
				                                                                             拼团玩法			                        
				                             <div class="closeBtn"></div>
				                        </div>
				                   </div> 
				                   <div class="playContent">
				                        
				                        <div class="playItem">
				                            <div class="redLine"></div>
				                            <div class="itemWord">
				                                   <span>团长：</span> 团长是指该团第一位支付成功的人。
				                            </div>
				                        </div>
				                        
				                        <div class="playItem">
				                            <div class="redLine"></div>
				                            <div class="itemWord">
				                                   <span>开团：</span> 团长购买拼团商品，完成支付后，团即可开启。
				                            </div>
				                        </div>
				                        
				                         <div class="playItem">
				                            <div class="redLine"></div>
				                            <div class="itemWord">
				                                 <span>  邀请好友参团：</span> 团长开团后可以将团链接分享给好友，购买该商品的好友视为参团成员占用该团的参团名额（需支付成功），参团成员也可以分享团链接邀请更多的成员参加。
				                            </div>
				                        </div>
				                        
				                        <div class="playItem">
				                            <div class="redLine"></div>
				                            <div class="itemWord">
				                                <span>   取消订单：</span> 拼团订单未支付时，若其参与的团已拼团成功或失败，则该订单自动取消。拼团订单支付成功后不支持取消订单；拼团失败时该团所有订单自动取消。
				                            </div>
				                        </div>
				                        
				                        <div class="playItem">
				                            <div class="redLine"></div>
				                            <div class="itemWord">
				                              <span> 拼团成功：</span> 开团至活动截止时间达到规定的成团人数，即可拼团成功。
				                            </div>
				                        </div>
				                        
				                        <div class="playItem">
				                            <div class="redLine"></div>
				                            <div class="itemWord">
				                             <span> 拼团失败：</span> 开团至活动截止时间为能找到相应人数的好友参团，该团失败，系统自动退款。拼团成功后若出现团圆订单全部取消的情况，团长连带取消。
				                            </div>
				                        </div>
				                   
				                   </div>
					              
				             </div> 
			          </div> 
			          
			          <!-- end -->
			          
          </div>
            
            <div class="swiper-slide">
            
                          <div class="slide3Title">
                                  <div></div>
                                  <div>团购套餐信</div>
                                  <div></div>
                          </div>
                          <div class="areaOne">
                                 <div class="content">
                                      <div class="item">
                                             <div>视 频 类 型：<span>功能展示类</span></div>
                                      </div>
                                      <div class="item">
                                             <div>时 &nbsp &nbsp &nbsp &nbsp &nbsp长：  <span>30秒 五个卖点展示</span></div>
                                      </div>
                                      <div class="item">
                                             <div>实 拍 影 棚：   <span>五选二</span></div>
                                      </div>
                                      <div class="item">
                                             <div>推 荐 比 例：   <span> 1:1 或  16:9  （二选一）</span></div>
                                      </div>
                                      <div class="item">
                                             <div>分辨率推荐：  <span> 1024*1024 或  1920*1080 （二选一）</span></div>
                                      </div>
                                      <div class="item">
                                             <div>道 &nbsp &nbsp &nbsp &nbsp &nbsp具：   <span>普通配饰</span></div>
                                      </div>
                                      <div class="item">
                                             <div>音 &nbsp &nbsp &nbsp &nbsp &nbsp乐：     <span>免费版权</span></div>
                                      </div>
                                       <div class="item">
                                             <div>字 &nbsp &nbsp &nbsp &nbsp &nbsp体：     <span>免费版权</span></div>
                                      </div>
                                     
                                 </div>
                          </div>
                          
                           <div class="slide3Title">
                                  <div></div>
                                  <div>服务说明</div>
                                  <div></div>
                          </div>
                          
                          <div class="areaOne">
                              <div class="centerContent">
                                     	下单后，请尽快通过二维码与客服取得联系。
                              </div>
                          </div>
                          
                           <div class="slide3Title">
                                  <div></div>
                                  <div>温馨提示</div>
                                  <div></div>
                          </div>
                          
                          <div class="areaOne">
                              <div class="centerContent">
                                     	本活动详情，您可向拍片网官方客服咨询。
                              </div>
                          </div>
                          
            </div>
            
        </div>
    </div>
    
    <div class="orderBtn leftBtn hide">
                             ￥5188<br><span>原价</span>
    </div>
    <a class="orderBtn rightBtn hide" href="/salesman/taobao/message/${uniqueId}">
	                             ￥2588<br><span>20人团 (未成团退款)  </span>
    </a>
    
    
   
	
</body>
</html>