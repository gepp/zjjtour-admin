<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员投诉</title>
<link href="${ contextpath }/res/css/style.css" rel="stylesheet" type="text/css" />
<link href="${ contextpath }/res/css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ contextpath }/res/js/jquery.js"></script>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">会员投诉</a></li>
    </ul>
</div>
<div class="formbody">
<div id="usual1" class="usual"> 
    <div class="itab">
  	<ul> 
    <li><a href="#tab1" class="selected">会员投诉查看</a></li> 
  	</ul>
</div> 
<div id="tab1" class="tabson">
  <ul class="forminfo">
  <form action="" method="POST"  id="memberComplainForm">
									 
					 			   <li><label>id<b></b></label>
 			     <div class="control-group">
   			 		${ memberComplain.id}
   				</div>
 			   </li>
 				       			 			   <li><label>会员ID<b></b></label>
 			     <div class="control-group">
   			 		${ memberComplain.memberId}
   				</div>
 			   </li>
 				       			 			   <li><label>会员手机<b></b></label>
 			     <div class="control-group">
   			 		${ memberComplain.memberMobile}
   				</div>
 			   </li>
 				       			 			   <li><label>会员姓名<b></b></label>
 			     <div class="control-group">
   			 		${ memberComplain.memberName}
   				</div>
 			   </li>
 				       			 			   <li><label>投诉内容<b></b></label>
 			     <div class="control-group">
   			 		${ memberComplain.complainMessage}
   				</div>
 			   </li>
 				       			 			   <li><label>投诉时间<b></b></label>
 			     <div class="control-group">
   			 		${ memberComplain.complainTime}
   				</div>
 			   </li>
 				       			 			   <li><label>回复状态<b></b></label>
 			     <div class="control-group">
   			 		${ memberComplain.replayStatus}
   				</div>
 			   </li>
 				       			 			   <li><label>回复人id<b></b></label>
 			     <div class="control-group">
   			 		${ memberComplain.replayUserid}
   				</div>
 			   </li>
 				       			 			   <li><label>回复时间<b></b></label>
 			     <div class="control-group">
   			 		${ memberComplain.replayTime}
   				</div>
 			   </li>
 				       			 			   <li><label>回复内容<b></b></label>
 			     <div class="control-group">
   			 		${ memberComplain.replayMessage}
   				</div>
 			   </li>
 				       			 			   <li><label>审核状态<b></b></label>
 			     <div class="control-group">
   			 		${ memberComplain.reviewStatus}
   				</div>
 			   </li>
 				       			 			   <li><label>审核人id<b></b></label>
 			     <div class="control-group">
   			 		${ memberComplain.reviewUserid}
   				</div>
 			   </li>
 				       			 			   <li><label>审核时间<b></b></label>
 			     <div class="control-group">
   			 		${ memberComplain.reviewTime}
   				</div>
 			   </li>
 				       			 			   <li><label>审核意见<b></b></label>
 			     <div class="control-group">
   			 		${ memberComplain.reviewMessage}
   				</div>
 			   </li>
 				        			<li><label>&nbsp;</label>
   			 <input name="" type="button" class="btn" value="返回" onclick="window.location='${ contextpath}/membercomplain/list'"/></li>
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

 
 