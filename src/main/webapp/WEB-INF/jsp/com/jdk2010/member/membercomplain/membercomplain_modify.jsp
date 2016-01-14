<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员投诉</title>
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
    <li><a href="#">会员投诉</a></li>
    </ul>
</div>
<div class="formbody">
<div id="usual1" class="usual"> 
    <div class="itab">
  	<ul> 
    <li><a href="#tab1" class="selected">会员投诉编辑</a></li> 
  	</ul>
</div> 
<div id="tab1" class="tabson">
  <ul class="forminfo">
  <form action="" method="post"  id="memberComplainForm">
									 
					 			   <li><label>id<b></b></label>
 			   <input  type="text" class="dfinput" id="id" name="memberComplain.id" placeholder="请输入id" value="${ memberComplain.id}" />
 			   </li>
 				       			 			   <li><label>会员ID<b></b></label>
 			   <input  type="text" class="dfinput" id="memberId" name="memberComplain.memberId" placeholder="请输入会员ID" value="${ memberComplain.memberId}" />
 			   </li>
 				       			 			   <li><label>会员手机<b></b></label>
 			   <input  type="text" class="dfinput" id="memberMobile" name="memberComplain.memberMobile" placeholder="请输入会员手机" value="${ memberComplain.memberMobile}" />
 			   </li>
 				       			 			   <li><label>会员姓名<b></b></label>
 			   <input  type="text" class="dfinput" id="memberName" name="memberComplain.memberName" placeholder="请输入会员姓名" value="${ memberComplain.memberName}" />
 			   </li>
 				       			 			   <li><label>投诉内容<b></b></label>
 			   <input  type="text" class="dfinput" id="complainMessage" name="memberComplain.complainMessage" placeholder="请输入投诉内容" value="${ memberComplain.complainMessage}" />
 			   </li>
 				       			 			   <li><label>投诉时间<b></b></label>
 			   <input  type="text" class="dfinput" id="complainTime" name="memberComplain.complainTime" placeholder="请输入投诉时间" value="${ memberComplain.complainTime}" />
 			   </li>
 				       			 			   <li><label>回复状态<b></b></label>
 			   <input  type="text" class="dfinput" id="replayStatus" name="memberComplain.replayStatus" placeholder="请输入回复状态" value="${ memberComplain.replayStatus}" />
 			   </li>
 				       			 			   <li><label>回复人id<b></b></label>
 			   <input  type="text" class="dfinput" id="replayUserid" name="memberComplain.replayUserid" placeholder="请输入回复人id" value="${ memberComplain.replayUserid}" />
 			   </li>
 				       			 			   <li><label>回复时间<b></b></label>
 			   <input  type="text" class="dfinput" id="replayTime" name="memberComplain.replayTime" placeholder="请输入回复时间" value="${ memberComplain.replayTime}" />
 			   </li>
 				       			 			   <li><label>回复内容<b></b></label>
 			   <input  type="text" class="dfinput" id="replayMessage" name="memberComplain.replayMessage" placeholder="请输入回复内容" value="${ memberComplain.replayMessage}" />
 			   </li>
 				       			 			   <li><label>审核状态<b></b></label>
 			   <input  type="text" class="dfinput" id="reviewStatus" name="memberComplain.reviewStatus" placeholder="请输入审核状态" value="${ memberComplain.reviewStatus}" />
 			   </li>
 				       			 			   <li><label>审核人id<b></b></label>
 			   <input  type="text" class="dfinput" id="reviewUserid" name="memberComplain.reviewUserid" placeholder="请输入审核人id" value="${ memberComplain.reviewUserid}" />
 			   </li>
 				       			 			   <li><label>审核时间<b></b></label>
 			   <input  type="text" class="dfinput" id="reviewTime" name="memberComplain.reviewTime" placeholder="请输入审核时间" value="${ memberComplain.reviewTime}" />
 			   </li>
 				       			 			   <li><label>审核意见<b></b></label>
 			   <input  type="text" class="dfinput" id="reviewMessage" name="memberComplain.reviewMessage" placeholder="请输入审核意见" value="${ memberComplain.reviewMessage}" />
 			   </li>
 				        			<li><label>&nbsp;</label><input name="" type="submit" class="btn" value=" 确定"/>
    			&nbsp;&nbsp;
   			 <input name="" type="button" class="btn" value="返回" onclick="window.location='${ contextpath}/membercomplain/list'"/></li>
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
 			$('#memberComplainForm').on("click", ".doSubmit", function(e){
 				var a=$(e.delegateTarget).trigger("validate");
 			})
 			.validator({
 			    fields: {
 			    	 			    		 			    			'memberComplain.id':'required;',
 			    	     			    	 			    		 			    			'memberComplain.memberId':'required;',
 			    	     			    	 			    		 			    			'memberComplain.memberMobile':'required;',
 			    	     			    	 			    		 			    			'memberComplain.memberName':'required;',
 			    	     			    	 			    		 			    			'memberComplain.complainMessage':'required;',
 			    	     			    	 			    		 			    			'memberComplain.complainTime':'required;',
 			    	     			    	 			    		 			    			'memberComplain.replayStatus':'required;',
 			    	     			    	 			    		 			    			'memberComplain.replayUserid':'required;',
 			    	     			    	 			    		 			    			'memberComplain.replayTime':'required;',
 			    	     			    	 			    		 			    			'memberComplain.replayMessage':'required;',
 			    	     			    	 			    		 			    			'memberComplain.reviewStatus':'required;',
 			    	     			    	 			    		 			    			'memberComplain.reviewUserid':'required;',
 			    	     			    	 			    		 			    			'memberComplain.reviewTime':'required;',
 			    	     			    	 			    		 			    			'memberComplain.reviewMessage':'required;',
 			    	     			    	 			        
 			    },
 			   valid: function(form){
 				  var me = this;
 			        // 提交表单之前，hold住表单，防止重复提交
 			        me.holdSubmit();
 			        $.ajax({
 			            url: "${ contextpath}/membercomplain/modifyaction",
 			            data: $(form).serialize(),
 			            type: "POST",
 			            success: function(data){
 			                // 提交表单成功后，释放hold，如果不释放hold，就变成了只能提交一次的表单
 			                me.holdSubmit(false);
 			                if(data.status=='success'){
 			                	parent.layer.alert('当前操作成功', {
								}, function(index){
									window.location.href='${ contextpath}/membercomplain/list';
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
 