<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.tag.mytag.com" prefix="page"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新闻管理</title>
<link href="${ contextpath }/res/css/style.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="${ contextpath }/res/js/jquery.js"></script>
<script type="text/javascript"
	src="${ contextpath }/res/js/layer/layer.js"></script>
<script type="text/javascript" src="${ contextpath }/res/js/common.js"></script>
<link rel="stylesheet" href="${ contextpath }/res/js/validator-0.7.3/jquery.validator.css">
	<script type="text/javascript"
		src="${ contextpath }/res/js/validator-0.7.3/jquery.validator.js"></script>
	<script type="text/javascript"
		src="${ contextpath }/res/js/validator-0.7.3/local/zh_CN.js"></script>
	<link href="${ contextpath }/res/css/select.css" rel="stylesheet"
		type="text/css" />
	<script type="text/javascript"
		src="${ contextpath }/res/js/select-ui.min.js"></script>
<link rel="stylesheet" href="${ contextpath }/res/js/kindeditor-4.1.7/themes/default/default.css" />
<script src="${ contextpath }/res/js/kindeditor-4.1.7/kindeditor.js"></script>
<script src="${ contextpath }/res/js/kindeditor-4.1.7/lang/zh_CN.js"></script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a></li>
			<li><a href="#">${menu.name }</a></li>
			<c:if test="${news_type=='ZYHD' }"><li><a href="#">重要活动</a></li></c:if>
			<c:if test="${news_type=='ZYJH' }"><li><a href="#">重要讲话</a></li></c:if>
			<c:if test="${news_type=='MTBD' }"><li><a href="#">媒体报道</a></li></c:if>
					<li><a href="#">新增</a></li>
		</ul>
		
	</div>
	<div class="formbody">
		<div id="usual1" class="usual">
  
			<div id="tab1" class="tabson" style="">
				<ul class="forminfo">
					<form action="" method="post" id="securityNewsForm">
					<input  name="news_type" value="${news_type }" type="hidden" />
					<input type="hidden" id="menuId" name="menuId" value="${menu.id }"/>
						
						<li><label>&nbsp;<b></b></label>
 						<input name=""
							type="button" class="btn" value="返回"
							onclick="window.location='${ contextpath}/securitynews/list.htm?id=${menu.id }&news_type=${news_type }'" />
 						
 						</li>
 						<li>
 						<label>所属标签<b></b></label>
 						<div class="vocation">
 						<select  id="bq_id" name="bq_id" class="select1">
 						<c:forEach var="bq" items="${bqList }" >
 						
 							<option value="${bq.id }" >${bq.name }</option>
 						</c:forEach>
 						
 						</select>
 						</div>
 						</li>
						<li><label>标题<b></b></label> <input type="text"
							class="dfinput" id="title" name="securityNews.title"
							placeholder="请输入标题" /></li>
						<li><label>seo关键字<b></b></label> <input type="text"
							class="dfinput" id="keywords" name="securityNews.keywords"
							placeholder="请输入关键字" /></li>
						<li><label>系统来源<b></b></label> <input type="text"
							class="dfinput" id="newsFrom" name="securityNews.newsFrom"
							placeholder="请输入系统来源" /></li>
						<li><label>简略标题<b></b></label> <input type="text"
							class="dfinput" id="litterTitle" name="securityNews.litterTitle"
							placeholder="" /></li>
						<li><label>缩略图<b></b></label> <input type="text"
							class="dfinput" id="smallimg" name="securityNews.smallimg"
							placeholder="" />
							<input type="button" id="smallimgBtn" value="图片上传" onclick="" class="btn"/>
							<img id="smallimgShow" height="30" width="30" style="vertical-align:middle;"   src="${contextpath }/res/images/d05.png"/><i>建议尺寸：400*280</i>
							</li>
						<li><label>首页图<b></b></label> <input type="text"
							class="dfinput" id="indeximg" name="securityNews.indeximg"
							placeholder="" />
							<input type="button"   value="图片上传" id="indeximgBtn" class="btn"/>
							<img id="indeximgShow" height="30" width="30" style="vertical-align:middle;"    src="${contextpath }/res/images/d05.png"/><i>建议尺寸：400*280</i>
							</li>
						<li><label><b>&nbsp;</b></label>
						<input type="checkbox" name="indexStatus"/>是否首页显示 &nbsp;&nbsp;<input type="checkbox" name="topStatus"/>是否置顶
						</li>
						 
						<li><label>跳转URL<b></b></label> <input type="text"
							class="dfinput" id="url" name="securityNews.url"
							placeholder="" />
							<input type="checkbox" name="jumpType"/>页内跳转
							</li>
						<li><label>排序<b></b></label> <input type="text"
							class="dfinput" id="orderlist" name="securityNews.orderlist"
							placeholder="" value="1"/></li>
						<li><label>阅读权限<b></b></label>
						<div class="vocation">
								<select name="securityNews.readType" class="select1">
									<option value="1">会员</option>
									<option value="0" selected>全部</option>
								</select>
							</div>
						
						</li>
						<li><label>内容摘要<b></b></label> 
							<textarea cols="60" rows="20" name="securityNews.abstractContent" id="abstractContent" style="padding: 1px;height:100px;line-height:16px" class="dfinput"></textarea>
							</li>
						<div id="defaultDiv">
						
						
						<li><label>内容详情<b></b></label> <textarea id="content"
								name="securityNews.content"
								style="width: 700px; height: 250px; visibility: hidden;"></textarea>
						</li>
						</div>
						<c:if test="${news_type=='' }">
						<li><label>全景控件url<b></b></label>
						 <input type="text"
							class="dfinput" id="quanjingUrl" name="securityNews.quanjingUrl"
							placeholder="" />
						
						</li>
						
						<li><label>&nbsp;<b></b></label> 
						<input type="checkbox" name="maodianStatus" onclick="isShowMaodian();"/>是否启用锚点
						</li>
						<li style="display:none" id="showMaodian"><label>&nbsp;<b></b></label> 
						<input name=""
							type="button" class="btn" value="添加锚点" onclick="addMaodian()" />
						</li>
						</c:if>
 						<div id="maodianDiv">
 						</div>
						<input type="hidden" value="" name="review_status"  id="review_status"/>
						<li><label>&nbsp;</label><input id="submitbtn" name="" type="submit"
							class="btn" value=" 确定" /> &nbsp;&nbsp;
							 <c:if test="${shenheFlag=='1' }">
							<input name="" type="button"
							class="btn" value="审核通过" onclick="shenhe();"/> &nbsp;&nbsp; 
							</c:if>
							<input name=""
							type="button" class="btn" value="返回"
							onclick="window.location='${ contextpath}/securitynews/list.htm?id=${menu.id }&news_type=${news_type }'" /></li>
						<input type="hidden"  value="0" id="incId" name="incId"/>
					</form>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	$("#abstractContent").html("");
	function isShowMaodian(){
		 var checkbox = $("input[name='maodianStatus']");
		  
		 if($("input[name='maodianStatus']").prop("checked")){
			 $("#showMaodian").css("display","");
			 $("#maodianDiv").css("display","");
			 $("#defaultDiv").css("display","none");
			 $("#abstractContent").val("");
			 
		 }else{
			 $("#showMaodian").css("display","none");
			 $("#maodianDiv").css("display","none");
			 $("#defaultDiv").css("display","");
		 }
	}
	</script>


<script type="text/javascript">
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="securityNews.content"]', {
			allowFileManager : true
		});
	});
	function shenhe(){
		$("#review_status").val("1");
		$("#submitbtn").click();	
	}
	KindEditor.ready(function(K) {
		var editor = K.editor({
			allowFileManager : true
		});
		K('#smallimgBtn').click(function() {
			editor.loadPlugin('image', function() {
				editor.plugin.imageDialog({
					showRemote : false,
					imageUrl : K('#smallimg').val(),
					clickFn : function(url, title, width, height, border, align) {
						K('#smallimg').val(url);
						document.getElementById("smallimgShow").src=url;
						editor.hideDialog();
					}
				});
			});
		});
		K('#indeximgBtn').click(function() {
			editor.loadPlugin('image', function() {
				editor.plugin.imageDialog({
					showRemote : false,
					imageUrl : K('#indeximg').val(),
					clickFn : function(url, title, width, height, border, align) {
						K('#indeximg').val(url);
						document.getElementById("indeximgShow").src=url;
						editor.hideDialog();
					}
				});
			}); 
		});
		K('#fileBtn').click(function() {
			
			editor.loadPlugin('image', function() {
				editor.plugin.imageDialog({
					showRemote : false,
					imageUrl : K('#indeximg').val(),
					clickFn : function(url, title, width, height, border, align) {
						K('#indeximg').val(url);
						document.getElementById("indeximgShow").src=url;
						editor.hideDialog();
					}
				});
			});
		});
		
		
	});
	
	
	
	$(document)
			.ready(
					function() {
						$(".select1").uedSelect({
							width : 345
						});
						$('#securityNewsForm')
								.on(
										"click",
										".doSubmit",
										function(e) {
											var a = $(e.delegateTarget)
													.trigger("validate");
										})
								.validator(
										{
											fields : {
												'securityNews.title' : 'required;'

											},
											valid : function(form) {
												var me = this;
												// 提交表单之前，hold住表单，防止重复提交
												document.getElementById("content").value=editor.html();
												 
												$.ajax({
															url : "${ contextpath}/securitynews/addaction",
															data : $(form)
																	.serialize(),
															type : "post",
															success : function(
																	data) {
																// 提交表单成功后，释放hold，如果不释放hold，就变成了只能提交一次的表单
																me
																		.holdSubmit(false);
																if (data.status == 'success') {

																	 	alert('当前操作成功');
																		window.location.href = '${ contextpath}/securitynews/list.htm?id=${menu.id }&news_type=${news_type}';
																				 

																} else {
																	sAlert('当前操作失败');
																}

															}
														});
											}
										});

					});
	function addMaodian(){
		var incId=$("#incId").val();
		var newId=parseInt(incId)+1;
		var textAreaId="textArea"+newId;
		var divId="div"+newId;
		var str="<div id=\""+divId+"\"><li><label>锚点名称<b></b></label> <input type=\"text\" class=\"dfinput\"  name=\"maodianName\"  value=\"\"/>&nbsp;&nbsp;<input name=\"\" type=\"button\" class=\"btn\" value=\"删除\" onclick=\"deleteMaodian('"+divId+"')\" /></li><li><label>锚点内容<b></b></label> <textarea id=\""+textAreaId+"\" name=\"maodianContent\" style=\"width: 700px; height: 250px; visibility: hidden;\"></textarea></li></div>";
		$("body").height();
		$("#maodianDiv").append(str);
		$("#incId").val(newId);
		resizeHeight();
		KindEditor.create('textarea[id="'+textAreaId+'"]', {
			allowFileManager : true,
			afterBlur:function(){this.sync();}
		});
		
	}
	
	function deleteMaodian(id){
		$("#"+id).remove();
	}
	function resizeHeight(){
		  var parentHeight=$('#rightFrame', parent.document).height();	 
		  var newHeight=parentHeight+350;
		  //alert(newHeight);
		  $('#rightFrame', parent.document).height((newHeight));
	}
</script>
