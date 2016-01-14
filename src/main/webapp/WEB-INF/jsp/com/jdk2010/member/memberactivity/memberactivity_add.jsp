<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>活动</title>
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
    <li><a href="#">活动</a></li>
    </ul>
</div>
<div class="formbody">
<div id="usual1" class="usual"> 
    <div class="itab">
  	<ul> 
    <li><a href="#tab1" class="selected">活动添加</a></li> 
  	</ul>
</div> 
<div id="tab1" class="tabson">
  <ul class="forminfo">
  	<form action="" method="post"  id="memberActivityForm">
									 
					 			   <li><label>id<b></b></label>
 			   <input  type="text" class="dfinput" id="id" name="memberActivity.id" placeholder="请输入id"  />
 			   </li>
 				       			 			   <li><label>活动标题<b></b></label>
 			   <input  type="text" class="dfinput" id="title" name="memberActivity.title" placeholder="请输入活动标题"  />
 			   </li>
 				       			 			   <li><label>litter_title<b></b></label>
 			   <input  type="text" class="dfinput" id="litterTitle" name="memberActivity.litterTitle" placeholder="请输入litter_title"  />
 			   </li>
 				       			 			   <li><label>通告内容<b></b></label>
 			   <input  type="text" class="dfinput" id="content" name="memberActivity.content" placeholder="请输入通告内容"  />
 			   </li>
 				       			 			   <li><label>用户id<b></b></label>
 			   <input  type="text" class="dfinput" id="userid" name="memberActivity.userid" placeholder="请输入用户id"  />
 			   </li>
 				       			 			   <li><label>活动状态全部、未开始、进行中、已结束<b></b></label>
 			   <input  type="text" class="dfinput" id="activityStatus" name="memberActivity.activityStatus" placeholder="请输入活动状态全部、未开始、进行中、已结束"  />
 			   </li>
 				       			 			   <li><label>是否启用<b></b></label>
 			   <input  type="text" class="dfinput" id="status" name="memberActivity.status" placeholder="请输入是否启用"  />
 			   </li>
 				       			 			   <li><label>创建时间<b></b></label>
 			   <input  type="text" class="dfinput" id="ctime" name="memberActivity.ctime" placeholder="请输入创建时间"  />
 			   </li>
 				       			 			   <li><label>缩略图<b></b></label>
 			   <input  type="text" class="dfinput" id="smallimg" name="memberActivity.smallimg" placeholder="请输入缩略图"  />
 			   </li>
 				       			 			   <li><label>首页图<b></b></label>
 			   <input  type="text" class="dfinput" id="indeximg" name="memberActivity.indeximg" placeholder="请输入首页图"  />
 			   </li>
 				       			 			   <li><label>url<b></b></label>
 			   <input  type="text" class="dfinput" id="url" name="memberActivity.url" placeholder="请输入url"  />
 			   </li>
 				       			 			   <li><label>排序<b></b></label>
 			   <input  type="text" class="dfinput" id="orderlist" name="memberActivity.orderlist" placeholder="请输入排序"  />
 			   </li>
 				       			 			   <li><label>摘要<b></b></label>
 			   <input  type="text" class="dfinput" id="abstractContent" name="memberActivity.abstractContent" placeholder="请输入摘要"  />
 			   </li>
 				       			 			   <li><label>0会员 1全部<b></b></label>
 			   <input  type="text" class="dfinput" id="joinType" name="memberActivity.joinType" placeholder="请输入0会员 1全部"  />
 			   </li>
 				       			 			   <li><label>是否首页<b></b></label>
 			   <input  type="text" class="dfinput" id="indexStatus" name="memberActivity.indexStatus" placeholder="请输入是否首页"  />
 			   </li>
 				       			 			   <li><label>是否置顶<b></b></label>
 			   <input  type="text" class="dfinput" id="topStatus" name="memberActivity.topStatus" placeholder="请输入是否置顶"  />
 			   </li>
 				       			 			   <li><label>0页面 1页外<b></b></label>
 			   <input  type="text" class="dfinput" id="jumpType" name="memberActivity.jumpType" placeholder="请输入0页面 1页外"  />
 			   </li>
 				       			 			   <li><label>menu_id<b></b></label>
 			   <input  type="text" class="dfinput" id="menuId" name="memberActivity.menuId" placeholder="请输入menu_id"  />
 			   </li>
 				       			 			   <li><label>0未处理 1通过 2 失败<b></b></label>
 			   <input  type="text" class="dfinput" id="reviewStatus" name="memberActivity.reviewStatus" placeholder="请输入0未处理 1通过 2 失败"  />
 			   </li>
 				       			 			   <li><label>review_userid<b></b></label>
 			   <input  type="text" class="dfinput" id="reviewUserid" name="memberActivity.reviewUserid" placeholder="请输入review_userid"  />
 			   </li>
 				       			 			   <li><label>review_time<b></b></label>
 			   <input  type="text" class="dfinput" id="reviewTime" name="memberActivity.reviewTime" placeholder="请输入review_time"  />
 			   </li>
 				       			 			   <li><label>review_reason<b></b></label>
 			   <input  type="text" class="dfinput" id="reviewReason" name="memberActivity.reviewReason" placeholder="请输入review_reason"  />
 			   </li>
 				       			 			   <li><label>是否支持报名<b></b></label>
 			   <input  type="text" class="dfinput" id="supportStatus" name="memberActivity.supportStatus" placeholder="请输入是否支持报名"  />
 			   </li>
 				       			 			   <li><label>开始时间<b></b></label>
 			   <input  type="text" class="dfinput" id="startTime" name="memberActivity.startTime" placeholder="请输入开始时间"  />
 			   </li>
 				       			 			   <li><label>截止时间<b></b></label>
 			   <input  type="text" class="dfinput" id="endTime" name="memberActivity.endTime" placeholder="请输入截止时间"  />
 			   </li>
 				        			<li><label>&nbsp;</label><input name="" type="submit" class="btn" value=" 确定"/>
    			&nbsp;&nbsp;
   			 <input name="" type="button" class="btn" value="返回" onclick="window.location='${ contextpath}/memberactivity/list'"/></li>
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
 			$('#memberActivityForm').on("click", ".doSubmit", function(e){
 				var a=$(e.delegateTarget).trigger("validate");
 			})
 			.validator({
 			    fields: {
 			    	 			    		 			    			'memberActivity.id':'required;',
 			    	     			    	 			    		 			    			'memberActivity.title':'required;',
 			    	     			    	 			    		 			    			'memberActivity.litterTitle':'required;',
 			    	     			    	 			    		 			    			'memberActivity.content':'required;',
 			    	     			    	 			    		 			    			'memberActivity.userid':'required;',
 			    	     			    	 			    		 			    			'memberActivity.activityStatus':'required;',
 			    	     			    	 			    		 			    			'memberActivity.status':'required;',
 			    	     			    	 			    		 			    			'memberActivity.ctime':'required;',
 			    	     			    	 			    		 			    			'memberActivity.smallimg':'required;',
 			    	     			    	 			    		 			    			'memberActivity.indeximg':'required;',
 			    	     			    	 			    		 			    			'memberActivity.url':'required;',
 			    	     			    	 			    		 			    			'memberActivity.orderlist':'required;',
 			    	     			    	 			    		 			    			'memberActivity.abstractContent':'required;',
 			    	     			    	 			    		 			    			'memberActivity.joinType':'required;',
 			    	     			    	 			    		 			    			'memberActivity.indexStatus':'required;',
 			    	     			    	 			    		 			    			'memberActivity.topStatus':'required;',
 			    	     			    	 			    		 			    			'memberActivity.jumpType':'required;',
 			    	     			    	 			    		 			    			'memberActivity.menuId':'required;',
 			    	     			    	 			    		 			    			'memberActivity.reviewStatus':'required;',
 			    	     			    	 			    		 			    			'memberActivity.reviewUserid':'required;',
 			    	     			    	 			    		 			    			'memberActivity.reviewTime':'required;',
 			    	     			    	 			    		 			    			'memberActivity.reviewReason':'required;',
 			    	     			    	 			    		 			    			'memberActivity.supportStatus':'required;',
 			    	     			    	 			    		 			    			'memberActivity.startTime':'required;',
 			    	     			    	 			    		 			    			'memberActivity.endTime':'required;',
 			    	     			    	 			        
 			    },
 			   valid: function(form){
 				  var me = this;
 			        // 提交表单之前，hold住表单，防止重复提交
 			        me.holdSubmit();
 			        $.ajax({
 			            url:"${ contextpath}/memberactivity/addaction",
 			            data: $(form).serialize(),
 			            type: "POST",
 			            success: function(data){
 			                // 提交表单成功后，释放hold，如果不释放hold，就变成了只能提交一次的表单
 			                me.holdSubmit(false);
 			                if(data.status=='success'){
 			                	parent.layer.alert('当前操作成功', {
								closeBtn: 0
								}, function(index){
									window.location.href='${ contextpath}/memberactivity/list';
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
 