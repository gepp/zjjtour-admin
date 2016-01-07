<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户</title>
<link href="${ contextpath }/res/css/style.css" rel="stylesheet" type="text/css" />
<link href="${ contextpath }/res/css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ contextpath }/res/js/jquery.js"></script>
<script type="text/javascript" src="${ contextpath }/res/js/layer/layer.js"></script>
<script type="text/javascript" src="${ contextpath }/res/js/common.js"></script>
<link rel="stylesheet" href="${ contextpath }/res/js/validator-0.7.3/jquery.validator.css">
	<script type="text/javascript" src="${ contextpath }/res/js/validator-0.7.3/jquery.validator.js"></script>
	<script type="text/javascript" src="${ contextpath }/res/js/validator-0.7.3/local/zh_CN.js"></script>
	<script type="text/javascript" src="${ contextpath }/res/js/select-ui.min.js"></script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a></li>
			<li><a href="#">用户</a></li>
		</ul>
	</div>
	<div class="formbody">
		<div id="usual1" class="usual">
			<div class="itab">
				<ul>
					<li><a href="#tab1" class="selected">用户添加</a></li>
				</ul>
			</div>
			<div id="tab1" class="tabson">
				<ul class="forminfo">
					<form action="" method="post" id="securityUserForm">
						<li><label>登陆用户名<b></b></label> <input type="text" class="dfinput" id="username" name="securityUser.username" placeholder="请输入登录名" /></li>
						<li><label>邮箱<b></b></label> <input type="text" class="dfinput" id="email" name="securityUser.email" placeholder="请输入邮箱" /></li>
						<li><label>密码<b></b></label> <input type="password" class="dfinput" id="userpwd" name="userpwd" placeholder="请输入密码" /></li>
						<li><label>手机<b></b></label> <input type="text" class="dfinput" id="phone" name="securityUser.phone" placeholder="请输入手机" /></li>
						<li><label>真实姓名<b></b></label> <input type="text" class="dfinput" id="realname" name="securityUser.realname" placeholder="请输入真实姓名" /></li>
						<li><label>状态<b></b></label>
							<div class="vocation">
								<select name="securityUser.status" class="select1">
									<option value="1">启用</option>
									<option value="0">停用</option>
								</select>
							</div></li> <input type="hidden" class="dfinput" id="parentId" name="organizationId" placeholder="" /> <input type="hidden" class="dfinput" id="roleIds" name="roleIds" placeholder="" />

						<li><label>所属组织<b></b></label> <input type="text" class="dfinput" id="parentName" name="parentName" placeholder="" readonly /> <input type="button" value="选择组织" onclick="selectParentOrganization();" class="btn" /></li>
						<li><label>拥有角色<b></b></label> <input type="text" class="dfinput" id="roleNames" name="roleNames" placeholder="" readonly /> <input type="button" value="选择角色" onclick="selectRole();" class="btn" /></li>
						<li><label>&nbsp;</label><input name="" type="submit" class="btn" value=" 确定" /> &nbsp;&nbsp; <input name="" type="button" class="btn" value="返回" onclick="window.location='${ contextpath}/securityuser/list'" /></li>
					</form>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	function selectParentOrganization() {
		parent.layer.open({
			type : 2,
			title : '选择上级组织【点击行选中】',
			area : [ '580px', '90%' ],

			content : '${contextpath}/securityorganization/select.htm'
		});
	}
	function selectRole() {
		parent.layer.open({
			type : 2,
			title : '选择角色',
			area : [ '580px', '90%' ],

			content : '${contextpath}/securityrole/select.htm?roleIds='
					+ $("#roleIds").val()
		});
	}
</script>


<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$(".select1").uedSelect({
							width : 345
						});
						$('#securityUserForm')
								.on(
										"click",
										".doSubmit",
										function(e) {
											var a = $(e.delegateTarget)
													.trigger("validate");
										})
								.validator(
										{
											fields : {
												'securityUser.username' : 'required;remote[${contextpath}/securityuser/check.htm]',
												'userpwd' : 'required',
												'securityUser.realname' : 'required;',
												'securityUser.organizationId' : 'required;',
												'securityUser.email':'email'
											},
											valid : function(form) {
												var me = this;
												// 提交表单之前，hold住表单，防止重复提交
												me.holdSubmit();
												$
														.ajax({
															url : "${ contextpath}/securityuser/addaction",
															data : $(form)
																	.serialize(),
															type : "post",
															success : function(
																	data) {
																// 提交表单成功后，释放hold，如果不释放hold，就变成了只能提交一次的表单
																me
																		.holdSubmit(false);
																if (data.status == 'success') {
																	parent.layer.alert(
																					'当前操作成功',
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
											}
										});

					});
</script>
