<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理系统</title>
<link href="${contextpath }/res/css/style.css" rel="stylesheet"
	type="text/css" />
<script language="JavaScript" src="${contextpath }/res/js/jquery.js"></script>
<script language="JavaScript"
	src="${ contextpath }/res/js/layer/layer.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
	

<script type="text/javascript">
	$(function() {
		//导航切换
		$(".menuson .header").click(
				function() {
					var $parent = $(this).parent();
					$(".menuson>li.active").not($parent).removeClass(
							"active open").find('.sub-menus').hide();

					$parent.addClass("active");
					if (!!$(this).next('.sub-menus').size()) {
						if ($parent.hasClass("open")) {
							$parent.removeClass("open").find('.sub-menus')
									.hide();
						} else {
							$parent.addClass("open").find('.sub-menus').show();
						}

					}
				});

		$('.title').click(function() {
			var $ul = $(this).next('ul');
			$('dd').find('.menuson').slideUp();
			if ($ul.is(':visible')) {
				$(this).next('.menuson').slideUp();
			} else {
				$(this).next('.menuson').slideDown();
			}
		});
	});
</script>
</head>
<body
	style="background:url(${contextpath}/res/images/topbg.gif) repeat-x;">
	<div id="topDiv">
		<div class="topleft">
			<a href="main.html" target="_parent"><img
				src="${contextpath }/res/images/logo.png" title="系统首页" /></a>
		</div>
		<div class="topright">
			<ul>
				<li><span><img src="${contextpath }/res/images/help.png"
						title="帮助" class="helpimg" /></span><a href="#">帮助</a></li>
				<li><a href="${contextpath }/tech.htm" target="rightFrame">技术支持</a></li>
				<li><a href="${contextpath }/passwordModify.htm" target="rightFrame">修改密码</a></li>
				<li><a href="${contextpath }/loginout.htm" target="_parent">退出</a></li>
			</ul>

			<div class="user">
				<span>${securityUser.realname }</span>
			</div>
		</div>
	</div>
	<div id="frameLeft"
		style="position: fixed; top: 88px; position: fixed; left: 0; height: 100%; width: 150px; overflow: hidden; vertical-align: top;">
		<div class="lefttop">
			<span></span>菜 单
		</div>

		<dl class="leftmenu">
			${menuStr }
		</dl>
	</div>
	<div id="maincontent"
		style="position: fixed; left: 150px; top: 88px; right: 0; bottom: 0; overflow: auto;">
		<iframe id="rightFrame" name="rightFrame" marginwidth="0"
			marginheight="0" src="${contextpath }/defaultMain.htm"
			frameborder="0" width="100%" scrolling="no" height="100%"
			style="overflow-x: hidden; overflow-y: hidden;"></iframe>

	</div>

</body>
</html>
<script type="text/javascript">
	//注意：下面的代码是放在和iframe同一个页面调用,放在iframe下面
	$("#rightFrame").load(function() {
		var mainheight = $(this).contents().find("html").height();
 		if (mainheight < 600) { //如果需要最小高度，就有了if判断，
			$(this).attr("height", 600); //如果高度小于600，则把iframe高度改为600
		} else {
			$(this).attr("height", mainheight); //如果高度大于或者等于600时，则iframe高度等于嵌进来html的高度
		}
		var mainwidth = $(this).contents().find("html").width();
		$(this).attr("width", mainwidth);
	});
 
</script>
