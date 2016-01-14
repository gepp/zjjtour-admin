<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>通知公告</title>
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
    <li><a href="#">通知公告</a></li>
    </ul>
</div>
<div class="formbody">
<div id="usual1" class="usual"> 
    <div class="itab">
  	<ul> 
    <li><a href="#tab1" class="selected">通知公告添加</a></li> 
  	</ul>
</div> 
<div id="tab1" class="tabson">
  <ul class="forminfo">
  	<form action="" method="post"  id="securityNewsForm">
									 
					 			   <li><label>id<b></b></label>
 			   <input  type="text" class="dfinput" id="id" name="securityNews.id" placeholder="请输入id"  />
 			   </li>
 				       			 			   <li><label>通告标题<b></b></label>
 			   <input  type="text" class="dfinput" id="title" name="securityNews.title" placeholder="请输入通告标题"  />
 			   </li>
 				       			 			   <li><label>通告内容<b></b></label>
 			   <input  type="text" class="dfinput" id="content" name="securityNews.content" placeholder="请输入通告内容"  />
 			   </li>
 				       			 			   <li><label>用户id<b></b></label>
 			   <input  type="text" class="dfinput" id="userid" name="securityNews.userid" placeholder="请输入用户id"  />
 			   </li>
 				       			 			   <li><label>是否启用<b></b></label>
 			   <input  type="text" class="dfinput" id="status" name="securityNews.status" placeholder="请输入是否启用"  />
 			   </li>
 				       			 			   <li><label>创建时间<b></b></label>
 			   <input  type="text" class="dfinput" id="ctime" name="securityNews.ctime" placeholder="请输入创建时间"  />
 			   </li>
 				        			<li><label>&nbsp;</label><input name="" type="submit" class="btn" value=" 确定"/>
    			&nbsp;&nbsp;
   			 <input name="" type="button" class="btn" value="返回" onclick="window.location='${ contextpath}/securitynews/list'"/></li>
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
 			$('#securityNewsForm').on("click", ".doSubmit", function(e){
 				var a=$(e.delegateTarget).trigger("validate");
 			})
 			.validator({
 			    fields: {
 			    	 			    		 			    			'securityNews.id':'required;',
 			    	     			    	 			    		 			    			'securityNews.title':'required;',
 			    	     			    	 			    		 			    			'securityNews.content':'required;',
 			    	     			    	 			    		 			    			'securityNews.userid':'required;',
 			    	     			    	 			    		 			    			'securityNews.status':'required;',
 			    	     			    	 			    		 			    			'securityNews.ctime':'required;',
 			    	     			    	 			        
 			    },
 			   valid: function(form){
 				  var me = this;
 			        // 提交表单之前，hold住表单，防止重复提交
 			        me.holdSubmit();
 			        $.ajax({
 			            url:"${ contextpath}/securitynews/addaction",
 			            data: $(form).serialize(),
 			            type: "POST",
 			            success: function(data){
 			                // 提交表单成功后，释放hold，如果不释放hold，就变成了只能提交一次的表单
 			                me.holdSubmit(false);
 			                if(data.status=='success'){
 			                	parent.layer.alert('当前操作成功', {
								closeBtn: 0
								}, function(index){
									window.location.href='${ contextpath}/securitynews/list';
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
 