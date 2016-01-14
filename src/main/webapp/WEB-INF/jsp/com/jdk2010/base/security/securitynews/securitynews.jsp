<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>通知公告</title>
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
			<li><a href="#">通知公告</a></li>
		</ul>
</div>
<div class="rightinfo">
		
					
							 			 				 					 					 				 			 				 			 				 			 				 			 				 			 			
							<form method="post" action="${ contextpath}/securitynews/list" class="form-horizontal">
				<ul class="seachform1" style="padding-top: 45px">
																												<li><label>通告标题</label><input type="text" name="title"  id="title" class="scinput1" placeholder="请输入通告标题" value="${title}"></li>
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
			<span>通知公告</span>
		</div>
		<table class="tablelist">
		<thead>
				<tr>
				<th><input type="checkbox" width="15px"  id="checkAll"/></th>
				
														   <th>id</th>
																			   <th>通告标题</th>
																			   <th>通告内容</th>
																			   <th>用户id</th>
																			   <th>是否启用</th>
																			   <th>创建时间</th>
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
															${ item.content}
													</td>	

						 												 						<td>
															${ item.userid}
													</td>	

						 												 						<td>
															${ item.status}
													</td>	

						 												 						<td>
															${ item.ctime}
													</td>	

						 													<td>
							<a href="${ contextpath }/securitynews/modify.htm?id=${item.id}" class="tablelink">编辑</a> 
							<a href="${ contextpath }/securitynews/view.htm?id=${item.id}"  class="tablelink">查看</a>
 				   </tr>
				</c:forEach>
			</tbody>
		</table>
		<page:page href="${ contextpath}/securitynews/list?title=${title}" data="pageList" />
		
</div>
</body>
</html>

<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
		$(document).ready(function(){
			table_init("${ contextpath}/securitynews","${ contextpath}/securitynews/list?");
		});
</script>

 