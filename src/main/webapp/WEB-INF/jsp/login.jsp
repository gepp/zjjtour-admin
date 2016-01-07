<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎登录管理平台</title>
<link href="${contextpath}/res/css/style.css" rel="stylesheet"
	type="text/css" />
<script language="JavaScript" src="${contextpath}/res/js/jquery.js"></script>
<script src="${contextpath}/res/js/cloud.js" type="text/javascript"></script>
<script type="text/javascript" src="${contextpath }/res/js/layer/layer.js"></script>
<script type="text/javascript" src="${contextpath }/res/js/jQuery.decode.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />

<script language="javascript">
	$(function() {
		$('.loginbox').css({
			'position' : 'absolute',
			'left' : ($(window).width() - 692) / 2
		});
		$(window).resize(function() {
			$('.loginbox').css({
				'position' : 'absolute',
				'left' : ($(window).width() - 692) / 2
			});
		})
	});
function login(){
	var username=$("#username").val();
	var password=$("#password").val();
	var captcha=$("#captcha").val();
	var rememberMe=$("#rememberMe").prop("checked");
	if(username==''||password==''||captcha==''){
		layer.alert('请填写用户名/密码/验证码！');
	}
	else{
        var map={"username":username,"password":$.decode(password),"rememberMe":rememberMe,"captcha":captcha};
		  $.ajax({
		        url:"${contextpath}/doLogin.htm",
		        type:"post",
		        data:map,
		        dataType:"json",
		        success:function(data){
		           if(data.flag=='T'){
		        	   window.location.href="${contextpath}/main.htm";
		           }else{
		        	   $("#imgsrc").click();
		        	   $("#captcha").val('');
		        	   layer.alert(data.reason);
		           }
		        }, 
		        error:function(data) {
		            
		        }
		    });
	}
}
$(document).keyup(function(event){ 
    var keycode = event.which; 
    //处理回车的情况 
    if(keycode==13){ 
    	login();
   } 
    
});  

if (top.location != self.location){       
    top.location = "${contextpath}/login.htm";       
}    
</script>
</head>
<body style="background-color: #1c77ac; background-image: url(${contextpath}/res/images/light.png); background-repeat: no-repeat; background-position: center top; overflow: hidden;">
	<div id="mainBody">
		<div id="cloud1" class="cloud"></div>
		<div id="cloud2" class="cloud"></div>
	</div>
	<div class="loginbody">
		<span class="systemlogo"></span>
		<div class="loginbox loginbox2">
			<ul>
				<li><input name="username" id="username" type="text"
					class="loginuser" value="" onclick="JavaScript:this.value=''" /></li>
				<li><input name="password" id="password" type="password" class="loginpwd"
					value="" onclick="JavaScript:this.value=''" /></li>
				<li class="yzm">
				    <span><input name="" id="captcha" type="text" value="验证码" onclick="JavaScript:this.value=''"/></span>
				    <cite>
				    <img width="114" height="46" id="imgsrc" src="${contextpath}/captcha.htm?d='+new Date().getTime()" onclick="this.src='${contextpath}/captcha.htm?d='+new Date().getTime()"/>
					</cite> 
				</li>
				<li><input name="" type="button" class="loginbtn" value="登 录"
					onclick="login();" /><label><input type="checkbox" value="rememberMe" id="rememberMe" name="rememberMe"  />记住密码</label></li>
			</ul>
		</div>
	</div>
</body>

</html>
