﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="attachmentload.aspx.cs"
    Inherits="DTCMS.Web.admin.attachmentload" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>附件上传</title>
    <link href="../css/blue_body.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/public.js"></script>
    <link href="../../inc/dialog/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../inc/dialog/dialog.js"></script>
    <style type="text/css">
        *
        {
            padding: 0;
            margin: 0;
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-size: 12px;
        }
        #container
        {
            width: 570px;
            margin: 0 auto;
        }
        .text1
        {
            width: 120px;
            margin-left:16px;
        }
        .text2
        {
            width: 120px;
        }
        .bg
        {
            background: url(../images/blue/login_input_bg.gif) no-repeat left top #F7FAFC;
        }
        .file
        {
            cursor: pointer;
        }
        #upload tr
        {
            height: 24px;
            line-height: 24px;
        }
        
        #div_attachmentType span{
            padding-right: 3px;
        }
    </style>

    <script type="text/javascript">
        $(document).ready(function() {
            LoadData();
        });
        function LoadData() {
            $.ajax({
                url: "/admin/ajax/attachment_list.aspx",
                type: "GET",
                data: "action=upload&ran=" + Math.random(),
                success: function(json) {
                    InitPage(json);
                }
            });
        }
        function InitPage(json) {
            if (json != "") {
                var data = eval("data=" + json);
                $("#chHasWaterMark").attr("checked", data.HasWaterMark == 1 ? true : false);
                $("#chHasAbbrImage1").attr("checked", data.HasAbbrImage == 1 ? true : false);
                $("#chHasWaterMark1").attr("checked", data.HasAbbrImageWaterMark == 1 ? true : false);
                $("#abbrImageWidth1").val(data.AbbrImageWidth);
                $("#abbrImageHeight1").val(data.AbbrImageHeight);
                $("#div_attachmentType").html(data.attachmentType);
            }
        }
    </script>

</head>
<body>    
    <form enctype="multipart/form-data" id="form1" name="form1" target="formTarget" method="post"
    action="simpleuploader.aspx?type=image">
    <div id="container">
        <div id="upload">
            <div id="top" style="text-align: left; width: 100%;">
                <div id="div_attachmentType" style="margin-bottom: 4px;">
                </div>
                <span>
                    <input type="hidden" id="hidden_attr" name="hidden_attr"
                        value="1" /></span>
                <fieldset style="padding: 3px 0 6px 0; border:1px solid #BDBCBD;">
                    <legend style="margin-left: 8px;">附件上传</legend>
                    <table id="imagetable0" style="width: 100%;" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="width: 6%;" align="right">
                            </td>
                            <td style="width: 34%;">
                                <span>附件浏览</span>
                            </td>
                            <td style="width: 30%;">
                                <span style="margin-left: 16px;">附件名称</span>
                            </td>
                            <td style="width: 30%;">
                                <span>附件描述</span>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <label>
                                    1:</label>
                            </td>
                            <td>
                                <input name='File1' id='File1' class="file bg" type='file' value='' size="26" onchange="fileOnChange(this);" />
                            </td>
                            <td>
                                <input name="File1Name" id="File1Name" class="text1 bg" type="text" value="" />
                            </td>
                            <td>
                                <input name="File1Info" id="File1Info" class="text2 bg" type="text" value="" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <label>
                                    2:</label>
                            </td>
                            <td>
                                <input name='File2' id='File2' class="file bg" type='file' value='' size='26' onchange="fileOnChange(this);" />
                            </td>
                            <td>
                                <input name="File2Name" id="File2Name" class="text1 bg" type="text" value="" />
                            </td>
                            <td>
                                <input name="File2Info" id="File2Info" class="text2 bg" type="text" value="" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <label>
                                    3:</label>
                            </td>
                            <td>
                                <input name='File3' id='File3' class="file bg" type='file' value='' size='26' onchange="fileOnChange(this);" />
                            </td>
                            <td>
                                <input name="File3Name" id="File3Name" class="text1 bg" type="text" value="" />
                            </td>
                            <td>
                                <input name="File3Info" id="File3Info" class="text2 bg" type="text" value="" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <label>
                                    4:</label>
                            </td>
                            <td>
                                <input name='File4' onchange="fileOnChange(this);" id='File4' class="file bg" type='file'
                                    value='' size='26' />
                            </td>
                            <td>
                                <input name="File4Name" id="File4Name" class="text1 bg" type="text" value="" />
                            </td>
                            <td>
                                <input name="File4Info" id="File4Info" class="text2 bg" type="text" value="" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <label>
                                    5:</label>
                            </td>
                            <td>
                                <input name='File5' onchange="fileOnChange(this);" id='File5' class="file bg " type='file'
                                    value='' size='26' />
                            </td>
                            <td>
                                <input name="File5Name" id="File5Name" class="text1 bg" type="text" value="" />
                            </td>
                            <td>
                                <input name="File5Info" id="File5Info" class="text2 bg" type="text" value="" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </div>
            <div id="bottom" style="margin-top: 6px; width: 100%; text-align: left;">
                <fieldset style="padding: 3px 0 6px 0; border:1px solid #BDBCBD;">
                    <legend style="margin-left: 8px;">
                        <label>
                            图片参数设置</label></legend>
                    <table width="100%;" cellpadding="2" cellspacing="0">
                        <tr>
                            <td style="width: 18%; text-align: right;">
                                <label>
                                    原图水印:</label>
                            </td>
                            <td style="width: 82%;">
                                <input type="hidden" id="HasWaterMark" name="HasWaterMark" value="0" />
                                <input type="checkbox" id="chHasWaterMark" name="chHasWaterMark" class="bg" value="true" />
                                <input type="hidden" id="Count" name="Count" value="1" />
                            </td>
                        </tr>
                        <tr id="AbbrImagesTable">
                            <td align="right">
                                <label>
                                    缩略图:</label>
                            </td>
                            <td>
                                <input type="checkbox" id="chHasAbbrImage1" class="bg" name="chHasAbbrImage1" value="true" />
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top; text-align: right;">
                                缩略图水印:
                            </td>
                            <td>
                                <input type="checkbox" id="chHasWaterMark1" class="bg" name="chHasWaterMark1" value="true" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="top">
                                缩略图宽:
                            </td>
                            <td>
                                <input name="abbrImageWidth1" id="abbrImageWidth1" class="bg" type="text" style="width: 36px"
                                    maxlength="4" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="top">
                                缩略图高:
                            </td>
                            <td>
                                <input name="abbrImageHeight1" id="abbrImageHeight1" class="bg" type="text" style="width: 36px"
                                    maxlength="4" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </div>
        </div>
        <div style="clear: both;" id="msg">
        </div>
        <input type="hidden" id="result" value="" />
    </div>
    <div style="display: none;">
        <iframe name="formTarget" src="javascript:void(0)" height="0"></iframe>
    </div>
    </form>   
    <form id="formService" name="formService" runat="server">
    
    </form>    
    <script type="text/javascript">
        function fileOnChange(obj) {
            var val = obj.value;
            var fileName = val.substring(val.lastIndexOf('\\') + 1);
            $("#" + obj.id + "Name").val(fileName);
            $("#" + obj.id + "Info").val(fileName);
        }        
        
        function upload() {
            var files = $(":file");
            
            var validate = true;
            var flag = true;

            $.each(files, function(i, n) {
                var val = n.value;
                if (val != "" && val != null) {
                    validate = false;

                    var ext = val.substring(n.value.lastIndexOf(".") + 1).toLowerCase();
                    if (ext != "" && !hasFormat(ext)) {
                        Dialog.alert("附件类型不支持" + ext + "文件！请重新选择。");
                        flag = false;
                    }
                }

            });
            if (validate) {
                Dialog.alert("请选择要上传的文件！");
                return;
            }
                
            if (flag == false) return;

            document.getElementById("form1").submit();
        }

        function onUploadCompleted(iResult, errorMsg, iResultPath) {      
            switch (iResult.toString()) {
                case "1":
                    try {
                        setResult(iResultPath);
                        window.parent.parent.Dialog.close();                        
                    } catch (ex) { }
                    break;

                case "202":
                    Dialog.alert('无效的文件类型！以下文件上传失败:' + errorMsg);
                    break;

                case "203":
                    Dialog.alert("您没有权限上传此文件，请检查服务器设置");
                    break;

                default:
                    Dialog.alert('上传失败，错误代码: ' + iResult);
                    break;
            }
        }

        function hasFormat(ext) {
            switch (getAttr()) {
                case "1":
                    return hasImage(ext);
                case "2":
                    return hasVideo(ext);
                case "3":
                    return hasAudio(ext);
                case "4":
                    return hasFlash(ext);
                case "5":
                    return hasAttachment(ext);
                default:
                    return false;
            }
        }

        function msg() {
            //showLoading("正在上传数据，请稍候...", "#container");
        }        

        function setAttr(obj) {
            $("#hidden_attr").val(obj.value || 1);
        }
        function getAttr() {
            return $("#hidden_attr").val() || 1;
        }

        function setResult(value) {
            $("#result").val(value);
        }
        function resultPath() {
            return $("#result").val();
        }
    </script>

</body>
</html>
