// JavaScript Document

var _webServiceUrl = "http://112.124.98.197:8080/webservice/";
var _downloadFileHref = "http://112.124.98.197:8080/uploadfile/DownloadFile.ashx";

//var _downloadFileHref = "http://localhost:54955/DownloadFile.ashx?token=";
//var _webServiceUrl = "http://localhost:54955/";

var _client = new HproseHttpClient(_webServiceUrl, ["CreateProject",
                                                    "GetProject",
                                                    "GetIndustry",
                                                    "GetChineseArea",
                                                    "Search",
                                                    "GetProjects",
                                                    "UpdateShareFileStaus",
                                                    "GetRubbishShareFile",
                                                    "GetShareFile",
                                                    "GetUserId",
                                                    "GetIntrestProject",
                                                    "GetBoughtProject",
                                                    "GetFocusProject",
                                                    "GetDiscussedProject",
                                                    "GetDiscussionGroupOnlineStaus",
                                                    "GetAllInterest",
                                                    "RecommandUser",
                                                    "RecommandGroup",
                                                    "RecommandCompany",
                                                    "FollowUser",
                                                    "IsInFocusUser"
                                                    ]);

// JS对象： 项目
function Project() { }
HproseClassManager.register(Project, 'JZHT_DataModel_Project');

// JS对象： 过滤字段
function SearchFilter() { }
HproseClassManager.register(SearchFilter, 'JZHT_DataModel_SearchFilter');

// JS对象： 排序字段
function SearchSortField() { }
HproseClassManager.register(SearchFilter, 'JZHT_DataModel_SearchSortField');

// JS对象： 关注
function Follow() { }
HproseClassManager.register(Follow, 'JZHT_DataModel_Follow');