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
		 	<div class="formtitle1">
						<span>密码修改</span>
					</div>
			<div id="tab1" class="tabson">
				<ul class="forminfo">
					<form action="" method="post" id="securityUserForm">
						<input type="hidden"  name="securityUser.id"  value="${securityUser.id} "  />
						<li><label>登陆用户名<b></b></label>${securityUser.username}</li>
						<li><label>原密码<b></b></label> <input type="password" class="dfinput" id="userpwd" name="userpwd"  placeholder="请输入密码" value="" /></li>
						<li><label>新密码<b></b></label> <input type="password" class="dfinput" id="userpwd1" name="userpwd1"  placeholder="请输入密码" value="" /></li>
						<li><label>重复新密码<b></b></label> <input type="password" class="dfinput" id="userpwd2" name="userpwd2"  placeholder="请再输入一遍密码" value="" /></li>
						<li><label>&nbsp;</label><input name="" type="submit" class="btn" value=" 确定" /></li>
					</form>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>



<script type="text/javascript">
	 
	$(document)
			.ready(
					function() {
						$(".select1").uedSelect({
							width : 345
						});
						$('.tablelist tbody tr:odd').addClass('odd');
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
												'userpwd':'required;',
												'userpwd1' : '第一次密码: required',
												'userpwd2' : 'required;match(userpwd1)'
											},
											valid : function(form) {
												var me = this;
												// 提交表单之前，hold住表单，防止重复提交
												me.holdSubmit();
												$
														.ajax({
															url : "${ contextpath}/securityuser/modifyPwd.htm",
															data : $(form).serialize(),
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
																						window.location.href = '${contextpath}/defaultMain.htm';
																					});
																} else {
																	sAlert(data.message);
																	$("#userpwd").val('');
																	$("#userpwd1").val('');
																	$("#userpwd2").val('');
																}

															}
														});
											}
										});

					});
</script>
