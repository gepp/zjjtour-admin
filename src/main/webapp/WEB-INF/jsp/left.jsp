<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${contextpath }/res/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${contextpath }/res/js/jquery.js"></script>

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

		// 三级菜单点击
		$('.sub-menus li').click(function(e) {
			$(".sub-menus li.active").removeClass("active")
			$(this).addClass("active");
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
	})
</script>


</head>

<body style="background: #f0f9fd;">
	<div class="lefttop">
		<span></span>功能菜单
	</div>

	<dl class="leftmenu">
				${menuStr }
			<!-- 
		<dd>
			<div class="title">
				<span><img src="${contextpath }/res/images/leftico03.png" /></span>系统管理
			</div>
			<ul class="menuson">
				<li><cite></cite><a href="${contextpath }/securitymenu/list.htm" target="rightFrame">菜单管理</a><i></i></li>
				<li><cite></cite><a href="${contextpath }/securityrole/list.htm" target="rightFrame">角色管理</a><i></i></li>
				<li><cite></cite><a href="${contextpath }/securityuser/list.htm" target="rightFrame">用户管理</a><i></i></li>
				<li><cite></cite><a href="${contextpath }/securityorganization/list.htm" target="rightFrame">部门管理</a><i></i></li>
			</ul>
		</dd>


		<dd>
			<div class="title">
				<span><img src="${contextpath }/res/images/leftico04.png" /></span>日期管理
			</div>
			<ul class="menuson">
				<li><cite></cite><a href="#">自定义</a><i></i></li>
				<li><cite></cite><a href="#">常用资料</a><i></i></li>
				<li><cite></cite><a href="#">信息列表</a><i></i></li>
				<li><cite></cite><a href="#">其他</a><i></i></li>
			</ul>

		</dd>
 -->
	</dl>

</body>
</html>
