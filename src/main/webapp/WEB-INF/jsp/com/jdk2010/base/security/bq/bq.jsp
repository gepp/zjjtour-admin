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
<title>标签管理</title>
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
			<li><a href="#">标签管理</a></li>
		</ul>
	</div>

	<div class="rightinfo">
		 
 		<div class="tools">
			<ul class="toolbar">
			<li class="click" onclick="add();" ><span><img src="${contextpath }/res/images/t01.png"></span>添加</li>
	        <li onclick="deleteBq();" ><span><img src="${contextpath }/res/images/t03.png"></span>删除</li>
			</ul>
		</div>
		<div class="formtitle1">
			<span>标签管理</span>
		</div>
		<table class="tablelist">
			<thead>
				<tr>
					<th><input name="" type="checkbox" value="" id="checkAll" /></th>
					<th>所属栏目</th>
					<th>标签名称</th>
 					<th>排序号</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${finalList}" varStatus="idx">
					<tr>
						
						<c:if test="${item.type=='1' }">
						 
						<td><input type="checkbox" name="subBox" value="${item.id}" /></td>
						<td style="width:100px">${item.lanmuName }</td>
						<td></td>
 						<td></td>
						<td></td>
						<td></td>
						</c:if>
						<c:if test="${item.type=='0' }">
						<td><input type="checkbox" name="subBox" value="${item.id}" /></td>
						<td>${item.menuName }</td>
						<td>${item.name }</td>
 						<td>${item.orderlist }</td>
						<td>${item.status==0?'停用':'启用' }</td>
						<td>
						 <a href="${contextpath }/bq/bqmodify.htm?id=${item.id}"
							class="tablelink">编辑</a> 
							&nbsp;&nbsp;
						<a href="${contextpath }/bq/listnews.htm?menuId=${item.id}&banner_id=${item.bannerId}"
							class="tablelink">新闻管理</a> 
					
							</td>
						</c:if>
						
					</tr>
				</c:forEach>

			</tbody>
		</table>

 
 
	</div>
	<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
		table_init("${ contextpath}/securitynews","${ contextpath}/securitynews/list?");
		function add(){
 			window.location.href="${contextpath}/bq/bqadd.htm";
		}
		function deleteBq(){
			var del_ids="" ;
			var count=0;
			var checkbox = $("input[name='subBox']");
			checkbox.each(function() {
				if (this.checked) {
					del_ids += this.value+",";
					count=count+1;
				}
			});
			if(count==0){
				sAlert('请选择要删除的数据！');
			}
			
			else{
				parent.layer.confirm('您确认删除您所选择的'+count+'条数据么？',function(index){
					//ajax提交删除数据
					jQuery.ajax({
								type: "post", 
								url:"${contextpath}/bq/bqdelete", 
								dataType: "json",
								data:{action:'delete',ids:del_ids},
								success: function (data) { 
									parent.layer.close(index);
									if(data.status=='success'){
										parent.layer.alert('当前操作成功', {
											closeBtn: 0
										}, function(index){
											parent.layer.close(index);
											window.location.href="${contextpath}/bq/listBq.htm";
										});
									}else{
										parent.layer.close(index);
										parent.layer.alert(data.message, {
											closeBtn: 0
										}, function(index){
											parent.layer.close(index);
											window.location.href="${contextpath}/securitymenu/listBq.htm";
										});
									}
									
									 
								} 
						});
				});
			 
			}
		}
 
		
		
		
	</script>

</body>

</html>
