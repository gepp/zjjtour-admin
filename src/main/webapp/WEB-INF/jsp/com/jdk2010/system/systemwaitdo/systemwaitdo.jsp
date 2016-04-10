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
<title>代办事项</title>
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
			<li><a href="#">代办事项</a></li>
		</ul>
	</div>
	<div class="rightinfo">



		<div class="tools">
			<ul class="toolbar">
			<li class="click" onclick="accept();" ><span><img src="${contextpath }/res/images/t02.png"></span>审核</li>
	        <li onclick="rollback();" ><span><img src="${contextpath }/res/images/t04.png"></span>回复</li>
		</ul>
 		</div>
		<div class="formtitle1">
			<span>代办事项</span>
		</div>
		<table class="tablelist">
			<thead>
				<tr>
					<th><input type="checkbox" width="15px" id="checkAll" /></th>
					<th>栏目名称</th>
					<th>标题</th>
					<th>时间</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pageList.list}" var="item">

					<tr>
						<td><input type="checkbox" name="subBox" value="${item.id}" /></td>

						<td>${ item.name}</td>

						<td onclick="review('${item.targetId}')">${ item.title}</td>

						<td>${ item.ctime}</td>

						<td>${ item.status}</td>


						<td>${ item.targetId}</td>

						<td><a
							href="${ contextpath }/systemwaitdo/modify.htm?id=${item.id}"
							class="tablelink">编辑</a> <a
							href="${ contextpath }/systemwaitdo/view.htm?id=${item.id}"
							class="tablelink">查看</a>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<page:page href="${ contextpath}/systemwaitdo/list?" data="pageList" />

	</div>
</body>
</html>

<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
		$(document).ready(function(){
			table_init("${ contextpath}/systemwaitdo","${ contextpath}/systemwaitdo/list?");
		});
		function review(parentId,id){
			var detailUrl='${indexsettingMap.index_url}';
			if(parentId=='1011'){
				detailUrl=detailUrl+'quanjingDetail.htm?id='+id;
			}
			else if(parentId=='1010'){
				detailUrl=detailUrl+'changyouDetail.htm?id='+id;
			}
			else if(parentId=='1058'){
				detailUrl=detailUrl+'xiuxianDetail.htm?id='+id;
			}
			else if(parentId=='1037'){
				detailUrl=detailUrl+'tingwenDetail.htm?id='+id;
			}
			parent.window.open(detailUrl,'_blank');
		}
</script>

