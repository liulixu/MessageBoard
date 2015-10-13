<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript">
    var request=new XMLHttpRequest();
    request.onreadystatechange=function(){
        if(request.readyState==1){
            request.open("post","a",true);

            request.send();
        }
    }



    var XMLHttpReq;
    function createXMLHttpRequest() {
        try {
            XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP");//IE高版本创建XMLHTTP
        }
        catch(E) {
            try {
                XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");//IE低版本创建XMLHTTP
            }
            catch(E) {
                XMLHttpReq = new XMLHttpRequest();//兼容非IE浏览器，直接创建XMLHTTP对象
            }
        }

    }
    function sendAjaxRequest(url) {
        createXMLHttpRequest();                                //创建XMLHttpRequest对象
        XMLHttpReq.open("post", url, true);
        XMLHttpReq.onreadystatechange = processResponse; //指定响应函数
        XMLHttpReq.send(null);
    }
    //回调函数
    function processResponse() {
        if (XMLHttpReq.readyState == 4) {
            if (XMLHttpReq.status == 200) {
                var text = XMLHttpReq.responseText;
                abc.value=text;

            }
        }
    }
    function f(){
        sendAjaxRequest('b');

    }

</script>
</head>

<body onload="f()">
<img src="a">
<input id="abc" value="${random}">

</body>
</html>
