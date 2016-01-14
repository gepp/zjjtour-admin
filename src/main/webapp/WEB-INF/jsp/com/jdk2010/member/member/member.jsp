<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员</title>
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
			<li><a href="#">会员</a></li>
		</ul>
</div>
<div class="rightinfo">
		
					
							 			 				 					 					 				 			 				 					 					 				 			 				 					 					 				 			 				 			 				 			 				 			 				 			 			
							<form method="post" action="${ contextpath}/member/list" class="form-horizontal">
				<ul class="seachform1" style="padding-top: 45px">
																												<li><label>会员名称</label><input type="text" name="nickname"  id="nickname" class="scinput1" placeholder="请输入会员名称" value="${nickname}"></li>
																						<li><label>邮箱</label><input type="text" name="email"  id="email" class="scinput1" placeholder="请输入邮箱" value="${email}"></li>
																						<li><label>手机</label><input type="text" name="mobile"  id="mobile" class="scinput1" placeholder="请输入手机" value="${mobile}"></li>
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
			<span>会员</span>
		</div>
		<table class="tablelist">
		<thead>
				<tr>
				<th><input type="checkbox" width="15px"  id="checkAll"/></th>
				
														   <th>id</th>
																			   <th>会员名称</th>
																			   <th>邮箱</th>
																			   <th>手机</th>
																			   <th>真实姓名</th>
																			   <th>性别</th>
																			   <th>启用标志</th>
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
															${ item.nickname}
													</td>	

						 												 						<td>
															${ item.email}
													</td>	

						 												 						<td>
															${ item.mobile}
													</td>	

						 												 						<td>
															${ item.realname}
													</td>	

						 												 						<td>
															${ item.sex}
													</td>	

						 												 						<td>
															${ item.status}
													</td>	

						 												 						<td>
															${ item.ctime}
													</td>	

						 													<td>
							<a href="${ contextpath }/member/modify.htm?id=${item.id}" class="tablelink">编辑</a> 
							<a href="${ contextpath }/member/view.htm?id=${item.id}"  class="tablelink">查看</a>
 				   </tr>
				</c:forEach>
			</tbody>
		</table>
		<page:page href="${ contextpath}/member/list?nickname=${nickname}&email=${email}&mobile=${mobile}" data="pageList" />
		
</div>
</body>
</html>

<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
		$(document).ready(function(){
			table_init("${ contextpath}/member","${ contextpath}/member/list?");
		});
</script>

 