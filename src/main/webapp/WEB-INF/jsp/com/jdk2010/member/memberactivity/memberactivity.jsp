<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>活动</title>
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
			<li><a href="#">活动</a></li>
		</ul>
</div>
<div class="rightinfo">
		
					
							 			 				 			 				 					 					 				 			 				 			 				 			 				 					 					 				 			 				 					 					 				 			 				 			 				 			 				 			 				 			 				 			 				 			 				 			 				 			 				 			 				 			 				 			 				 					 					 				 			 				 			 				 			 				 			 				 			 				 					 					 				 			 				 					 					 				 			 			
							<form method="post" action="${ contextpath}/memberactivity/list" class="form-horizontal">
				<ul class="seachform1" style="padding-top: 45px">
																																					<li><label>litter_title</label><input type="text" name="litter_title"  id="litter_title" class="scinput1" placeholder="请输入litter_title" value="${litter_title}"></li>
																																								<li><label>活动状态全部、未开始、进行中、已结束</label><input type="text" name="activity_status"  id="activity_status" class="scinput1" placeholder="请输入活动状态全部、未开始、进行中、已结束" value="${activity_status}"></li>
																						<li><label>是否启用</label><input type="text" name="status"  id="status" class="scinput1" placeholder="请输入是否启用" value="${status}"></li>
																																																																																																																									<li><label>0未处理 1通过 2 失败</label><input type="text" name="review_status"  id="review_status" class="scinput1" placeholder="请输入0未处理 1通过 2 失败" value="${review_status}"></li>
																																																										<li><label>开始时间</label><input type="text" name="start_time"  id="start_time" class="scinput1" placeholder="请输入开始时间" value="${start_time}"></li>
																						<li><label>截止时间</label><input type="text" name="end_time"  id="end_time" class="scinput1" placeholder="请输入截止时间" value="${end_time}"></li>
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
			<span>活动</span>
		</div>
		<table class="tablelist">
		<thead>
				<tr>
				<th><input type="checkbox" width="15px"  id="checkAll"/></th>
				
														   <th>id</th>
																			   <th>活动标题</th>
																			   <th>litter_title</th>
																			   <th>通告内容</th>
																			   <th>用户id</th>
																			   <th>活动状态全部、未开始、进行中、已结束</th>
																			   <th>是否启用</th>
																			   <th>创建时间</th>
																			   <th>缩略图</th>
																			   <th>首页图</th>
																			   <th>url</th>
																			   <th>排序</th>
																			   <th>摘要</th>
																			   <th>0会员 1全部</th>
																			   <th>是否首页</th>
																			   <th>是否置顶</th>
																			   <th>0页面 1页外</th>
																			   <th>menu_id</th>
																			   <th>0未处理 1通过 2 失败</th>
																			   <th>review_userid</th>
																			   <th>review_time</th>
																			   <th>review_reason</th>
																			   <th>是否支持报名</th>
																			   <th>开始时间</th>
																			   <th>截止时间</th>
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
															${ item.title}
													</td>	

						 												 						<td>
															${ item.litterTitle}
													</td>	

						 												 						<td>
															${ item.content}
													</td>	

						 												 						<td>
															${ item.userid}
													</td>	

						 												 						<td>
															${ item.activityStatus}
													</td>	

						 												 						<td>
															${ item.status}
													</td>	

						 												 						<td>
															${ item.ctime}
													</td>	

						 												 						<td>
															${ item.smallimg}
													</td>	

						 												 						<td>
															${ item.indeximg}
													</td>	

						 												 						<td>
															${ item.url}
													</td>	

						 												 						<td>
															${ item.orderlist}
													</td>	

						 												 						<td>
															${ item.abstractContent}
													</td>	

						 												 						<td>
															${ item.joinType}
													</td>	

						 												 						<td>
															${ item.indexStatus}
													</td>	

						 												 						<td>
															${ item.topStatus}
													</td>	

						 												 						<td>
															${ item.jumpType}
													</td>	

						 												 						<td>
															${ item.menuId}
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
															${ item.reviewReason}
													</td>	

						 												 						<td>
															${ item.supportStatus}
													</td>	

						 												 						<td>
															${ item.startTime}
													</td>	

						 												 						<td>
															${ item.endTime}
													</td>	

						 													<td>
							<a href="${ contextpath }/memberactivity/modify.htm?id=${item.id}" class="tablelink">编辑</a> 
							<a href="${ contextpath }/memberactivity/view.htm?id=${item.id}"  class="tablelink">查看</a>
 				   </tr>
				</c:forEach>
			</tbody>
		</table>
		<page:page href="${ contextpath}/memberactivity/list?litter_title=${litter_title}&activity_status=${activity_status}&status=${status}&review_status=${review_status}&start_time=${start_time}&end_time=${end_time}" data="pageList" />
		
</div>
</body>
</html>

<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
		$(document).ready(function(){
			table_init("${ contextpath}/memberactivity","${ contextpath}/memberactivity/list?");
		});
</script>

 