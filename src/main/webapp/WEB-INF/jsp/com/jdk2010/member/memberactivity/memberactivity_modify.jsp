<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>活动</title>
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
	<script language="javascript" type="text/javascript" src="${ contextpath }/res/js/My97DatePicker/WdatePicker.js"></script>
	
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
			<li><a href="#">活动</a></li>
		</ul>
	</div>
	<div class="formbody">
		<div id="usual1" class="usual">
			<div class="itab">
				<ul>
					<li><a href="#tab1" class="selected">活动编辑</a></li>
				</ul>
			</div>
			<div id="tab1" class="tabson">
				<ul class="forminfo">
					<form action="" method="post" id="memberActivityForm">

						<input type="hidden"
							class="dfinput" id="id" name="memberActivity.id"
							placeholder="请输入id" value="${ memberActivity.id}" />
						<li><label>活动标题<b></b></label> <input type="text"
							class="dfinput" id="title" name="memberActivity.title"
							placeholder="请输入活动标题" value="${ memberActivity.title}" /></li>
						<li><label>简略标题<b></b></label> <input type="text"
							class="dfinput" id="litterTitle"
							name="memberActivity.litterTitle" placeholder="请输入简略标题"
							value="${ memberActivity.litterTitle}" /></li>
						  
						<li><label>活动状态<b></b></label>
 						    <div class="vocation">
								<select name="memberActivity.activityStatus" class="select1">
									<option value="0" <c:if test="${memberActivity.activityStatus==0 }">selected</c:if>>未开始</option>
									<option value="1" <c:if test="${memberActivity.activityStatus==1 }">selected</c:if>>进行中</option>
									<option value="2" <c:if test="${memberActivity.activityStatus==2 }">selected</c:if>>已结束</option>
								</select>
							</div> 
						 
						 </li>
						<li><label>是否启用<b></b></label>
						  <div class="vocation">
								<select name="memberActivity.status" class="select1">
									<option value="1" <c:if test="${memberActivity.status==1 }">selected</c:if>>启用</option>
									<option value="0" <c:if test="${memberActivity.status==0 }">selected</c:if>>停用</option>
								</select>
							</div> 
						</li>
						<li><label>参与权限<b></b></label> 
						<div class="vocation">
								<select name="memberActivity.joinType" class="select1">
									<option value="1" <c:if test="${memberActivity.joinType==1 }">selected</c:if>>会员</option>
									<option value="0" <c:if test="${memberActivity.joinType==0 }">selected</c:if>>全部</option>
								</select>
							</div> 
						</li>
					 <li><label>缩略图<b></b></label> <input type="text"
							class="dfinput" id="smallimg" name="memberActivity.smallimg"
							placeholder="" value="${memberActivity.smallimg }"/>
							<input type="button" id="smallimgBtn" value="图片上传" onclick="" class="btn"/>
							<img id="smallimgShow" height="30" width="30" style="vertical-align:middle;"   src="${memberActivity.smallimg }"/>
							</li>
						<li><label>首页图<b></b></label> <input type="text"
							class="dfinput" id="indeximg" name="memberActivity.indeximg"
							placeholder="" value="${memberActivity.indeximg }" />
							<input type="button"   value="图片上传" id="indeximgBtn" class="btn"/>
							<img id="indeximgShow" height="30" width="30" style="vertical-align:middle;"    src="${memberActivity.indeximg }"/>
							</li>
						<li><label>跳转URL<b></b></label> <input type="text"
							class="dfinput" id="url" name="memberActivity.url"
							placeholder="" value="${memberActivity.url }" />
							<input type="checkbox" name="jumpType" <c:if test="${memberActivity.jumpType==1 }">checked</c:if> />页内跳转
							</li>
						<li><label>排序<b></b></label> <input type="text"
							class="dfinput" id="orderlist" name="memberActivity.orderlist"
							placeholder="请输入排序" value="${ memberActivity.orderlist}" /></li>
						<li><label>摘要<b></b></label>
						<textarea cols="60" rows="20" name="memberActivity.abstractContent"
							id="abstractContent" style="padding: 1px;height:100px;line-height:16px" class="dfinput">
							</textarea>
						
						</li>
						<li><label><b>&nbsp;</b></label>
						<input type="checkbox" name="indexStatus"
						<c:if test="${memberActivity.indexStatus==1 }">checked</c:if>
						/>是否首页显示 &nbsp;&nbsp;
						<input type="checkbox" name="topStatus"
						<c:if test="${memberActivity.topStatus==1 }">checked</c:if>
						/>是否置顶
						&nbsp;&nbsp;
						<input type="checkbox" name="supportStatus"
						<c:if test="${memberActivity.supportStatus==1 }">checked</c:if>
						/>是否支持报名
						</li>	
						 <fmt:formatDate value="${memberActivity.startTime}" var="startTime" pattern="yyyy-MM-dd" />
						  <fmt:formatDate value="${memberActivity.endTime}" var="endTime" pattern="yyyy-MM-dd" />
						<li><label>开始时间<b></b></label> <input type="text"
							class="dfinput" id="startTime" name="memberActivity.startTime"
							placeholder="请输入开始时间"  onfocus="WdatePicker({isShowWeek:true})" value="${startTime }"/></li>
						<li><label>截止时间<b></b></label>
						<input type="text"
							class="dfinput" id="endTime" name="memberActivity.endTime"
							placeholder="请输入截止时间" value="${endTime}"  onfocus="WdatePicker({isShowWeek:true})"/></li>
						<li><label>内容详情<b></b></label> 
						<textarea id="content"
								name="memberActivity.content"
								style="width: 700px; height: 250px; visibility: hidden;">
								${memberActivity.content}
								</textarea>
						
						</li>	
							
						<li><label>&nbsp;</label><input name="" type="submit"
							class="btn" value=" 确定" /> &nbsp;&nbsp; <input name=""
							type="button" class="btn" value="返回"
							onclick="window.location='${ contextpath}/memberactivity/list'" /></li>
					</form>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	$("#abstractContent").html("${memberActivity.abstractContent}");
	</script>


<script type="text/javascript">
var editor;
KindEditor.ready(function(K) {
	editor = K.create('textarea[name="memberActivity.content"]', {
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
 			$('#memberActivityForm').on("click", ".doSubmit", function(e){
 				var a=$(e.delegateTarget).trigger("validate");
 			})
 			.validator({
 			    fields: {
 			    	'memberActivity.title':'required;',
	    			'memberActivity.litterTitle':'required;',
	    			'memberActivity.startTime':'required;',
	    			'memberActivity.endTime':'required;'
 			    	     			    	 			        
 			    },
 			   valid: function(form){
 				  var me = this;
 			        // 提交表单之前，hold住表单，防止重复提交
 			        me.holdSubmit();
 			       document.getElementById("content").value=editor.html();
 			        $.ajax({
 			            url: "${ contextpath}/memberactivity/modifyaction",
 			            data: $(form).serialize(),
 			            type: "POST",
 			            success: function(data){
 			                // 提交表单成功后，释放hold，如果不释放hold，就变成了只能提交一次的表单
 			                me.holdSubmit(false);
 			                if(data.status=='success'){
 			                	parent.layer.alert('当前操作成功', {
								}, function(index){
									window.location.href='${ contextpath}/memberactivity/list';
									parent.layer.close(index);
								});
 			                }else{
 			                	sAlert('当前操作失败');
 			                }
 			               
 			            }
 			        });
 			    }
 			})
 			;
 		 
 		}		
 	);
 </script>
