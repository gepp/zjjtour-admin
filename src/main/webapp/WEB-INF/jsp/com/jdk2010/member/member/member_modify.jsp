<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员</title>
<link href="${ contextpath }/res/css/style.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript" src="${ contextpath }/res/js/jquery.js"></script>
<script type="text/javascript" src="${ contextpath }/res/js/layer/layer.js"></script>
<script type="text/javascript" src="${ contextpath }/res/js/common.js"></script>
<link rel="stylesheet" href="${ contextpath }/res/js/validator-0.7.3/jquery.validator.css">
<script type="text/javascript" src="${ contextpath }/res/js/validator-0.7.3/jquery.validator.js"></script>
<script type="text/javascript" src="${ contextpath }/res/js/validator-0.7.3/local/zh_CN.js"></script>
		<link href="${ contextpath }/res/css/select.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${ contextpath }/res/js/select-ui.min.js"></script>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">会员</a></li>
    </ul>
</div>
<div class="formbody">
<div id="usual1" class="usual"> 
    <div class="itab">
  	<ul> 
    <li><a href="#tab1" class="selected">会员编辑</a></li> 
  	</ul>
</div> 
<div id="tab1" class="tabson">
  <ul class="forminfo">
  <form action="" method="post"  id="memberForm">
									 
					 			   <li><label>id<b></b></label>
 			   <input  type="text" class="dfinput" id="id" name="member.id" placeholder="请输入id" value="${ member.id}" />
 			   </li>
 				       			 			   <li><label>会员名称<b></b></label>
 			   <input  type="text" class="dfinput" id="nickname" name="member.nickname" placeholder="请输入会员名称" value="${ member.nickname}" />
 			   </li>
 				       			 			   <li><label>邮箱<b></b></label>
 			   <input  type="text" class="dfinput" id="email" name="member.email" placeholder="请输入邮箱" value="${ member.email}" />
 			   </li>
 				       			 			   <li><label>手机<b></b></label>
 			   <input  type="text" class="dfinput" id="mobile" name="member.mobile" placeholder="请输入手机" value="${ member.mobile}" />
 			   </li>
 				       			 			   <li><label>真实姓名<b></b></label>
 			   <input  type="text" class="dfinput" id="realname" name="member.realname" placeholder="请输入真实姓名" value="${ member.realname}" />
 			   </li>
 				       			 			   <li><label>性别<b></b></label>
 			   <input  type="text" class="dfinput" id="sex" name="member.sex" placeholder="请输入性别" value="${ member.sex}" />
 			   </li>
 				       			 			   <li><label>启用标志<b></b></label>
 			   <input  type="text" class="dfinput" id="status" name="member.status" placeholder="请输入启用标志" value="${ member.status}" />
 			   </li>
 				       			 			   <li><label>创建时间<b></b></label>
 			   <input  type="text" class="dfinput" id="ctime" name="member.ctime" placeholder="请输入创建时间" value="${ member.ctime}" />
 			   </li>
 				        			<li><label>&nbsp;</label><input name="" type="submit" class="btn" value=" 确定"/>
    			&nbsp;&nbsp;
   			 <input name="" type="button" class="btn" value="返回" onclick="window.location='${ contextpath}/member/list'"/></li>
 	</form>
  </ul>
 </div>
 </div>  
</div>
</body>
</html>
  <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

 
 <script type="text/javascript">

 
 	$(document).ready(
 		function(){
 		  $(".select1").uedSelect({
				width : 345			  
			});
 			$('#memberForm').on("click", ".doSubmit", function(e){
 				var a=$(e.delegateTarget).trigger("validate");
 			})
 			.validator({
 			    fields: {
 			    	 			    		 			    			'member.id':'required;',
 			    	     			    	 			    		 			    			'member.nickname':'required;',
 			    	     			    	 			    		 			    			'member.email':'required;',
 			    	     			    	 			    		 			    			'member.mobile':'required;',
 			    	     			    	 			    		 			    			'member.realname':'required;',
 			    	     			    	 			    		 			    			'member.sex':'required;',
 			    	     			    	 			    		 			    			'member.status':'required;',
 			    	     			    	 			    		 			    			'member.ctime':'required;',
 			    	     			    	 			        
 			    },
 			   valid: function(form){
 				  var me = this;
 			        // 提交表单之前，hold住表单，防止重复提交
 			        me.holdSubmit();
 			        $.ajax({
 			            url: "${ contextpath}/member/modifyaction",
 			            data: $(form).serialize(),
 			            type: "POST",
 			            success: function(data){
 			                // 提交表单成功后，释放hold，如果不释放hold，就变成了只能提交一次的表单
 			                me.holdSubmit(false);
 			                if(data.status=='success'){
 			                	parent.layer.alert('当前操作成功', {
								}, function(index){
									window.location.href='${ contextpath}/member/list';
									parent.layer.close(index);
								});
 			                }else{
 			                	sAlert('当前操作失败');
 			                }
 			               
 			            }
 			        });
 			    }
 			})
 			;
 		 
 		}		
 	);
 </script>
 