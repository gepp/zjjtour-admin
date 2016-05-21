<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>活动</title>
<link href="${ contextpath }/res/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="${ contextpath }/res/css/page.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="${ contextpath }/res/js/jquery.js"></script>
<script type="text/javascript" src="${ contextpath }/res/js/common.js"></script>
<script type="text/javascript" 	src="${ contextpath }/res/js/layer/layer.js"></script>
<script language="javascript" type="text/javascript" src="${ contextpath }/res/js/My97DatePicker/WdatePicker.js"></script>
<link href="${ contextpath }/res/css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ contextpath }/res/js/select-ui.min.js"></script>

</head>
<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a></li>
			<li><a href="#">活动</a></li>
		</ul>
	</div>
	<div class="rightinfo">



		<form method="post" action="${ contextpath}/memberactivity/list"
			class="form-horizontal">
			<ul class="seachform" style="padding-top: 10px; padding-left: 15px">
				<li><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;标题</label><input type="text"
					name="title" id="title" class="scinput1"
					placeholder="" value="${title}"></li>
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
				<li><label>是否启用</label>
				  <div class="vocation">
						 <select class="select1" name="status">
							<option value="" <c:if test="${status==''}">selected</c:if>>全部</option>
							<option value="1" <c:if test="${status=='1'}">selected</c:if>>启用</option>
							<option value="0" <c:if test="${status=='0'}">selected</c:if>>停用</option>
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
				</ul>
				<ul class="seachform" style="padding-top: 10px; padding-left: 15px">
				<li><label>起始时间起</label>
				<input type="text"
					name="start_time_start" id="start_time_start" class="scinput1"
					placeholder="请输入活动起始时间" value="${start_time_start}" onfocus="WdatePicker({isShowWeek:true})">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 至&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="text"
					name="start_time_end" id="start_time_end" class="scinput1"
					placeholder="请输入截止时间" value="${start_time_end}" onfocus="WdatePicker({isShowWeek:true})">
				</li>
				<li><label>截止时间起</label>
				<input type="text"
					name="end_time_start" id="end_time_start" class="scinput1"
					placeholder="请输入活动截止时间起" value="${end_time_start}" onfocus="WdatePicker({isShowWeek:true})">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text"
					name="end_time_end" id="end_time_end" class="scinput1"
					placeholder="请输入截止时间止" value="${end_time_end}" onfocus="WdatePicker({isShowWeek:true})">
				</li> 
			 
				<input name="" type="submit"
						id="table_refresh" class="scbtn" value="查询" />
					</li>
			</ul>
				<br/>
			
	<div class="tools">
			<ul class="toolbar">
			<c:if test="${fabuFlag=='1' }">
			<li class="click" id="table_add"><span><img src="${contextpath }/res/images/t01.png"></span>添加</li>
	        <li id="table_delete"><span><img src="${contextpath }/res/images/t03.png"></span>删除</li>
	        </c:if>
	        <c:if test="${shenheFlag=='1' }">
	        <li class="click" onclick="accept();" ><span><img src="${contextpath }/res/images/t02.png"></span>审核</li>
	        <li onclick="rollback();" ><span><img src="${contextpath }/res/images/t04.png"></span>驳回</li>
	        </c:if>
 			</ul>
		</div>

		</form>
		<div class="formtitle1">
			<span>活动</span>
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
					
						<td><a
							href="${ contextpath }/memberactivity/modify.htm?id=${item.id}"
							class="tablelink">编辑</a>&nbsp;&nbsp;<a
							href="#" onclick="seeDetail('${item.id}')"
							class="tablelink">查看明细</a>
							&nbsp;&nbsp;<a
							href="#"  onclick="preview('${item.id}');"
							class="tablelink">预览</a>
							
							<a
							href="#"  onclick="deleteActivity('${item.id}');"
							class="tablelink">删除活动</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<page:page
			href="${ contextpath}/memberactivity/list?litter_title=${litter_title}&activity_status=${activity_status}&status=${status}&review_status=${review_status}&start_time=${start_time}&end_time=${end_time}"
			data="pageList" />

	</div>
</body>
</html>

<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
		$(document).ready(function(){
			$(".select1").uedSelect({
				width : 160			  
			});
			table_init("${ contextpath}/memberactivity","${ contextpath}/memberactivity/list?");
		});
		

		function accept() {
			var jumpType="activity_check";
			var del_ids = "";
			var count = 0;
			var checkbox = $("input[name='subBox']");
			checkbox.each(function() {
				if (this.checked) {
					del_ids += this.value + ",";
					count = count + 1;
				}
			});
			if (count == 0) {
				sAlert('请选择要审核通过的数据！');
			}

			else {
				parent.layer.open({
					type : 2,
					title : '请输入您的审核意见',
					shadeClose : true,
					shade : 0.8,
					area : [ '500px', '45%' ],
					content : '${contextpath}/memberactivity/toCheck.htm?ids='
							+ del_ids + '&type=1&id=${menu.id }&jumpType='+jumpType //iframe的url
				});

			}
		}
		
		function deleteActivity(del_ids){
			parent.layer.confirm('您确认删除您所选择的数据么？',function(index){
				//ajax提交删除数据
				jQuery.ajax({
							type: "post", 
							url:"${contextpath}/memberactivity/delete", 
							dataType: "json",
							data:{action:'delete',ids:del_ids},
							success: function (data) { 
								parent.layer.close(index);
								if(data.status=='success'){
									parent.layer.alert('当前操作成功', {
										closeBtn: 0
									}, function(index){
										parent.layer.close(index);
										window.location.href="${contextpath}/memberactivity/list.htm?id=${menu.id}";
									});
								}else{
									parent.layer.close(index);
									parent.layer.alert(data.message, {
										closeBtn: 0
									}, function(index){
										parent.layer.close(index);
										window.location.href="${contextpath}/memberactivity/list.htm?id=${menu.id}";
									});
								}
								
								 
							} 
					});
			});
		}

		function rollback() {
			var jumpType="activity_check";
			var del_ids = "";
			var count = 0;
			var checkbox = $("input[name='subBox']");
			checkbox.each(function() {
				if (this.checked) {
					del_ids += this.value + ",";
					count = count + 1;
				}
			});
			if (count == 0) {
				sAlert('请选择要驳回的数据！');
			}

			else {
				parent.layer.open({
					type : 2,
					title : '请输入您的驳回意见',
					shadeClose : true,
					shade : 0.8,
					area : [ '500px', '45%' ],
					content : '${contextpath}/memberactivity/toCheck.htm?ids='
							+ del_ids + '&type=2&id=${menu.id }&jumpType='+jumpType //iframe的url
				});

			}

		}
		
		
		function seeDetail(id){
			parent.layer.open({
			    type: 2,
			    title: '查看活动明细',
			    shadeClose: true,
			    shade: 0.8,
			    area : [ '500px', '60%' ],
			    content: '${contextpath}/memberactivity/memberList.htm?id='+id //iframe的url
			}); 
		}

		function preview(id){
			var detailUrl='${indexsettingMap.index_url}activityDetail.htm?id='+id;
			parent.window.open(detailUrl,'_blank');
		}
</script>

