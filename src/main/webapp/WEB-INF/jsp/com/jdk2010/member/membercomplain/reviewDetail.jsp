<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>回复详情</title>
<link href="${ contextpath }/res/css/style.css" rel="stylesheet" type="text/css" />
<link href="${ contextpath }/res/css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ contextpath }/res/js/jquery.js"></script>
</head>
<body style="min-width: 300px">
	 
	<div class="formbody">
		<div id="usual1" class="usual">
				<ul class="forminfo">
						<li><label><b>回复内容</b></label>
							<div class="control-group">${ memberComplain.replayMessage}</div></li>
						<li><label><b>回复人</b></label>
							<div class="control-group">${ memberComplain.replayName}</div></li>
						<li><label><b>回复时间</b></label>
							<div class="control-group">${ memberComplain.replayTime}</div></li>
						<li><label><b>审核人</b></label>
							<div class="control-group">${ memberComplain.reviewName}</div></li>
						<li><label><b>审核内容</b></label>
							<div class="control-group">${ memberComplain.reviewMessage}</div></li>
						<li><label><b>审核时间</b></label>
							<div class="control-group">${ memberComplain.reviewTime}</div></li>
				</ul>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
</script>


