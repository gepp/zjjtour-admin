<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>部门</title>
<link href="${ contextpath }/res/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ contextpath }/res/js/jquery.js"></script>
<script type="text/javascript" src="${ contextpath }/res/js/layer/layer.js"></script>
<script type="text/javascript" src="${ contextpath }/res/js/common.js"></script>
<link rel="stylesheet" href="${ contextpath }/res/js/validator-0.7.3/jquery.validator.css">
	<script type="text/javascript" src="${ contextpath }/res/js/validator-0.7.3/jquery.validator.js"></script>
	<script type="text/javascript" src="${ contextpath }/res/js/validator-0.7.3/local/zh_CN.js"></script>
	<link href="${ contextpath }/res/css/select.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${ contextpath }/res/js/select-ui.min.js"></script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a></li>
			<li><a href="#">部门</a></li>
		</ul>
	</div>
	<div class="formbody">
		<div id="usual1" class="usual">
			<div class="itab">
				<ul>
					<li><a href="#tab1" class="selected">部门编辑</a></li>
				</ul>
			</div>
			<div id="tab1" class="tabson">
				<ul class="forminfo">
					<form action="" method="post" id="securityOrganizationForm">
					 <input type="hidden" class="dfinput" id="id" name="securityOrganization.id" placeholder="请输入pk" value="${ securityOrganization.id}" />
						<li><label>编码<b></b></label> <input type="text" class="dfinput" id="code" name="securityOrganization.code" placeholder="请输入编码" value="${ securityOrganization.code}" /></li>
						<li><label>机构名称<b></b></label> <input type="text" class="dfinput" id="name" name="securityOrganization.name" placeholder="请输入机构名称" value="${ securityOrganization.name}" /></li>
						<li><label>描述<b></b></label> <input type="text" class="dfinput" id="description" name="securityOrganization.description" placeholder="请输入描述" value="${ securityOrganization.description}" /></li>
						<li><label>上级机构编码<b></b></label> <input type="hidden" class="dfinput" id="parentId" name="securityOrganization.parentId" placeholder="" value="${ securityOrganization.parentId}" "  /> <input type="text" class="dfinput" id="parentName" name="parentName" placeholder="" readonly
							value="${parentName }" onclick="selectParentOrganization();" /> <input type="button" value="选择上级" onclick="selectParentOrganization();" class="btn" /></li>
						<li><label>状态<b></b></label> 
						<div class="vocation">
						<select name="securityOrganization.status" class="select1">
								<option value="0" <c:if test="${ securityOrganization.status==0}">selected</c:if>>停用</option>
								<option value="1" <c:if test="${ securityOrganization.status==1}">selected</c:if>>启用</option>
						</select>
						</div>
						</li>
						<li><label>&nbsp;</label><input name="" type="submit" class="btn" value=" 确定" /> &nbsp;&nbsp; <input name="" type="button" class="btn" value="返回" onclick="window.location='${ contextpath}/securityorganization/list'" /></li>
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
function selectParentOrganization(){
	parent.layer.open({
	    type: 2,
	    title: '选择上级组织【点击行选中】',
	    area: ['580px', '90%'],
	    
	    content: '${contextpath}/securityorganization/select.htm' //iframe的url
	}); 
}
	$(document).ready(function() {
		$(".select1").uedSelect({
			width : 345
		});
		$('#securityOrganizationForm').on("click", ".doSubmit", function(e) {
			var a = $(e.delegateTarget).trigger("validate");
		}).validator({
			fields : {
				'securityOrganization.name' : 'required;'
			},
			valid : function(form) {
				var me = this;
				// 提交表单之前，hold住表单，防止重复提交
				me.holdSubmit();
				$.ajax({
					url : "${ contextpath}/securityorganization/modifyaction",
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
								window.location.href='${ contextpath}/securityorganization/list';
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
