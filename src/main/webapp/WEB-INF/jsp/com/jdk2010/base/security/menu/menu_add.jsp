<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>菜单</title>
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
		<link href="${ contextpath }/res/css/select.css" rel="stylesheet"
		type="text/css" />
	<script type="text/javascript"
		src="${ contextpath }/res/js/select-ui.min.js"></script>
<link rel="stylesheet" href="${ contextpath }/res/js/kindeditor-4.1.7/themes/default/default.css" />
<script src="${ contextpath }/res/js/kindeditor-4.1.7/kindeditor.js"></script>
<script src="${ contextpath }/res/js/kindeditor-4.1.7/lang/zh_CN.js"></script>
</head>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a></li>
			<li><a href="#">栏目管理</a></li>
		</ul>
	</div>
	<div class="formbody">
		<div id="usual1" class="usual">
			<div class="itab">
				<ul>
					<li><a href="#tab1" class="selected">栏目新增</a></li>
				</ul>
			</div>
			
			<div id="tab1" class="tabson">
				<ul class="forminfo">
					<form action="" method="post" id="securityMenuForm">
						<li><label>栏目名称<b></b></label> <input type="text"
							class="dfinput" id="name" name="securityMenu.name"
							placeholder="请输入栏目名称" value="${ securityMenu.name}" /></li>
						<li><label>缩略图<b></b></label> <input type="text"
							class="dfinput" id="smallimg" name="securityMenu.img"
							placeholder="" />
							<input type="button" id="smallimgBtn" value="图片上传" onclick="" class="btn"/>
							<img id="smallimgShow" height="30" width="30" style="vertical-align:middle;"   src="${contextpath }/res/images/d05.png"/>
							</li>
						<li><label>栏目描述<b></b></label> 
						<textarea cols="60" rows="20" name="securityMenu.description"
							id="description" style="padding: 1px;height:100px;line-height:16px" class="dfinput">
						${securityMenu.description }
						</textarea>
						</li>
				  
						<li><label>栏目上级<b></b></label>
							<div class="vocation">
								<select name="securityMenu.parentId" id="parentId" class="select1" onchange="getMenuCount()">
									<option value="0">无</option>
									<c:forEach var="item" items="${firstMenuList }">
										<option value="${item.id }">${item.name }</option>
									</c:forEach>
 								</select>
 							</div>
						</li>
						<li><label>栏目类型<b></b></label>
						<div class="vocation">
						<select name="securityMenu.columnType" class="select1">
									<option value="0">空</option>
									<option value="1">列表</option> 
									<option value="2">详情</option> 
 						</select>
						</div>
						</li>
						<li><label>页面类型<b></b></label>
						<div class="vocation">
						<select name="securityMenu.pageType" class="select1">
									<option value="0">模版</option>
									<option value="1">导航</option>
 						</select>
						</div>
						</li>	
						<li><label>排序号<b></b></label> <input type="text"
							class="dfinput" id="orderlist" name="securityMenu.orderlist"
							placeholder="请输入排序号" value="${ securityMenu.orderlist}" /></li>
						 <li><label>是否启用<b></b></label>
						<div class="vocation">
								<select name="securityMenu.status" class="select1">
									<option value="0" >停用</option>
									<option value="1" selected>启用</option>
								</select>
							</div>
						</li>
						<li><label>&nbsp;</label><input name="" type="submit"
							class="btn" value=" 确定" /> &nbsp;&nbsp; <input name=""
							type="button" class="btn" value="返回"
							onclick="window.location='${ contextpath}/securitymenu/list'" /></li>
					</form>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	$("#description").html("");
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
	});
</script>


<script type="text/javascript">
	function getMenuCount(){
		var parentId=$("#parentId").val();
		if(parentId!='0'){
		$.ajax({
			url : "${ contextpath}/securitymenu/getMenuCount.htm?parentId="+parentId,
			type : "get",
			success : function(data) {
				if (data.data.total>=8) {
						alert('二级栏目不允许超过8个,请重新选择！');	
						document.getElementById("parentId").value='0';
						 
						return false;
				} 

			}
		});
		}
	}

	$(document).ready(function() {
		  $(".select1").uedSelect({
				width : 345			  
			});
		$('#securityMenuForm').on("click", ".doSubmit", function(e) {
			var a = $(e.delegateTarget).trigger("validate");
		}).validator({
			fields : {
				'securityMenu.name' : 'required;',
				'securityMenu.orderlist':'required;integer[+0]; range[~20]'
				
			},
			valid : function(form) {
				var me = this;
				// 提交表单之前，hold住表单，防止重复提交
				me.holdSubmit();
				$.ajax({
					url : "${ contextpath}/securitymenu/addaction",
					data : $(form).serialize(),
					type : "POST",
					success : function(data) {
						// 提交表单成功后，释放hold，如果不释放hold，就变成了只能提交一次的表单
						me.holdSubmit(false);
						if (data.status == 'success') {
							parent.layer.alert('当前操作成功', {
								closeBtn: 0
							}, function(index){
								window.location.href='${ contextpath}/securitymenu/list';
								parent.layer.close(index);
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
