﻿/*** tab菜单 ***/
function selectTab(showContent, selfObj) {
    // 操作标签
    var tab = document.getElementById("tab_menu").getElementsByTagName("li");
    for (var i = 0; i < tab.length; i++) {
        tab[i].className = "";
    }
    selfObj.parentNode.className = "tab_on";
    // 操作内容
    for (var j = 1; j <= tab.length; j++) {
        document.getElementById('tab' + j).style.display = "none";
    }
    document.getElementById(showContent).style.display = "block";
    selfObj.blur();
}
/*** 获取鼠标坐标 ***/
function mousePosition(ev) {
    if (!ev) ev = window.event;
    if (ev.pageX || ev.pageY) {
        return { x: ev.pageX, y: ev.pageY };
    }
    return {
        x: ev.clientX + document.documentElement.scrollLeft - document.body.clientLeft,
        y: ev.clientY + document.documentElement.scrollTop - document.body.clientTop
    };
}
/*** 获取标签坐标 ***/
function getElemCoords(elem) {
    var dom = document.getElementById(elem);
    var t = dom.offsetTop;
    var l = dom.offsetLeft;
    dom = dom.offsetParent;
    while (dom) {
        t += dom.offsetTop;
        l += dom.offsetLeft;
        dom = dom.offsetParent;
    }; return {
        top: t,
        left: l
    };
}
/***去除符号***/
function trimSign(opt) {
    var replaceStr = opt[opt.selectedIndex].text;
    var lastIndex = replaceStr.lastIndexOf("├");
    alert(opt[opt.selectedIndex].text);
    document.getElementById('slt_ParentClassName').text = replaceStr.substring(lastIndex + 1, replaceStr.length);
}
/*** Cookie ***/
function getCookie(check_name) {
    var a_all_cookies = document.cookie.split(';');
    var a_temp_cookie = cookie_name = cookie_value = '';
    var b_cookie_found = false;
    for (i = 0; i < a_all_cookies.length; i++) {
        a_temp_cookie = a_all_cookies[i].split('=');
        cookie_name = a_temp_cookie[0].replace(/^\s+|\s+$/g, '');
        if (cookie_name == check_name) {
            b_cookie_found = true;
            if (a_temp_cookie.length > 1) cookie_value = unescape(a_temp_cookie[1].replace(/^\s+|\s+$/g, ''));
            return cookie_value;
        }
        a_temp_cookie = null;
        cookie_name = '';
    }
    if (!b_cookie_found) return null;
}
function setCookie(sName, sValue) {
    try {
        var sCookie = sName + "=" + encodeURIComponent(sValue);
        document.cookie = sCookie;
    } catch (e) { }
}
function changeClassName(objectChange, classN) {
    objectChange.className = classN;
}

function select(object) {   //单击选择当前行
    var input = object.getElementsByTagName("input");
    if (input && input[0]) {
        input[0].checked = !input[0].checked;
    }
}

/*** 全选反选*name=items ***/
function invertCheck(elem) {
    var input = document.getElementsByName("items");
    var len = input.length;
    for (var i = 0; i < len; i++) {
        if (elem.checked) {
            input[i].checked = true;
        }
        else {
            input[i].checked = false;
        }
    }
}

/*** 获取选择ID*name=items ***/
function getCheckId() {
    var iValue = ""; //返回值
    var input = document.getElementsByName("items");
    if (input) {
        for (var i = 0, len = input.length; i < len; i++) {
            if (input[i].checked) {
                if (iValue == "") {
                    iValue = input[i].value;
                } else {
                    iValue = iValue + "," + input[i].value;
                }
            }
        }
    }
    return iValue;
}
function getSingleCheckID() {
    var iValue = ""; //返回值
    var input = document.getElementsByName("items");
    if (input) {
        for (var i = 0, len = input.length; i < len; i++) {
            if (input[i].checked) {
                iValue = input[i].value;
            }
        }
    }
    return iValue;
}
















