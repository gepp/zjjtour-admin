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
<body style="min-width: 300px">
 
	<div class="rightinfo">
		 
	 
		<table class="tablelist">
			<thead>
				<tr>
					<th>会员名称</th>
					<th>真实姓名</th>
					<th>手机</th>
					<th>邮箱</th>
					<th>报名时间</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${userList}" var="item">
					<tr>
						<td>${ item.nickname}</td>
						<td>${ item.realname}</td>
						<td>${ item.mobile}</td>
						<td>${ item.email}</td>
						<td>${ item.ctime}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
</body>
</html>

