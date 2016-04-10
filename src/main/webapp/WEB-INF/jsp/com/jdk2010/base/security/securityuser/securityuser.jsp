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
<title>用户</title>
<link href="${ contextpath }/res/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="${ contextpath }/res/css/page.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="${ contextpath }/res/js/jquery.js"></script>
<script type="text/javascript" src="${ contextpath }/res/js/common.js"></script>
<script type="text/javascript"
	src="${ contextpath }/res/js/layer/layer.js"></script>

</head>
<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a></li>
			<li><a href="#">用户</a></li>
		</ul>
	</div>
	<div class="rightinfo">



		<div class="tools">
			<ul class="toolbar">
			<li class="click" id="table_add"><span><img src="${contextpath }/res/images/t01.png" /></span>添加</li>
	        <li id="table_delete" ><span><img src="${contextpath }/res/images/t03.png" /></span>删除</li>
 			</ul>
		</div>
		<div class="formtitle1">
			<span>用户</span>
		</div>
		<table class="tablelist">
			<thead>
				<tr>
					<th><input type="checkbox" width="15px" id="checkAll" /></th>
					<th>登录名</th>
					<th>邮箱</th>
					<th>手机</th>
					<th>真实姓名</th>
					<th>状态</th>
					<th>创建时间</th>
					<th>组织</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pageList.list}" var="item">

					<tr>
						<td><input type="checkbox" name="subBox" value="${item.id}" /></td>

						<td>${ item.username}</td>

						<td>${ item.email}</td>

						<td>${ item.phone}</td>

						<td>${ item.realname}</td>

						<td>${ item.status=='1'?'启用':'停用'}</td>

						<td>${ item.ctime}</td>

						<td>${ item.organizationName}</td>

						<td><a
							href="${ contextpath }/securityuser/modify.htm?id=${item.id}"
							class="tablelink">编辑</a> <a
							href="${ contextpath }/securityuser/view.htm?id=${item.id}"
							class="tablelink">查看</a>
							<a
							href="javascript:void(0)"
							class="tablelink" onclick="resetPwd('${item.id}');">密码重置</a>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<page:page href="${ contextpath}/securityuser/list?" data="pageList" />

	</div>
</body>
</html>

<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	$(document).ready(
			function() {
				table_init("${ contextpath}/securityuser",
						"${ contextpath}/securityuser/list?");
			});
	function resetPwd(id){
		parent.layer.confirm('确定重置该用户密码?', {
			btn : [ '确定', '取消' ]
		}, function(index) {
			parent.layer.close(index);
			$.ajax({
					url : "${ contextpath}/securityuser/resetPwd.htm?id="+id,
					type : "post",
					success : function(data) {
						
						// 提交表单成功后，释放hold，如果不释放hold，就变成了只能提交一次的表单
						if (data.status == 'success') {
							parent.layer.alert('重置密码成功，密码已重置为111111，请牢记!',
											{
 												closeBtn : 0
											},
											function(index) {
												parent.layer.close(index);
												window.location.href = '${ contextpath}/securityuser/list';
											});
						} else {
							sAlert('当前操作失败');
						}

					}
				});
		}, function() {

		});
	}
</script>

