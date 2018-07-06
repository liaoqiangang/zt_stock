$(function() {

	$.validator.addMethod("character", function(value,element) { 
		var length = value.length; 
		var reg = /^[a-zA-Z0-9_]*$/; 
		return this.optional(element) || (reg.test(value)); 
		}, "只能输入英文,数字和下划线"); 
	$.validator.addMethod("phone", function(value,element) { 
		var length = value.length; 
		var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
		var tel = /^\d{3,4}-?\d{7,9}$/; 
		return this.optional(element) || (tel.test(value) || mobile.test(value)); 
		}, "请正确填写您的联系电话"); 
	$.validator.addMethod("checkIP", function(value,element) { 
		var length = value.length; 
		var reg = /((25[0-5]|2[0-4]\d|1?\d?\d)\.){3}(25[0-5]|2[0-4]\d|1?\d?\d)/; 
		return this.optional(element) || (reg.test(value)); 
		}, "请输入正确的IP");
	
	
});
(function (config) {
    config['lock'] = true;
    config['okVal'] = '确定';
    config['cancelVal'] = '关闭';
})(dialog.defaults);

function ajaxGet(url,data,callback){
	$.ajax({
		url: url,
		type: "post",
		cache: false,
		data:data,
		datatype: "json",
		success: callback,
		error: function(){
		}
	})
}
/**
 * 设置dialog的高度
 * @param height 非ie浏览器和ie9的高度
 * @param ieHeight ie6、7、8的高度
 * @return
 */
function dialogHeight(height,ieHeight){
	var h = height;
	if($.browser.msie){
		if ($.browser.version == "6.0" || $.browser.version == "7.0" || $.browser.version == "8.0") {
			h = ieHeight;
		}
	}
	return h;
}

/**
 * 格式当前时间 yyyy-MM-dd
 * 
 * @return
 */
function getNowFormatDate() {
	var day = new Date();

	var Year = 0;
	var Month = 0;
	var Day = 0;
	var CurrentDate = "";
	// 初始化时间
	Year = day.getFullYear();
	Month = day.getMonth() + 1;
	Day = day.getDate();
	CurrentDate += Year + "-";
	if (Month >= 10) {
		CurrentDate += Month + "-";
	} else {
		CurrentDate += "0" + Month + "-";
	}
	if (Day >= 10) {
		CurrentDate += Day;
	} else {
		CurrentDate += "0" + Day;
	}
	return CurrentDate;
}
/**
 * 阻止冒泡
 * @param e
 * @return
 */
function stopBubble(e){
	if(e && e.stopPropagation){
		e.stopPropagation();
	}else{
		window.event.cancelBubble = true;
	}
}

function refreshIFrame(iframeId){
	window.parent.frames[iframeId].location.reload();
}

$.fn.serializeObject = function() {   
	var o = {};   
	var a = this.serializeArray();   
	$.each(a, function() {   
	  if (o[this.name]) {   
	    if (!o[this.name].push) {   
	      o[this.name] = [ o[this.name] ];   
	    }   
	 o[this.name].push(this.value || '');   
	} else {   
	 o[this.name] = this.value || '';   
	}   
	});   
	return o;   
}
/**
 * 确认提示框
 */
function dialogConfirm(message, callback) {
	dialog({
		title:"提示",
		icon:"question",
	    content: message,
	    ok: callback,
	    cancel: true
	}).show();
}

/**
 * 提示框
 */
function dialogMessage(message,jumpUrl,iframe) {
	var callback = function() {
		if(jumpUrl){
			window.location.href = path + jumpUrl;
		}else{
			var list = dialog.list;
			for (var i in list) {
			    list[i].close();
			};
		}
		//刷新父页面
		if(iframe){
			refreshIFrame(iframe);
		}
	};
	dialog({
		title:"提示",
		icon:"warning",
	    content: message,
	    ok: callback
	}).show();
}

function dialogAlert(message,listForm,iframe) {
	dialog({
		title:"提示",
		icon: 'succeed',
	    content: message,
	    cancel: function() {
				if(listForm != null && listForm != ""){
					$("#"+listForm).submit();
				}else{
					var list = dialog.list;
					for (var i in list) {
					    list[i].close();
					};
				}
				//刷新父页面
				if(iframe){
					refreshIFrame(iframe);
				}
			}
	}).show();
}
/**
 * 添加、修改、删除等操作使用的dialog对话框
 * @param title 标题
 * @param content 对话框显示的内容
 * @param id 唯一编号
 * @param yfn 点击确定按钮的回调函数
 * @return
 */
function editDialog(title,content,id,callback){
	var ok = "";
	if(typeof(callback) == "function"){
		ok = callback;
	}else{
		ok = function () {
			$("#"+callback).submit();
			return false;
		}
	}
	dialog({
		title: title,
	    content: content,
	    id: id,
	    ok: ok,
	    cancel: true 
	}).show();
}
