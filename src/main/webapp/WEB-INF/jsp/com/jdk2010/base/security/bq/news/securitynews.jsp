<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>路线管理</title>
<link href="${ contextpath }/res/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="${ contextpath }/res/css/page.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="${ contextpath }/res/js/jquery.js"></script>
<script type="text/javascript" src="${ contextpath }/res/js/common.js"></script>
<script type="text/javascript"
	src="${ contextpath }/res/js/layer/layer.js"></script>
<link href="${ contextpath }/res/css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ contextpath }/res/js/select-ui.min.js"></script>

</head>
<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a></li>
 			<li><a href="#">标签管理</a></li>
		</ul>
	</div>
	<div class="rightinfo">
	<form method="post" action="${ contextpath}/bq/listnews.htm">
		<input type="hidden" value="${menu.id }" name="menuId"/>
			<ul class="seachform" style="padding-top: 10px; padding-left: 15px">
			<li><label>标题</label><input type="text" name="title"
					id="title" class="scinput1" placeholder="" value="${title}" style="width:300px"></li>
						<li><label>是否审核</label>
						<div class="vocation">
						 <select class="select1" name="reviewStatus">
						 <option value="0" <c:if test="${reviewStatus=='0'}">selected</c:if>>全部</option>
						 <option value="1" <c:if test="${reviewStatus=='1'}">selected</c:if>>通过</option>
						 <option value="2" <c:if test="${reviewStatus=='2'}">selected</c:if>>驳回</option>
						 </select>
						 </div>
						 </li>
						 
					<li>
					<input name="" type="submit"
						id="table_refresh" class="scbtn" value="查询" />
					</li>
					
		
			</ul>
		 
	</form>
		<br/>
		 <div class="tools">
			<ul class="toolbar">
			<li class="click" onclick="add();" ><span><img src="${contextpath }/res/images/t01.png"></span>添加线路</li>
	        <li onclick="deleteNews();" ><span><img src="${contextpath }/res/images/t03.png"></span>删除线路</li>
 			</ul>
		</div>
		<div class="formtitle1">
			<span>已选线路</span>
		</div>
		<table class="tablelist">
			<thead>
				<tr>
					<th><input type="checkbox" width="15px" id="checkAll" /></th>
					<th>标题</th>
					<th>发布人</th>
					<th>发布时间</th>
					<th>是否审核</th>
					<th>审核人</th>
					<th>审核时间</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pageList.list}" var="item">

					<tr>
						<td><input type="checkbox" name="subBox" value="${item.id}" /></td>
						<td>${ item.title}</td>
						<td>${ item.realname}</td>
						<td>${ item.ctime}</td>
						<td>${ item.reviewStatus=='0'?'未处理':(item.reviewStatus=='1'?'通过':'失败')}</td>
						<td>${ item.reviewUserid}</td>
						<td>${ item.reviewTime}</td>
					 
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<page:page href="${contextpath}/securitynews/list.htm?title=${title}&menuId=${menu.id }"
			data="pageList" />

	</div>
</body>
</html>
 <script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
		$(document).ready(function(){
			$(".select1").uedSelect({
				width : 100			  
			});
			table_init("${ contextpath}/bq/listnews","${ contextpath}/bq/listnews?");
		});
		function goback(){
			window.location.href="${contextpath}/bq/listBq.htm";
		}
		function add(){
			layer.open({
				type : 2,
				title : '线路选择',
				shadeClose : true,
				area : [ '90%', '80%' ],
				content : '${contextpath}/bq/bqselect.htm?bgId=${menu.id }' //iframe的url
			});
		}
		function deleteNews(){
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
								url:"${contextpath}/bq/bqNewsdelete.htm?id=${menu.id }", 
								dataType: "json",
								data:{ids:del_ids},
								success: function (data) { 
									parent.layer.close(index);
									if(data.status=='success'){
										parent.layer.alert('当前操作成功', {
											closeBtn: 0
										}, function(index){
											parent.layer.close(index);
											window.location.href="${contextpath}/bq/listnews.htm?menuId=${menu.id}";
										});
									}else{
										parent.layer.close(index);
										parent.layer.alert(data.message, {
											closeBtn: 0
										}, function(index){
											parent.layer.close(index);
											window.location.href="${contextpath}/bq/listnews.htm?menuId=${menu.id}";
										});
									}
									
									 
								} 
						});
				});
			 
			}
		}
		
</script>

