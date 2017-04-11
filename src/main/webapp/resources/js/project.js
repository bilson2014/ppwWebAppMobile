var role;
var ROLE_EMPLOYEE = "employee"; 
var ROLE_CUSTOMER = "customer";
var ROLE_PROVIDER = "provider";
var flowBtn;
var currentOperation ;
var successIntervalObj;
var isBd;
$().ready(function(){
	role = $("#role").val(); //用户身份
	isBd = $('#add-project').length > 0;
	showHeadImg();
	initDefaultMsg();
	flowBtn = flowBtnControl.loadFlowBtn(); // 流程按钮
	tab.bindEvent();
	loadProjectCard.loadList();
});

function initDefaultMsg(){
	var loginName = $('#loginName').text();
	if(loginName == null || loginName == undefined || loginName == ''){
		$('#loginName').text('');
	}
	
	var realName = $('#realName').text();
	if(realName == null || realName == undefined || realName == ''){
		$('#realName').text('');
	}
}

function showHeadImg(){
	var userImgPath = $('#user_img').val();
	if(userImgPath != null && userImgPath != '' && userImgPath != undefined){ // 加载用户头像
		
		if(userImgPath.indexOf('http') > -1){
			// 第三方登录
			$('#infoHead').attr('src',userImgPath);
		}else{
			var imgPath = getDfsHostName() + userImgPath;
			$('#infoHead').attr('src',imgPath);
			
		}
	}else{
		// 加载 默认头像
		var defaultImgPath = getHostName() + '/resources/images/icons/lazyloading3.png';
		$('#infoHead').attr('src',defaultImgPath);
	}
}



function showTime(){
	   var mydate = new Date();
	   var str = "" + mydate.getFullYear() + "-";
	   str += (mydate.getMonth()+1) + "-";
	   str += mydate.getDate() + "-";
	   return str;
}
// 选项卡控制
var tab = {
		resetView:function(){
			$("#pauseProject").attr('class','noDoing');
			$("#doingProject").attr('class','noDoing');
			$("#historyProject").attr('class','noDoing');
			$('#projectCard').addClass('hide');
			$('#projectCardHistory').addClass('hide');
			$('#projectCardPause').addClass('hide');
			$('#showImg').removeClass('hide');
		},
		bindEvent:function(){
			$("#pauseProject").on('click',function(){
				tab.resetView();
				$(this).attr('class','doing');
				$('#projectCardPause').removeClass('hide');
				if($('#projectCardPause').find('div').hasClass('projectCard')){
					$('#showImg').addClass('hide');
					$('#toOrder').addClass('hide');
				}else{
					$('#showImg').addClass('hide');
					$('#toOrder').removeClass('hide');
				}
				
			});
			$("#doingProject").on('click',function(){
				tab.resetView();
				$(this).attr('class','doing');
				$('#projectCard').removeClass('hide');
				if($('#projectCard').find('div').hasClass('projectCard')){
					$('#showImg').addClass('hide');
					$('#toOrder').addClass('hide');
				}else{
					$('#showImg').addClass('hide');
					$('#toOrder').removeClass('hide');
				}
			});
			$("#historyProject").on('click',function(){
				tab.resetView();
				$(this).attr('class','doing');
				$('#projectCardHistory').removeClass('hide');
				if($('#projectCardHistory').find('div').hasClass('projectCard')){
					$('#showImg').addClass('hide');
					$('#toOrder').addClass('hide');
				}else{
					$('#showImg').addClass('hide');
					$('#toOrder').removeClass('hide');
				}
			});
		}
};

var loadProjectCard = {
	loadList:function(){
		$('#showImg').removeClass('hide');
		var root = $("#projectCard");
		var rootHistory = $("#projectCardHistory");
		var rootPause = $("#projectCardPause");
		loadData(function(msg) {
			if(msg.length > 0){
			
				var step = new Step_Tool_dc();
				// 分类型加载    客户--》进行中、历史     供应商，视频管家 --》 暂停、进行中、历史
				switch (role) {
					case ROLE_CUSTOMER:
						for(var por in msg){
							var state = msg[por].state;
							var html = cardBuildHtml.createBase(msg[por].nodes,msg[por].task,step,msg[por].id,msg[por].projectName,state);
							if(state == 0 || state == 3)
								root.append(html);
							else if(state == 1 || state == 2)
								rootHistory.append(html);
						}
						break;
					case ROLE_EMPLOYEE:
					case ROLE_PROVIDER:
						for(var por in msg){
							var state = msg[por].state;
							var html = cardBuildHtml.createBase(msg[por].nodes,msg[por].task,step,msg[por].id,msg[por].projectName,state);
							if(state == 0)
								root.append(html);
							else if(state == 3)
								rootPause.append(html);
							else if(state == 1 || state == 2)
								rootHistory.append(html);
						}
						
						controlCard.bindMgrEvent();
						break;
				}
				
			}else{
				controlCard.bindMgrEvent();
			}
			controlCard.init();
			if(root.html() == ''){
				$('#toOrder').removeClass('hide');
			}else{
				$('#toOrder').addClass('hide');
			}
			$('#showImg').addClass('hide');
		}, getContextPath() + '/project/all-project', $.toJSON({}));
		
	},
	loadBaseInfo:function(self){
		// 加载基础信息
		var key = self.attr("data-id");
		if (key != null && key != undefined && key != '') {
			loadData(function(msg) {
				
				if(msg.length<=0){
					self.next('#projectContent').addClass('hide');
					self.addClass('opens');
				}
				
				var content = self.next('#projectContent');
				content.html('');
				var priceFinish = msg.priceFinish;
				if(priceFinish == undefined || priceFinish == null || priceFinish == '')
					priceFinish = '暂无';
				var $body = '<div class="openArea">'+
								'<div class="openInfo">'+
									'<div>项目名称</div>'+
									'<div class="projectWidth">'+msg.projectName+'</div>'+
								'</div>'+
								'<div class="openInfo">'+
									'<div>项目编号</div>'+
									'<div class="projectWidth">'+msg.serial+'</div>'+
								'</div>'+
								'<div class="openInfo">'+
									'<div>项目价格</div>'+
									'<div class="projectWidth">'+priceFinish+'</div>'+
								'</div>'+
							'</div>';
				content.append($body);
			}, getContextPath() + '/project/get-projectInfo', $.toJSON({
				id : key
			}));
		}
		
	},
	loadFile:function(self){
		var key = self.attr("data-id");
		if(key != null ){
			loadData(function(msg) {
				
				
				if(msg.length<=0){
					self.next('#projectFile').addClass('hide');
					self.addClass('opens');
				}
				
				var content = self.next('#projectFile');
				content.html('');
				if(msg.length > 0){
					for(var index in msg){
						 var name=msg[index].irOriginalName;
	                    var fileName=name.lastIndexOf(".");
	                    var finalName=name.substring(fileName+1);
	                    var src='/resources/images/file/';
	                    var url = getDfsHostName() + (msg[index].irViewName == null?msg[index].irFormatName:msg[index].irViewName);//getFileUrl(msg[index].irId);
	                    switch (finalName) {
	                        case 'doc':
	                        case 'docx':
	                            src+='doc.png';
	                            break;
	                        case 'xls':
	                        case 'xlsx':
	                            src+='xls.png';
	                            break;
	                        case 'ppt':
	                        case 'pptx':
	                            src+='ppt.png';
	                            break;
	                        case 'pdf':
	                            src+='pdf.png';
	                            break;
	                        case 'txt':
	                            src+='txt.png';
	                            break;
	                        case 'avi':
	                            src+='avi.png';
	                            break;
	                        case 'esp':
	                            src+='esp.png';
	                            break;  
	                        case 'jpg':
	                            src+='jpg.png';
	                            break;  
	                        case 'mov':
	                            src+='mov.png';
	                            break;
	                        case 'mp3':
	                            src+='mp3.png';
	                            break;
	                        case 'mp4':
	                            src+='mp4.png';
	                            break;
	                        case 'png':
	                            src+='png.png';
	                            break;
	                        case 'rar':
	                            src+='rar.png';
	                            break;
	                        case 'wav':
	                            src+='wav.png';
	                            break;
	                        case 'zip':
	                            src+='zip.png';
	                            break;
	                        default:
	                            src+='file.png';
	                            break;
	                    }
	                    var fileimg='<img class="img-icon" id="img-icon-id" src="'+src+'">';
	                    var line = '<div class="line"></div>';
	    				var $body = '<div class="proJectArea">'+
	    					fileimg +
	    					'<ul style="display: inline-block">'+
	    						'<li>'+name+'</li>'+
	    						'<li>上传于'+ msg[index].irCreateDate+'</li>'+
	    					'</ul>'+
	    					'<div class="icon">'+
	    						'<a href = "'+url+'">'+
	    						'<div class="find" data-id="'+msg[index].irId+'"></div>'+
	    						'</a>'+
	    						'<div class="share" data-url="'+url+'"></div>'+
	    					'</div>'+
	    				'</div>';
	    				content.append($body);
					}
				}
				controlCard.bindFileShareBtn();
			}, getContextPath() + '/project/getResourceList', $.toJSON({
				id : key
			}));
		}
	},
	loadMessage:function(self){
		var key = self.attr("data-id");
		if(key != null ){
			loadData(function(msg) {
				var content = self.next('#projectBoard');
				content.html('');
				if(msg.length > 0){
					$body = '<div class="boardArea">'+
					'<div style="width: 90%; margin: 0 auto">'+
						'<textarea class = "comment"></textarea>'+
					'</div>'+
					'<div class="btn-red-common subcomment" data-id ="'+msg[0].icIndentId+'" >提交</div>'+
					'<div class="historyNote">';
					for(var index in msg){
						var user = msg[index].userViewModel;
						var text = "未知";
						if (user != null) {
							//imgx.attr("src",user.imgUrl);
							text = user.userName;
							if(user.imgUrl != undefined && user.imgUrl != '') {
								if(user.imgUrl.indexOf('resources/images') < 0) {
									user.imgUrl = getDfsHostName() + user.imgUrl;
								}
							}
						}
						$body+='<div class="noteArea" >'+
									'<div>'+
										'<img src ='+ user.imgUrl +' >'+
									'</div>'+
									'<ul style="display: inline-block">'+
										'<li>'+text+msg[index].icCreateDate.split(' ')[0]+'</li>'+
										'<li>'+msg[index].icContent+'</li>'+
									'</ul>'+
								'</div>';
					}
					$body+=
						'</div>'+
					'</div>';
					content.append($body);
					controlCard.bindCommentBtn();
				}
			}, getContextPath() + '	/project/getAllComment', $.toJSON({
				id : key
			}));
		}
	},
	loadPay:function(self){
		var key = self.attr("data-id");
		var div = $(self).next().find('#proPriceCard');
		div.html('');
		var $body;
		loadData(function(msg){
			
		if(role != 'employee' || (!$('#projectCardHistory').hasClass('hide'))){	
			if(msg.length<=0 ){
				self.next().addClass('hide');
				self.addClass('opens');
			}
		}
			
			if(msg != null ){
				msg.forEach(function(deal){
				var status =  deal.dealStatus;
				var dealLogSource = deal.dealLogSource; // 交易日志来源
				var dealLogSourceStr = '';
				var dateStr = '';
				if(deal.dealLogSource == 0)
					dealLogSourceStr = '线上支付';
				else
					dealLogSourceStr = '线下支付';
				
				var statusStr = '';
				// TODO: 支付卡样式
				switch (status) {
				case 0: // 正常
					statusStr = '<div class="stateWait zhifuzhong-event" data-id = "'+key+'">待支付</div>';
					dateStr = '<div class="contentTitle">截止时间</div>'+
					'<div class="contentInfo">'+ deal.orderTimeOut +'</div>';
					break;
				case 1: // 完成
					var str = deal.payTime;
					if(str != null && str != ''){
						str = str.split(' ')[0];
					}else{
						str = '';
					}
					var patTime = '';
					statusStr = '<div class="state">完成</div>';
					dateStr = '<div class="contentTitle">付款时间</div>'+
					'<div class="contentInfo">'+ str +'</div>';
					break;
				case 2: // 支付关闭
					statusStr = '<div class="state">失效</div>';
					dateStr = '<div class="contentTitle">失效时间</div>'+
					'<div class="contentInfo">'+ deal.orderTimeOut +'</div>';
					break;
				}
				
			$body =
				'<div class="proPriceCard">'+
				'<div class="proPriceContent">'+
					'<ul>'+
						'<li>'+
							'<div class="contentTitle">支付方</div>'+
							'<div class="contentInfo">'+deal.userName+'</div>'+
							 statusStr +
						'</li>'+
						'<li>'+
							'<div class="contentTitle">收款方</div>'+
							'<div class="contentInfo">'+deal.proceedsSide+'</div>'+
						'</li>'+
						'<li>'+
							'<div class="contentTitle">订单号</div>'+
							'<div class="contentInfo">'+deal.billNo+'</div>'+
						'</li>'+
//						'<li>'+
//							'<div class="contentTitle">支付时间</div>'+
//							'<div class="contentInfo">'+deal.payTime+'</div>'+
//						'</li>'+
						'<li>'+
							'<div class="contentTitle">支付方式</div>'+
							'<div class="contentInfo">'+dealLogSourceStr+'</div>'+
						'</li>'+
						'<li>'+
							dateStr +
						'</li>'+
						'<li>'+
						    '<div class="contentInfo last">'+deal.payPrice+'元</div>'+
							'<div class="contentTitle last">'+
								'<label>￥</label><label>总金额</label>'+
							'</div>'+
						'</li>'+
					'</ul>'+
				'</div>'+
				'</div>';
				div.append($body);
				});
			}
			// bind event
			controlCard.payShare();
		}, getContextPath()+'/pay/get/deallogs', $.toJSON({
			projectId:key
		}));
	}
};
var cardBuildHtml ={
		createBase:function (obj,task,step,id,proName,state){
			var stepHtml;
			var percentage ;
			var btnx = '';
			var taskName = task == null ? null:task.name;
			var update_project_btn = '<div class="update update-project" data-id="'+id+'"></div>';
			switch (state) {
			case 3:
				btnx = flowBtnControl.buildResumeView(id);
				percentage = '<span>暂停</span>';
				stepHtml = step.drawStep(taskName,obj,'awqeqe',true);
				break;
			case 2:
				stepHtml = step.drawStep(taskName,obj,'ing',false);
				percentage = step.percentage(taskName,obj);
				if(percentage == 0 && (state == 0 || state == 3)){
					btnx = flowBtnControl.buildFirstView(id);
				}else if((state == 0 || state == 3)){
					btnx = flowBtnControl.buildNormal(id);
				}
				percentage += '<span style="font-size:1.8rem;color:#999">%</span>';
				update_project_btn = '';
				break;
			case 1:
				update_project_btn = '';
				stepHtml = step.drawStep(taskName,obj,'ing',true);
				percentage = step.percentage(taskName,obj);
				if(percentage == 0 && (state == 0 || state == 3)){
					btnx = flowBtnControl.buildFirstView(id);
				}else if((state == 0 || state == 3)){
					btnx = flowBtnControl.buildNormal(id);
				}
				percentage += '<span style="font-size:1.8rem;color:#999">%</span>';
				break;
			case 0:
				stepHtml = step.drawStep(taskName,obj,'ing',true);
				percentage = step.percentage(taskName,obj);
				if(percentage == 0 && (state == 0 || state == 3)){
					btnx = flowBtnControl.buildFirstView(id);
				}else if((state == 0 || state == 3)){
					btnx = flowBtnControl.buildNormal(id);
				}
				percentage += '<span style="font-size:1.6rem;color:#999">%</span>';
				break;
			}
			if(!isBd)
				update_project_btn = '';
			var title = '';
			var paySendBtn ='';
			switch (role) {
			case ROLE_PROVIDER:
			case ROLE_CUSTOMER:
				title = 
				'<div class="cardTitle">'+
					'<div class="cardTitleWord">'+proName+'</div>'+
					'<div class="cardStatues">'+percentage+'</div>'+
				'</div>';
				paySendBtn = '';
				break;
			case ROLE_EMPLOYEE:
				title = 

				'<div class="cardTitle">'+
					'<div class="cardTitleWord">'+proName+'</div>'+
					update_project_btn+
					'<div class="cardStatues">'+percentage+'</div>'+
				'</div>';
				if(state == 0 || state ==3)
				paySendBtn = 
				  '<div class="payStyle" id="sendBtn">'+
		          	'<div class="leftBtn openOnLine"  data-id="'+id+'">发起线上支付</div>'+
		          	'<div class="rightBtn openOutLine"  data-id="'+id+'">记录线下支付</div>'+
		          '</div>';
				break;
			}
			var $body = 
				'<div class="projectCard" style="display: block;" data-name='+proName+'>'+
				 title +
				'<div class="step" data-id="'+id+'">'+
					stepHtml+
					btnx+
				'</div>'+
				'<div class="getMoreInfo">'+
					'<div class="autoDiv">'+
						'<div class="openDiv open openProject " data-id="'+id+'" id="openProject">'+
							'<img class="sameLine"'+
								'src="/resources/images/customer/projectInfo.png">'+
							'<div class="sameLine infoTitle">项目信息</div>'+
							'<img class="sameLine imgright"'+
								'src="/resources/images/customer/noOpen.png" id="openProjectIcon"> <img '+
								'class="sameLine imgright hide"'+
								'src="/resources/images/customer/open.png" id="closeProjectIcon">'+
						'</div>'+
						'<div class="openContent hide" id="projectContent">'+
						'</div>'+
					'</div>'+
		
					'<div class="autoDiv">'+
						'<div class="openDiv open openPrice index_'+id+'" data-id="'+id+'" id="openPrice">'+
							'<img class="sameLine" src="/resources/images/customer/price.png">'+
							'<div class="sameLine infoTitle">支付信息</div>'+
							'<img class="sameLine imgright"'+
								'src="/resources/images/customer/noOpen.png" id="openPriceIcon"> <img '+
								'class="sameLine imgright hide"'+
								'src="/resources/images/customer/open.png" id="closePriceIcon">'+
						'</div>'+
						'<div class="proPriceDiv hide " id="proPrice">'+
							paySendBtn +
							'<div class="" id ="proPriceCard">'+
							'</div>'+
						'</div>'+
					'</div>'+
		
					'<div class="autoDiv">'+
						'<div class="openDiv open openFile" data-id="'+id+'" id="openFile">'+
							'<img class="sameLine"'+
								'src="/resources/images/customer/projectFlie.png">'+
							'<div class="sameLine infoTitle">项目文件</div>'+
							'<img class="sameLine imgright"'+
								'src="/resources/images/customer/noOpen.png" id="openFileIcon"> <img '+
								'class="sameLine imgright hide"'+
								'src="/resources/images/customer/open.png" id="closeFileIcon">'+
						'</div>'+
						'<div class="proJectDiv hide" id="projectFile">'+
						'</div>'+
					'</div>'+
		
					'<div class="autoDiv">'+
						'<div class="openLastDiv open openBoard" data-id="'+id+'" id="openBoard" style="border: none">'+
							'<img class="sameLine" src="/resources/images/customer/note.png">'+
							'<div class="sameLine infoTitle">留言板</div>'+
							'<img class="sameLine imgright"'+
								'src="/resources/images/customer/noOpen.png" id="openBoradIcon"> <img '+
								'class="sameLine imgright hide"'+
								'src="/resources/images/customer/open.png" id="closeBoradIcon">'+
						'</div>'+
						'<div class="board hide" id="projectBoard">'+
						'</div>'+
					'</div>'+
				'</div>'+
			'</div>';
			
			return $body;
		},
}



var controlCard = {
		init:function(){
			this.controlProject();
			this.controlPrice();
			this.controlFile();
			this.controlBoard();
			// 取消流程按钮隐藏属性
			$('.btndiv-id').removeClass('hide');
			
			flowBtnControl.initEvent();
			
		},
		//项目信息
		controlProject:function(){
			$('.openProject').on('click',function(){
				if($(this).hasClass('open')){
					controlCard.openProject($(this));
				}else{
					controlCard.closeProject($(this));
				}
			});
		},
		openProject:function(self){
			self.removeClass('open');
			self.removeClass('opens');
			self.find("#openProjectIcon").addClass('hide');
			self.find('#closeProjectIcon').removeClass('hide');
			self.next('#projectContent').removeClass('hide');
			loadProjectCard.loadBaseInfo(self);
		},
		closeProject:function(self){
			self.addClass('open');
			self.removeClass('opens');
			self.find("#openProjectIcon").removeClass('hide');
			self.find('#closeProjectIcon').addClass('hide');
			self.next('#projectContent').addClass('hide');
			//self.next('#projectContent').html("");
		},
		//支付
		controlPrice:function(self){
			$('.openPrice').on('click',function(){
				if($(this).hasClass('open')){
					controlCard.openPrice($(this));
				}else{
					controlCard.closePrice($(this));
				}
			});
		},
		openPrice:function(self){
			self.removeClass('open');
			self.removeClass('opens');
			self.find("#openPriceIcon").addClass('hide');
			self.find('#closePriceIcon').removeClass('hide');
			self.next('#proPrice').removeClass('hide');
			loadProjectCard.loadPay(self);
		},
		closePrice:function(self){
			self.addClass('open');
			self.removeClass('opens');
			self.find("#openPriceIcon").removeClass('hide');
			self.find('#closePriceIcon').addClass('hide');
			self.next('#proPrice').addClass('hide');
		},
		//项目文件
		controlFile:function(){
			$('.openFile').on('click',function(){
				if($(this).hasClass('open')){
					controlCard.openFile($(this));
				}else{
					controlCard.closeFile($(this));
				}
			});
		},
		openFile:function(self){
			self.removeClass('open');
			self.removeClass('opens');
			self.find("#openFileIcon").addClass('hide');
			self.find('#closeFileIcon').removeClass('hide');
			self.next('#projectFile').removeClass('hide');
			loadProjectCard.loadFile(self);
		},
		closeFile:function(self){
			self.addClass('open');
			self.removeClass('opens');
			self.find("#openFileIcon").removeClass('hide');
			self.find('#closeFileIcon').addClass('hide');
			self.next('#projectFile').addClass('hide');
		},
		//留言板
		controlBoard:function(){
			$('.openBoard').on('click',function(){
				 
				if($(this).hasClass('open')){
					controlCard.openBoard($(this));
				}else{
					controlCard.closeBoard($(this));
				}
			});
		},
		openBoard:function(self){
			self.removeClass('open');
			self.find("#openBoradIcon").addClass('hide');
			self.find('#closeBoradIcon').removeClass('hide');
			self.next('#projectBoard').removeClass('hide');
			loadProjectCard.loadMessage(self);
		},
		closeBoard:function(self){
			self.addClass('open');
			self.find("#openBoradIcon").removeClass('hide');
			self.find('#closeBoradIcon').addClass('hide');
			self.next('#projectBoard').addClass('hide');
		},
		bindCommentBtn : function(){
			$('.subcomment').off('click');
			$('.subcomment').on('click',function(){
				controlCard.submitcomment($(this));
			});
		},
		bindFileShareBtn : function(){
			$('.share').on('click',function(){
				var key = $(this).attr('data-url');
				jumpShare(key);
			});
		},
		submitcomment : function (self) {
			var key = self.attr("data-id");
			if(key != null ){
				var comment = self.parent().find('.comment').val();
				if(comment == null || comment == undefined || comment== ''){
					successToolTipShow('评论不能为空！');
					return;
				}
				if (comment != null || comment != '') {
					loadData(function(msg) {
						$(".comment").val("");
						loadProjectCard.loadMessage(self.parents('div#projectBoard').prev());
					}, getContextPath() + '/project/addComment', $.toJSON({
						icContent : comment,
						icIndentId : key
					}));
				}
			}
		},
		bindMgrEvent : function (){
			$('.openOnLine').on('click',function(){
				$('#onLine').removeClass('hide');
				var key = $(this).attr('data-id');
				$('#onLineDate').html(getCurrentTime());
				loadData(function(msg){
					$("#onLineBillNo").val(msg.billNo);
					$("#onLinePName").val(msg.projectName);
					$("#onLineExpenditure").val(msg.userName);
					$("#onLinePayPrice").val(msg.payPrice);
					$(".onLineSubBtn").attr('data-id',key);
				}, getContextPath() + '/pay/get/billno', $.toJSON({
					projectId : key
				}));
			});
			$('.openOutLine').on('click',function(){
				$('#outLine').removeClass('hide');
				$('#outLineDateTitle').html(getCurrentTime());
				var key = $(this).attr('data-id');
				loadData(function(msg){
					$("#outLinePName").val(msg.projectName);
					$("#outLineExpenditure").val(msg.userName);
					$("#outLinePayPrice").val(msg.payPrice);
					$('.outLineSubBtn').attr('data-id',key);
					$('#outLineDate').val(getCurrentTime());
				}, getContextPath() + '/pay/get/billno', $.toJSON({
					projectId : key
				}));
			});
			$('.update-project').on('click',function(){
				var key = $(this).attr('data-id');
				var path=getContextPath()+ "/mgr/projects/upadte-view";
			    var formBody = '<form action="'+path+'" method="post" oncomplete="false" id="submitkey" style="display: none;">';
			    formBody += '<input type="text" name="key" value="'+ key +'" style="display: none">';
			    formBody += '</form>';
			    $('body').append(formBody);
			    $('#submitkey').submit().remove();
			});
			$("#add-project").off("click").on("click",function(){
				window.location.href = getContextPath()
				+ "/mgr/flow/add-view";
			})
			$('.cancle').on('click',function(){
				$('#onLine').addClass('hide');
				$('#outLine').addClass('hide');
				$('#waring').addClass('hide');
				$('#waring2').addClass('hide');
				$('#nextcheckListModel').addClass('hide');
				// 增加数据清空
				var orderId = $("#onLineBillNo").val('');
				var projectName = $("#onLinePName").val('');
				var cusName = $("#onLineExpenditure").val('');
				var payPrice = $("#onLinePayPrice").val('');
				
				var outlineTime = $('#outLineDate').val('');
				var orderOutLine = $("#outLineBillNo").val('');
				var projectName = $("#outLinePName").val('');
				var cusName = $("#outLineExpenditure").val('');
				var payMoney = $("#outLinePayPrice").val('');
			});
			$('#checkListULcancle').on('click',function(){
				$('#onLine').addClass('hide');
				$('#outLine').addClass('hide');
				$('#waring').addClass('hide');
				$('#waring2').addClass('hide');
				$('#nextcheckListModel').addClass('hide');
				// 增加数据清空
				var orderId = $("#onLineBillNo").val('');
				var projectName = $("#onLinePName").val('');
				var cusName = $("#onLineExpenditure").val('');
				var payPrice = $("#onLinePayPrice").val('');
				
				var outlineTime = $('#outLineDate').val('');
				var orderOutLine = $("#outLineBillNo").val('');
				var projectName = $("#outLinePName").val('');
				var cusName = $("#outLineExpenditure").val('');
				var payMoney = $("#outLinePayPrice").val('');
			});
			$('.onLineSubBtn').on('click',function(){
				var res = dealVerify(0);
				if(!res)
					return;
				
				var key = $(this).attr('data-id');
				var orderId = $("#onLineBillNo").val();
				var projectName = $("#onLinePName").val();
				var cusName = $("#onLineExpenditure").val();
				var payPrice = $("#onLinePayPrice").val();
				loadData(function(msg){
					if(msg.errorCode == 200){
						$('#onLine').addClass('hide');
						var root = $('.index_'+key);
						controlCard.openPrice(root);
					}else{
						//alert("出错啦"+msg.errorCode);
						$('#onLine').addClass('hide');
					}
				},  getContextPath() + '/pay/sendpay',$.toJSON({
					billNo:orderId,
					projectName:projectName,
					userName:cusName,
					payPrice:payPrice,
					projectId:key
				}));
			});
			$('.outLineSubBtn').on('click',function(){
				var res = dealVerify(1);
				if(!res)
					return;
				
				var key = $(this).attr('data-id');
				var outlineTime = $('#outLineDate').val();
				var orderOutLine = $("#outLineBillNo").val().trim();
				var projectName = $("#outLinePName").val().trim();
				var cusName = $("#outLineExpenditure").val().trim();
				var payMoney = $("#outLinePayPrice").val().trim();
				// if(checkPayList.checkOutLinePayList()){	
					loadData(function(msg){
						if(msg.errorCode == 200){
							$('#outLine').addClass('hide');
							var root = $('.index_'+key);
							controlCard.openPrice(root);
						}else{
							//alert("出错啦"+msg.errorCode);
							$('#outLine').addClass('hide');
						}
					}, getContextPath()+'/pay/offline/save', $.toJSON({
						projectId : key,
						payTime : outlineTime,
						unOrderId : orderOutLine,
						projectName : projectName,
						userName : cusName,
						payPrice : payMoney
					}));
				//}
			});
			// 下一步弹出框关闭
			$('#phoneModelCancel').on('click',function(){
				$('#waring').addClass('hide');
				currId =  -1;
			});
			$('#phoneModelCancel2').on('click',function(){
				$('#waring2').addClass('hide');
				currId =  -1;
			});
			$('#checkListCancel').on('click',function(){
				$('#checkList').addClass('hide');
				currId =  -1;
			});
			$('#checkListConfirm').on('click',function(){
				$('#checkList').addClass('hide');
				currId =  -1;
			});
		},
		payShare : function (){
			// 暂未开启
//			$('.zhifuzhong-event').off('click');
//			$('.zhifuzhong-event').on('click',function(){
//				alert($(this).attr('data-id'));
//			});
		}
}

var currId = -1;
var flowBtnControl = {
		loadFlowBtn : function(){
			// 适配权限控制系统（量身定做）
			var flowBtns = $('.btndiv-id');
			if(flowBtns.length > 0){
				var html = flowBtns.prop('outerHTML');
				flowBtns.remove();
				return $(html);
			}
			return '';
		},
		buildFirstView : function (id){ // 如果有权限则包含 三个按钮（下一步，暂停，取消）
			if(flowBtn != undefined && flowBtn != ''){
				var btns = flowBtn.clone();
				btns.attr('data-id',id);
				btns.find('.resumeBtn').remove();
				btns.find('.prev-task').remove();
				return btns.prop('outerHTML');
			}
			return '';
		},
		buildResumeView : function (id) {
			if(flowBtn != undefined && flowBtn != ''){
				var btns = flowBtn.clone();
				btns.attr('data-id',id);
				btns.find('.flowbtn').remove();
				btns.find('.pausebtn').remove();
				btns.find('.prev-task').remove();
				return btns.prop('outerHTML');
			}
			return '';
		},
		buildNormal : function (id){
			if(flowBtn != undefined && flowBtn != ''){
				var btns = flowBtn.clone();
				btns.attr('data-id',id);
				btns.find('.resumeBtn').remove();
				return btns.prop('outerHTML');
			}
			return '';
		},
		nextFlowBtn : function (key){
			currId = key;
			if(key != null ){
				loadData(function(msg) {
					if(msg.result == "true"){
						refresh();
					}else{ 
						$('#waring').addClass('hide');
						$('#checkList').removeClass('hide');
						$('#phoneModelErrorList').html(msg.result);
					}
				}, getContextPath() + '/project/flow/completeTask', $.toJSON({
					id : key
				}));
			}
		},
		cancelBtn : function (key,reason,errormsg){
			var msg = $('#msg').val();
			if(msg == null || msg ==undefined || msg == ''){
				$('#errorMsg').removeClass('hide');
				$('#errorMsg').text(errormsg);
				return;
			}else{
				$('#errorMsg').addClass('hide');
			}
			if(key != null ){
				loadData(function(msg) {
					refresh();
				}, getContextPath() + '/project/cancelProject', $.toJSON({
					id : key,
					description : reason.val()
				}));
			}
		},
		prevTaskBtn : function (key){
			if(key != null ){
				loadData(function(msg) {
					refresh();
				}, getContextPath() + '/project/flow/jumpPrevTask', $.toJSON({
					id : key
				}));
			}
		},
		pauseFlowBtn : function (key,input,errormsg){
			var msg = $('#msg').val();
			if(msg == null || msg ==undefined || msg == ''){
				$('#errorMsg').removeClass('hide');
				$('#errorMsg').text(errormsg);
				return;
			}else{
				$('#errorMsg').addClass('hide');
			}
			if(key != null ){
				loadData(function(msg) {
					refresh();
				}, getContextPath() + '/project/flow/suspendProcess', $.toJSON({
					id : key,
					description : input.val()
				}));
			}
		},
		resumeFlowBtn : function (key){
			if(key != null ){
				loadData(function(msg) {
					refresh();
				}, getContextPath() + '/project/flow/resumeProcess', $.toJSON({
					id : key
				}));
			}
		},
		resetFlowView : function (self){
			var key = self.parent('div').attr('data-id');
			
		},
		initEvent : function (){
			$('.flowbtn').off('click');
			$('.pausebtn').off('click');
			$('.cancelbtn').off('click');
			$('.resumeBtn').off('click');
			$('.prev-task').off('click');
			
			
			$('.flowbtn').on('click',function(){
				var key = $(this).parent('div').attr('data-id');
				//show(flowBtnControl.nextFlowBtn,key,'您确定进行下一步吗？');
				checkList(key);
			});
			$('.pausebtn').on('click',function(){
				var key = $(this).parent('div').attr('data-id');
				show_2(flowBtnControl.pauseFlowBtn,key,'您确定要暂停项目吗？','*必须填写暂停原因！');
			});
			$('.cancelbtn').on('click',function(){
				var key = $(this).parent('div').attr('data-id');
				show_2(flowBtnControl.cancelBtn,key,'您确定要取消项目吗？','*必须填写取消原因！');
			});
			$('.resumeBtn').on('click',function(){
				var key = $(this).parent('div').attr('data-id');
				show(flowBtnControl.resumeFlowBtn,key,'您确定恢复项目吗？');
			});
			$('.prev-task').on('click',function(){
				var key = $(this).parent('div').attr('data-id');
				show(flowBtnControl.prevTaskBtn,key,'您确定回退到上个阶段吗？');
			});
			
		}
}

function show(event,id,msg){
	var mode = $('#waring');
	mode.removeClass('hide');
	mode.find('#phoneModelConfirm').off();
	mode.find('#phoneModelConfirm').on('click',function(){
		event(id);
	});
	mode.find('#infoModel').text(msg);
}
function nextFlow2 (){
	 key = currId;
	if(key != null && currId != -1){
		loadData(function(msg) {
			if(msg.result == "true"){
				refresh();
			}else{
				$('#waring').addClass('hide');
				$('#checkList').removeClass('hide');
				$('#phoneModelErrorList').html(msg.result);
			}
		}, getContextPath() + '/project/flow/completeTask', $.toJSON({
			id : key,
			skipPay : true
		}));
	}
}

function checkList(key){
	$('#nextcheckListModel').removeClass('hide');
	$('#nextflowbtn').off('click');
	$('#nextflowbtn').css('background-color','#333');
	if(key != null ){
		currId = key;
		loadData(function(msg) {
			var html= msg.result.html;
			$('#checkListUL').html(html);
			if(msg.result.isok){
				$('#nextflowbtn').on('click',function(){
					flowBtnControl.nextFlowBtn(key);
				});
				$('#nextflowbtn').css('background-color','#fe5453');
				$('#checkListLabel').text('您确定进入下一步吗？');
			}else{
				$('#nextflowbtn').css('background-color','#999');
				$('#nextflowbtn').off('click');
				$('#checkListLabel').text('请在pc端确认更改！');
			}
		}, getContextPath() + '/mgr/flow/verifyIntegrity', $.toJSON({
			id : key
		}));
	}
}

function show_2(event,id,msg,errormsg){
	$('#errorMsg').addClass('hide');
	var mode = $('#waring2');
	var info = $('#msg');
	info.val('');
	mode.removeClass('hide');
	mode.find('#phoneModelConfirm2').off();
	mode.find('#phoneModelConfirm2').on('click',function(){
		event(id,info,errormsg);
	});
	mode.find('#infoModel').text(msg);
}

function getCurrentTime() {
	var myDate = new Date();
	var year = myDate.getFullYear();
	var month = myDate.getMonth() + 1;
	var day = myDate.getDate();
	return year + '-' + (month < 10 ? '0' + month : month) + '-' + day;
}
function showError(message) {
	alert(message);
}
function refresh (){
	 location.reload();
}
function jumpShare(url) {
	//var link = getFileUrl(fileId);
	$('#share-open').click();	
	share.init(url, '项目文件', getContextPath() + '/resources/banner/flex1.jsp');
}
function getFileUrl(fileId){
	var linkfinish ="";
	syncLoadData(function(msg) {
		var fileName=msg.url;
		var extName=fileName.substring(fileName.lastIndexOf(".")+1,fileName.length);
		var link= getDfsHostName() + getContextPath();
		if(extName=='mp4'){
			link+="/mgr/doc/video/"+msg.url;
		}else{
			link+="/portal/project/doc/"+msg.url;
		}
		linkfinish = link;
	}, getContextPath() + '/mgr/doc/getDocView', $.toJSON({
		irId : fileId
	}));
	return linkfinish;
}
function dealVerify(tab){
	if(tab == 0){
		// 线上支付
		if(!VerifyInput($('#onLinePName'))){
			successToolTipShow('必须填写项目名！');
			return false;
		}
		
		if(!VerifyInput($('#onLineBillNo'))){
			successToolTipShow('必须填写支付单号！');
			return false;
		}
		
		if(!VerifyInput($('#onLineExpenditure'))){
			successToolTipShow('必须填写付款方！');
			return false;
		}
		
		if(!VerifyInput($('#onLinePayPrice'))){
			successToolTipShow('必须填写支付金额！');
			return false;
		}
		return true;
	}else{
		// 线下支付
		if(!VerifyInput($('#outLineBillNo'))){
			successToolTipShow('必须填写银行流水号！');
			return false;
		}
		
		if(!VerifyInput($('#outLinePName'))){
			successToolTipShow('必须填写项目名称！');
			return false;
		}
		
		if(!VerifyInput($('#outLineExpenditure'))){
			successToolTipShow('必须填写客户名称！');
			return false;
		}
		
		if(!VerifyInput($('#outLineDate'))){
			successToolTipShow('必须填写支付时间！');
			return false;
		}
		
		if(!VerifyInput($('#outLinePayPrice'))){
			successToolTipShow('必须填写支付金额！');
			return false;
		}
		return true;
	}
}

function VerifyInput(jqueryObj){
	if(jqueryObj== null || jqueryObj.val() == null || jqueryObj.val() == undefined || jqueryObj.val() == '' )
		return false;
	else
		return true;
}
//错误信息 提示框弹出方法
function successToolTipShow(word){
	window.clearInterval(successIntervalObj);
	$('#errorDiv').text(word);
	$('#errorDiv').slideDown('normal');
	//successIntervalObj = window.setInterval(hideSuccessTooltip, 3000);
}

function hideSuccessTooltip(){
	$('#errorDiv').hide('normal');
}

