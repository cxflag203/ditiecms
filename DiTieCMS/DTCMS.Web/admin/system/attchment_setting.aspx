﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="attchment_setting.aspx.cs"
    Inherits="DTCMS.Web.admin.sys.attchment_setting" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>附件设置</title>
    <link href="../css/blue_body.css" rel="stylesheet" type="text/css" />
    <link href="/inc/dialog/dialog.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/iColorPicker.js"></script>
    <script type="text/javascript" src="/inc/dialog/dialog.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>

    <style type="text/css">
        #continer
        {
            margin:0 15px;
        }
        .hr
        {
            height: 12px;
            line-height: 12px;
            overflow: hidden;
            clear: both;
        }
        .caption
        {
            margin: 0 0 0 3px;
            height: 28px;
            line-height: 28px;
        }
        .a_table_form
        {
            border: 0;
            empty-cells: show;
            line-height: 32px;
            margin-top: 5px;
            width: 100%;
        }
        .hr1
        {
            float:left; border-bottom:solid 2px #ccc; font-size:15px; padding:20px 0 3px 0;
        }
        .hr2
        {
            clear:both; border-bottom:solid 1px #ccc; height:0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="continer">
        
            <div class="hr1">基本设置：</div>
            <div class="hr2"></div>
            <table cellpadding="10" cellspacing="0" class="a_table_form">
                <tbody>
                    <tr>
                        <td class="main_bleft">
                            存储目录规则:
                        </td>
                        <td class="main_bright" colspan="3">
                            <input type="radio" id="rdo_y" name="rdo_dirctory" value="yyyy" onclick="Dirctory(this)"
                                runat="server" /><label for="rdo_y">按年保存</label>
                            <input type="radio" id="rdo_ym" name="rdo_dirctory" value="yyyyMM" onclick="Dirctory(this)"
                                runat="server" /><label for="rdo_ym">按年/月保存</label>
                            <input type="radio" id="rdo_ymd" name="rdo_dirctory" value="yyyyMMdd" onclick="Dirctory(this)"
                                runat="server" /><label for="rdo_ymd">按年/月/日保存</label>
                            <input type="hidden" id="hideen_dirctory" runat="server" value="yyyyMM" />
                        </td>
                    </tr>
                    <tr>
                        <td class="main_bleft">
                            缩略图:
                        </td>
                        <td class="main_bright" colspan="3">
                            <input type="checkbox" id="chk_HashAbbrImage" runat="server" /><label for="chk_HashAbbrImage">生成缩略图</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="main_bleft">
                            缩略图宽:
                        </td>
                        <td class="main_bright">
                            <input type="text" id="txt_AbbrImageWidth" runat="server" class="textbox short" style="width: 80px;" /><span
                                class="caption">(单位:像素)</span>
                        </td>
                        <td class="main_bleft">
                            缩略图高:
                        </td>
                        <td class="main_bright">
                            <input type="text" id="txt_AbbrImageHeight" runat="server" class="textbox short"
                                style="width: 80px;" /><span class="caption">(单位:像素)</span>
                        </td>
                    </tr>
                </tbody>
            </table>
        
            <div class="hr1">水印设置：</div>
            <div class="hr2"></div>
            <table cellpadding="10" cellspacing="0" class="a_table_form">
                <tbody>
                    <tr>
                        <td class="main_bleft">
                            水印类型:
                        </td>
                        <td class="main_bright">
                            <input type="radio" id="rdo_FontWater" name="rdo_Water" runat="server" checked="true" />
                            <label for="rdo_FontWater" style=" margin-right:6px;">
                                文字水印</label>
                            <input type="radio" id="rdo_ImageWater" name="rdo_Water" runat="server" />
                            <label for="rdo_ImageWater">
                                图片水印</label>
                        </td>
                        <td class="main_bleft">
                            水印:
                        </td>
                        <td class="main_bright">
                            <input type="checkbox" id="chk_HasWaterMark" runat="server" /><label for="chk_HasWaterMark" style=" margin-right:6px;">原图水印</label>
                            <input type="checkbox" id="chk_HasAbbrImageWaterMark" runat="server" /><label for="chk_HasAbbrImageWaterMark">缩略图水印</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="main_bleft">
                            水印文字:
                        </td>
                        <td class="main_bright">
                            <input type="text" id="txt_WaterFont" class="textbox short" runat="server" />
                        </td>
                        <td class="main_bleft">
                            水印文字颜色:
                        </td>
                        <td class="main_bright">
                            <input type="text" id="txt_WaterFontColor" class="iColorPicker" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="main_bleft">
                            水印文字类型:
                        </td>
                        <td class="main_bright">
                            <select id="slt_WaterFontType" runat="server" style="width: 185px; background: #F7FAFC;">
                            </select>
                        </td>
                        <td class="main_bleft">
                            水印文字大小:
                        </td>
                        <td class="main_bright">
                            <input type="text" id="txt_WaterFontSize" class="textbox short" runat="server" /><span
                                class="caption">(单位:像素)</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="main_bleft">
                            水印图片地址:
                        </td>
                        <td class="main_bright" colspan="3">
                            <input type="text" id="txt_WaterImageUrl" class="textbox" runat="server" /><img src="../images/blue/s.gif"
                                class="select" alt="选取" onclick="dialogAttachmentUpload('/admin/attachment/attachmentmanage.aspx', onCancel);" />
                        </td>
                    </tr>
                    <tr>
                        <td class="main_bleft">
                            水印图片透明度:
                        </td>
                        <td class="main_bright" colspan="3">
                            <input type="text" id="txt_WaterImageUrlTran" class="textbox short" runat="server" /><span
                                class="caption">(1到100)</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="main_bleft">
                            水印位置:
                        </td>
                        <td class="main_bright" colspan="3">
                            <table id="tb_percent" cellpadding="0" cellspacing="0" border="0">
                                <tbody>
                                    <tr>
                                        <td>
                                            <input type="radio" id="rdo_top_left" name="percent" runat="server" /><label for="rdo_top_left">左上</label>
                                        </td>
                                        <td>
                                            <input type="radio" id="rdo_top_center" name="percent" runat="server" /><label for="rdo_top_center">中上</label>
                                        </td>
                                        <td>
                                            <input type="radio" id="rdo_top_right" name="percent" runat="server" /><label for="rdo_top_right">右上</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="radio" id="rdo_center_left" name="percent" runat="server" /><label for="rdo_center_left">左中</label>
                                        </td>
                                        <td>
                                            <input type="radio" id="rdo_center_center" name="percent" runat="server" /><label
                                                for="rdo_center_center">局中</label>
                                        </td>
                                        <td>
                                            <input type="radio" id="rdo_center_right" name="percent" runat="server" /><label
                                                for="rdo_center_right">右中</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="radio" id="rdo_bottom_left" name="percent" runat="server" /><label for="rdo_bottom_left">左下</label>
                                        </td>
                                        <td>
                                            <input type="radio" id="rdo_bottom_center" name="percent" runat="server" /><label
                                                for="rdo_bottom_center">中下</label>
                                        </td>
                                        <td>
                                            <input type="radio" id="rdo_bottom_right" name="percent" runat="server" /><label
                                                for="rdo_bottom_right">右下</label>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <input type="hidden" id="hidden_XPercent" value="0" runat="server" />
                            <input type="hidden" id="hidden_YPercent" value="0" runat="server" />
                        </td>
                    </tr>
                </tbody>
            </table>
            
            <div class="hr1">上传格式设置：</div>
            <div class="hr2"></div>
            <table cellpadding="10" cellspacing="0" class="a_table_form">
                <tbody>
                    <tr>
                        <td class="main_bleft">
                            图片保存格式:
                        </td>
                        <td class="main_bright">
                            <input type="text" id="txt_ImageFormat" runat="server" class="textbox" />
                        </td>
                        <td class="main_bleft">
                            视频保存格式:
                        </td>
                        <td class="main_bright">
                            <input type="text" id="txt_VidoFormat" runat="server" class="textbox" />
                        </td>
                    </tr>
                    <tr>
                        <td class="main_bleft">
                            音频保存格式:
                        </td>
                        <td class="main_bright">
                            <input type="text" id="txt_AudioFormat" runat="server" class="textbox" />
                        </td>
                        <td class="main_bleft">
                            Flash保存格式:
                        </td>
                        <td class="main_bright">
                            <input type="text" id="txt_Flash" runat="server" class="textbox" />
                        </td>
                    </tr>
                    <tr>
                        <td class="main_bleft">
                            附件保存格式:
                        </td>
                        <td class="main_bright" colspan="3">
                            <input type="text" id="txt_AttachmentFormat" runat="server" class="textbox" />
                        </td>
                    </tr>
                </tbody>
            </table>
            
        <div class="hr">
        </div>
        <div style="text-align: center;">
            <button type="button" id="btn_Save1" class="b1" runat="server" onserverclick="btn_Save_Click">
                保存</button>
            <button id="btn_Cancel" type="button" class="b1" onclick="history.back(-1);">
                取消</button>
        </div>
    </div>
    </form>

    <script type="text/javascript">
        function Dirctory(obj) {
            $("#hideen_dirctory").val(obj.value);
        }

        function onCancel(iResultPath) {
            $("#txt_WaterImageUrl").val(iResultPath);
        } 
    </script>

</body>
</html>
