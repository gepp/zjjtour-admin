<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>诚信信息修改</title>
<link href="${ contextpath }/res/css/style.css" rel="stylesheet"
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
	<link href="${ contextpath }/res/css/select.css" rel="stylesheet"
		type="text/css" />
	<script type="text/javascript"
		src="${ contextpath }/res/js/select-ui.min.js"></script>
	<link rel="stylesheet"
		href="${ contextpath }/res/js/kindeditor-4.1.7/themes/default/default.css" />
	<script src="${ contextpath }/res/js/kindeditor-4.1.7/kindeditor.js"></script>
	<script src="${ contextpath }/res/js/kindeditor-4.1.7/lang/zh_CN.js"></script>
	<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a></li>
			<li><a href="#">诚信内容修改</a></li>
			<li><a href="#">编辑</a></li>
		</ul>
	</div>
	<div class="formbody">
		<div id="usual1" class="usual">
			 
			<div id="tab1" class="tabson">
				<ul class="forminfo">
					<form action="" method="post" id="securityNewsForm">
 					<input  type="hidden" class="dfinput" id="id" name="securityNews.id" placeholder="请输入id" value="${ securityNews.id}" />
						<li><label>标题<b></b></label> <input type="text"
							class="dfinput" id="title" name="securityNews.title"
							placeholder="请输入标题" value="${ securityNews.title}" /></li>
						 
						 
						 
						<li><label>内容详情<b></b></label> 
						<textarea id="content"
								name="securityNews.content"
								style="width: 700px; height: 250px; visibility: hidden;">
								${securityNews.content }
								</textarea>
						
						</li>
						 
						
						 
						
						<li><label>&nbsp;</label><input name="" type="submit"
							class="btn" value=" 确定" /> &nbsp;&nbsp;</li>
					</form>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
</script>


<script type="text/javascript">
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="securityNews.content"]', {
			allowFileManager : true
		});
	});
	 
	
 	$(document).ready(
 		function(){
 		  $(".select1").uedSelect({
				width : 345			  
			});
 			
	$('#securityNewsForm')
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
												'securityNews.title' : 'required;'
											},
											valid : function(form) {
												 
												var me = this;
												// 提交表单之前，hold住表单，防止重复提交
												document.getElementById("content").value=editor.html();
												$
														.ajax({
															url : "${ contextpath}/securitynews/chengxinmodifyaction",
															data : $(form).serialize(),
															type : "post",
															success : function(
																	data) {
																// 提交表单成功后，释放hold，如果不释放hold，就变成了只能提交一次的表单
																me
																		.holdSubmit(false);
																if (data.status == 'success') {
																	parent.layer
																			.alert(
																					'当前操作成功',
																					{
																						closeBtn : 0
																					},
																					function(index) {
																						parent.layer.close(index);
																						window.location.href = '${ contextpath}/securitynews/toChengxin.htm';
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
