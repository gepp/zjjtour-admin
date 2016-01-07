<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>角色</title>
<link href="${ contextpath }/res/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="${ contextpath }/res/css/select.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="${ contextpath }/res/js/jquery.js"></script>
<script type="text/javascript"
	src="${ contextpath }/res/js/layer/layer.js"></script>
<script type="text/javascript" src="${ contextpath }/res/js/common.js"></script>
<link rel="stylesheet"
	href="${ contextpath }/res/js/validator-0.7.3/jquery.validator.css">
	<script type="text/javascript"
		src="${ contextpath }/res/js/validator-0.7.3/jquery.validator.js"></script>
	<script type="text/javascript"
		src="${ contextpath }/res/js/validator-0.7.3/local/zh_CN.js"></script>
	<script type="text/javascript"
		src="${ contextpath }/res/js/select-ui.min.js"></script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a></li>
			<li><a href="#">角色</a></li>
		</ul>
	</div>
	<div class="formbody">
		<div id="usual1" class="usual">
			<div class="itab">
				<ul>
					<li><a href="#tab1" class="selected">角色编辑</a></li>
				</ul>
			</div>
			<div id="tab1" class="tabson">
				<ul class="forminfo">
					<form action="" method="post" id="securityRoleForm">

						<input type="hidden" class="dfinput" id="id"
							name="securityRole.id" placeholder="请输入id"
							value="${ securityRole.id}" />
						<li><label>编码<b></b></label> <input type="text"
							class="dfinput" id="code" name="securityRole.code"
							placeholder="请输入编码" value="${ securityRole.code}" readonly/></li>
						<li><label>角色名称<b></b></label> <input type="text"
							class="dfinput" id="name" name="securityRole.name"
							placeholder="请输入角色名称" value="${ securityRole.name}" /></li>
						<li><label>角色描述<b></b></label> <input type="text"
							class="dfinput" id="description" name="securityRole.description"
							placeholder="请输入角色描述" value="${ securityRole.description}" /></li> <input
							type="hidden" class="dfinput" id="menuIds" name="menuIds"
							placeholder="" readonly value="${menuIds }" />
						<li><label>角色授权<b></b></label> <input type="text"
							class="dfinput" id="menuNames" name="menuNames" placeholder=""
							readonly value="${menuNames }" /> <input type="button"
							value="选择菜单" onclick="selectMenu();" class="btn" /></li>

						<li><label>状态<b></b></label>
							<div class="vocation">
								<select name="securityRole.status" class="select1">
									<option value="0"
										<c:if test="${ securityRole.status==0}">selected</c:if>>停用</option>
									<option value="1"
										<c:if test="${ securityRole.status==1}">selected</c:if>>启用</option>
								</select>
							</div></li>
						<li><label>&nbsp;</label><input name="" type="submit"
							class="btn" value=" 确定" /> &nbsp;&nbsp; <input name=""
							type="button" class="btn" value="返回"
							onclick="window.location='${ contextpath}/securityrole/list'" /></li>
					</form>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	function selectMenu() {
		parent.layer.open({
			type : 2,
			title : '角色授权',
			area : [ '580px', '90%' ],
			content : '${contextpath}/securitymenu/select.htm?menuIds='+$("#menuIds").val() //iframe的url
		});
	}
</script>


<script type="text/javascript">


	$(document).ready(function() {
		$(".select1").uedSelect({
			width : 345
		});
		$('#securityRoleForm').on("click", ".doSubmit", function(e) {
			var a = $(e.delegateTarget).trigger("validate");
		}).validator({
			fields : {
				'securityRole.name' : 'required;'
			},
			valid : function(form) {
				var me = this;
				// 提交表单之前，hold住表单，防止重复提交
				me.holdSubmit();
				$.ajax({
					url : "${ contextpath}/securityrole/modifyaction",
					data : $(form).serialize(),
					type : "POST",
					success : function(data) {
						// 提交表单成功后，释放hold，如果不释放hold，就变成了只能提交一次的表单
						me.holdSubmit(false);
						if (data.status == 'success') {
							parent.layer.alert('当前操作成功', {
								closeBtn: 0
							}, function(index){
								parent.layer.close(index);
								window.location.href='${ contextpath}/securityrole/list';
							});
						} else {
							sAlert('当前操作失败');
						}

					}
				});
			}
		});

	});
</script>
