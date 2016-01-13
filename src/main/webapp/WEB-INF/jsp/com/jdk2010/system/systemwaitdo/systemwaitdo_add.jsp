<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>代办事项</title>
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
    <li><a href="#">代办事项</a></li>
    </ul>
</div>
<div class="formbody">
<div id="usual1" class="usual"> 
    <div class="itab">
  	<ul> 
    <li><a href="#tab1" class="selected">代办事项添加</a></li> 
  	</ul>
</div> 
<div id="tab1" class="tabson">
  <ul class="forminfo">
  	<form action="" method="POST"  id="systemWaitdoForm">
									 
					 			   <li><label>id<b></b></label>
 			   <input  type="text" class="dfinput" id="id" name="systemWaitdo.id" placeholder="请输入id"  />
 			   </li>
 				       			 			   <li><label>栏目名称<b></b></label>
 			   <input  type="text" class="dfinput" id="name" name="systemWaitdo.name" placeholder="请输入栏目名称"  />
 			   </li>
 				       			 			   <li><label>代办事项名称<b></b></label>
 			   <input  type="text" class="dfinput" id="title" name="systemWaitdo.title" placeholder="请输入代办事项名称"  />
 			   </li>
 				       			 			   <li><label>创建时间<b></b></label>
 			   <input  type="text" class="dfinput" id="ctime" name="systemWaitdo.ctime" placeholder="请输入创建时间"  />
 			   </li>
 				       			 			   <li><label>状态<b></b></label>
 			   <input  type="text" class="dfinput" id="status" name="systemWaitdo.status" placeholder="请输入状态"  />
 			   </li>
 				       			 			   <li><label>user_id<b></b></label>
 			   <input  type="text" class="dfinput" id="userId" name="systemWaitdo.userId" placeholder="请输入user_id"  />
 			   </li>
 				       			 			   <li><label>类型<b></b></label>
 			   <input  type="text" class="dfinput" id="type" name="systemWaitdo.type" placeholder="请输入类型"  />
 			   </li>
 				       			 			   <li><label>目标ID<b></b></label>
 			   <input  type="text" class="dfinput" id="targetId" name="systemWaitdo.targetId" placeholder="请输入目标ID"  />
 			   </li>
 				        			<li><label>&nbsp;</label><input name="" type="submit" class="btn" value=" 确定"/>
    			&nbsp;&nbsp;
   			 <input name="" type="button" class="btn" value="返回" onclick="window.location='${ contextpath}/systemwaitdo/list'"/></li>
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
 			$('#systemWaitdoForm').on("click", ".doSubmit", function(e){
 				var a=$(e.delegateTarget).trigger("validate");
 			})
 			.validator({
 			    fields: {
 			    	 			    		 			    			'systemWaitdo.id':'required;',
 			    	     			    	 			    		 			    			'systemWaitdo.name':'required;',
 			    	     			    	 			    		 			    			'systemWaitdo.title':'required;',
 			    	     			    	 			    		 			    			'systemWaitdo.ctime':'required;',
 			    	     			    	 			    		 			    			'systemWaitdo.status':'required;',
 			    	     			    	 			    		 			    			'systemWaitdo.userId':'required;',
 			    	     			    	 			    		 			    			'systemWaitdo.type':'required;',
 			    	     			    	 			    		 			    			'systemWaitdo.targetId':'required;',
 			    	     			    	 			        
 			    },
 			   valid: function(form){
 				  var me = this;
 			        // 提交表单之前，hold住表单，防止重复提交
 			        me.holdSubmit();
 			        $.ajax({
 			            url:"${ contextpath}/systemwaitdo/addaction",
 			            data: $(form).serialize(),
 			            type: "POST",
 			            success: function(data){
 			                // 提交表单成功后，释放hold，如果不释放hold，就变成了只能提交一次的表单
 			                me.holdSubmit(false);
 			                if(data.status=='success'){
 			                	sAlert('当前操作成功');
 			                	sOpen('${ contextpath}/systemwaitdo/list');
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
 