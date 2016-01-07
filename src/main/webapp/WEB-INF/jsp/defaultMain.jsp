<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${contextpath }/res/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextpath }/res/js/jquery.js"></script>
<script type="text/javascript" src="${contextpath }/res/js/jsapi.js"></script>
<script type="text/javascript" src="${contextpath }/res/js/format+zh_CN,default,corechart.I.js"></script>		
<script type="text/javascript" src="${contextpath }/res/js/jquery.ba-resize.min.js"></script>
</head>
<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">工作台</a></li>
    </ul>
    </div>
    
    
    <div class="mainbox">
    
    <div class="mainleft">
    
     
    <!--leftinfo end-->
    
    
    <div class="leftinfos">
    
   <div class="infoleft">
    <div class="listtitle">常用工具<a href="#" class="more1">设置</a></div>
    
    <ul class="tooli">
    <li><span><img src="${contextpath }/res/images/d01.png" /></span><p><a href="#">test</a></p></li>
     
    </ul>
    
    </div>
   
    <div class="inforight">
    
    <div class="listtitle">系统环境</div>    
   	<ul class="newlist">
    <li><i>操作系统</a></i>${osName }</li>
    <li><i>java版本</a></i>${jdkVersion }</li>
    <li><i>java目录</a></i>${jdkHome }</li>
     <li><i>服务器版本</a></i><%= application.getServerInfo() %></li>
    </ul>        
    </div>
     
    </div>
    
    
    </div>
    <!--mainleft end-->
     
    <div class="mainright">
     
    <div class="dflist1">
    <div class="listtitle">信息统计</div>    
    
    </div>

    </div>
    <!--mainright end--> 
    </div>
</body>
<script type="text/javascript">
	setWidth();
	$(window).resize(function(){
		setWidth();	
	});
	function setWidth(){
		var width = ($('.leftinfos').width()-12)/2;
		$('.infoleft,.inforight').width(width);
	}
</script>
</html>
