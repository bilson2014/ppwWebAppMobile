<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<spring:url value="/resources/images" var="imgPath" />

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
		                 <div class="differentItem">北京市朝阳区国贸建外SOHO东区6号楼25层</div>
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