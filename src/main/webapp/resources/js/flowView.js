var Step_Tool_dc = function() {
	 this.Steps = new Array(), this.stepAllHtml = "";
}

Step_Tool_dc.prototype = {
	/**
	 * 绘制到目标位置
	 */
	createStepArray : function(currStep, stepListJson,className,model) {
		this.currStep = currStep;
		for (var i = 0; i < stepListJson.length; i++) {
			var time = '';
			if (stepListJson[i].scheduledTime.fdStartTime != null
					&& stepListJson[i].scheduledTime.fdStartTime != '') {
				time = stepListJson[i].scheduledTime.fdStartTime.split(' ')[0];
			}
			var Step_Obj = new Step(this.currStep, i, stepListJson[i].name,
					time, stepListJson.length,className,stepListJson[i].createTime,model);
			Step_Obj.createStepHtml();
			this.Steps.push(Step_Obj);
		}
		
	},
	drawStep : function(currName, stepListJson,className,model) {
		var currStep = this.index(stepListJson,currName);
		this.clear();
		this.createStepArray(currStep, stepListJson,className,model);
		if (this.Steps.length > 0) {
			this.stepAllHtml += "<div>";
			for (var i = 0; i < this.Steps.length; i++) {
				this.stepAllHtml += this.Steps[i].htmlCode;
			}
			this.stepAllHtml += "</div>";
			console.log(this.stepAllHtml);
			return this.stepAllHtml;
		} else {
			return "没有任何步骤";
		}
	},
	clear : function(){
		this.stepAllHtml = '';
		this.Steps = new Array();
	},
	index : function(stepListJson,currName){
		if(currName == null)
			return stepListJson.length -1;
		for (var i = 0; i < stepListJson.length; i++) {
			if(stepListJson[i].name == currName)
				return i;
		}
		return stepListJson.length - 1;
	},
	percentage : function(currName, stepListJson){
		var index = 0;
		if(currName == null){
			index = stepListJson.length;
		}else{
			for (var i = 0; i < stepListJson.length; i++) {
				if(stepListJson[i].name == currName){
					index = i;
					break;
				}
			}
		}
		var percentage = index / stepListJson.length * 100;
		return percentage;
	}
}
var Step = function(currStep, StepNum, StepText, StepDate, totalCount,className,createTime,model) {
	this.currStep = currStep, this.StepNum = StepNum, this.StepText = StepText,
			this.totalCount = totalCount, this.htmlCode = "",
			this.StepDate = StepDate;
			this.className = className;
			this.createTime = createTime;
			this.model = model;
}
Step.prototype = {
	createStepHtml : function() {
		if (this.currStep > this.totalCount) {
			this.currStep = this.totalCount;
		} else if (this.currStep <= 0) {
			this.currStep = 0;
		}

		var img_classSype;
		var text_classSype;
		var type_classSype = '完成';
		var now_time = "";
		if(this.StepNum < this.currStep){
			img_classSype = 'flow-finish-img '+this.className;
			text_classSype = 'flow-finish-text';
			if(this.model){
				type_classSype = '进行中';
				now_time = this.StepDate;
			}
			else{
				if(this.createTime == null||this.createTime == ""||this.createTime == undefined){
					now_time = "未定";
				}else{
				 now_time = this.createTime.substring(0,10);
				}
				type_classSype = '完成';
			}
		}else if(this.StepNum == this.currStep){
			img_classSype = 'flow-doing-img '+this.className;
			text_classSype = 'flow-doing-text';
			if(this.model){
				type_classSype = '进行中';
				now_time = this.StepDate;
			}
			else{
				if(this.createTime == null||this.createTime == ""||this.createTime == undefined){
					now_time = "未定";
				}else{
				 now_time = this.createTime.substring(0,10);
				}
				type_classSype = '完成';
			}
		
		}else if(this.StepNum > this.currStep){
			img_classSype = 'flow-notstart-img';
			text_classSype = 'flow-notstart-text';
			type_classSype = '预计';
			now_time = this.StepDate;
		}
		
		var imgUrl = '';
		switch (this.StepNum) {
		case 0:
			imgUrl = '/resources/images/customer/first.png';
			break;
		case this.totalCount-1:
			imgUrl = '/resources/images/customer/last.png';
			break;
		default:
			imgUrl = '/resources/images/customer/mid.png';
			break;
		}
		
		var stepHtml = 
		'<ul class="flow-item">'+
			'<li>' +
				'<div class="'+text_classSype+'">'+this.StepText+'</div>'+
			'</li>'+
			'<li>'+
				'<img src="'+imgUrl+'" class="flow-item  '+img_classSype+' " />'+
			'</li>'+
			'<li>'+
				'<div class="'+text_classSype+' timeWord">'+type_classSype+'</div>'+
			'</li>'+
			'<li>'+
				'<div class="'+text_classSype+' flow-item-date">'+now_time+'</div>'+
			'</li>'+
		'</ul>';
		this.htmlCode = stepHtml;
	}

}
