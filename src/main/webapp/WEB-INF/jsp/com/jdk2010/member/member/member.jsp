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
<title>会员</title>
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
			<li><a href="#">会员管理</a></li>
		</ul>
	</div>
	<div class="rightinfo">



		<form method="post" action="${ contextpath}/member/list"
			class="form-horizontal">
			<ul class="seachform" style="padding-top: 10px; padding-left: 15px">
				<li><label>会员名称</label><input type="text" name="nickname"
					id="nickname" class="scinput1" placeholder="请输入会员名称"
					value="${nickname}"></li>
				<li><label>邮箱</label><input type="text" name="email" id="email"
					class="scinput1" placeholder="请输入邮箱" value="${email}"></li>
				<li><label>手机</label><input type="text" name="mobile"
					id="mobile" class="scinput1" placeholder="请输入手机" value="${mobile}"></li>
				<li>
				<input name="" type="submit"
						id="table_refresh" class="scbtn" value="查询" />
					</li>

			</ul>
			<br/>
			<div class="tools">
					<ul class="toolbar">
						<li class="click" id="table_add"><span><img
								src="${ contextpath }/res/images/t01.png" /></span>添加</li>
						<li id="table_delete"><span><img
								src="${ contextpath }/res/images/t03.png" /></span>删除</li>
					</ul>
				</div>
		</form>
		<div class="formtitle1">
			<span>会员</span>
		</div>
		<table class="tablelist">
			<thead>
				<tr>
					<th><input type="checkbox" width="15px" id="checkAll" /></th>
					<th>会员名称</th>
					<th>邮箱</th>
					<th>手机</th>
					<th>真实姓名</th>
					<th>性别</th>
					<th>状态</th>
					<th>创建时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pageList.list}" var="item">

					<tr>
						<td><input type="checkbox" name="subBox" value="${item.id}" /></td>

						<td>${ item.nickname}</td>

						<td>${ item.email}</td>

						<td>${ item.mobile}</td>

						<td>${ item.realname}</td>

						<td>${ item.sex==1?'男':'女'}</td>

						<td>${ item.status=='1'?'启用':'停用'}</td>

						<td>${ item.ctime}</td>

						<td><a
							href="${ contextpath }/member/modify.htm?id=${item.id}"
							class="tablelink">编辑</a>&nbsp;&nbsp;<a
							href="javascript:void(0)"
							class="tablelink" onclick="resetPwd('${item.id}');">密码重置</a>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<page:page
			href="${ contextpath}/member/list?nickname=${nickname}&email=${email}&mobile=${mobile}"
			data="pageList" />

	</div>
</body>
</html>

<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
		$(document).ready(function(){
			table_init("${ contextpath}/member","${ contextpath}/member/list?");
		});
		function resetPwd(id){
			parent.layer.confirm('确定重置该用户密码?', {
				btn : [ '确定', '取消' ]
			}, function(index) {
				parent.layer.close(index);
				$.ajax({
						url : "${ contextpath}/member/resetPwd.htm?id="+id,
						type : "post",
						success : function(data) {
							
							// 提交表单成功后，释放hold，如果不释放hold，就变成了只能提交一次的表单
							if (data.status == 'success') {
								parent.layer.alert('重置密码成功！',
												{
	 												closeBtn : 0
												},
												function(index) {
													parent.layer.close(index);
													window.location.href = '${ contextpath}/member/list';
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

