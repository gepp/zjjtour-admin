<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页设置</title>
<link href="${ contextpath }/res/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="${ contextpath }/res/css/page.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="${ contextpath }/res/js/jquery.js"></script>
<script type="text/javascript" src="${ contextpath }/res/js/common.js"></script>
<script type="text/javascript"
	src="${ contextpath }/res/js/layer/layer.js"></script>

</head>
<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a></li>
			<li><a href="#">首页设置</a></li>
		</ul>
	</div>
	<div class="rightinfo">

		<div class="formtitle1">
			<span>首页设置</span>
		</div>
			 <div class="tools">
			<ul class="toolbar">
				<li class="click" onclick="staticHtml();"><span><img
						src="${ contextpath }/res/images/t01.png" /></span>首页静态化</li>
				 
		 
			</ul>
		</div>
		<table class="tablelist">
			<thead>
				<tr>
					<th>网站名称</th>
					<th>首页样式</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${ indexsettingMap.title}</td>
					<td>${ indexsettingMap.style_type}</td>
					<td><a href="${ contextpath }/indexSettingModify.htm?id=${indexsettingMap.id}"
						class="tablelink">编辑</a></td>
				</tr>
			</tbody>
		</table>
		
		<br/>
		<div class="formtitle1">
			<span>首页滚动图设置</span>
		</div>
		
	 <div class="tools">
			<ul class="toolbar">
				<li class="click" onclick="add();"><span><img
						src="${ contextpath }/res/images/t01.png" /></span>添加</li>
				<li class="click" onclick="deleteImage();"><span><img
						src="${ contextpath }/res/images/t03.png" /></span>删除</li>
		 
			</ul>
		</div>

		<table class="tablelist">
			<thead>
				<tr>
					<th><input type="checkbox" width="15px" id="checkAll" /></th>
					<th>标题</th>
					<th>跳转地址</th>
					<th>图片缩略</th>
					<th>排序号</th>
					<th>是否启用</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pageList.list}" var="item">
					<tr>
						<td><input type="checkbox" name="subBox" value="${item.id}" /></td>
						<td>${ item.title}</td>
						<td>${ item.jumpUrl}</td>
						<td><img src="${ item.imgUrl}" height="30" width="30" onclick="seePicture('${item.id}')" alt="点击查看大图" /></td>
						<div id="${item.id}" style="display:none"><img src="${item.imgUrl}"></div>

						<td>${ item.orderlist}</td>
						<td>${ item.status==1?'启用':'停用'}</td>

						<td><a href="${ contextpath }/systemadv/modify.htm?id=${item.id}"
							class="tablelink">编辑</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>

<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	$(document).ready(function(){
		table_init("${ contextpath}/bq/listnews","${ contextpath}/bq/listnews?");
	});
	function add(){
		window.location.href="${contextpath}/systemadv/add";
	}
	
	function deleteImage(){
		var del_ids="" ;
		var count=0;
		var checkbox = $("input[name='subBox']");
		checkbox.each(function() {
			if (this.checked) {
				del_ids += this.value+",";
				count=count+1;
			}
		});
		if(count==0){
			sAlert('请选择要删除的数据！');
		}
		
		else{
			parent.layer.confirm('您确认删除您所选择的'+count+'条数据么？',function(index){
				//ajax提交删除数据
				jQuery.ajax({
							type: "post", 
							url:"${contextpath}/systemadv/delete.htm", 
							dataType: "json",
							data:{ids:del_ids},
							success: function (data) { 
								parent.layer.close(index);
								if(data.status=='success'){
									parent.layer.alert('当前操作成功', {
										closeBtn: 0
									}, function(index){
										parent.layer.close(index);
										window.location.href="${contextpath}/toIndexSetting";
									});
								}else{
									parent.layer.close(index);
									parent.layer.alert(data.message, {
										closeBtn: 0
									}, function(index){
										parent.layer.close(index);
										window.location.href="${contextpath}/toIndexSetting";
									});
								}
								
								 
							} 
					});
			});
		 
		}
	}
	
	function seePicture(id){
		layer.open({
		    type: 1,
		    title: false,
		    closeBtn: 0,
		    area: $('#'+id).width(),
		    skin: 'layui-layer-nobg', //没有背景色
		    shadeClose: true,
		    content: $('#'+id)
		});
	}
	function staticHtml(){
		parent.layer.confirm('您确认初始化首页？',function(index){
			//ajax提交删除数据
			jQuery.ajax({
						type: "post", 
						url:"${contextpath}/genIndex.htm", 
						dataType: "json",
						success: function (data) { 
							parent.layer.close(index);
							if(data.status=='success'){
								parent.layer.alert('首页初始化成功,请刷新首页', {
									closeBtn: 0
								}, function(index){
									parent.layer.close(index);
									window.location.href="${contextpath}/toIndexSetting";
								});
							}else{
								parent.layer.close(index);
								parent.layer.alert(data.message, {
									closeBtn: 0
								}, function(index){
									parent.layer.close(index);
									window.location.href="${contextpath}/toIndexSetting";
								});
							}
							
							 
						} 
				});
		});
	}
</script>

