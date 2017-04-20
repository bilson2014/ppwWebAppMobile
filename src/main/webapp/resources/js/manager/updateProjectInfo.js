var PopInterValObj,oTimer,successIntervalObj
$().ready(function(){
	projectSource.init();
	synergy.init();
	user.init();
	provider.init();
	price.init();
	time.init();
});
var projectSource ={
		    init:function(){
		    	this.showReferrer();
		    	this.initReferrerInput();
		    	this.loadSource();//加载来源信息
		    	this.getProjectInfo();//若是更新项目,加载原有信息
		    	this.addOrUpdateProject();//添加or更新项目
		    },  
		    showReferrer:function(){
		    	$("#projectSource").on('change',function(){
		   		 if($("#projectSource").val().trim()=='个人信息下单'){
		   			 $("#referrer").removeClass('hide');
		   		 }
		   		 else{
		   			 $("#referrer").addClass('hide');
		   		 }
		      });
		    },
		    initReferrerInput:function (){
		    	$("#input-referrer").on('keydown', function() {
		    		userName = $('#input-referrer').val().trim();
		    	});
		    	$("#input-referrer").on('keyup', function() {
		    		if (userName != $('#input-referrer').val().trim()) {
		    			var inputString=$('#input-referrer').val().trim();
		    			projectSource.searchReferrer(inputString);
		    			isShow = true;
		    			$("#ul-select-referrer").show();
		    		}
		    	});
		    },
		  //推荐人检索
		    searchReferrer:function (inputString) {
		    	loadData(function (msg){
		    		var table=$("#ul-select-referrer");
		    		table.html("");
		    		table.removeClass("hide");
		    		msg.forEach(function(referrer){
		    			var name=referrer.employeeRealName+''.trim();
		    				var li=$("<li data-id='"+referrer.employeeId+"' data-name='"+referrer.employeeRealName+"'>"+referrer.employeeRealName+"</li>");
		    				li.on("click",function(){
		    					var name=jQuery(this).attr('data-name');
		    					var id=jQuery(this).attr('data-id');
		    					isShow = false;
		    					table.html("");
		    					$("#error-input-referrer").hide();
		    					//详细业务相关
		    					$("#referrer-Id-hidden").val(id);
		    					$("#input-referrer").val(name);
		    					$("#ul-select-referrer").hide();
		    				});
		    				table.append(li);
		    		});
		    	}, getContextPath() + '/mgr/projects/get/reffers', $.toJSON({
		    		name:inputString
		    	}));
		    },
		    loadSource:function(){
		    	loadData(function(msg) {
		    		var select=$("#projectSource");
		    		for (var int = 0; int < msg.length; int++) {
		    			var li=$("<option>"+msg[int].name+"</option>");
		    			select.append(li);
		    		}
		    	}, getContextPath() + '/mgr/projects/getProjectTags', null);
		    },
		    getProjectInfo:function(){
		    	var _this = this;
		    	var state=$(".state").text().trim()
		    	if(state=='update'){
		    		_this.updateProject_ViewInit();
		    	}else{
		    		//新增模式，生成序列号
		    		_this.fillSerialID();
		    		//预算时间，沟通时间为当前时间
		    		$("#gtstarttime").val(new Date().Format("yyyy-MM-dd"));
		    	}
		    },
		    updateProject_ViewInit:function(){
		    	var currentProject = getCurrentProject();
		    	loadData(function(msg) {
		    		$(".projectId").val("");
		    		$(".projectName").val("");
		    		$("#userName").val("");
		    		$(".userContact").val("");
		    		$(".userPhone").val("");
		    		$("#teamName").val("");
		    		$(".teamContact").val("");
		    		$(".teamPhone").val("");
		    		$(".firstinput").val("");
		    		$(".lastinput").val("");
		    		$(".description").val("");
		    		$(".gtstarttime").val("");
		    		$(".fastarttime").val("");
		    		$(".swstarttime").val("");
		    		$(".zzstarttime").val("");
		    		$(".jfstarttime").val("");
		    		$(".teamId").val("");
		    		$(".userId").val("");
		    		$("#firstinput").val("");
		    		$("#lastinput").val("");
		    		$("#finishInput").val("");
		    		$("#userinput").val("");
		    		$("#providerInput").val("");
		    		// put data
		    		$(".projectId").val(msg.serial);
		    		$("#projectName").val(msg.projectName);
		    		$("#userName").val(msg.userName);
		    		$("#userContact").val(msg.userContact);
		    		$("#userPhone").val(msg.userPhone);
		    		$("#teamName").val(msg.teamName);
		    		$("#teamContact").val(msg.teamContact);
		    		$("#teamPhone").val(msg.teamPhone);
		    		if(msg.source=='个人信息下单'){
			   			 $("#referrer").removeClass('hide');
			   		 }
			   		 else{
			   			 $("#referrer").addClass('hide');
			   		 }
		    		$("#projectSource").val(msg.source);
		    		//add wangliming 2016.5.10 11:28 begin
		    		//-->添加推荐人
		    		if($("#projectSource").val().trim()=='个人信息下单'){
		    			$("#div-friendship").removeClass('hide');
		    			$("#referrer-Id-hidden").val(msg.referrerId);
		    			$("#input-referrer").val(msg.referrerName);
		    		}
		    		//add wangliming 2016.5.10 11:29 end
		    		$(".teamId").val(msg.teamId);
		    		$(".userId").val(msg.customerId);
		    		$("#firstinput").val(msg.priceFirst);
		    		$("#lastinput").val(msg.priceLast);
		    		$("#finishInput").val(msg.priceFinish);
		    		$("#description").val(msg.description);
		    		$("#gtstarttime").val(msg.time.gt);
		    		$("#fastarttime").val(msg.time.fa);
		    		$("#swstarttime").val(msg.time.sw);
		    		$("#zzstarttime").val(msg.time.zz);
		    		$("#jfstarttime").val(msg.time.jf);
		    		// 初始化协同人
		    		var synergys = msg.synergys;
		    		$("#synergy").html("");
		    		if(synergys != null && synergys.length > 0){
		    			synergy.showOpenView();
		    			$.each(synergys,function(i,item){
		    				$('.cooperative').css('visibility','visible');
		    				$('#helpLabel').hide();
	    					var html = synergy.createSynergyView(item.userName,item.ratio,item.userId,item.synergyId);
	    					$("#synergy").append(html);
	    					synergy.setSynergyEvent();
	    					synergy.delSynergyView();
		    			});
		    		}
		    		if(msg.customerPayment+'' == '')
		    			$("#userinput").val('');
		    		else
		    			$("#userinput").val(msg.customerPayment);
		    		if(msg.providerPayment+'' == '')
		    			$("#providerInput").val('');
		    		else
		    			$("#providerInput").val(msg.providerPayment);
		    		hasPirce();
		    	}, getContextPath() + '/mgr/projects/get-redundantProject', $.toJSON({
		    		id : currentProject
		    	}));
		    },
		    fillSerialID:function(){
		    	loadData(function(msg) {
		    		var id=msg.serial;
		    		$(".projectId").val(id);
		    	}, getContextPath() + '/mgr/projects/get/SerialID', null);
		    },
		    addOrUpdateProject:function(){
		    	var _this = this;
		    	var state=$(".state").text().trim();
		    	$("#indent-btn").off("click").on("click",function(){
		    		if(state=='update'){
		    			_this.updateProject();
		    		}else{
		    			_this.addProject();
		    		}
		    	});
		    	$("#topSubmit").off("click").on("click",function(){
		    		if(state=='update'){
		    			_this.updateProject();
		    		}else{
		    			_this.addProject();
		    		}
		    	});
		    },
		    updateProject:function(){
		    	//解绑事件防止多次点击
		    	disableSubmitBtnEnent(0);
	    		if(!checkInfo.init()){
	    			//验证错误，恢复事件
		    		enableSubmitBtnEnent();
	    			return false;
	    		}
		    	var currentProject = getCurrentProject();
		    	var projectSerial = $(".projectId").val().trim();
		    	var projectName = $("#projectName").val().trim();
		    	var userName = $("#userName").val().trim();
		    	var userContact = $("#userContact").val().trim();
		    	var userPhone = $("#userPhone").val().trim();
		    	var teamName = $("#teamName").val().trim();
		    	var teamContact = $("#teamContact").val().trim();
		    	var teamPhone = $("#teamPhone").val().trim();
		    	var source=$("#projectSource").val().trim();
		    	var priceFirst=$("#firstinput").val().trim();
		    	var priceLast=$("#lastinput").val().trim();
		    	var priceFinish=$("#finishInput").val().trim();
		    	var teamId= $("#teamId").val();
		    	var customerId= $("#userId").val();
		    	var description = $("#description").val().trim();
		    	var gtstarttime = $("#gtstarttime").val().trim();
		    	var fastarttime = $("#fastarttime").val().trim();
		    	var swstarttime = $("#swstarttime").val().trim();
		    	var zzstarttime = $("#zzstarttime").val().trim();
		    	var jfstarttime = $("#jfstarttime").val().trim();
		    	//获取推荐人，是友情推荐时为 “人名” 否则为 ‘’
		    	var referrerId=getReferrer();
		    	//add laowng
		    	var customerPayment=$("#userinput").val().trim();
		    	var providerPayment=$("#providerInput").val().trim();
		    	if(providerPayment == ''){
		    		providerPayment =null;
		    	}
		    	if(customerPayment == ''){
		    		customerPayment= null;
		    	}
		    	loadData(function(msg) {
		    		if (msg) {
		    			submitForm();
		    		} else {
		    			enableSubmitBtnEnent();
		    			alert('error:' + msg);
		    		}
		    	}, getContextPath() + '/mgr/projects/update-indentProject', $.toJSON({
		    		id : currentProject,
		    		serial : projectSerial,
		    		projectName : projectName,
		    		userName : userName,
		    		userContact : userContact,
		    		userPhone : userPhone,
		    		teamName : teamName,
		    		teamContact : teamContact,
		    		teamPhone : teamPhone,
		    		priceFirst:priceFirst,
		    		priceLast:priceLast,
		    		priceFinish:priceFinish,
		    		description : description,
		    		source:source,
		    		teamId:teamId,
		    		customerId:customerId,
		    		referrerId : referrerId,
		    		time : {
		    			gt : gtstarttime,
		    			fa : fastarttime,
		    			sw : swstarttime,
		    			zz : zzstarttime,
		    			jf : jfstarttime
		    		},
		    		synergys:getViewSynerhy(),
		    		providerPayment:providerPayment,
		    		customerPayment:customerPayment
		    	}));
		    },
		    addProject:function(){
		    	disableSubmitBtnEnent(0);
	    		if(!checkInfo.init()){
	    			//验证错误，恢复事件
		    		enableSubmitBtnEnent();
	    			return false;
	    		}
	    		var projectSerial = $(".projectId").val().trim();
		    	var projectName = $("#projectName").val().trim();
		    	var userName = $("#userName").val().trim();
		    	var userContact = $("#userContact").val().trim();
		    	var userPhone = $("#userPhone").val().trim();
		    	var teamName = $("#teamName").val().trim();
		    	var teamContact = $("#teamContact").val().trim();
		    	var teamPhone = $("#teamPhone").val().trim();
		    	var source=$("#projectSource").val().trim();
		    	var priceFirst=$("#firstinput").val().trim();
		    	var priceLast=$("#lastinput").val().trim();
		    	var priceFinish=$("#finishInput").val().trim();
		    	var teamId= $("#teamId").val();
		    	var customerId= $("#userId").val();
		    	var description = $("#description").val().trim();
		    	var gtstarttime = $("#gtstarttime").val().trim();
		    	var fastarttime = $("#fastarttime").val().trim();
		    	var swstarttime = $("#swstarttime").val().trim();
		    	var zzstarttime = $("#zzstarttime").val().trim();
		    	var jfstarttime = $("#jfstarttime").val().trim();
		    	//获取推荐人，是友情推荐时为“人名”否则为 ‘’
		    	var referrerId=getReferrer();
		    	//add laowng
		    	var customerPayment=$("#userinput").val().trim();
		    	var providerPayment=$("#providerInput").val().trim();
		    	if(providerPayment == ''){
		    		providerPayment =null;
		    	}
		    	if(customerPayment == ''){
		    		customerPayment= null;
		    	}
		    	loadData(function(msg) {
		    		if (msg) {
		    			window.location.href = getContextPath() + "/mgr/index";
		    		} else {
		    			enableSubmitBtnEnent();
		    			alert('error:' + msg);
		    		}
		    	}, getContextPath() + '/mgr/projects/save', $.toJSON({
		    		serial : projectSerial,
		    		projectName : projectName,
		    		userName : userName,
		    		userContact : userContact,
		    		userPhone : userPhone,
		    		teamName : teamName,
		    		teamContact : teamContact,
		    		teamPhone : teamPhone,
		    		priceFirst : priceFirst,
		    		priceLast : priceLast,
		    		priceFinish : priceFinish,
		    		description : description,
		    		source : source,
		    		teamId : teamId,
		    		customerId : customerId,
		    		referrerId : referrerId,
		    		time : {
		    			gt : gtstarttime,
		    			fa : fastarttime,
		    			sw : swstarttime,
		    			zz : zzstarttime,
		    			jf : jfstarttime
		    		},
		    		synergys:getViewSynerhy(),
		    		providerPayment:providerPayment,
		    		customerPayment:customerPayment
		    	}));
		    }
}

var synergy ={
		init:function(){
			this.addSynergy();
			this.initSynergy();
		},
		initSynergy:function(input_div){
			var input=$(input_div).find("input#name");
			$(input).off('keydown');
			$(input).off('keyup');
			$(input).on('keydown', function() {
				userName = $(input).val().trim();
			});
			$(input).on('keyup', function() {
				if (userName != $(input).val().trim()) {
					isShow = true;
					synergy.searchSynergy($(input));
				}
			});
		},
		setSynergyEvent:function(){
			var deleteSynergys=$("[name^=delSynergy]");
			deleteSynergys.off('click');
			var cout=deleteSynergys.length;
			$.each(deleteSynergys,function(i,item){
				var x2=$(item).parent();
				synergy.initSynergy(x2);
			});
		},
		addSynergy:function(name,ratio,userid,synergyid){
			$('#addSynergyIcon').on('click',function(){
				var currCount=$("div[name^=Synergy-info]").length;
				if(currCount<3){
					synergy.showOpenView();
					var html = synergy.createSynergyView("","","","");
					$("#synergy").append(html);
					synergy.setSynergyEvent();
					synergy.delSynergyView();
				}else{
					 successToolTipShow('不能多于3个协同人');
				}
			});
		},
		createSynergyView:function(name,ratio,userid,synergyid){
			var $body='<div class="autoContent" name="Synergy-info">'+
				'<div class="divPosition">'+
				        '<div class="syeName">协同人名称</div>'+
						'<input class="name" value="'+name+'" id="name">'+
						'<div class="syeBl">比例</div>'+
						'<input   class="bl" value="'+ratio+'" id="ratio">'+
						'<span name="delSynergy"><div></div></span>'+
						'<div class="bfb">%</div>'+
						'<input type="hidden" id="user-id"  value="'+userid+'"  />'+
						'<input type="hidden" id="synergy-id"  value="'+synergyid+'"  /> '+
						'<ul class="ul-option-common hide" id="ul-select-synergy"></ul>'+
				'</div>';
				$body+='</div>';
			return $body;
		},
		delSynergyView:function(){
			var deleteSynergys=$("[name^=delSynergy]");
			var cout=deleteSynergys.length;
			deleteSynergys.on('click',function(){
				if(cout != 0){
					var x=$(this).parent().find("input#synergy-id")
					var res = false;
					if(x.val().trim() != ''){
						res = removeSynergy($(x).val().trim());
						if(res){
							$(this).parent().parent().remove();
						}else{
							successToolTipShow('协同人删除失败！'); //TODO:
						}
					}else{
						$(this).parent().parent().remove();
					}
				}	
				var deleteSecondSynergys=$("[name^=delSynergy]");
				var couts=deleteSecondSynergys.length;
				if(couts==0){
					synergy.showCloseView();
				}
			});
		},
		removeSynergy:function(id){
			loadData(function(){
			}, getContextPath() + '/mgr/projects/remove/synergy', $.toJSON({
				name:id
			}));
		},
		verifySynerhyRatio:function(ratio,baseRatio){
			/**
			 * 1.验证是否非空
			 * 2.验证输入是否为数字
			 * 3.验证价格是否超过100
			 * 4.协调输出错误信息
			 */
			var res ="ok";
			baseRatio = Number(baseRatio)+Number(ratio);
			if(ratio == null || ratio == undefined || ratio == '' ){
				res = "请填写占有比例";
			} else if(!checkDecimal(ratio)){
				res = "只能输入数字呦";
			}else if(baseRatio > 100 || baseRatio < 1 ){
				res = "所有协同人比例之和小于100%";
			}
			return {str:res,baseRatio:baseRatio};
		},
		getReferrerData:function(name){
			syncLoadData(function(msg) {
				referrerList=msg;
			}, getContextPath() + '/mgr/projects/search/employee/list', $.toJSON({
				name:name
			}));
	},
		checkSynerhy:function(){
			var dbUser = '';
			var totalPrice = 0 ;
			var base_Synergy = $("div[name^=Synergy-info]");
			if(base_Synergy  != null && base_Synergy.length > 0){
				var hasError=false;
				var baseRatio = 0;
				var userIdArray = new Array();
				for (var ix = 0; ix < base_Synergy.length; ix++) {
					var item = base_Synergy[ix];
					var userId = $(item).find("input#user-id").val().trim();
					var userName = $(item).find("input#name").val().trim();
					var ratio = $(item).find("input#ratio").val().trim();
					var ratioName =$(item).find("input#ratio");
					userIdArray.push(userId);
		            if(userName!='' || ratioName.val().trim() !='' ){// 如果填写的价格，那么联系人必须通过验证
		            	synergy.getReferrerData(userName);//获取数据库模糊查询用户名字相同的协助人
		    			if(referrerList != ''){
		    				for (var int = 0; int < referrerList.length; int++) {
		    					var referrer = referrerList[int];
		    					var name=referrer.employeeRealName+''.trim();
		    					var id=referrer.employeeId;
		    					if(userId == id && name == userName){
		    						hasError =false;
		    						break;
		    					}else{
		    						$(item).find("input#user-id").val('');
		    						hasError =true;
		    					}
		    				}
		    			}else{
		    				 //输入的信息数据库里不存在
		    				hasError =true;
		    			}
		    			if(hasError){
		    				$(item).find("input#name").focus();
		    				successToolTipShow('推荐人不正确');
		    				return false;
		    			}
		    			// 继续验证价格
		    			var res = synergy.verifySynerhyRatio(ratio,baseRatio);
		    			if(res.str != 'ok'){
		    				//价格发生问题
		    				successToolTipShow(res.str);
		    				ratioName.focus();
		    				hasError =true;
		    				return false;
		    			}
		    			baseRatio=res.baseRatio;
		           }
		            //add same people check by lt 20160606
		            //begin
		            var userId = $(item).find("input#user-id").val().trim();
		            var s =userIdArray.length;
		            if(userIdArray.length!=1){
		            for(var i=0;i<userIdArray.length-1;i++)
		            {
		                    for(var j=1;j<userIdArray.length;j++)
		                    {
		                    	   if(userIdArray[i]==userIdArray[j]&&i!=j)
		                            {
		                    		    successToolTipShow('协同人重复了');
		                				$(item).find("input#name").focus();
		                                return false;
		                            }
		                    }
		                }
		            }
				}
				 if(userId==''){
		         	successToolTipShow('协同人不存在');
		         	$(item).find("input#name").focus();
		         	 return false;
		         }
					var logiNname = $("#logiNname").val();
					if(logiNname == userName){
						successToolTipShow('自己不能是协同人');
						$(item).find("input#name").focus();
						 return false;
					}
				//end
				return true;
			}
			return true;
		},
		showOpenView:function(){
			$("#synergy").removeClass('hide');
			$('#synergyInfo').addClass('white');
			$('#synergyTopLine').addClass('hide');
			$('#synergyBottomLine').addClass('hide');
		},
		showCloseView:function(){
			$("#synergy").addClass('hide');
			$('#synergyInfo').removeClass('white');
			$('#synergyTopLine').removeClass('hide');
			$('#synergyBottomLine').removeClass('hide');
		},
		searchSynergy:function(input) {
			loadData(function (msg){
				var inputString=input.val().trim();
				var div=$(input).parent();
				var table=div.find("ul#ul-select-synergy");
				table.html("");
				table.show();
				table.removeClass("hide")
				msg.forEach(function(referrer){
					var li=$("<li data-id='"+referrer.employeeId+"' data-name='"+referrer.employeeRealName+"'>"+referrer.employeeRealName+"</li>");
					li.on("click",function(){
						var name=jQuery(this).attr('data-name');
						var id=jQuery(this).attr('data-id');
						isShow = false;
						table.html("");
						table.hide();
						//详细业务相关
						div.find("input#name").val(name);
						div.find("input#user-id").val(id);
					});
					table.append(li);
				});
				var hover=false;
				$(table).hover(function(){
						hover=true;
				 },function(){
				    	hover=false;
				  });
				$(input).on('blur',function(){
					if(!hover){
						table.html("");
						//table.hide();
						table.addClass("hide");
					}
				});
			}, getContextPath() + '/mgr/projects/search/employee/list', $.toJSON({
				name:input.val().trim()
			}));
		}
}

var user ={
		init:function(){
			this.showUser();
			this.initUserInput();
		},
		showUser:function(){
			$('#userOpen').on('click',function(){
				  if($('#userInfo').hasClass("white")){
					  user.showCloseView();
				  }else{
					  user.showOpenView();
				  }
			});
		},
		showOpenView:function(){
			$('#userOpenIcon').addClass('transform');
			$("#user").removeClass('hide');
			$('#userInfo').addClass('white');
			$('#userBottomLine').addClass('hide')
		},
		showCloseView:function(){
			$('#userOpenIcon').removeClass('transform');
			$("#user").addClass('hide');
			$('#userInfo').removeClass('white');
			$('#userBottomLine').removeClass('hide')
		},
		//初始化用户搜索框
		initUserInput:function(){
			$('#userName').on('keydown', function() {
				userName = $('#userName').val().trim();
			});
			$('#userName').on('keyup', function() {
				if (userName != $('#userName').val().trim()) {
					user.searchUser();
					$("#ul-select").show();
					isShow = true;
				}
			});
		},
		//用户搜索方法
		searchUser:function() {
			var userName = $("#userName").val();
			loadData(function(msg) {
				var table=$("#ul-select");
				table.removeClass("hide");
				table.html("");
					for (var int = 0; int < msg.length; int++) {
						var li=$("<li data-id='"+msg[int].id+"' data-contact='"+msg[int].realName+"' data-phone='"+msg[int].telephone+"' >"+msg[int].userName+"</li>");
						li.on("click",function(){
							var contact=jQuery(this).attr('data-contact');
							var phone=jQuery(this).attr('data-phone');
							var id=jQuery(this).attr('data-id');
							$("#userContact").val(contact);
							$("#userPhone").val(phone);
							$("#userId").val(id);
							document.getElementById("userName").value=this.innerHTML;
							$("#ul-select").hide();
							isShow = false;
							table.html("");
						});
						table.append(li);
					}
					var hover=false;
					$(table).hover(function(){
							hover=true;
					 },function(){
					    	hover=false;
					  });
					$("#userName").on('blur',function(){
						if(!hover){
							table.html("");
							table.addClass("hide");
						}
					});
			}, getContextPath() + '/mgr/projects/user/search/info', $.toJSON({
				userName : userName
			}));
		}
}

var provider ={
		init:function(){
			this.showProvider();
			this.initTeamInput();
		},
		showProvider:function(){
			$('#providerOpen').on('click',function(){
				  if($('#providerInfo').hasClass("white")){
					  provider.showCloseView();
				  }else{
					  provider.showOpenView();
				  }
			});
		},
		showOpenView:function(){
			$('#providerOpenIcon').addClass('transform');
			$("#provider").removeClass('hide');
			$('#providerInfo').addClass('white');
			$('#providerBottomLine').addClass('hide')
		},
		showCloseView:function(){
			$('#providerOpenIcon').removeClass('transform');
			$("#provider").addClass('hide');
			$('#providerInfo').removeClass('white');
			$('#providerBottomLine').removeClass('hide')
		},
		//初始化供应商搜索框
		initTeamInput:function(){
			$('#teamName').on('keydown', function() {
				teamName = $('#teamName').val().trim();
			});
			$('#teamName').on('keyup', function() {
				if (teamName != $('#teamName').val().trim()) {
					provider.searchTeam();
					$("#ul-select-team").show();
					isShow = true;
				}
			});
		},
		//团队搜索方法 
		searchTeam:function() {
			var teamName = $("#teamName").val();
			loadData(function(msg) {
				var table=$("#ul-select-team");
				table.removeClass("hide");
				table.html("");
				for (var int = 0; int < msg.length; int++) {
					var li=$("<li data-id='"+msg[int].teamId+"' data-contact='"+msg[int].loginName+"' data-phone='"+msg[int].phoneNumber+"' >"+msg[int].teamName+"</li>");
					li.on("click",function(){
						var contact=jQuery(this).attr('data-contact');
						var phone=jQuery(this).attr('data-phone');
						var id=jQuery(this).attr('data-id');
						$("#teamContact").val(contact);
						$("#teamPhone").val(phone);
						$("#teamId").val(id);
						document.getElementById("teamName").value=this.innerHTML;
						$("#ul-select-team").hide();
						isShow = false; 
						table.html("");
					});
					table.append(li);
				}
				var hover=false;
				$(table).hover(function(){
						hover=true;
				 },function(){
				    	hover=false;
				  });
				$("#teamName").on('blur',function(){
					if(!hover){
						table.html("");
						table.addClass("hide");
					}
				});
			}, getContextPath() + '/mgr/projects/team/search/info', $.toJSON({
				teamName : teamName
			}));
		}
}

var price ={
		init:function(){
			this.showPrice();
		},
		showPrice:function(){
			$('#priceOpen').on('click',function(){
				  if($('#priceInfo').hasClass("white")){
					  price.showCloseView();
				  }else{
					  price.showOpenView();
				  }
			});
		},
		showOpenView:function(){
			$('#priceOpenIcon').addClass('transform');
			$("#price").removeClass('hide');
			$('#priceInfo').addClass('white');
			$('#priceBottomLine').addClass('hide')
		},
		showCloseView:function(){
			$('#priceOpenIcon').removeClass('transform');
			$("#price").addClass('hide');
			$('#priceInfo').removeClass('white');
			$('#priceBottomLine').removeClass('hide')
		},
		//验证预计价格
		priceVerifyInputNotNull:function() {
				var first=$("#firstinput");
				var last=$("#lastinput");
				if(!checkNumber(first.val())){
					first.val("");
					successToolTipShow('请填写价格范围');
					price.showOpenView();
					first.focus();
					return false;
				}
				if(!checkNumber(last.val())){
					last.val("");
					successToolTipShow('价格范围出错');
					price.showOpenView();
					last.focus();
					return false;
				}
				if(first.val()=="0"){
					first.val('0');
				}
				if(last.val()=="0"){
					last.val('0');
				}
				if(parseInt(first.val())>parseInt(last.val())){
					last.val("");
					price.showOpenView();
					successToolTipShow('价格范围出错');
					return false;
				}
				return true;
		},
		//验证最终价格
		checkFinishPrice:function() {
			var text=$("#finishInput").val();
			if(text == null ||text=='' || text=='0'){
				$("#finishInput").val("");
				$("#finishInput").focus();
				price.showOpenView();
				successToolTipShow('请填写最终价格');
				return false;
			}
			if(!checkNumber(text)){
				$("#finishInput").val("");
				$("#finishInput").focus();
				price.showOpenView();
				successToolTipShow('最终价格有误');
				return false;
			}
			return true;
		},
		  priceCheck:function(){
				$("#firstinput").on('change',function(){
	 				var res=price.priceVerifyInputNotNull();
	 			});
	 			$("#lastinput").on('change',function(){
	 				var res=price.priceVerifyInputNotNull();
	 			});
	 			$("#finishInput").on('change',function(){
	 				price.checkFinishPrice();
	 			});
		  }
}

var time ={
		init:function(){
			this.showTime();
			this.datepick();
		},
		showTime:function(){
			$('#timeOpen').on('click',function(){
				  if($('#timeInfo').hasClass("white")){
					  time.showCloseView();
				  }else{
					  time.showOpenView();
				  }
			});
		},
		showOpenView:function(){
			$('#timeOpenIcon').addClass('transform');
			$("#time").removeClass('hide');
			$('#timeInfo').addClass('white');
			$('#timeBottomLine').addClass('hide');
			$('#timetopLine').addClass('hide');
		},
		showCloseView:function(){
			$('#timeOpenIcon').removeClass('transform');
			$("#time").addClass('hide');
			$('#timeInfo').removeClass('white');
			$('#timeBottomLine').removeClass('hide');
			$('#timetopLine').addClass('hide');
		},
		datepick:function(){	
			$("#dtBox").DateTimePicker({
				dateFormat:'yyyy-MM-dd',
				language:'zh-CN'
			});
		},
		VerifyTime:function(){
			var time=$("input[id$='time']");
			for (var int = time.length-1; int >=0 ; int--) {
				var currTime=$(time[int]).val();
				if(currTime!=''){
					for (var int2 = int; int2 >=0 ; int2--) {
						var currafter=$(time[int2]).val();
						if(currafter!=''){
							//第一个比第二个大返回true
							if(!dateCompare(currTime,currafter)){
								$(time[int]).focus();
								successToolTipShow('时间有误');
								return false;
							}
						}
					}
				}
			}
			return true;
		}
}
var checkInfo = {
		 init:function(){
			 return this.check();
		 },
         check:function(){
	        	 var error =$('#errorDiv');
	        	 var projectName = $('#projectName');
	        	 var userName = $('#userName');
	        	 var userContact = $('#userContact');
	        	 var userTel = $('#userPhone');
	        	 var providerName = $('#teamName');
	        	 var providerContact = $('#teamContact');
	        	 var providerTel = $('#teamPhone');
	        	 var gtstarttime = $("#gtstarttime").val().trim();
	        	 var fastarttime = $("#fastarttime").val().trim();
	        	 var swstarttime = $("#swstarttime").val().trim();
	        	 var zzstarttime = $("#zzstarttime").val().trim();
	        	 var jfstarttime = $("#jfstarttime").val().trim();
        		 var res=synergy.checkSynerhy();
        		if(!res){
        			return false;
        		}
        	 if(projectName.val()==null||projectName.val()==""){
        		 successToolTipShow('请填写项目名');
        		 projectName.focus();
        		 return false;
        	 }
 			 if(userName.val()==null||userName.val()==""){
 				 if(!$('#userInfo').hasClass("white")){
 					user.showOpenView();
				  }
        		 successToolTipShow('请填写客户');
        		 userName.focus();
        		 return false;;
        	 }
 			 if(userContact.val()==null||userContact.val()==""){
        		 successToolTipShow('请填写客户联系人');
        		 userContact.focus();
        		 return false;
        	 }
 			 if(userTel.val()==null||userTel.val()==""){
        		 successToolTipShow('请填写客户电话');
        		 userTel.focus();
        		 return false;
        	 }
 			 
 			 /*注释原因，供应商不是必填项
 			  * if(providerName.val()==null||providerName.val()==""){
 				 if(!$('#providerInfo').hasClass("white")){
 					provider.showOpenView();
				  }
        		 successToolTipShow('请填写供应商');
        		 providerName.focus();
        		 return false;
        	 }
 			 
 			 if(providerContact.val()==null||providerContact.val()==""){
 				if(!$('#providerInfo').hasClass("white")){
 					provider.showOpenView();
				  }
        		 successToolTipShow('请填写供应商联系人');
        		 providerContact.focus();
        		 return false;
        	 }
 			 
 			 if(providerTel.val()==null||providerTel.val()==""){
 				if(!$('#providerInfo').hasClass("white")){
 					provider.showOpenView();
				  }
        		 successToolTipShow('请填写供应商电话');
        		 providerTel.focus();
        		 return false;
        	 }*/
 			if(!price.priceVerifyInputNotNull()){return false;}
 			//if(!price.checkFinishPrice()){return false;}
 			return time.VerifyTime();
         }
	}

//成功信息 提示框弹出方法
function successToolTipShow(word){
	window.clearInterval(successIntervalObj);
	$('#errorDiv').text(word);
	$('#errorDiv').slideDown('normal');
	successIntervalObj = window.setInterval(hideSuccessTooltip, 3000);
}

function hideSuccessTooltip(){
	$('#errorDiv').hide('normal');
}

//时间比较
function dateCompare(date1, date2) {
	var time1 = date1.replace(/-/g, "/");
	var date1 = new Date(time1);
	var time2 = date2.replace(/-/g, "/");
	var date2 = new Date(time2);
	if (date1.getTime() >= date2.getTime())
		return true;
	else
		return false;
}

function submitForm(){
	$('#showImg').removeClass('hide');
	var key=getCurrentProject();
	var path=getContextPath()+ "/mgr/index";
	var formBody = '<form action="'+path+'" method="post" oncomplete="false" id="submitkey" style="display: none;">';
	formBody += '<input type="text" name="key" value="'+ key +'" style="display: none">';
	formBody += '</form>';
	$('body').append(formBody);
	$('#submitkey').submit().remove();
}

function getCurrentProject() {
	return $("#key").val();
}

function hasPirce(){
	var userPrirce =$("#userinput").val().trim();
	var providerPrice =$('#providerInput').val().trim();
	if(userPrirce!=0||providerPrice!=0){
		$("#close-div").slideDown(10);
		$('#loadWord').text('收起');
		$('#circleImg').addClass('circle-180');
		isMore=false;
	}
	else{
		$("#close-div").slideUp(10);
		$('#loadWord').text('展开更多');
		$('#circleImg').removeClass('circle-180');
		isMore=true;
	}
}

function getReferrer() {
	if($("#projectSource").val().trim()=='个人信息下单'){
		 return  $("#referrer-Id-hidden").val();
	 }
	 else{
		 return '0';
	 }
}

function getViewSynerhy() {
	var base_Synergy = $("div[name^=Synergy-info]");
	var currCount=base_Synergy.length;
	var synergys = new Array(currCount);
	var index =0 ;
	for (var i = 0; i < synergys.length; i++) {
		var synergy=base_Synergy[i];
		var userId=$(synergy).find("input#user-id").val();
		var ratio=$(synergy).find("input#ratio").val().trim();
		var userName=$(synergy).find("input#name").val().trim();
		var synergyId=$(synergy).find("input#synergy-id").val().trim();
		if(userId == null || userId == '' || userId == undefined )
			continue ;
		synergys[index] = {
				userId:userId,
				userName:userName,
				ratio:ratio,
				synergyId:synergyId
		};
		index++;
	}
	return synergys;
}

function disableSubmitBtnEnent(check){
	$("#indent-btn").off('click');
	$("#topSubmit").off('click');
	if(check!=undefined){
		$('.bottom-div').show();
	}
}

function enableSubmitBtnEnent(){
	var state=$(".state").text().trim();
	disableSubmitBtnEnent();
	projectSource.addOrUpdateProject();
}

function removeSynergy(id){
	var res =false;
	syncLoadData(function(msg){
		res = msg;
	}, getContextPath() + '/mgr/projects/remove/synergy', $.toJSON({
		name:id
	}));
	return res;
}

Date.prototype.Format = function (fmt) { //author: meizz 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}
