<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>活动管理</title>
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
<body style="min-width: 300px">

	 
	<div class="rightinfo">
	<form method="post" action="${ contextpath}/activitylist.htm">
			<ul class="seachform" style="padding-top: 10px; padding-left: 15px">
			<li><label>活动标题</label><input type="text" name="title"
					id="title" class="scinput1" placeholder="" value="${title}" style="width:300px"></li>
			<li><label>活动状态</label>
					  <div class="vocation">
						 <select class="select1" name="activity_status">
							<option value="" <c:if test="${activity_status==''}">selected</c:if>>全部</option>
							<option value="0" <c:if test="${activity_status=='0'}">selected</c:if>>未开始</option>
							<option value="1" <c:if test="${activity_status=='1'}">selected</c:if>>进行中</option>
							<option value="2" <c:if test="${activity_status=='2'}">selected</c:if>>已结束</option>
					      </select>
					   </div>
				</li>
				<li><label>审核状态</label>
						<div class="vocation">
						 <select class="select1" name="review_status">
							 <option value="" <c:if test="${review_status==''}">selected</c:if>>全部</option>
							 <option value="1" <c:if test="${review_status=='1'}">selected</c:if>>未审核</option>
							 <option value="2" <c:if test="${review_status=='2'}">selected</c:if>>已审核</option>
						 </select>
						 </div>
					</li>	 
					<li>
					<input name="" type="submit"
						id="table_refresh" class="scbtn" value="查询" />
					&nbsp;&nbsp;
					<input name="" type="button"  class="scbtn" value="确定选择" onclick="submitCheck();" />
					</li>
					
		
			</ul>
		 
	</form>
		<br/>
	 
		<div class="formtitle1">
			<span>通知公告</span>
		</div>
		<table class="tablelist">
			<thead>
				<tr>
					<th><input type="checkbox" width="15px" id="checkAll" /></th>
					<th>活动标题</th>
					<th>开始时间</th>
					<th>截止时间</th>
					<th>活动状态</th>
					<th>是否支持报名</th>
					<th>是否启用</th>
					<th>报名人数</th>
					<th>审核状态</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pageList.list}" var="item">

					<tr>
						<td>
						
						<c:if test="${item.reviewStatus==1 }">
						<input type="checkbox" name="subBox" value="${item.id}" />
						
						</c:if>
						<c:if test="${item.reviewStatus!=1 }">
						<span class="cboxDisable"></span>
						</c:if>
						</td>

						<td>${ item.title}</td>
						<fmt:formatDate value="${item.startTime }"  var="startTime" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${item.endTime }"  var="endTime" pattern="yyyy-MM-dd"/>
						<td>${startTime}</td>

						<td>${endTime}</td>

						<td>${ item.activityStatus==0?'未开始':(item.activityStatus==1?'进行中':'已结束')}</td>
						
					    <td>${ item.supportStatus=='1'?'支持':'不支持'}</td>
						
						  <td>${ item.status==1?'启用':'停用'}</td>
						<td>${item.usercount }</td>
						<td>${ item.reviewStatus=='0'?'未处理':(item.reviewStatus=='1'?'通过':'驳回')}</td>
					
						 
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<page:page href="${contextpath}/activitylist.htm?title=${title}&activity_status=${activity_status}&review_status=${review_status}" data="pageList" />

	</div>
</body>
</html>
 <script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
		$(document).ready(function(){
			$(".select1").uedSelect({
				width : 100			  
			});
			table_init("${ contextpath}/securitynews","${ contextpath}/securitynews/list?title=${title}&activity_status=${activity_status}&review_status=${review_status}");
		});
		 
		function submitCheck(){
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
				sAlert('请选择要添加的数据！');
			}
			
			else{
			
			parent.layer.confirm('您确认添加您所选择的'+count+'条数据么？',function(index){
				//ajax提交删除数据
				jQuery.ajax({
							type: "post", 
							url:"${contextpath}/submitCheck.htm", 
							dataType: "json",
							data:{action:'delete',ids:del_ids,type:'2'},
							success: function (data) { 
								parent.layer.close(index);
								if(data.status=='success'){
									parent.layer.alert('当前操作成功', {
										closeBtn: 0
									}, function(index){
										parent.layer.close(index);
										parent.location.reload();
										 
									});
								}else{
									parent.layer.close(index);
									parent.layer.alert(data.message, {
										closeBtn: 0
									}, function(index){
										parent.layer.close(index);
										parent.location.reload();
									});
								}
								
								 
							} 
					});
			});
		}
		}
		
</script>

