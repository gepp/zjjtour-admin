<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>待办事项</title>
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
			<li><a href="#">待办事项-新闻发布审核</a></li>
		</ul>
	</div>
	<div class="rightinfo">
	<form method="post" action="${ contextpath}/securitynews/listWaitShenhe.htm">
			<ul class="seachform" style="padding-top: 10px; padding-left: 15px">
			<li><label>标题</label><input type="text" name="title"
					id="title" class="scinput1" placeholder="" value="${title}" style="width:300px"></li>
					<li>
					<input name="" type="submit"
						id="table_refresh" class="scbtn" value="查询" />
					</li>
					
		
			</ul>
		 
	</form>
		<br/>
		 
		 <div class="tools">
			<ul class="toolbar">
			 
	        <c:if test="${shenheFlag=='1' }">
	        <li class="click" onclick="accept();" ><span><img src="${contextpath }/res/images/t02.png"></span>审核</li>
	        <li onclick="rollback();" ><span><img src="${contextpath }/res/images/t04.png"></span>驳回</li>
	        </c:if>
 			</ul>
		</div>
		<div class="formtitle1">
			<span>待办事项-新闻发布审核</span>
		</div>
		<table class="tablelist">
			<thead>
				<tr>
					<th><input type="checkbox" width="15px" id="checkAll" /></th>
					<th>栏目名称</th>
					<th>标题</th>
					<th>时间</th>
					<th>状态</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pageList.list}" var="item">

					<tr>
						<td><input type="checkbox" name="subBox" value="${item.id}" /></td>
						<td >${ item.menuName}</td>
						<td onclick="review('${item.menuId}','${item.id }')"><a href="" class="tablelink">${ item.title}</a></td>
						<td>${ item.ctime}</td>
						<td>${ item.reviewStatus=='0'?'未处理':(item.reviewStatus=='1'?'通过':'驳回')}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<page:page href="${contextpath}/securitynews/listWaitShenhe.htm"
			data="pageList" />

	</div>
</body>
</html>
 <script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
		$(document).ready(function(){
			table_init("${ contextpath}/securitynews","${ contextpath}/securitynews/list?");
		});
		
		
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
					content : '${contextpath}/securitynews/toCheck.htm?ids='
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
					content : '${contextpath}/securitynews/toCheck.htm?ids='
							+ del_ids + '&type=2&id=${menu.id }&jumpType='+jumpType //iframe的url
				});

			}

		}
		function review(parentId,id){
			var detailUrl='${indexsettingMap.index_url}';
			if(parentId=='1012'||parentId=='1013'||parentId=='1014'||parentId=='1015'||parentId=='1084'||parentId=='1085'||parentId=='1086'||parentId=='1087'){
				detailUrl=detailUrl+'quanjingDetail.htm?id='+id;
			}
			else if(parentId=='1010'||parentId=='1036'||parentId=='1088'||parentId=='1089'||parentId=='1090'){
				detailUrl=detailUrl+'changyouDetail.htm?id='+id;
			}
			else if(parentId=='1091'||parentId=='1092'||parentId=='1093'||parentId=='1094'||parentId=='1095'){
				detailUrl=detailUrl+'xiuxianDetail.htm?id='+id;
			}
			else if(parentId=='1037'||parentId=='1038'||parentId=='1055'||parentId=='1056'||parentId=='1057'){
				detailUrl=detailUrl+'tingwenDetail.htm?id='+id;
			}
			parent.window.open(detailUrl,'_blank');
		}
	</script>

