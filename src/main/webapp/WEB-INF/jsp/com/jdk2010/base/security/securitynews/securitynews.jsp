<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新闻管理</title>
<link href="${ contextpath }/res/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="${ contextpath }/res/css/page.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="${ contextpath }/res/js/jquery.js"></script>
<script type="text/javascript" src="${ contextpath }/res/js/common.js"></script>
 
<link href="${ contextpath }/res/css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ contextpath }/res/js/select-ui.min.js"></script>

</head>
<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a></li>
			<li><a href="#">${menu.name }</a></li>
			<c:if test="${news_type=='ZYHD' }"><li><a href="#">重要活动</a></li></c:if>
			<c:if test="${news_type=='ZYJH' }"><li><a href="#">重要讲话</a></li></c:if>
			<c:if test="${news_type=='MTBD' }"><li><a href="#">媒体报道</a></li></c:if>
		</ul>
	</div>
	<div class="rightinfo">
	<form method="post" action="${ contextpath}/securitynews/list.htm">
		<input type="hidden" value="${menu.id }" name="id"/>
			<ul class="seachform" style="padding-top: 10px; padding-left: 15px">
				<li><label>标题</label><input type="text" name="title" id="title"
					class="scinput1" placeholder="" value="${title}"
					style="width: 300px"></li>
				<li><label>是否审核</label>
					<div class="vocation">
						<select class="select1" name="reviewStatus">
							<option value="0"
								<c:if test="${reviewStatus=='0'}">selected</c:if>>全部</option>
							<option value="1"
								<c:if test="${reviewStatus=='1'}">selected</c:if>>通过</option>
							<option value="2"
								<c:if test="${reviewStatus=='2'}">selected</c:if>>驳回</option>
						</select>
					</div></li>
				<li><label>所属标签<b></b></label>
					<div class="vocation">
						<select id="bq_id" name="bq_id" class="select1">
							<option value="">全部</option>
							<c:forEach var="bq" items="${bqList }">
								
								<option value="${bq.id }"
									<c:if test="${bq_id==bq.id }">selected</c:if>>${bq.name }</option>
							</c:forEach>

						</select>
					</div></li>

				<li>
					<input name="" type="submit"
						id="table_refresh" class="scbtn" value="查询" />
					</li>
					
		
			</ul>
		 
	</form>
		<br/>
		 
		 <div class="tools">
			<ul class="toolbar">
			<c:if test="${fabuFlag=='1' }">
			<li class="click" onclick="add();" ><span><img src="${contextpath }/res/images/t01.png"></span>添加</li>
	        <li onclick="deleteNews();" ><span><img src="${contextpath }/res/images/t03.png"></span>删除</li>
	        </c:if>
	        <c:if test="${shenheFlag=='1' }">
	        <li class="click" onclick="accept();" ><span><img src="${contextpath }/res/images/t02.png"></span>批量审核</li>
	        <li onclick="rollback();" ><span><img src="${contextpath }/res/images/t04.png"></span>驳回</li>
	        </c:if>
	        <li class="click" onclick="saveOrderlist();" ><span><img src="${contextpath }/res/images/t01.png"></span>保存排序</li>
 			</ul>
		</div>
		<div class="formtitle1">
			<span>${menu.name }</span>
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
					<th>排序号</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pageList.list}" var="item">

					<tr>
						<td>
						<c:if test="${item.reviewStatus==1 }">
						<span class="cboxDisable"></span>
						</c:if>
						<c:if test="${item.reviewStatus!=1 }">
						<input type="checkbox" name="subBox" value="${item.id}" />
						</c:if>
						
						</td>
						<td>
						<c:if test="${fn:length(item.title)>34}">
										${fn:substring(item.title,0,34)}...
									</c:if>
									<c:if test="${fn:length(item.title)<=34}">
										${item.title }
									</c:if></td>
						<td>${ item.realname}</td>
						<td>${ item.ctime}</td>
						<td>${ item.reviewStatus=='0'?'未处理':(item.reviewStatus=='1'?'通过':'驳回')}</td>
						<td>${ item.reviewName}</td>
						<td>${ item.reviewTime}</td>
						<td><input type="text" value="${item.orderlist }" id="${item.id}" name="orderlistInput"></input></td>
						<td>
						<c:if test="${shenheFlag=='1' }">
							<c:if test="${item.reviewStatus=='0' }">
							<a href="#" class="tablelink"  onclick="acceptOne('${item.id}');">审核</a>  
							</c:if>
						</c:if>
						
						<c:if test="${fabuFlag=='1' }">
						<a href="${ contextpath }/securitynews/modify.htm?id=${item.id}&news_type=${news_type}"
							class="tablelink">编辑</a>  
						<a href="javascript:void(0)" onclick="deleteNew('${item.id}');"
							class="tablelink">删除</a>  
						</c:if>
						<a href="#" class="tablelink"  onclick="preview('${item.id}');">预览</a>  
						</td>
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<page:page href="${contextpath}/securitynews/list.htm?title=${title}&menuId=${menu.id }&reviewStatus=${reviewStatus }&id=${id }&news_type=${news_type }&bq_id=${bq_id }"
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
			table_init("${ contextpath}/securitynews","${contextpath}/securitynews/list?");
		});
		function deleteNew(del_ids){
			parent.layer.confirm('您确认删除您所选择的数据么？',function(index){
				//ajax提交删除数据
				jQuery.ajax({
							type: "post", 
							url:"${contextpath}/securitynews/delete", 
							dataType: "json",
							data:{action:'delete',ids:del_ids},
							success: function (data) { 
								parent.layer.close(index);
								if(data.status=='success'){
									parent.layer.alert('当前操作成功', {
										closeBtn: 0
									}, function(index){
										parent.layer.close(index);
										window.location.href="${contextpath}/securitynews/list.htm?id=${menu.id}";
									});
								}else{
									parent.layer.close(index);
									parent.layer.alert(data.message, {
										closeBtn: 0
									}, function(index){
										parent.layer.close(index);
										window.location.href="${contextpath}/securitynews/list.htm?id=${menu.id}";
									});
								}
								
								 
							} 
					});
			});
		}
		function goback(){
			window.location.href="${contextpath}/securitymenu/list.htm";
		}
		function add(){
 			window.location.href="${contextpath}/securitynews/add.htm?menuId=${menu.id}&news_type=${news_type}";
		}
		function saveOrderlist(){
			var orderlist_ids="" ;
			var count=0;
			var checkbox = $("input[name='orderlistInput']");
			checkbox.each(function() {
				if (this.value=='') {
					alert('请填写排序号');
					$(this).focus();
					return false;
				}else{
					orderlist_ids=orderlist_ids+$(this).attr("id")+"-"+$(this).val()+"~";
				}
			});
			
			parent.layer.confirm('您确认保存排序吗？',function(index){
				//ajax提交删除数据
				jQuery.ajax({
							type: "post", 
							url:"${contextpath}/securitynews/updateOrderlist", 
							dataType: "json",
							data:{orderlist_ids:orderlist_ids},
							success: function (data) { 
								parent.layer.close(index);
								if(data.status=='success'){
									parent.layer.alert('当前操作成功', {
										closeBtn: 0
									}, function(index){
										parent.layer.close(index);
										window.location.href="${contextpath}/securitynews/list.htm?id=${menu.id}";
									});
								}else{
									parent.layer.close(index);
									parent.layer.alert(data.message, {
										closeBtn: 0
									}, function(index){
										parent.layer.close(index);
										window.location.href="${contextpath}/securitynews/list.htm?id=${menu.id}";
									});
								}
								
								 
							} 
					});
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
								url:"${contextpath}/securitynews/delete", 
								dataType: "json",
								data:{action:'delete',ids:del_ids},
								success: function (data) { 
									parent.layer.close(index);
									if(data.status=='success'){
										parent.layer.alert('当前操作成功', {
											closeBtn: 0
										}, function(index){
											parent.layer.close(index);
											window.location.href="${contextpath}/securitynews/list.htm?id=${menu.id}";
										});
									}else{
										parent.layer.close(index);
										parent.layer.alert(data.message, {
											closeBtn: 0
										}, function(index){
											parent.layer.close(index);
											window.location.href="${contextpath}/securitynews/list.htm?id=${menu.id}";
										});
									}
									
									 
								} 
						});
				});
			 
			}
		}
		
		
		function accept(){
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
				sAlert('请选择要审核通过的数据！');
			}
			
			else{
				parent.layer.open({
				    type: 2,
				    title: '请输入您的审核意见',
				    shadeClose: true,
				    shade: 0.8,
				    area : [ '500px', '45%' ],
				    content: '${contextpath}/securitynews/toCheck.htm?ids='+del_ids+'&type=1&id=${menu.id }&jumpType=piliang_check' //iframe的url
				}); 
				
			}
		}
		
		function acceptOne(id){
			 
				parent.layer.open({
				    type: 2,
				    title: '请输入您的审核意见',
				    shadeClose: true,
				    shade: 0.8,
				    area : [ '500px', '45%' ],
				    content: '${contextpath}/securitynews/toCheck.htm?ids='+id+'&type=1&id=${menu.id }&jumpType=piliang_check' //iframe的url
				}); 
				
		}
		
		function rollback(){
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
				sAlert('请选择要驳回的数据！');
			}
			
			else{
				parent.layer.open({
				    type: 2,
				    title: '请输入您的审核意见',
				    shadeClose: true,
				    shade: 0.8,
				    area : [ '500px', '45%' ],
				    content: '${contextpath}/securitynews/toCheck.htm?ids='+del_ids+'&type=2&id=${menu.id }&jumpType=piliang_check' //iframe的url
				}); 
				
			}
				 
		}
		
		function preview(id){
			 
			var detailUrl='${indexsettingMap.index_url}';
			if('${parentId}'=='1011'){
				detailUrl=detailUrl+'quanjingDetail.htm?id='+id;
			}
			else if('${parentId}'=='1010'){
				detailUrl=detailUrl+'changyouDetail.htm?id='+id;
			}
			else if('${parentId}'=='1058'){
				detailUrl=detailUrl+'xiuxianDetail.htm?id='+id;
			}
			else if('${parentId}'=='1037'){
				detailUrl=detailUrl+'tingwenDetail.htm?id='+id;
			}
			parent.window.open(detailUrl,'_blank');
		}
		
		
</script>

