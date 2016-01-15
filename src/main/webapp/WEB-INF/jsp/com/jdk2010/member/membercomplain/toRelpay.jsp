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
<title></title>
<link href="${ contextpath }/res/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="${ contextpath }/res/css/page.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="${ contextpath }/res/js/jquery.js"></script>
<script type="text/javascript" src="${ contextpath }/res/js/common.js"></script>
<script type="text/javascript"
	src="${ contextpath }/res/js/layer/layer.js"></script>
<link href="${ contextpath }/res/css/select.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="${ contextpath }/res/js/select-ui.min.js"></script>

</head>
<body style="min-width: 300px">

	<table class="tableEdit">
	<tr>
		<td style="width:100px">回复内容</td>
		<td><textarea cols="60" rows="10" name="reviewReason"
				id="reviewReason" style="padding: 5px;width:90%">
				
				</textarea></td>
	
	</tr>
	</table>
	<br />
	<br />
	<li style="position:fixed;left:20%;bottom:10px""><label>&nbsp;</label><input name="" type="button" class="btn"
		value=" 确定" onclick="check();" /> &nbsp;&nbsp; <input name=""
		type="button" class="btn" value="关闭" onclick="closeAll();" /></li>
</body>
</html>
<script type="text/javascript">
	$("#reviewReason").val('');

	function closeAll() {
		parent.layer.closeAll();
	}
	function check(){
		var reviewReason=$("#reviewReason").val();
		$.ajax({
			url : "${ contextpath}/membercomplain/updateReplay.htm",
			data:{'ids':'${ids}','reason':reviewReason,'reviewStatus':'${type}'},
			type : "POST",
			success : function(data) {
				// 提交表单成功后，释放hold，如果不释放hold，就变成了只能提交一次的表单
				if (data.status == 'success') {
					parent.layer.alert('当前操作成功', {
						closeBtn: 0
					}, function(index){
						parent.rightFrame.location.href='${contextpath}/membercomplain/list.htm}';
						parent.layer.closeAll();
					});
					
					
				} else {
					sAlert('当前操作失败');
				}

			}
		});
		
		
		
	}
</script>

