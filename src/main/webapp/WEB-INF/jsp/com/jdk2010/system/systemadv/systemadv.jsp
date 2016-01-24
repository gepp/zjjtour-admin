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
<title>滚动图</title>
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
			<li><a href="#">滚动图</a></li>
		</ul>
	</div>
	<div class="rightinfo">



		<div class="tools">
			<ul class="toolbar">
				<li class="click" id="table_add"><span><img
						src="${ contextpath }/res/images/t01.png" /></span>添加</li>
				<li id="table_delete"><span><img
						src="${ contextpath }/res/images/t03.png" /></span>删除</li>
				<li id="table_refresh"><span><img
						src="${ contextpath }/res/images/t04.png" /></span>查询</li>
			</ul>
		</div>

		<div class="formtitle1">
			<span>滚动图</span>
		</div>
		<table class="tablelist">
			<thead>
				<tr>
					<th><input type="checkbox" width="15px" id="checkAll" /></th>

					<th>id</th>
					<th>标题</th>
					<th>跳转地址</th>
					<th>图片</th>
					<th>类型</th>
					<th>排序号</th>
					<th>是否启用</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pageList.list}" var="item">

					<tr>
						<td><input type="checkbox" name="subBox" value="${item.id}" /></td>
						<td>${ item.id}</td>

						<td>${ item.title}</td>

						<td>${ item.jumpUrl}</td>

						<td>${ item.imgUrl}</td>

						<td>${ item.type}</td>

						<td>${ item.orderlist}</td>

						<td>${ item.status}</td>

						<td><a
							href="${ contextpath }/systemadv/modify.htm?id=${item.id}"
							class="tablelink">编辑</a> <a
							href="${ contextpath }/systemadv/view.htm?id=${item.id}"
							class="tablelink">查看</a>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<page:page href="${ contextpath}/systemadv/list?" data="pageList" />

	</div>
</body>
</html>

<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
		$(document).ready(function(){
			table_init("${ contextpath}/systemadv","${ contextpath}/systemadv/list?");
		});
</script>

