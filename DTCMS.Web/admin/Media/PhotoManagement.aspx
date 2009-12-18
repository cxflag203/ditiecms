﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PhotoManagement.aspx.cs" Inherits="DTCMS.Web.admin.Media.PhotoManagement" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>图片管理</title>
    <style type="text/css">
	    body{
	    margin:0 auto;
	    border:0;
	    padding:0;
	    text-align:center;
	    font-family:"Arial Unicode MS";
	    font-size:16px;
    }
    ul{
	    list-style:none;
    }

	    #container{	
	    width:760px;
    }
	    #menu{
	    width:100%;
	    margin-bottom:12px;
    }
	    #menu ul li{
	    float:left;
	    width:86px;		
    }
	    #menu ul li a{
	    display:block;
	    text-decoration:none;
	    cursor:pointer;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="container">
	        <div id="menu">
		        <ul>
			        <li><a href="javascript:void(0)">图片上传</a></li>
			        <li><a href="javascript:void(0)">图片浏览</a></li>
		        </ul>
	        </div>
	        <div id="main">
		        <iframe src="PhotoUpload.aspx" width="100%" height="366" id="FrmImgUpload" name="FrmImgUpload" frameborder="0" scrolling="no"></iframe>        
	        </div>
        </div>
	</form>
</body>
</html>
