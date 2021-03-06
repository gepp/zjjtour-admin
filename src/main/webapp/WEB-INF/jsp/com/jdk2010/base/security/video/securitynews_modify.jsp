<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>通知公告</title>
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
			<li><a href="#">${menu.name }</a></li>
			<li><a href="#">编辑</a></li>
		</ul>
	</div>
	<div class="formbody">
		<div id="usual1" class="usual">
			 
			<div id="tab1" class="tabson">
				<ul class="forminfo">
					<form action="" method="post" id="securityNewsForm">
 					<input  type="hidden" class="dfinput" id="id" name="securityNews.id" placeholder="请输入id" value="${ securityNews.id}" />
						<li><label>&nbsp;<b></b></label>
 						<input name=""
							type="button" class="btn" value="返回"
							onclick="window.location='${ contextpath}/securitynews/list.htm?id=${securityNews.menuId }&news_type=${news_type }'" />
 						
 						</li>
 						<%-- <li style="display:none">
 						<label>所属标签<b></b></label>
 						<div class="vocation">
 						<select  id="bq_id" name="bq_id" class="select1">
 						<c:forEach var="bq" items="${bqList }" >
 						
 							<option value="${bq.id }" <c:if test="${old_bq_id==bq.id }">selected</c:if>>${bq.name }</option>
 						</c:forEach>
 						
 						</select>
 						</div>
 						</li> --%>
						<li><label>标题<b></b></label> <input type="text"
							class="dfinput" id="title" name="securityNews.title"
							placeholder="请输入标题" value="${ securityNews.title}" /></li>
						<li><label>简略标题<b></b></label> <input type="text"
							class="dfinput" id="litterTitle" name="securityNews.litterTitle"
							placeholder="" value="${securityNews.litterTitle }" /></li>
						<li><label>缩略图<b></b></label> <input type="text"
							class="dfinput" id="smallimg" name="securityNews.smallimg"
							placeholder="" value="${securityNews.smallimg }"/>
							<input type="button" id="smallimgBtn" value="图片上传" onclick="" class="btn"/>
							<img id="smallimgShow" height="30" width="30" style="vertical-align:middle;"   src="${securityNews.smallimg }"/>
							</li>
						<li><label>首页图<b></b></label> <input type="text"
							class="dfinput" id="indeximg" name="securityNews.indeximg"
							placeholder="" value="${securityNews.indeximg }" />
							<input type="button"   value="图片上传" id="indeximgBtn" class="btn"/>
							<img id="indeximgShow" height="30" width="30" style="vertical-align:middle;"    src="${securityNews.indeximg }"/>
							</li>
						<li><label>上传视频<b></b></label> <input type="text"
							class="dfinput" id="videoUrl" name="securityNews.videoUrl"
							placeholder="" value="${securityNews.videoUrl }"/>
							<input type="button"   value="视频上传" id="videoUrlBtn" class="btn"/>
 							</li>
						<li><label><b>&nbsp;</b></label>
						<input type="checkbox" name="indexStatus"
						<c:if test="${securityNews.indexStatus==1 }">checked</c:if>
						/>是否首页显示 &nbsp;&nbsp;
						<input type="checkbox" name="topStatus"
						<c:if test="${securityNews.topStatus==1 }">checked</c:if>
						/>是否置顶
						</li>
						<li><label>跳转URL<b></b></label> <input type="text"
							class="dfinput" id="url" name="securityNews.url"
							placeholder="" value="${securityNews.url }" />
							<input type="checkbox" name="jumpType" <c:if test="${securityNews.jumpType==1 }">checked</c:if> />页内跳转
							</li>
						<li><label>排序<b></b></label> <input type="text"
							class="dfinput" id="orderlist" name="securityNews.orderlist"
							placeholder="" value="${securityNews.orderlist }"/></li>
						<li><label>阅读权限<b></b></label>
						<div class="vocation">
								<select name="securityNews.readType" class="select1">
									<option value="1" <c:if test="${securityNews.readType==1 }">selected</c:if>>会员</option>
									<option value="0" <c:if test="${securityNews.readType==0 }">selected</c:if>>全部</option>
								</select>
							</div>
						
						</li>
						<li><label>视频摘要<b></b></label> <input type="text"
							class="dfinput" id="abstractContent" name="securityNews.abstractContent"
							placeholder="" value="${securityNews.abstractContent }" /></li>
						<li><label>视频详情<b></b></label> 
						<textarea id="content"
								name="securityNews.content"
								style="width: 700px; height: 250px; visibility: hidden;">
								${securityNews.content }
								</textarea>
						
						</li>
						<li><label>调用代码<b></b></label> <textarea id="outJs"
								name="securityNews.outJs" class="dfinput"
								style="width: 700px; height: 250px;">${securityNews.outJs}</textarea>
							<input type="checkbox" name="outStatus" <c:if test="${securityNews.outStatus==1 }">checked</c:if>/>外部调用
						</li>
						<li><label>&nbsp;</label><input name="" type="submit"
							class="btn" value=" 确定" /> &nbsp;&nbsp; <input name=""
							type="button" class="btn" value="返回"
							onclick="window.location='${ contextpath}/securitynews/toViedoList.htm?bannerMenuId=${bannerMenuId }'" /></li>
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
						K('#smallimg').val(url);
						document.getElementById("smallimgShow").src=url;
						editor.hideDialog();
					}
				});
			});
		});
		K('#videoUrlBtn').click(function() {
			editor.loadPlugin('image', function() {
				editor.plugin.imageDialog({
					showRemote : false,
					imageUrl : K('#videoUrl').val(),
					clickFn : function(url, title, width, height, border, align) {
						K('#videoUrl').val(url);
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
						K('#indeximg').val(url);
						document.getElementById("indeximgShow").src=url;
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
						K('#indeximg').val(url);
						document.getElementById("indeximgShow").src=url;
						editor.hideDialog();
					}
				});
			});
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
															url : "${ contextpath}/securitynews/modifyVideoaction",
															data : $(form)
																	.serialize(),
															type : "post",
															success : function(
																	data) {
																// 提交表单成功后，释放hold，如果不释放hold，就变成了只能提交一次的表单
																me
																		.holdSubmit(false);
																if (data.status == 'success') {
																	alert('当前操作成功');
																	window.location.href = '${ contextpath}/securitynews/toViedoList.htm?id=${securityNews.menuId }&bannerMenuId=${bannerMenuId}';

																} else {
																	sAlert('当前操作失败');
																}

															}
														});
											}
										});

					});
</script>
