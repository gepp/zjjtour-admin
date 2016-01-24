<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新闻管理</title>
<link href="${ contextpath }/res/css/style.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="${ contextpath }/res/js/jquery.js"></script>
<script type="text/javascript"
	src="${ contextpath }/res/js/layer/layer.js"></script>
<script type="text/javascript" src="${ contextpath }/res/js/common.js"></script>
<link rel="stylesheet" href="${ contextpath }/res/js/validator-0.7.3/jquery.validator.css">
	<script type="text/javascript"
		src="${ contextpath }/res/js/validator-0.7.3/jquery.validator.js"></script>
	<script type="text/javascript"
		src="${ contextpath }/res/js/validator-0.7.3/local/zh_CN.js"></script>
	<link href="${ contextpath }/res/css/select.css" rel="stylesheet"
		type="text/css" />
	<script type="text/javascript"
		src="${ contextpath }/res/js/select-ui.min.js"></script>
<link rel="stylesheet" href="${ contextpath }/res/js/kindeditor-4.1.7/themes/default/default.css" />
<script src="${ contextpath }/res/js/kindeditor-4.1.7/kindeditor.js"></script>
<script src="${ contextpath }/res/js/kindeditor-4.1.7/lang/zh_CN.js"></script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a></li>
			<li><a href="#">视频管理</a></li>
					<li><a href="#">新增</a></li>
		</ul>
		
	</div>
	<div class="formbody">
		<div id="usual1" class="usual">
  
			<div id="tab1" class="tabson">
				<ul class="forminfo">
					<form action="" method="post" id="securityNewsForm">
					
					<input type="hidden" id="menuId" name="menuId" value="${menu.id }"/>
						<li><label>标题<b></b></label> <input type="text"
							class="dfinput" id="title" name="securityNews.title"
							placeholder="请输入标题" /></li>
						<li><label>简略标题<b></b></label> <input type="text"
							class="dfinput" id="litterTitle" name="securityNews.litterTitle"
							placeholder="" /></li>
						<li><label>缩略图<b></b></label> <input type="text"
							class="dfinput" id="smallimg" name="securityNews.smallimg"
							placeholder="" />
							<input type="button" id="smallimgBtn" value="图片上传" onclick="" class="btn"/>
							<img id="smallimgShow" height="30" width="30" style="vertical-align:middle;"   src="${contextpath }/res/images/d05.png"/>
							</li>
						<li><label>首页图<b></b></label> <input type="text"
							class="dfinput" id="indeximg" name="securityNews.indeximg"
							placeholder="" />
							<input type="button"   value="图片上传" id="indeximgBtn" class="btn"/>
							<img id="indeximgShow" height="30" width="30" style="vertical-align:middle;"    src="${contextpath }/res/images/d05.png"/>
							</li>
						<li><label>上传视频<b></b></label> <input type="text"
							class="dfinput" id="videoUrl" name="securityNews.videoUrl"
							placeholder="" />
							<input type="button"   value="视频上传" id="videoUrlBtn" class="btn"/>
 							</li>
						
						<li><label><b>&nbsp;</b></label>
						<input type="checkbox" name="indexStatus"/>是否首页显示 &nbsp;&nbsp;<input type="checkbox" name="topStatus"/>是否置顶
						</li>
						 
						<li><label>跳转URL<b></b></label> <input type="text"
							class="dfinput" id="url" name="securityNews.url"
							placeholder="" />
							<input type="checkbox" name="jumpType"/>页内跳转
							</li>
						<li><label>排序<b></b></label> <input type="text"
							class="dfinput" id="orderlist" name="securityNews.orderlist"
							placeholder="" value="1"/></li>
						<li><label>阅读权限<b></b></label>
						<div class="vocation">
								<select name="securityNews.readType" class="select1">
									<option value="1">会员</option>
									<option value="0" selected>全部</option>
								</select>
							</div>
						
						</li>
						<li><label>视频摘要<b></b></label> <input type="text"
							class="dfinput" id="abstractContent" name="securityNews.abstractContent"
							placeholder="" /></li>
						<li><label>内容详情<b></b></label> <textarea id="content"
								name="securityNews.content"
								style="width: 700px; height: 250px; visibility: hidden;"></textarea>
						</li>
 							
 						<li><label>调用代码<b></b></label> <textarea id="outJs"
								name="securityNews.outJs" class="dfinput"
								style="width: 700px; height: 250px;"></textarea>
							<input type="checkbox" name="outStatus"/>外部调用
						</li>
						<li><label>&nbsp;</label><input name="" type="submit"
							class="btn" value=" 确定" /> &nbsp;&nbsp; <input name=""
							type="button" class="btn" value="返回"
							onclick="window.location='${ contextpath}/securitynews/toViedoList'" /></li>
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
	KindEditor.ready(function(K) {
		var editor = K.editor({
			allowFileManager : true
		});
		K('#smallimgBtn').click(function() {
			editor.loadPlugin('image', function() {
				editor.plugin.imageDialog({
					showRemote : false,
					imageUrl : K('#smallimg').val(),
					clickFn : function(url, title, width, height, border, align) {
						K('#smallimg').val('<%=basePath %>'+url);
						document.getElementById("smallimgShow").src='<%=basePath %>'+url;
						editor.hideDialog();
					}
				});
			});
		});
		K('#indeximgBtn').click(function() {
			editor.loadPlugin('image', function() {
				editor.plugin.imageDialog({
					showRemote : false,
					imageUrl : K('#indeximg').val(),
					clickFn : function(url, title, width, height, border, align) {
						K('#indeximg').val('<%=basePath %>'+url);
						document.getElementById("indeximgShow").src='<%=basePath %>'+url;
						editor.hideDialog();
					}
				});
			});
		});
		K('#videoUrlBtn').click(function() {
			editor.loadPlugin('image', function() {
				editor.plugin.imageDialog({
					showRemote : false,
					imageUrl : K('#videoUr').val(),
					clickFn : function(url, title, width, height, border, align) {
						K('#indeximg').val('<%=basePath %>'+url);
						editor.hideDialog();
					}
				});
			});
		});
		
		K('#fileBtn').click(function() {
			
			editor.loadPlugin('image', function() {
				editor.plugin.imageDialog({
					showRemote : false,
					imageUrl : K('#indeximg').val(),
					clickFn : function(url, title, width, height, border, align) {
						K('#indeximg').val('<%=basePath %>'+url);
						document.getElementById("indeximgShow").src='<%=basePath %>'+url;
						editor.hideDialog();
					}
				});
			});
		});
		
		
	});
	
	
	
	$(document)
			.ready(
					function() {
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
												 
												$.ajax({
															url : "${ contextpath}/securitynews/addVideoaction",
															data : $(form)
																	.serialize(),
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
																						window.location.href = '${ contextpath}/securitynews/toViedoList.htm?id=${menu.id }';
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
