﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Class_list.aspx.cs" Inherits="DTCMS.Web.admin.news.Class_list" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>栏目列表</title>
    <link href="../css/blue_body.css" type="text/css" rel="StyleSheet" />
    <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="../component/treetable/TableTree4J.js"></script>
    <script type="text/javascript">
        $(function() {
            LoadData();
        });
        function LoadData() { 
            $.ajax({
                url: "/admin/ajax/class_list.aspx",
                type: "GET",
                data: "action=load&ran=" + Math.random(),
                success: function(json) {
                    showGridTree(json);
                }               
            });
        }
        var gridTree;
        function showGridTree(json) {
            gridTree = new TableTree4J("gridTree", "../component/treetable/");
            gridTree.config.useLine = false;
            gridTree.tableDesc = "<table id=\"tab\" class=\"GridView\">";
            var headerDataList = new Array("栏目名称", "所属类型", "创建时间", "排序");
            var widthList = new Array("45%", "25%", "20%", "10%");
            gridTree.setHeader(headerDataList, -1, widthList, true, "GridHead", "展开/折叠", "header status text", "", "");
            //设置列样式
            gridTree.gridHeaderColStyleArray = new Array("", "", "", "bleft");
            gridTree.gridDataCloStyleArray = new Array("", "", "", "");
            if(json!=""){
            var data = eval("data=" + json);
            $.each(data, function(i, n) {
            var dataList = new Array("<a href='Class_add.aspx?Id="+n.cid+"'>" + n.classname + "</a>", n.classtype, n.adddate, n.orderid);
                gridTree.addGirdNode(dataList, n.cid, n.parentid == 0 ? -1 : n.parentid, null, n.orderid);
            });
            }
            gridTree.printTableTreeToElement("gridTreeDiv");
        }
    </script>
    <style type="text/css">
        .GridView{
            width: 100%;
            font-size: 12px;
            border: 1px #CAD9EA solid;
            border-collapse: collapse;
        }
        .GridHead td{
            line-height: 28px;
            height: 28px;
            font-weight: bold;
            text-indent: 10px;
            background: url(../images/blue/th_bg.gif) right bottom no-repeat;
        }
        .GridHead a{
            white-space: nowrap;
            text-decoration: none;
        }
        .GridHead .bleft{   
        	background-position:left bottom;
        }
        .GridView td{
            height: 26px;
            text-indent: 10px;
            border-top: 1px solid #D3E0ED;
            border-bottom: 1px solid #D3E0ED;
        }
        .GridHighLightRow td{
            background: #E0F0FD;
        }
    </style>
</head>
<body>
    <div id="container">
        <div id="tab_menu" class="tabs">
            <ul>
                <li class="tab_on"><a href="javascript:;">栏目管理</a></li>
            </ul>
        </div>
        <div class="toolbar">
            <a href="Class_Add.aspx" class="button b2">新建栏目</a><a href="Class_Add.aspx" class="button b3">新建栏目</a><a href="Class_Add.aspx" class="button b4"><img src="../images/ico/i_02.gif" />新建栏目</a><a href="Class_Add.aspx" class="button b5">新建栏目</a><a href="Class_Edit.aspx" class="button b1">编辑</a>
        </div>
        <div id="gridTreeDiv">
        </div>
    </div>
</body>
</html>