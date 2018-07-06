// JavaScript Document

var DefaultSelectedValue = '未选择';

// 所有行业公共变量
var IndustryDataCache = null;             //行业数据缓存
var IndustrySelectionControl1ID = null;
var IndustrySelectionControl2ID = null;
var IndustrySelectionControl3ID = null;
var IndustrySelectionControl4ID = null;

// 为行业绑定数据
var bindingIndustryData = {

    // WebServiceClient, 下拉框1 ID, 下拉框2 ID, 下拉框3 ID, 下拉框4 ID
    init: function (webServiceClient, selectionControl1ID, selectionControl2ID, selectionControl3ID, selectionControl4ID) {
        var globalThis = this;

        this.IndustrySelectionControl1ID = selectionControl1ID;
        this.IndustrySelectionControl2ID = selectionControl2ID;
        this.IndustrySelectionControl3ID = selectionControl3ID;
        this.IndustrySelectionControl4ID = selectionControl4ID;

        globalThis._controllter(true, true, true, true);
        if (IndustryDataCache === null) {
        	$.ajax({
        		url: "/demo/manager/projectinfo/getAllIndustry",
        		type: "get",
        		cache: false,
        		dataType: "json",
        		success: function(result){
        			IndustryDataCache = result[0];
        			globalThis._bindingData(selectionControl1ID, IndustryDataCache);
        		},
        		error: function(){
        		}
        	});
        }
        else
        {
            globalThis._bindingData(selectionControl1ID, IndustryDataCache);
        }

        $(selectionControl1ID).live("change", function (event) { globalThis._selectionControl1_Change($(this), event); });
        $(selectionControl2ID).live("change", function (event) { globalThis._selectionControl2_Change($(this), event); });
        $(selectionControl3ID).live("change", function (event) { globalThis._selectionControl3_Change($(this), event); });
    },

    _bindingData: function (selectionControl, data) {
        if (!data || !data.subIndustry) {
            return;
        }
        
        var globalThis = this, length = data.subIndustry.length;
        $.addSelectionOption(selectionControl, DefaultSelectedValue, '');

        var i, industryName, index;

        for (i = 0; i < length; i++) {
            industryName = data.subIndustry[i].name;
            index = data.subIndustry[i].value;
            $.addSelectionOption(selectionControl, industryName, index);
        }
    },

    _selectionControl1_Change: function (sender, event) {
        var globalThis = this;
        var text = $(sender).find("option:selected").text();

        if (text === DefaultSelectedValue) {
            globalThis._controllter(true, false, false, false);
        }
        else {
            var data = IndustryDataCache.subIndustry[parseInt($(globalThis.IndustrySelectionControl1ID).val()) - 1];
            $(globalThis.IndustrySelectionControl2ID).empty();
            globalThis._bindingData(globalThis.IndustrySelectionControl2ID, data);
            globalThis._controllter(true, true, false, false);
        }
    },

    _selectionControl2_Change: function (sender, event) {
        var globalThis = this;
        var text = $(sender).find("option:selected").text();

        if (text === DefaultSelectedValue) {
            globalThis._controllter(true, true, false, false);
        }
        else {
            var data = IndustryDataCache.subIndustry[$(globalThis.IndustrySelectionControl1ID).val() - 1].subIndustry[$(globalThis.IndustrySelectionControl2ID).val() - 1];
            $(globalThis.IndustrySelectionControl3ID).empty();
            globalThis._bindingData(globalThis.IndustrySelectionControl3ID, data);
            //globalThis._controllter(true, true, true, false);
            if (data.subIndustry !== null) {
                globalThis._controllter(true, true, true, false);
            }
            else {
                globalThis._controllter(true, true, false, false);
            }
        }
    },

    _selectionControl3_Change: function (sender, event) {
        var globalThis = this;
        var text = $(sender).find("option:selected").text();

        if (text === DefaultSelectedValue) {
            globalThis._controllter(true, true, true, false);
        }
        else {
            var data = IndustryDataCache.subIndustry[$(globalThis.IndustrySelectionControl1ID).val() - 1].subIndustry[$(globalThis.IndustrySelectionControl2ID).val() - 1].subIndustry[$(globalThis.IndustrySelectionControl3ID).val() - 1];
            $(globalThis.IndustrySelectionControl4ID).empty();
            globalThis._bindingData(globalThis.IndustrySelectionControl4ID, data);

            if (data.subIndustry !== null) {
                globalThis._controllter(true, true, true, true);
            }
            else {
                globalThis._controllter(true, true, true, false);
            }
        }
    },

    // 添加下拉选择项，下拉框对象，内容，值
    _addSelectionOption: function (parent, content, value) {
        $(parent).append("<option value='" + value + "'>" + content + "</option>");
    },

    // 控制器为控制四个下拉框显示与隐藏
    _controllter: function (control1IsDisplay, control2IsDisplay, control3IsDisplay, control4IsDisplay) {
        var globalThis = this;

        if (control1IsDisplay) {
            $(globalThis.IndustrySelectionControl1ID).show();
        }
        else {
            $(globalThis.IndustrySelectionControl1ID).hide();
            $(globalThis.IndustrySelectionControl1ID).empty();
        }

        if (control2IsDisplay) {
            $(globalThis.IndustrySelectionControl2ID).show();
        }
        else {
            $(globalThis.IndustrySelectionControl2ID).hide();
            $(globalThis.IndustrySelectionControl2ID).empty();
        }

        if (control3IsDisplay) {
            $(globalThis.IndustrySelectionControl3ID).show();
        }
        else {
            $(globalThis.IndustrySelectionControl3ID).hide();
            $(globalThis.IndustrySelectionControl3ID).empty();
        }

        if (control4IsDisplay) {
            $(globalThis.IndustrySelectionControl4ID).show();
        }
        else {
            $(globalThis.IndustrySelectionControl4ID).hide();
            $(globalThis.IndustrySelectionControl4ID).empty();
        }
    }
};

// 所有地区公共变量
var AreaDataCache = null;               //地区数据缓存
var AreaSelectionControl1ID = null;
var AreaSelectionControl2ID = null;

// 为地区绑定数据
var bindingAreaData = {

    // WebServiceClient, 下拉框1 ID, 下拉框2 ID
    init: function (webServiceClient, selectionControl1ID, selectionControl2ID) {
        var globalThis = this;

        this.AreaSelectionControl1ID = selectionControl1ID;
        this.AreaSelectionControl2ID = selectionControl2ID;

        globalThis._controllter(true, false);

        if (AreaDataCache === null) {
            webServiceClient.GetChineseArea(function (result, args) {
                AreaDataCache = result;
                globalThis._bindingData(selectionControl1ID, AreaDataCache);
            }, true);
        }
        else {
            globalThis._bindingData(selectionControl1ID, AreaDataCache);
        }

        $(selectionControl1ID).live("change", function (event) { globalThis._selectionControl1_Change($(this), event); });
    },

    _bindingData: function (selectionControl, data) {

        if (data === null || data.subAreas === null) {
            return;
        }

        var globalThis = this, length = data.subAreas.length, areaName;
        $.addSelectionOption(selectionControl, DefaultSelectedValue, '');

        var i, industryName;
        for (i = 0; i < length; i++) {
            areaName = data.subAreas[i].areaName;
            $.addSelectionOption(selectionControl, areaName, i);
        }
    },

    _selectionControl1_Change: function (sender, event) {
        var globalThis = this;
        var text = $(sender).find("option:selected").text();

        if (text === DefaultSelectedValue) {
            globalThis._controllter(true, false);
        }
        else {
            var data = AreaDataCache.subAreas[$(globalThis.AreaSelectionControl1ID).val()];
            $(globalThis.AreaSelectionControl2ID).empty();
            globalThis._bindingData(globalThis.AreaSelectionControl2ID, data);
            globalThis._controllter(true, true);
        }
    },

    // 控制器为控制四个下拉框显示与隐藏
    _controllter: function (control1IsDisplay, control2IsDisplay) {
        var globalThis = this;

        if (control1IsDisplay) {
            $(globalThis.AreaSelectionControl1ID).show();
        }
        else {
            $(globalThis.AreaSelectionControl1ID).hide();
        }

        if (control2IsDisplay) {
            $(globalThis.AreaSelectionControl2ID).show();
        }
        else {
            $(globalThis.AreaSelectionControl2ID).hide();
        }
    }
};

// 绑定数组 
var bindingArrayData = {

    // 选择框ID，绑定数组
    init: function (selectionControlID, array) {
        this._bindingData(selectionControlID, array);
    },

    _bindingData: function (selectionControlID, array) {
        if (array === null || array === undefined) {
            return;
        }

        var i, length = array.length, id, content;

        $.addSelectionOption(selectionControlID, DefaultSelectedValue, '');

        for (i = 0; i < length; i++) {
            id = array[i][0];
            content = array[i][1];
            $.addSelectionOption(selectionControlID, content, id);
        }
    }
};

// 所有项目类型公共变量
var ProjectTypeControl1ID = null;
var ProjectTypeControl2ID = null;
var ProjectTypeControl3ID = null;

// 为项目类型绑定数据
var bindProjectTypeData = {

    // 选择框ID，绑定数组
    init: function (selectionControl1ID, selectionControl2ID, selectionControl3ID) {
        var globalThis = this;
        
        this.ProjectTypeControl1ID = selectionControl1ID;
        this.ProjectTypeControl2ID = selectionControl2ID;
        this.ProjectTypeControl3ID = selectionControl3ID;

        globalThis._controllter(true, false, false);

        this._bindingData(selectionControl1ID, ProjectType1Array);

        $(selectionControl1ID).live("change", function (event) { globalThis._selectionControl1_Change($(this), event); });
        $(selectionControl2ID).live("change", function (event) { globalThis._selectionControl2_Change($(this), event); });
    },

    _bindingData: function (selectionControlID, array) {
        if (array === null || array === undefined) {
            return;
        }

        var i, length = array.length, id, content;

        $.addSelectionOption(selectionControlID, DefaultSelectedValue, DefaultSelectedValue);

        for (i = 0; i < length; i++) {
            id = array[i][0];
            content = array[i][1];
            $.addSelectionOption(selectionControlID, content, id);
        }
    },

    _selectionControl1_Change: function (sender, event) {
        var globalThis = this;
        var value = $(sender).val();
        var text = $(sender).find("option:selected").text();

        if (text === DefaultSelectedValue) {
            globalThis._controllter(true, false, false);
        }
        else {
            var data = value == 1 ? ProjectType2Array1 : ProjectType2Array2;

            $(globalThis.ProjectTypeControl2ID).empty();
            globalThis._bindingData(globalThis.ProjectTypeControl2ID, data);
            globalThis._controllter(true, true, false);
        }
    },

    _selectionControl2_Change: function (sender, event) {
        var globalThis = this;
        var value = $(sender).val();
        var text = $(sender).find("option:selected").text();

        if (text === DefaultSelectedValue) {
            globalThis._controllter(true, true, false);
        }
        else {
            var data = null;

            if (value == 11)
            {
                data = ProjectType3Array1;
            }
            else if (value == 21)
            {
                data = ProjectType3Array2;
            }

            if (data != null) {
                $(globalThis.ProjectTypeControl3ID).empty();
                globalThis._bindingData(globalThis.ProjectTypeControl3ID, data);
                globalThis._controllter(true, true, true);
            }
            else
            {
                globalThis._controllter(true, true, false);
            }
        }
    },

    // 控制器为控制四个下拉框显示与隐藏
    _controllter: function (control1IsDisplay, control2IsDisplay, control3IsDisplay) {
        var globalThis = this;

        if (control1IsDisplay) {
            $(globalThis.ProjectTypeControl1ID).show();
        }
        else {
            $(globalThis.ProjectTypeControl1ID).hide();
            $(globalThis.ProjectTypeControl1ID).empty();
        }

        if (control2IsDisplay) {
            $(globalThis.ProjectTypeControl2ID).show();
        }
        else {
            $(globalThis.ProjectTypeControl2ID).hide();
            $(globalThis.ProjectTypeControl2ID).empty();
        }

        if (control3IsDisplay) {
            $(globalThis.ProjectTypeControl3ID).show();
        }
        else {
            $(globalThis.ProjectTypeControl3ID).hide();
            $(globalThis.ProjectTypeControl3ID).empty();
        }
    }
};

var InterestDataCache = null;           //兴趣爱好数据缓存

// 为兴趣爱好绑定数据
var bindInterestData = {

    init: function (webServiceClient, selectionControlID) {
        var globalThis = this;

        if (InterestDataCache === null) {
            webServiceClient.GetAllInterest(function (result, args) {
                InterestDataCache = result;
                globalThis._bindData(selectionControlID, InterestDataCache);
            }, true);
        }
        else {
            globalThis._bindData(selectionControlID, InterestDataCache);
        }
    },

    _bindData: function (selectionControlID, array) {
        if (array === null) {
            return;
        }

        var i, length = array.length, id, content;

        $.addSelectionOption(selectionControlID, DefaultSelectedValue, DefaultSelectedValue);

        for (i = 0; i < length; i++) {
            id = array[i].iD;
            content = array[i].interesting;
            $.addSelectionOption(selectionControlID, content, id);
        }
    }
}

// 查询类型
var SearchType = new Array([11, 'WebPage'], [12, 'Message'], [13, 'User'], [14, 'UserGroup'], [15, 'Project'], [16, 'Company'], [17, 'WeiPing']);

// 性别
var GenderTypeArray = new Array([1, '男'], [2, '女']);

// 企业类型
var CompanyTypeArray = new Array([1, '民营企业'], [2, '外资企业'], [3, '国有企业'], [4, '合资企业']);

// 有效期
var ValidDateArray = new Array([1, '1个月以内'], [2, '1-3个月'], [3, '3-6个月'], [4, '1年以内']);

// 项目类型分类
var ProjectType1Array = new Array([1, '投融资'], [2, '并购重组']);

// 投融资项目类型
var ProjectType2Array1 = new Array([11, '普通项目'], [12, '寻标的'], [13, '求融资']);

// 并购重组项目类型
var ProjectType2Array2 = new Array([21, '普通项目'], [22, '寻标的']);

// 投融资项目基本类型
var ProjectType3Array1 = new Array([101, '股权融资'], [102, '债权融资'], [103, '项目融资'], [104, '小额贷款'],
                                   [105, '投资担保'], [106, '信托理财'], [107, '拆借过桥'], [108, '其他类型']);

// 并购重组项目基本类型
var ProjectType3Array2 = new Array([201, '并购重组'], [202, '借壳上市'], [203, '其他类型']);

// 要求合作方企业
var ConsociationCompanyTypeArray = new Array([0, '无要求'], [1, '民营企业'], [2, '外资企业'], [3, '国有企业'], [4, '合资企业']);

// 要求合作方企业市值（估值）
var ConsociationMarketValueArray = new Array([0, '无要求'], [1, '5000万-1亿'], [2, '1亿-2亿'], [3, '2亿-5亿'], [4, '5亿-10亿'], [5, '10亿以上']);

// 紧急程度
var UrgencyArray = new Array([1,'普通'], [2,'紧急'], [3,'非常紧急']);

// 拟融资方式
var FinancingWayArray = new Array([1, '合作'], [2, '合资'], [3, '参股'], [4, '控股'], [5, '贷款'], [6, '借款'], [7, '风投'], [8, '其他']);

// 融资担保方式
var FinancingGuaranteeArray = new Array([1, '固定资产'], [2, '第三方担保'], [3, '股权转让'], [4, '股权抵押'], [5, '股权质押']);

// 融资偿还/退出方式
var FinancingQuitWayArray = new Array([1, '股权回购'], [2, '股权转让'], [3, '上市退出'], [4, '还本付息']);

// 发布时间
var CreateTimeArray = new Array([1, '最近一天'], [3, '最近三天'], [7, '最近一周'], [15, '最近半个月'], [30, '最近一个月'], [90, '最近三个月']);

// 注册资本
var RegisteredCapitalArray = new Array([1, '3000万以下'], [2, '3000万-5000万'], [3, '5000万-8000万'], [4, '8000万-1.5亿'], [5, '1.5亿以上']);