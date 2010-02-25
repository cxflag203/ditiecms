﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="database_runsql.aspx.cs"
    Inherits="DTCMS.Web.admin.system.database_runsql" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <title>运行SQL语句</title>
    <link href="../css/blue_body.css" type="text/css" rel="StyleSheet" />
    <link href="/inc/dialog/dialog.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/jquery-1.3.2-vsdoc2.js"></script>

    <script type="text/javascript" src="/inc/dialog/dialog.js"></script>
    <style type="text/css">
    .h0{height:2px;}
    .h6{ height:6px;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div>名称(M)：</div><div class="h0"></div>
        <div>
            <select id="slt_sysobject" runat="server" style="width: 320px; background: #F7FAFC;"
                onchange="getSysColumn(this.options[selectedIndex].value);">
            </select><br />
        </div>
        <div class="h6"></div>
        
        <div>列(O)：</div><div class="h0"></div>
        <div id="column_name" style="width: 493px; height: 142px; overflow: auto;">
        </div>
    </div> 
    <div class="h6"></div>
    
    <div>返回信息(R)：</div><div class="h0"></div>
    <div id="return_msg" style="width: 80%; height:142px; overflow: auto;">
    </div>
               
    <div class="h6"></div>
    <div>SQL语句：(L)</div><div class="h0"></div>
    <div>
        <textarea id="txts_sql" rows="6" cols="68" style="background: #F7FAFC;"></textarea></div>
    <div>
        <div style="height: 3px;">
        </div>
        <button type="button" id="btn_select" class="b1" onclick="onclick_btn_select();">查询</button>
        <button type="button" id="btn_update" class="b1" onclick="onclick_btn_update();">编辑</button>
        <button type="button" id="btn_cancel" class="b1">取消</button></div>
    </form>

    <script type="text/javascript">
        function selectColumns() {
            var cols = $("input[name='columns']");
            var select = "";
            $.each(cols, function(i, n) {
                if (n.checked == true) {
                    select = select + "," + n.value;
                }
            });
            if (select != "") {
                select = select.substring(1, select.length);
                $("#txts_sql").val("SELECT " + select + " FROM " + $("#slt_sysobject").val());
            } else {
                $("#txts_sql").val("");
            }

        }
        function selectColumnsAll(obj) {
            var cols = $("input[name='columns']");
            $.each(cols, function(i, n) {
                if (n.value != "*") {
                    n.checked = "";
                }
            });
            if (obj.checked == true) {
                $("#txts_sql").val("SELECT * FROM " + $("#slt_sysobject").val());
            } else {
                $("#txts_sql").val("");
            }
        }
        
        function getSysColumn(tablename) {
            var callback = function(res) {
                if (res.error) {
                    alert("请求错误，请刷新页面重试！\n" + res.error.Message);
                    return;
                }
                showSysColumn(res.value);
            }
            DTCMS.Web.admin.system.database_runsql.GetSysColumnDataTable(tablename, callback);
        }        
        function showSysColumn(html) {
            $("#column_name").html(html);
        }

        function onclick_btn_update() {
            var callback = function(res) {
                if (res.error) {
                    alert("请求错误，请刷新页面重试！\n" + res.error.Message);
                    return;
                }
                showReturn_msg(res.value);
            }
            DTCMS.Web.admin.system.database_runsql.Update($("#txts_sql").val(), callback);
        }
        function onclick_btn_select() {
            var callback = function(res) {
                if (res.error) {
                    alert("请求错误，请刷新页面重试！\n" + res.error.Message);
                    return;
                }
                showReturn_msg(res.value);
            }
            DTCMS.Web.admin.system.database_runsql.Select($("#txts_sql").val(), callback);
        }
        function showReturn_msg(html) {
            $("#return_msg").html(html);
        }
    </script>

</body>
</html>
