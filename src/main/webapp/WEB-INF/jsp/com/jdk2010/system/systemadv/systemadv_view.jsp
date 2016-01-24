<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>滚动图</title>
<link href="${ contextpath }/res/css/style.css" rel="stylesheet" type="text/css" />
<link href="${ contextpath }/res/css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ contextpath }/res/js/jquery.js"></script>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">滚动图</a></li>
    </ul>
</div>
<div class="formbody">
<div id="usual1" class="usual"> 
    <div class="itab">
  	<ul> 
    <li><a href="#tab1" class="selected">滚动图查看</a></li> 
  	</ul>
</div> 
<div id="tab1" class="tabson">
  <ul class="forminfo">
  <form action="" method="POST"  id="systemAdvForm">
									 
					 			   <li><label>id<b></b></label>
 			     <div class="control-group">
   			 		${ systemAdv.id}
   				</div>
 			   </li>
 				       			 			   <li><label>标题<b></b></label>
 			     <div class="control-group">
   			 		${ systemAdv.title}
   				</div>
 			   </li>
 				       			 			   <li><label>跳转地址<b></b></label>
 			     <div class="control-group">
   			 		${ systemAdv.jumpUrl}
   				</div>
 			   </li>
 				       			 			   <li><label>图片<b></b></label>
 			     <div class="control-group">
   			 		${ systemAdv.imgUrl}
   				</div>
 			   </li>
 				       			 			   <li><label>类型<b></b></label>
 			     <div class="control-group">
   			 		${ systemAdv.type}
   				</div>
 			   </li>
 				       			 			   <li><label>排序号<b></b></label>
 			     <div class="control-group">
   			 		${ systemAdv.orderlist}
   				</div>
 			   </li>
 				       			 			   <li><label>是否启用<b></b></label>
 			     <div class="control-group">
   			 		${ systemAdv.status}
   				</div>
 			   </li>
 				        			<li><label>&nbsp;</label>
   			 <input name="" type="button" class="btn" value="返回" onclick="window.location='${ contextpath}/systemadv/list'"/></li>
 	</form>
  </ul>
 </div>
 </div>  
</div>
</body>
</html>
  <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

 
 