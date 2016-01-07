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
<title>菜单选择</title>
<link href="${ contextpath }/res/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="${ contextpath }/res/css/page.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="${ contextpath }/res/js/jquery.js"></script>
<script type="text/javascript" src="${ contextpath }/res/js/common.js"></script>
<script type="text/javascript" src="${ contextpath }/res/js/layer/layer.js"></script>

</head>
<body style="min-width: 300px">


	<div class="rightinfo">
		<div class="formtitle1">
			<span>部门</span>
		</div>
		<table class="tablelist">
			<thead>
				<tr>
					<th><input type="checkbox" width="15px" id="checkAll" /></th>
					<th>菜单名称</th>
					<th>菜单编码</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${menuList}" var="item">
					<tr>
						<c:set var="itemPro" value=",${item.id }," />
						<td><input type="checkbox" name="subBox" value="${item.id}" <c:if test="${fn:contains(menuIds,itemPro)}">checked</c:if>
							menuName="${item.name }" /></td>
						<td>${ item.name}</td>
						<td>${ item.code}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br /> <br /> <br />
		<div style="position: fixed; left: 20%; bottom: 10px;">

			<input name="" type="submit" class="btn" value=" 确定"
				onclick="jumpToParent();" /> &nbsp;&nbsp; <input name=""
				type="button" class="btn" value="关闭" onclick="closeWindow();" />
		</div>
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

	function jumpToParent() {
		var ids = "";
		var count = 0;
		var checkbox = $("input[name='subBox']");
		var names = "";
		checkbox.each(function() {
			if (this.checked) {
				ids += this.value + ",";
				count = count + 1;
				names += $.trim($(this).attr("menuName"))+",";
			}
		});
		if (count == 0) {
			sAlert('请选择需要绑定的菜单！');
			return false;
		} else {
			if(ids.length>0){
				ids=","+ids;
			}
			if(names.length>0){
				names=names.substring(0,names.length-1);
			}
			$("#menuIds",parent.window.rightFrame.document).val(ids);
			$("#menuNames",parent.window.rightFrame.document).val(trim(names));
	 
		}
		closeWindow();
	}
	function closeWindow() {
		var index = parent.layer.getFrameIndex(window.name);
		parent.layer.close(index);
	}
</script>

