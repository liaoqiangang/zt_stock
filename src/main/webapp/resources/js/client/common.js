//------------------------------------ C++ 接口函数 Begin --------------------------

// 关闭 C++ 窗口
$.closeCPlusPlusWindow = function () {
    //alert('调用 C++ 关闭Window窗口');
    touRongZiOp.closeContainer();
}

// 加入用户群
// groupID: 讨论组ID
// verify: 0, 1, 2
$.joinChatGroup = function (groupID, verify) {
    //alert('调用 C++ 接口进入用户群');
    attentionOp.joinChatGroup(groupID, verify);
}

// 加入项目讨论组
$.joinDiscussionGroup = function (groupID) {
    //alert('调用 C++ 接口进入项目讨论组：' + groupID);
    touRongZiOp.jionDiscussionGroup(groupID);
}

// 主界面：加入项目讨论组
$.mainJoinDiscussionGroup = function (groupID) {
    //alert('调用 C++ 接口进入项目讨论组：' + groupID);
    var result = projectOp.jionDiscussionGroup(groupID);
    return result;
}

// 关注，取消关注人
// isAdd: 0:取消关注  1:增加关注
$.followUser = function (isAdd, userID) {
    //alert('调用 C++ 添加关注人/取消关注人');
    touRongZiOp.attentionFriend(isAdd, userID);
}

// 查询窗体：关注，取消关注人
// isAdd: 0:取消关注  1:增加关注
$.followUserInSearchWindow = function (isAdd, userID) {
    //alert('调用 C++ 添加关注人/取消关注人');
    var result = attentionOp.attention(isAdd, userID);
    return result;
}

// 查询窗体：查看用户资料
// userID : UserID 
// bIsGroup : True 是群, Flase 是用户或企业
$.showUserDetailsInSearchWindow = function (userID, bIsGroup) {
    //alert('调用 C++ 查看用户资料');
    attentionOp.showDetails(userID, bIsGroup);
}

// 关注项目
// isAdd: 0:取消关注  1:增加关注
// projectID : 项目id
// publishTime : 项目发布时间
// * projectType : 求融资/并购重组，用于拼接网络URL (可以传空字符串)
// * projectClass : 项目/标的，用于拼接网络URL (可以传空字符串)
// projectName : 项目名字
// creatorId : 创建者id
$.followProject = function (isAdd, projectID, publishTime, projectType, projectClass, projectName, creatorId) {
    //alert('调用 C++ 关注项目/取消关注项目');
    touRongZiOp.attentionProject(isAdd, projectID, publishTime, projectType, projectClass, projectName, creatorId);
}

// 举报项目
$.reportProject = function (projectID, projectName) {
    //alert('调用 C++ 举报项目');
    touRongZiOp.report(projectID, 100, projectName);
}



// 调用发布普通项目Window窗口
$.publishProject = function (type, token) {
    var projectType = type == 1 ? "投融资" : "并购重组";
    //alert("调用 C++ 发布项目, 类型:" + projectType);

    var url = $.getUrlPrefix() + "project.html?type={0}&token={1}";
    url = url.replace("{0}", type);
    url = url.replace("{1}", token);

    projectOp.showTouRongZi(url, 602, 522);
}

// 调用发布寻标的项目Window窗口
$.publishBidProject = function (type, token) {
    var projectType = type == 1 ? "投融资" : "并购重组";
    //alert("调用 C++ 发布项目, 类型:" + projectType);

    var url = $.getUrlPrefix() + "bid.html?type={0}&token={1}";
    url = url.replace("{0}", type);
    url = url.replace("{1}", token);

    projectOp.showTouRongZi(url, 602, 462);
}

// 调用发布求融资项目Window窗口
$.publishFinancingProject = function (token) {
    //alert("调用 C++ 发布项目, 类型:求融资");

    var url = $.getUrlPrefix() + "financing.html?token={0}";
    url = url.replace("{0}", token);

    projectOp.showTouRongZi(url);
}

// 调用查看普通项目信息Window窗口
$.viewProject = function (id, token) {
    //alert("调用 C++ 查看项目信息");

    var url = $.getUrlPrefix() + "projectinfo.html?id={0}&token={1}";
    url = url.replace("{0}", id);
    url = url.replace("{1}", token);

    projectOp.showTouRongZi(url, 602, 522);
}

// 调用查看求融资项目信息Window窗口
$.viewFinancingProject = function (id, token) {
    //alert("调用 C++ 查看求融资信息");

    var url = $.getUrlPrefix() + "financinginfo.html?id={0}&token={1}";
    url = url.replace("{0}", id);
    url = url.replace("{1}", token);

    projectOp.showTouRongZi(url);
}

// 调用查看寻标的项目信息Window窗口
$.viewBidProject = function (id, token) {
    //alert("调用 C++ 查看寻标的信息");

    var url = $.getUrlPrefix() + "bidinfo.html?id={0}&token={1}";
    url = url.replace("{0}", id);
    url = url.replace("{1}", token);

    projectOp.showTouRongZi(url, 602, 462);
}

// 改变窗体大小
$.resizeContainer = function (width, height) {
    //alert("width:" + width + "  height:" + height);
    touRongZiOp.resizeContainer(width, height);
}

// 提交错误信息到 C++ 窗口
$.showErrorMessageInCPlusPlusWindows = function () {
    alert('调用 C++ 显示错误信息');
    //todo: 等待 C++ 组的接口
}

// 获取用户Token
$.GetUserToken = function (windowType) {
    var token = -1;

    if (windowType == "search") { //查询人，群，机构窗口
        token = attentionOp.GetUserToken();
    }
    else if (windowType == "project") { //项目窗口
        token = touRongZiOp.GetUserToken();
    }
    else if (windowType == "searchProject") { //查询项目主窗口
        token = projectOp.GetUserToken();
    }
    else if (windowType == "ContainerOperations") { //注册成功
        token = ContainerOperations.GetUserToken();
    }
    else if (windowType == "GroupSharedFilesContainer") { //群共享
        token = GroupSharedFilesContainer.GetUserToken();
    }
    else if (windowType == "microCommentsOp") { //小微评
        token = microCommentsOp.GetUserToken();
    }
    else if (windowType == "ChoosingCompany") { //小微评
        token = ChoosingCompany.GetUserToken();
    }

    return token;
}

/*打开浏览器，strURL需要打开的网址*/
$.openBrowser = function (strURL) {
    if (strURL == "" || strURL == null)
        return;
    projectOp.openURL(strURL);
}

//------------------------------------ C++ 接口函数 End --------------------------

//------------------------------------ C++ 调用Js接口函数 Begin --------------------------

/*群共享刷新文件列表,供C++刷新列表*/
$.refreshGroupShareFileList = function (group, token) {
    $.getShareFile(group, token);
}

//------------------------------------ C++ 调用Js接口函数 End --------------------------

$(document).ready(function () {
    $(document).bind("contextmenu", function (e) {
        return false;
    });
});

// 为一组HTML元素，覆盖文本内容
$.replaceTextForElements = function (elements, oldText ,newText) {
    for (var i = 0; i < elements.length; i++) {
        var replaced = elements[i].innerHTML.replace(oldText, newText);
        elements[i].innerHTML = replaced;
    }
}

// 查询类型
$.searchType = {

    User : function() {
        return 13;
    },

    Group: function () {
        return 14;
    },

    Company: function () {
        return 16;
    },
    ThirdBand: function () {
        return 17;
    }
}

// 转换日期为 XXXX年XX月XX日
$.getYearMonthDay = function (str) {
    var date = new Date(str);
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var day = date.getDate();
    month = (month < 10 ? "0" + month : month);
    if (isNaN(year) || isNaN(month) || isNaN(day)) {
        mydate = str;
    }
    else {
        var mydate = (year.toString() + "年" + month.toString() + "月" + day.toString() + "日");
    }
    return mydate;
}

// 特殊函数： 创建项目页面调用，读取机构选中状态值, 如果选中返回1，未选中返回0
$.getOrgCheckValue = function (controlID) {
    if ($(controlID).attr("checked") == "checked") {
        return "1";
    }
    return "0";
}

// 读取一个输入框数值，如果为空则返回 0
$.getNumber = function (controlID) {
    var value = $(controlID).val();

    if (value === null || value === '' || value === '未选择' || value === undefined) {
        return null;
    }
    else {
        return parseFloat(value);
    }
}

// 获取地址栏前缀
$.getUrlPrefix = function () {
    return "http://112.124.98.197/client/";
}

// 读取地址栏参数
// name : 参数名
$.getUrlParam = function (name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]); return null;
}

// 获取下拉框选中 Value 值
// controlID : 控件 ID
$.getSelectedOptionValue = function (controlID) {
    var value = $(controlID).find("option:selected").val();

    if (value === null || value === '' || value === '未选择' || value === undefined) {
        return '';
    }
    else {
        return value;
    }
}

// 获取下拉框选中 Text 值
// controlID : 控件 ID
$.getSelectedOptionText = function (controlID) {
    var text = $(controlID).find("option:selected").text();

    if (text === null || text === '' || text === '未选择' || text === undefined) {
        return '';
    }
    else {
        return text;
    }
}

// 验证控件 Value 里的数字在限定范围内
// validateControlID : 要验证的控件
// warningControlID : 警示信息控件
// minValue : 最小值
// maxValue : 最大值
$.validateLimitNumber = function (validateControlID, warningControlID, minValue, maxValue) {
    var valueNumber = parseFloat($(validateControlID).val());

    if ($.trim(valueNumber) != '') {
        if (valueNumber < minValue || valueNumber > maxValue) {
            $.warningInput(validateControlID, warningControlID);
            return false;
        }
        else {
            $.resetWarningInput(validateControlID, warningControlID);
            return true;
        }
    }
    else {
        $.resetWarningInput(validateControlID, warningControlID);
        return true;
    }
}

// 验证控件 Value 不能为空
// validateControlID: 要验证的控件
// warningControlID:  警示信息控件
$.validateInputIsNotEmpty = function (validateControlID, warningControlID) {
    var text = $(validateControlID).val();

    if ($.trim(text) === '') {
        $.warningInput(validateControlID, warningControlID);
        return false;
    }
    else {
        $.resetWarningInput(validateControlID, warningControlID);
        return true;
    }
}

// 验证Value1 等于 Value2，如果等于则显示错误提示
$.validateEqual = function (compareValue1, compareValue2, warningControlID) {
    if (compareValue1 === compareValue2) {
        $.showWarning(warningControlID);
        return false;
    }
    else {
        $.resetWarning(warningControlID);
        return true;
    }
}

// 显示警告控件
$.showWarning = function (warningControlID) {
    $(warningControlID).show();
}

// 重置警告控件
$.resetWarning = function (warningControlID) {
    $(warningControlID).hide();
}

// 将一个控件背景设置为红色并获得焦点，同时显示警告控件
$.warningInput = function (controlID, warningControlID) {
    $(warningControlID).show();
    $(controlID).css("background-color", "#fbd1d1");
    $(controlID).focus();
}

// 恢复一个控件的状态，并隐藏警告信息
$.resetWarningInput = function (controlID, warningControlID) {
    $(warningControlID).hide();
    $(controlID).css("background-color", "#FFF");
}

// 将多条信息合并到一起，中间用分隔符分隔开
$.mergeMultiData = function (data1, data2, data3, data4) {
    var data = '', split = ' - ';

    if (data1 !== '' && data1 !== null && data1 !== undefined) {
        data += data1;
    }

    if (data2 !== '' && data2 !== null && data2 !== undefined) {
        data += split;
        data += data2;
    }

    if (data3 !== '' && data3 !== null && data3 !== undefined) {
        data += split;
        data += data3;
    }

    if (data4 !== '' && data4 !== null && data4 !== undefined) {
        data += split;
        data += data4;
    }

    return data;
}

// 将多个值合并到一起，中间用逗号分隔开
$.mergeMultiValue = function (data1, data2, data3, data4) {
    var data = '', split = ',';

    if (data1 !== '' && data1 !== null && data1 !== undefined) {
        data += data1;
    }

    if (data2 !== '' && data2 !== null && data2 !== undefined) {
        data += split;
        data += data2;
    }

    if (data3 !== '' && data3 !== null && data3 !== undefined) {
        data += split;
        data += data3;
    }

    if (data4 !== '' && data4 !== null && data4 !== undefined) {
        data += split;
        data += data4;
    }

    return data;
}

// 添加下拉选择项，下拉框对象，内容，值
$.addSelectionOption = function (parent, content, value) {
    $(parent).append("<option title='" + content + "'value='" + value + "'>" + content + "</option>");
}

// 通过 ID 从数组中获取显示内容
$.getContentFromArray = function (id, array) {

    if (id === undefined || array === undefined){
        return '';
    }

    var i, length = array.length, content = '（未知数据）', currID;

    for (i = 0; i < length; i++) {
        currID = array[i][0];
        
        if (id === currID)
        {
            content = array[i][1];
            break;
        }
    }

    return content;
}

// 通过 Value 从二维数组中获取 Id
$.getIdFromArray = function (value, array) {

    if (value === undefined || array === undefined) {
        return '';
    }

    var i, length = array.length, currValue, result = null;

    for (i = 0; i < length; i++) {
        currValue = array[i][1];

        if (value === currValue) {
            result = array[i][0];
            break;
        }
    }

    return result;
}

// 处理为空的情况，如果为空则显示（空）
$.friendlyShowValue = function (value) {
    //if (value === undefined || value === null || value.trim() === '') {
    if (value === undefined || value === null || value==="") {
        return '( 空 )';
    }
    else{
        return value;
    }
}

// 创建 SearchFilter 
$.createSearchFilter = function (field, condition, type) {
    var filter = new SearchFilter();

    filter["FilterField"] = field;
    filter["Condition"] = condition;
    filter["FilterType"] = type;

    return filter;
}

// 获取项目类型二级分类名称
$.getProjectTypeContent = function (projectType1, projectType2, projectType3) {
    var projectType = $.getContentFromArray(projectType1, ProjectType1Array);

    var array = projectType1 === 1 ? ProjectType2Array1 : ProjectType2Array2;
    projectType += (' - ' + $.getContentFromArray(projectType2, array));

    if (projectType2 === 11 ) {
        projectType += (' - ' + $.getContentFromArray(projectType3, ProjectType3Array1));
    }
    else if (projectType2 === 21) {
        projectType += (' - ' + $.getContentFromArray(projectType3, ProjectType3Array2));
    }

    return projectType;
}


// 获取项目二级分类名称
$.getProjectTypeMain = function (projectType1, projectType2, projectType3) {
    var projectType = $.getContentFromArray(projectType1, ProjectType1Array);

    var array = projectType1 === 1 ? ProjectType2Array1 : ProjectType2Array2;

    if (projectType2 === 11) {
        projectType = $.getContentFromArray(projectType3, ProjectType3Array1);
    }
    else if (projectType2 === 21) {
        projectType = $.getContentFromArray(projectType3, ProjectType3Array2);
    }

    return projectType;
}

/*计算窗口显示个数
type:类别（height：计算列数；width：计算行数；）；
subtrahend:减数；
dividend:被除数；
*/
$.calculateNumber = function (element,type, subtrahend, dividend)
{
	element = element || $(window);
    if (type === "")
        return 0;
    subtrahend = parseInt(subtrahend);
    dividend = parseInt(dividend);

    /*除数*/
    var divisor = 0;
    var numberRow = 0;
    if (type === "height")
    {
        divisor = parseInt(element.height());
    }
    else if (type === "width") {
        divisor = parseInt(element.width());
    }

    numberRow = Math.floor((divisor - subtrahend) / dividend);

    return numberRow;
}

/*将“”转换为0*/
$.checkEmptyToInt=function(value)
{
    var intValue = parseInt(value);

    if (isNaN(intValue))
    {
        if (value === "") {
            value = parseInt(0);
        }
    }
    
    return parseInt(value);
}


// 刷新主界面数据公共接口（C++通用）
// tableID(int):
// -- 11. 投融资-可能匹配的项目
// -- 12. 投融资-感兴趣的项目信息
// -- 13. 投融资-关注度较高的项目
// -- 21. 并购重组-可能匹配的项目
// -- 22. 并购重组-感兴趣的项目信息
// -- 23. 并购重组-关注度较高的项目
// -- 31. 我发布的项目
// -- 41. 我看过的项目
// -- 51. 我关注的项目
// -- 61. 我评论过的项目
// -- 71. 推荐的项目
$.refreshMainUIData = function (tableID) {

}

/** 
 * 限制输入框只能输入数字(JQuery插件) 
 *  
 * @author Johnson 
 * 
 * @example $("#amount").numeral() 
 * 
 * @example $("#amount").numeral(4) or $("#amount").numeral({'scale': 4}) 
 * 
 * @example $(".x-amount").numeral() 
 **/
$.fn.numeral = function () {
    var args = arguments;
    var json = typeof (args[0]) == "object";
    var scale = json ? args[0].scale : args[0];
    scale = scale || 0;
    $(this).css("ime-mode", "disabled");
    var keys = new Array(8, 9, 35, 36, 37, 38, 39, 40, 46);
    this.bind("keydown", function (e) {
        e = window.event || e;
        var code = e.which || e.keyCode;
        if (e.shiftKey) {
            return false;
        }
        var idx = Array.indexOf(keys, code);
        if (idx != -1) {
            return true;
        }
        var value = this.value;
        if (code == 190 || code == 110) {
            if (scale == 0 || value.indexOf(".") != -1) {
                return false;
            }
            return true;

        } else {
            if ((code >= 48 && code <= 57) || (code >= 96 && code <= 105)) {
                if (scale > 0 && value.indexOf(".") != -1) {
                    var reg = new RegExp("^[0-9]+(\.[0-9]{0," + (scale - 1) + "})?$");
                    var selText = getSelection();
                    if (selText != value && !reg.test(value)) {
                        return false;
                    }
                }
                return true;
            }
            return false;
        }
    });
    this.bind("blur", function () {
        if (this.value.lastIndexOf(".") == (this.value.length - 1)) {
            this.value = this.value.substr(0, this.value.length - 1);
        } else if (isNaN(this.value)) {
            this.value = "";
        } else {
            var value = this.value;
            if (scale > 0 && value.indexOf(".") != -1) {
                var reg = new RegExp("^[0-9]+(\.[0-9]{0," + scale + "})?$");
                if (!reg.test(value)) {
                    this.value = format(value, scale);
                }
            }
        }
    });
    this.bind("paste", function () {
        var s = window.clipboardData.getData('text');
        if (!/\D/.test(s));
        value = s.replace(/^0*/, '');
        return false;
    });
    this.bind("dragenter", function () {
        return false;
    });
    var format = function (value, scale) {
        return Math.round(value * Math.pow(10, scale)) / Math.pow(10, scale);
    }
    var getSelection = function () {
        if (window.getSelection) {
            return window.getSelection();
        }
        if (document.selection) {
            return document.selection.createRange().text;
        }
        return "";
    };
    Array.indexOf = function (array, value) {
        for (var i = 0; i < array.length; i++) {
            if (value == array[i]) {
                return i;
            }
        }
        return -1;
    }
};

function ajaxGet(url,callback){
	$.ajax({
		url: url,
		type: "get",
		cache: false,
		dataType: "json",
		success: callback,
		error: function(){
		}
	});
}
function scoreTip(message,okValue,icon,callback){
	
	art.dialog({
		id:"scoreTip",
		title:"提示",
		icon:icon,
		left:"30%",
		lock:true,
		opacity:0.3,
	    content: message,
	    cancelVal: '关闭',
	    cancel: true,
	    okVal:okValue,
	    ok:callback
	});
}
function scoreTipFree(message,okValue,icon,callback,projectId){
	
	art.dialog({
		id:"scoreTip",
		title:"提示",
		icon:icon,
		left:"30%",
		lock:true,
		opacity:0.3,
	    content: message,
	    cancelVal: '关闭',
	    cancel: true,
	    okVal:okValue,
	    ok:callback,
	    button: [
	             {
	                 name: '申请免费查看项目',
	                 callback: function () {
	                	 freeView(projectId);
	                     return true;
	                 },
	                 focus: true
	             }
	         ]

	});
}
/**
 * alert
 * @param container 容器名称
 * @param message 消息内容
 */
function containerAlert(container,message){
	if(!container){
		return;
	}
	container.showMessage("提示","",message,"确定","","",1);
}

function defaultImg(ele,size){
	size = size || 64;
	var picSize = "_"+size+"_"+size+".png";
	var companyPic="/resources/images/default/enterprise"+picSize;
	var malePic="/resources/images/default/male"+picSize;
	var femalePic="/resources/images/default/female"+picSize;
	var groupPic="/resources/images/default/group"+picSize;
	var type = $(ele).attr("utype");
	var userGender = $(ele).attr("gender");
	if(type == "user"){
		if(userGender == "女"){
			$(ele).attr("src",femalePic);
		}else{
			$(ele).attr("src",malePic);
		}
	}else if(type == "group"){
		$(ele).attr("src",groupPic);
	}else{
		$(ele).attr("src",companyPic);
	}
	ele.onerror=null; 
}

function defaultNull(text,defalutVlaue){
	if(!text && text == undefined){
		if(defalutVlaue){
			text = defaultValue;
		}else{
			text = "";
		}
	}
	return text;
}