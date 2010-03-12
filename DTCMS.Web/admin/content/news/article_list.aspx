﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="article_list.aspx.cs" Inherits="DTCMS.Web.admin.article_list" %>
<%@ Register TagPrefix="DT" Assembly="DTCMS.Controls" Namespace="DTCMS.Controls" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <title>文章列表</title>
    <link href="../../css/blue_body.css" type="text/css" rel="StyleSheet" />
    <link href="/inc/dialog/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../js/jquery-1.3.2-vsdoc2.js"></script>
    <script type="text/javascript" src="/inc/dialog/dialog.js"></script>
    <script type="text/javascript" src="../../js/common.js"></script>
    <script type="text/javascript" src="../../js/public.js"></script>
    <script type="text/javascript" src="../../js/datagrid.js"></script>
    <script type="text/javascript" src="../../js/contextmenu.js"></script>
</head>
<body>
    <form id="form1" runat="server"><div id="container">
		<div id="tab_menu" class="tabs">
			<ul>
				<li class="tab_on"><a href="javascript:;" >文章管理</a></li>
			</ul>
		</div>
		<div id="content">
		    <div class="toolbar">
                <a href="article_add.aspx" class="button b4"><img src="../../images/ico/i_add.gif" alt="" />添加文章</a>
                <a href="javascript:Dialog.alert('您没有权限编辑文章！');" class="button b4"><img src="../../images/ico/i_edit.gif" alt="" />编辑文章</a>
                <a href="javascript:verifyData(-1,true);" class="button b4"><img src="../../images/ico/i_verify.gif" alt="" />审核文章</a>
                <a href="javascript:DeleteData(-1,true);" class="button b4"><img src="../../images/ico/i_allDelete.gif" alt="" />批量删除</a>
            </div>
            <DT:DataGrid ID="dt_DataGrid" BindAjaxMethod="DTCMS.Web.admin.article_list.GetArticleJsonData" IsPage="true" CssClass="table_data" runat="server">
                <Colunms>
                    <DT:CheckBox Visible="true" Width="4%" />
                    <DT:RowsIndex HeaderText="文章ID" Visible="true" Width="6%" />
                    <DT:ColumnItem HeaderText="文章标题" Width="30%" DataField="Title" IsSort="true" />
                    <DT:ColumnItem HeaderText="所属栏目" Width="20%" DataField="ClassName" />
                    <DT:ColumnItem HeaderText="创建时间" Width="20%" DataField="AddDate" IsSort="true" />
                    <DT:ColumnItem HeaderText="是否审核" Width="10%" DataField="IsVerify" />
                    <DT:ColumnItem HeaderText="操作" Width="10%" DataField="ID" CssClass="bleft" />
                </Colunms>
            </DT:DataGrid><br />
			<div id="gridTreeDiv">
			
			</div>
		</div>
	</div>
    </form>
    <script type="text/javascript">
        function onSortClick(elem) {
            elem.blur()
        }
        function showDataList(data) {
            if (json != "") {
                var json = eval("data=" + data);
                var st = new Date().getTime();
                var option = {
                    jsondata: json,
                    checkbox: { visible: true, id: 'id' },
                    rowsindex: { visible: true, id: 'id' },
                    fields: [
	                        { name: 'id', dataFormat: function(r) { return '<a href="article_add.aspx?ID=' + r.id + '">' + r.title + '</a>'; } },
	                        { name: 'classname' },
	                        { name: 'adddate' },
	                        { name: 'isverify', dataFormat: function(r) { return r.isverify == 1 ? "已审核" : "未审核" } },
	                        { name: 'id' }
	                    ],
	                rowhandler: "contextMenu(this)"
                };
                $("#dataList").gridview(option);
                var st2 = new Date().getTime() - st;
                //alert(st2);
            }
        }
        function contextMenu(row) {
            var menu = { items: [
                { text: "预览", icon: "view", alias: "contextmenu-edit", action: contextMenuItem_click },
                { text: "编辑", icon: "edit", alias: "contextmenu-view", action: contextMenuItem_click },
                { text: "删除", disable: true, icon: "delete", alias: "contextmenu-delete", action: contextMenuItem_click },
                { type: "split" },
                { text: "发布", alias: "contextmenu-create", action: contextMenuItem_click },
                { text: "置顶", icon: "edit", alias: "contextmenu-create", width: 120, type: "group",
                    items: [
	                            { text: "组三集合", icon: "view", alias: "2-2", type: "group", width: 120, items: [
		                            { text: "组3一项", alias: "3-1" },
		                            { text: "组3二项", alias: "3-2" }
	                            ]
	                            },
	                            { text: "组1一项", icon: "view", alias: "2-1" },
	                            { text: "组1二项", alias: "2-3" },
	                            { text: "组1三项", alias: "2-4", action: contextMenuItem_click }
                            ]
                },
                { type: "split" },
                { text: "刷新", icon: "refresh", alias: "contextmenu-reflash", action: contextMenuItem_click }
                ]
            };
            $(row).contextmenu(menu);
        }
        function contextMenuItem_click() {
            /*var id = $(target).attr("id").substr(3);
            var cmd = this.data.alias;
            var ch = $.browser.msie ? target.ch : target.getAttribute("ch");
            var cell = ch.split("_FG$SP_");
            if (cmd == "contextmenu-edit") {
            alert("编辑，产品编号=" + id);
            }
            else if (cmd == "contextmenu-view") {
            alert("编辑，产品编号=" + id);
            }
            else if (cmd == "contextmenu-delete") {
            var name = cell[1];
            if (confirm("你确认要删除商品 [" + name + "] 吗？")) {
            alert("删除，产品编号=" + id);
            }
            }
            else {
            $("#productlist").flexReload();
            }*/
            alert('123');
        }
        var gridTree;
        function showGridTree(json) {
            gridTree = new TableTree4J("gridTree", true, true);
            gridTree.tableDesc = "<table id=\"tab\" class=\"table_data\">";

            var headerDataList = new Array("文章标题", "所属栏目", "创建时间", "是否审核", "操作");
            var widthList = new Array("4%", "4%", "32%", "20%", "20%", "10%", "10%");

            gridTree.setHeader(headerDataList, -1, widthList, true, "thead", "", "", "");
            //设置列样式
            gridTree.gridHeaderColStyleArray = new Array("", "", "", "", "bleft");
            gridTree.gridDataCloStyleArray = new Array("", "", "", "", "");

            if (json != "") {
                var data = eval("data=" + json);
                $.each(data, function(i, n) {
                var dataList = new Array("<a href=\"article_add.aspx?Id=" + n.id + "\">" + n.title + "</a>", n.classname, n.adddate,
                    n.isverify==1?"<a href=\"javascript:;\" onclick=\"verifyData(" + n.id + ",false,this)\">已审核</a>":"<a href=\"javascript:;\" onclick=\"verifyData(" + n.id + ",false,this)\" style=\"color:red\">未审核</a>",
                    "<a href=\"article_add.aspx?Id=" + n.id + "\">修改</a>&nbsp;&nbsp;<a href=\"javascript:DeleteData(" + n.id + ",false)\">删除</a>");
                    gridTree.addGirdNode(dataList, n.id,-1,null, n.id, "");
                });
            }
            gridTree.printTableTreeToElement("gridTreeDiv");
        }
        //编辑文章
        function editData() {
            var aid=getSingleCheckID();
            if (aid != "") {
                window.location.href = "article_add.aspx?Id=" + aid;
            } else {
                Dialog.alert("请选择要编辑的文章!");
            }
        }
        //aid:文章编号
        //flag:是否批量删除，true批量删除，false单个删除
        function DeleteData(aid, flag) {
            if (flag) {
                aid = getCheckId();
                if (aid == "") {
                    Dialog.alert("请选择要删除的文章!");
                    return;
                }
            }
            Dialog.confirm("确定要删除文章吗？", function() {
                var res = DTCMS.Web.admin.article_list.DeleteArticle(aid).value;
                if (res > 0) {
                    loadData(1);
                    showSuccess("成功删除" + res + "篇文章！");
                    return;
                }
                else {
                    showError("删除文章失败！");
                    return;
                }
            });
        }
        //审核文章
        function verifyData(aid, flag, elem) {
            if (flag) {
                aid = getCheckId();
                if (aid == "") {
                    Dialog.alert("请选择要审核的文章!");
                    return;
                }
            }
            var res = DTCMS.Web.admin.user_list.VerifyArticle(aid).value;
            if (res > 0) {
                if (flag) {
                    loadData(1);
                    showSuccess("批量审核用户文章！");
                } else {
                    elem.blur();
                    if (elem.innerHTML == "未审核") {
                        elem.innerHTML = "已审核";
                        elem.style.color = "black";
                    } else {
                        elem.innerHTML = "未审核";
                        elem.style.color = "red";
                    }
                }
            } else {
                showError("审核用户文章！");
            }
        }
    </script>
</body>
</html>