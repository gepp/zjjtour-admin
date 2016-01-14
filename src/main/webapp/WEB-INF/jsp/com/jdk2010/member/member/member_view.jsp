<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员</title>
<link href="${ contextpath }/res/css/style.css" rel="stylesheet" type="text/css" />
<link href="${ contextpath }/res/css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ contextpath }/res/js/jquery.js"></script>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">会员</a></li>
    </ul>
</div>
<div class="formbody">
<div id="usual1" class="usual"> 
    <div class="itab">
  	<ul> 
    <li><a href="#tab1" class="selected">会员查看</a></li> 
  	</ul>
</div> 
<div id="tab1" class="tabson">
  <ul class="forminfo">
  <form action="" method="POST"  id="memberForm">
									 
					 			   <li><label>id<b></b></label>
 			     <div class="control-group">
   			 		${ member.id}
   				</div>
 			   </li>
 				       			 			   <li><label>会员名称<b></b></label>
 			     <div class="control-group">
   			 		${ member.nickname}
   				</div>
 			   </li>
 				       			 			   <li><label>邮箱<b></b></label>
 			     <div class="control-group">
   			 		${ member.email}
   				</div>
 			   </li>
 				       			 			   <li><label>手机<b></b></label>
 			     <div class="control-group">
   			 		${ member.mobile}
   				</div>
 			   </li>
 				       			 			   <li><label>真实姓名<b></b></label>
 			     <div class="control-group">
   			 		${ member.realname}
   				</div>
 			   </li>
 				       			 			   <li><label>性别<b></b></label>
 			     <div class="control-group">
   			 		${ member.sex}
   				</div>
 			   </li>
 				       			 			   <li><label>启用标志<b></b></label>
 			     <div class="control-group">
   			 		${ member.status}
   				</div>
 			   </li>
 				       			 			   <li><label>创建时间<b></b></label>
 			     <div class="control-group">
   			 		${ member.ctime}
   				</div>
 			   </li>
 				        			<li><label>&nbsp;</label>
   			 <input name="" type="button" class="btn" value="返回" onclick="window.location='${ contextpath}/member/list'"/></li>
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

 
 