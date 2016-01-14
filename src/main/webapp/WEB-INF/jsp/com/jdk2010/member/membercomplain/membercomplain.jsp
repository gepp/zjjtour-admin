<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员投诉</title>
<link href="${ contextpath }/res/css/style.css" rel="stylesheet"
	type="text/css" />
	<link href="${ contextpath }/res/css/page.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="${ contextpath }/res/js/jquery.js"></script>
<script type="text/javascript" src="${ contextpath }/res/js/common.js"></script>
<script type="text/javascript" src="${ contextpath }/res/js/layer/layer.js"></script>

</head>
<body>

<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a></li>
			<li><a href="#">会员投诉</a></li>
		</ul>
</div>
<div class="rightinfo">
		
					
							 			 				 			 				 					 					 				 			 				 					 					 				 			 				 			 				 					 					 				 			 				 					 					 				 			 				 			 				 			 				 			 				 					 					 				 			 				 			 				 					 					 				 			 				 			 			
							<form method="post" action="${ contextpath}/membercomplain/list" class="form-horizontal">
				<ul class="seachform1" style="padding-top: 45px">
																																					<li><label>会员手机</label><input type="text" name="member_mobile"  id="member_mobile" class="scinput1" placeholder="请输入会员手机" value="${member_mobile}"></li>
																						<li><label>会员姓名</label><input type="text" name="member_name"  id="member_name" class="scinput1" placeholder="请输入会员姓名" value="${member_name}"></li>
																															<li><label>投诉时间</label><input type="text" name="complain_time"  id="complain_time" class="scinput1" placeholder="请输入投诉时间" value="${complain_time}"></li>
																						<li><label>回复状态</label><input type="text" name="replay_status"  id="replay_status" class="scinput1" placeholder="请输入回复状态" value="${replay_status}"></li>
																																																	<li><label>审核状态</label><input type="text" name="review_status"  id="review_status" class="scinput1" placeholder="请输入审核状态" value="${review_status}"></li>
																															<li><label>审核时间</label><input type="text" name="review_time"  id="review_time" class="scinput1" placeholder="请输入审核时间" value="${review_time}"></li>
																					 <div class="tools">
			<ul class="toolbar">
			<li class="click" id="table_add"><span><img src="${ contextpath }/res/images/t01.png" /></span>添加</li>
	        <li id="table_delete" ><span><img src="${ contextpath }/res/images/t03.png" /></span>删除</li>
	        <li  id="table_refresh"><span><img src="${ contextpath }/res/images/t04.png" /></span>查询</li>
			</ul>
		</div>
				
			 				</ul>
 			
			</form>
			 		<div class="formtitle1">
			<span>会员投诉</span>
		</div>
		<table class="tablelist">
		<thead>
				<tr>
				<th><input type="checkbox" width="15px"  id="checkAll"/></th>
				
														   <th>id</th>
																			   <th>会员ID</th>
																			   <th>会员手机</th>
																			   <th>会员姓名</th>
																			   <th>投诉内容</th>
																			   <th>投诉时间</th>
																			   <th>回复状态</th>
																			   <th>回复人id</th>
																			   <th>回复时间</th>
																			   <th>回复内容</th>
																			   <th>审核状态</th>
																			   <th>审核人id</th>
																			   <th>审核时间</th>
																			   <th>审核意见</th>
													<th>操作</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach items="${pageList.list}" var="item">
				 	
			       <tr>
						<td><input type="checkbox" name="subBox" value="${item.id}" /></td>
												 						<td>
															${ item.id}
													</td>	

						 												 						<td>
															${ item.memberId}
													</td>	

						 												 						<td>
															${ item.memberMobile}
													</td>	

						 												 						<td>
															${ item.memberName}
													</td>	

						 												 						<td>
															${ item.complainMessage}
													</td>	

						 												 						<td>
															${ item.complainTime}
													</td>	

						 												 						<td>
															${ item.replayStatus}
													</td>	

						 												 						<td>
															${ item.replayUserid}
													</td>	

						 												 						<td>
															${ item.replayTime}
													</td>	

						 												 						<td>
															${ item.replayMessage}
													</td>	

						 												 						<td>
															${ item.reviewStatus}
													</td>	

						 												 						<td>
															${ item.reviewUserid}
													</td>	

						 												 						<td>
															${ item.reviewTime}
													</td>	

						 												 						<td>
															${ item.reviewMessage}
													</td>	

						 													<td>
							<a href="${ contextpath }/membercomplain/modify.htm?id=${item.id}" class="tablelink">编辑</a> 
							<a href="${ contextpath }/membercomplain/view.htm?id=${item.id}"  class="tablelink">查看</a>
 				   </tr>
				</c:forEach>
			</tbody>
		</table>
		<page:page href="${ contextpath}/membercomplain/list?member_mobile=${member_mobile}&member_name=${member_name}&complain_time=${complain_time}&replay_status=${replay_status}&review_status=${review_status}&review_time=${review_time}" data="pageList" />
		
</div>
</body>
</html>

<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
		$(document).ready(function(){
			table_init("${ contextpath}/membercomplain","${ contextpath}/membercomplain/list?");
		});
</script>

 