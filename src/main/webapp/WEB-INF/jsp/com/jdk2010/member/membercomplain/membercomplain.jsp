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
<title>会员投诉</title>
<link href="${ contextpath }/res/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="${ contextpath }/res/css/page.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="${ contextpath }/res/js/jquery.js"></script>
<script type="text/javascript" src="${ contextpath }/res/js/common.js"></script>
<script type="text/javascript"
	src="${ contextpath }/res/js/layer/layer.js"></script>
<script language="javascript" type="text/javascript" src="${ contextpath }/res/js/My97DatePicker/WdatePicker.js"></script>
<link href="${ contextpath }/res/css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ contextpath }/res/js/select-ui.min.js"></script>

</head>
<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a></li>
			<li><a href="#">会员投诉</a></li>
		</ul>
	</div>
	<div class="rightinfo">



		<form method="post" action="${ contextpath}/membercomplain/list"
			class="form-horizontal">
			<ul class="seachform" style="padding-top: 10px; padding-left: 15px">
				<li><label>&nbsp;&nbsp;&nbsp;会员手机</label><input type="text" name="member_mobile"
					id="member_mobile" class="scinput1" placeholder="请输入会员手机"
					value="${member_mobile}"></li>
				<li><label>会员姓名</label><input type="text" name="member_name"
					id="member_name" class="scinput1" placeholder="请输入会员姓名"
					value="${member_name}"></li>
					<li><label>&nbsp;&nbsp;&nbsp;&nbsp;回复状态</label>
						<div class="vocation">
						 <select class="select1" name="replay_status">
						 <option value="" <c:if test="${replay_status==''}">selected</c:if>>全部</option>
						  <option value="0" <c:if test="${replay_status=='0'}">selected</c:if>>未回复</option>
						 <option value="1" <c:if test="${replay_status=='1'}">selected</c:if>>已回复</option>
						 </select>
						 </div>
					</li>
				 	<li><label>审核状态</label>
						<div class="vocation">
						 <select class="select1" name="review_status">
							 <option value="" <c:if test="${review_status==''}">selected</c:if>>全部</option>
							 <option value="0" <c:if test="${review_status=='0'}">selected</c:if>>未处理</option>
							 <option value="1" <c:if test="${review_status=='1'}">selected</c:if>>审核通过</option>
							 <option value="2" <c:if test="${review_status=='2'}">selected</c:if>>驳回</option>
						 </select>
						 </div>
					</li>
				 
				
			</ul>
			<ul class="seachform" style="padding-top: 10px; padding-left: 15px">
				<li><label>投诉时间起</label>
				<input type="text"
					name="complain_time_start" id="complain_time_start" class="scinput1"
					placeholder="请输入开始时间" value="${complain_time_start}" onfocus="WdatePicker({isShowWeek:true})">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text"
					name="complain_time_end" id="complain_time_end" class="scinput1"
					placeholder="请输入截止时间" value="${complain_time_end}" onfocus="WdatePicker({isShowWeek:true})">
				</li>
				 
				<li><label>审核日期起</label>
				<input type="text"
					name="review_time_start" id="review_time_start" class="scinput1"
					placeholder="请输入起始时间" value="${review_time_start}" onfocus="WdatePicker({isShowWeek:true})">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text"
					name="review_time_end" id="review_time_end" class="scinput1"
					placeholder="请输入截止时间" value="${review_time_end}" onfocus="WdatePicker({isShowWeek:true})">
				</li> 
				 
			 
				<input name="" type="submit"
						id="table_refresh" class="scbtn" value="查询" />
					</li>
			</ul>
			 <br/>	 
			<div class="tools">
			<ul class="toolbar">
			<c:if test="${fabuFlag=='1' }">
			<li class="click" onclick="replay();"><span><img src="${ contextpath }/res/images/t05.png" /></span>回复</li>
	        </c:if>
	        <c:if test="${shenheFlag=='1' }">
	        <li class="click" onclick="accept();" ><span><img src="${contextpath }/res/images/t02.png"></span>审核</li>
	        <li onclick="rollback();" ><span><img src="${contextpath }/res/images/t04.png"></span>驳回</li>
	        </c:if>
 			</ul>
		</div>


		</form>
		<div class="formtitle1">
			<span>会员投诉</span>
		</div>
		<table class="tablelist">
			<thead>
				<tr>
					<th><input type="checkbox" width="15px" id="checkAll" /></th>
					<th>投诉标题</th>
					<th>投诉人</th>
					<th>手机号</th>
					<th>投诉时间</th>
					<th>回复状态</th>
					<th>回复人</th>
					<th>回复时间</th>
					<th>审核状态</th>
					<th>审核人</th>
					<th>审核时间</th>
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
						
						<td><a class="tablelink" href="#" onclick="memberComplainDetail('${item.id}')">
						<c:choose>
						<c:when test="${fn:length(item.complainTitle)>10}">
							${fn:substring(item.complainTitle, 0, 10)}...
						</c:when>
						<c:otherwise>
						${ item.complainTitle}
						 </c:otherwise>
						 </c:choose>
						</a></td>
						
						<td>${ item.memberName}</td>
						
						<td>${ item.memberMobile}</td>
						<fmt:formatDate value="${item.complainTime }" pattern="yyyy-MM-dd HH:mm" var="complainTime"/>
						<td>${complainTime}</td>

						<td>${ item.replayStatus==0?'未回复':'已回复'}</td>

						<td>${ item.replayName}</td>
						<fmt:formatDate value="${item.replayTime }" pattern="yyyy-MM-dd HH:mm" var="replayTime"/>
						<td>${ replayTime}</td>

						<td>${ item.reviewStatus=='0'?'未处理':(item.reviewStatus=='1'?'通过':'驳回')}</td>

						<td>${ item.reviewName}</td>

						<td>${ item.reviewTime}</td>

						<td><a
							href="#" class="tablelink" onclick="memberComplainReviewDetail('${item.id}');">审核详情</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<page:page
			href="${ contextpath}/membercomplain/list?member_mobile=${member_mobile}&member_name=${member_name}&complain_time=${complain_time}&replay_status=${replay_status}&review_status=${review_status}&review_time=${review_time}"
			data="pageList" />

	</div>
</body>
</html>

<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
		$(document).ready(function(){
			$(".select1").uedSelect({
				width : 150			  
			});
			table_init("${ contextpath}/membercomplain","${ contextpath}/membercomplain/list?");
		});
		

		function replay() {
			var jumpType="wait_check";
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
				sAlert('请选择要回复的数据！');
			}

			else {
				parent.layer.open({
					type : 2,
					title : '请输入您的回复意见',
					shadeClose : true,
					shade : 0.8,
					area : [ '500px', '45%' ],
					content : '${contextpath}/membercomplain/toReplay.htm?ids='
							+ del_ids + '&type=1&id=${menu.id }&jumpType='+jumpType //iframe的url
				});

			}
		}
		
		
		function accept() {
			var jumpType="wait_check";
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
					content : '${contextpath}/membercomplain/toCheck.htm?ids='
							+ del_ids + '&type=1&id=${menu.id }&jumpType='+jumpType //iframe的url
				});

			}
		}

		function rollback() {
			var jumpType="wait_check";
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
					content : '${contextpath}/membercomplain/toCheck.htm?ids='
							+ del_ids + '&type=2&id=${menu.id }&jumpType='+jumpType //iframe的url
				});

			}

		}
		
		
		function memberComplainDetail(id) {
			parent.layer.open({
				type : 2,
				title : '投诉详情',
				shadeClose : true,
				shade : 0.8,
				area : [ '680px', '60%' ],
				content : '${contextpath}/membercomplain/memberComplainDetail.htm?id='+id
			});
			 
		}
		
		function memberComplainReviewDetail(id) {
			parent.layer.open({
				type : 2,
				title : '审核详情',
				shadeClose : true,
				shade : 0.8,
				area : [ '680px', '60%' ],
				content : '${contextpath}/membercomplain/reviewDetail.htm?id='+id
			});
			 
		}
		
</script>

