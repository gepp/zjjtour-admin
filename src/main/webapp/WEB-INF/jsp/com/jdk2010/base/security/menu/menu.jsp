<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>栏目管理</title>
<link href="${contextpath }/res/css/style.css" rel="stylesheet"
	type="text/css" />
	<link href="${contextpath }/res/css/page.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="${contextpath }/res/js/jquery.js"></script>
<script type="text/javascript" src="${contextpath }/res/js/common.js"></script>
<script type="text/javascript" src="${contextpath }/res/js/layer/layer.js"></script>

</head>
<body>

	<div class="place" style="">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a></li>
			<li><a href="#">栏目管理</a></li>
		</ul>
	</div>

	<div class="rightinfo">
		 
 		<div class="tools">
			<ul class="toolbar">
			<li class="click" id="table_add"><span><img src="${contextpath }/res/images/t01.png"></span>添加</li>
 			</ul>
		</div>
		<div class="formtitle1">
			<span>栏目管理</span>
		</div>
		<table class="tablelist">
			<thead>
				<tr>
 					<th>栏目名称</th>
 					<th>排序号</th>
					<th>栏目类型</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${menuList}" varStatus="idx">
					<tr>
 						<td>${item.name }</td>
 						<td>${item.orderlist }</td>
						<td>${item.column_type=='1'?'列表':(item.column_type=='2'?'详情':'无') }</td>
						<td>${item.status==0?'停用':'启用' }</td>
						<td>
						<c:if test="${item.id!='1010' }">
						<a href="#" class="tablelink" onclick="deleteMenu('${item.parent_id }','${item.id}')" >删除</a>
						</c:if>
						<c:if test="${item.type==1 }">
						<a href="${contextpath }/securitymenu/modify.htm?id=${item.id}"
							class="tablelink">编辑</a> 
					    </c:if>
						
						<c:if test="${item.column_type==1 }">
						<a href="${contextpath }/securitynews/list.htm?id=${item.id}"
							class="tablelink">管理</a> 
					    </c:if>
						<c:if test="${item.column_type==2 }">
						<a href="${contextpath }/securitynews/modifyDetail.htm?menuId=${item.id}"
							class="tablelink">管理</a> 
					    </c:if>		
					
							</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>

 
 
	</div>
	<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
		$(document).ready(function(){
			table_init("${contextpath}/securitymenu","${contextpath}/securitymenu/list?");
		});
		
		
		function deleteMenu(parentId, menuId) {
			var message="";
			if(parentId=='0'||parentId==''){
				message='您确认删除您所选择的栏目,子栏目也将删除？';
			}else{
				message='您确认删除您所选择的栏目？';
			}
			parent.layer.confirm(message, function(index) {
				jQuery.ajax({
					type: "post", 
					url: "${contextpath}/securitymenu/delete", 
					dataType: "json",
					data:{action:'delete',ids:menuId},
					success: function (data) { 
						parent.layer.close(index);
						if(data.status=='success'){
							parent.layer.alert('当前操作成功', {
								closeBtn: 0
							}, function(index){
								parent.layer.close(index);
								window.location.href='${contextpath}/securitymenu/list.htm';
							});
						}else{
							parent.layer.close(index);
							parent.layer.alert(data.message, {
								closeBtn: 0
							}, function(index){
								parent.layer.close(index);
								window.location.href='${contextpath}/securitymenu/list.htm';
							});
						}
						
						 
					} 
			});	
			});
		}
	</script>

</body>

</html>
