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
<title>部门</title>
<link href="${ contextpath }/res/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="${ contextpath }/res/css/page.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="${ contextpath }/res/js/jquery.js"></script>
<script type="text/javascript" src="${ contextpath }/res/js/common.js"></script>


</head>
<body style="min-width:300px">

	 
	<div class="rightinfo">
		<div class="formtitle1">
			<span>部门</span>
		</div>
		<table class="tablelist">
			<thead>
				<tr>
					<th>机构名称</th>
					<th>编码</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${organizationList}" var="item">
					<tr onclick="jumpToParent('${item.id}','${item.name }')">
						<td>${ item.name}</td>
						<td>${ item.code}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		

	</div>
</body>
</html>

<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	$(document).ready(
			function() {
				table_init("${ contextpath}/securityorganization",
						"${ contextpath}/securityorganization/list?");
			});
	
	function jumpToParent(id,name){
 		$("#parentId",parent.window.rightFrame.document).val(id);
		$("#parentName",parent.window.rightFrame.document).val(trim(name));
		var index = parent.layer.getFrameIndex(window.name);
		parent.layer.close(index);
	}
</script>

