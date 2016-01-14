<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>活动</title>
<link href="${ contextpath }/res/css/style.css" rel="stylesheet" type="text/css" />
<link href="${ contextpath }/res/css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ contextpath }/res/js/jquery.js"></script>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">活动</a></li>
    </ul>
</div>
<div class="formbody">
<div id="usual1" class="usual"> 
    <div class="itab">
  	<ul> 
    <li><a href="#tab1" class="selected">活动查看</a></li> 
  	</ul>
</div> 
<div id="tab1" class="tabson">
  <ul class="forminfo">
  <form action="" method="POST"  id="memberActivityForm">
									 
					 			   <li><label>id<b></b></label>
 			     <div class="control-group">
   			 		${ memberActivity.id}
   				</div>
 			   </li>
 				       			 			   <li><label>活动标题<b></b></label>
 			     <div class="control-group">
   			 		${ memberActivity.title}
   				</div>
 			   </li>
 				       			 			   <li><label>litter_title<b></b></label>
 			     <div class="control-group">
   			 		${ memberActivity.litterTitle}
   				</div>
 			   </li>
 				       			 			   <li><label>通告内容<b></b></label>
 			     <div class="control-group">
   			 		${ memberActivity.content}
   				</div>
 			   </li>
 				       			 			   <li><label>用户id<b></b></label>
 			     <div class="control-group">
   			 		${ memberActivity.userid}
   				</div>
 			   </li>
 				       			 			   <li><label>活动状态全部、未开始、进行中、已结束<b></b></label>
 			     <div class="control-group">
   			 		${ memberActivity.activityStatus}
   				</div>
 			   </li>
 				       			 			   <li><label>是否启用<b></b></label>
 			     <div class="control-group">
   			 		${ memberActivity.status}
   				</div>
 			   </li>
 				       			 			   <li><label>创建时间<b></b></label>
 			     <div class="control-group">
   			 		${ memberActivity.ctime}
   				</div>
 			   </li>
 				       			 			   <li><label>缩略图<b></b></label>
 			     <div class="control-group">
   			 		${ memberActivity.smallimg}
   				</div>
 			   </li>
 				       			 			   <li><label>首页图<b></b></label>
 			     <div class="control-group">
   			 		${ memberActivity.indeximg}
   				</div>
 			   </li>
 				       			 			   <li><label>url<b></b></label>
 			     <div class="control-group">
   			 		${ memberActivity.url}
   				</div>
 			   </li>
 				       			 			   <li><label>排序<b></b></label>
 			     <div class="control-group">
   			 		${ memberActivity.orderlist}
   				</div>
 			   </li>
 				       			 			   <li><label>摘要<b></b></label>
 			     <div class="control-group">
   			 		${ memberActivity.abstractContent}
   				</div>
 			   </li>
 				       			 			   <li><label>0会员 1全部<b></b></label>
 			     <div class="control-group">
   			 		${ memberActivity.joinType}
   				</div>
 			   </li>
 				       			 			   <li><label>是否首页<b></b></label>
 			     <div class="control-group">
   			 		${ memberActivity.indexStatus}
   				</div>
 			   </li>
 				       			 			   <li><label>是否置顶<b></b></label>
 			     <div class="control-group">
   			 		${ memberActivity.topStatus}
   				</div>
 			   </li>
 				       			 			   <li><label>0页面 1页外<b></b></label>
 			     <div class="control-group">
   			 		${ memberActivity.jumpType}
   				</div>
 			   </li>
 				       			 			   <li><label>menu_id<b></b></label>
 			     <div class="control-group">
   			 		${ memberActivity.menuId}
   				</div>
 			   </li>
 				       			 			   <li><label>0未处理 1通过 2 失败<b></b></label>
 			     <div class="control-group">
   			 		${ memberActivity.reviewStatus}
   				</div>
 			   </li>
 				       			 			   <li><label>review_userid<b></b></label>
 			     <div class="control-group">
   			 		${ memberActivity.reviewUserid}
   				</div>
 			   </li>
 				       			 			   <li><label>review_time<b></b></label>
 			     <div class="control-group">
   			 		${ memberActivity.reviewTime}
   				</div>
 			   </li>
 				       			 			   <li><label>review_reason<b></b></label>
 			     <div class="control-group">
   			 		${ memberActivity.reviewReason}
   				</div>
 			   </li>
 				       			 			   <li><label>是否支持报名<b></b></label>
 			     <div class="control-group">
   			 		${ memberActivity.supportStatus}
   				</div>
 			   </li>
 				       			 			   <li><label>开始时间<b></b></label>
 			     <div class="control-group">
   			 		${ memberActivity.startTime}
   				</div>
 			   </li>
 				       			 			   <li><label>截止时间<b></b></label>
 			     <div class="control-group">
   			 		${ memberActivity.endTime}
   				</div>
 			   </li>
 				        			<li><label>&nbsp;</label>
   			 <input name="" type="button" class="btn" value="返回" onclick="window.location='${ contextpath}/memberactivity/list'"/></li>
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

 
 