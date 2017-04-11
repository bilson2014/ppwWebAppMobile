define(['jquery'],function($){
	function Commons(){
		this.name = 'Common';
	}

	Commons.prototype = {
		debug : function(){ // debug 查看
             alert(1);
		},
		getContextPath:function() {
			var path = document.location.pathname.substr(1);
			path = "/" + path.substr(0, path.indexOf("/"));
			return '';
		},
		/**
		 * 获取 dfs的主机名
		 */
		 getDfsHostName:function(){
			var rPath = $('#storage_node').val();
			return rPath == undefined ? "http://resource.apaipian.com/resource/" : rPath;
		},
		/**
		 * 去掉千分位显示
		 */
		DisThousandCount:function(number){
			var tableData;
			if (number == 0) {
				tableData = 0;
			} else {
				tableData = number.toLocaleString();
				var indexOf = tableData.indexOf(".");
				if (indexOf > -1) {
					tableData = tableData.substring(0, tableData.indexOf("."));
				}
				tableData = tableData.replace(',','');
			}
			return tableData;
		},
		/**
		 * 验证 手机号
		 * @param str
		 */
		checkMobile:function (str) {
			var reg = /^(0|86|17951)?(13[0-9]|15[012356789]|17[0678]|18[0-9]|14[57])[0-9]{8}$/;
			if(str.match(reg)){
				return true;
			} else{
				return false;
			}
		},
		/**
		 * 验证 邮箱地址
		 */
		checkEmail:function (str){
			reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
			if(str.match(reg))
				return true; 
			else
				return false;
		},

		checkNumber:function (str){
			reg = /^[1-9]+[0-9]*]*$/;
			if(str.match(reg))
				return true;
			else
				return false;
		},
		// AJAX POST
		loadData:function(Func,url,param){
			$.ajax({
				url : url,
				type : 'POST',
				data : param,
				dataType : 'json',
				contentType : 'application/json; charset=UTF-8',
				success : function(data){
					Func(data);
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.error('ajax(' + url + ')[' + jqXHR.status + ']' + jqXHR.statusText);
					console.error(jqXHR.responseText);
					console.error('[' + textStatus + ']' + errorThrown);
				}
			});
		}
	}

	return {
		Common : Commons
	}

});