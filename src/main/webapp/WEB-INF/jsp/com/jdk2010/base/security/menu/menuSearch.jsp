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
<title>搜索设置</title>
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
			<li><a href="#">搜索设置</a></li>
		</ul>
	</div>

	<div class="rightinfo">
		 
 		 
		<div class="formtitle1">
			<span>搜索设置</span>
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
							<c:if test="${item.can_search!=1 }">
								<a class="tablelink" href="javascript:void(0)" onclick="updateStatus('${item.id}','1')">不支持</a>
							</c:if>
							
							<c:if test="${item.can_search==1 }">
								<a class="tablelink" href="javascript:void(0)" onclick="updateStatus('${item.id}','0')">支持</a>
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
		
		function updateStatus(id,type){
			jQuery.ajax({
				type: "post", 
				url: "${contextpath}/securitymenu/updateSearch", 
				dataType: "json",
				data:{'id':id,'canSearch':type},
				success: function (data) { 
 					if(data.status=='success'){
						parent.layer.alert('设置成功', {
							closeBtn: 0
						}, function(index){
							parent.layer.close(index);
							window.location.href='${contextpath}/securitymenu/listSearch.htm';
						});
					}else{
						parent.layer.close(index);
						parent.layer.alert(data.message, {
							closeBtn: 0
						}, function(index){
							parent.layer.close(index);
							window.location.href='${contextpath}/securitymenu/listSearch.htm';
						});
					}
					
					 
				} 
		});	
		}
	</script>

</body>

</html>
