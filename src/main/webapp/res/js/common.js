function sAlert(msg){
	parent.layer.alert(msg
	);
}
function sMsg(msg){
	parent.layer.msg(msg);
}
 

function sOpen(url){
	setTimeout(
     		function(){
     			window.location.href=url;
     		},1200
     );
}
function closeChild(){
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.close(index);
}
function table_init(action_base_url,action_query_url){
	//action_base_url是action的url action_query_url是查询的URL
	  $("#checkAll").click(function() {
 		    $('input[name="subBox"]').prop("checked",$("#checkAll").prop("checked"));
		  });
 
	//删除按钮业务处理
	$("#table_delete").click(
		function()
		{
			var del_ids="" ;
			var count=0;
			var checkbox = $("input[name='subBox']");
			checkbox.each(function() {
				if (this.checked) {
					del_ids += this.value+",";
					count=count+1;
				}
			});
			if(count==0){
				sAlert('请选择要删除的数据！');
			}
			
			else{
				parent.layer.confirm('您确认删除您所选择的'+count+'条数据么？',function(index){
					//ajax提交删除数据
					jQuery.ajax({
								type: "post", 
								url: action_base_url+"/delete", 
								dataType: "json",
								data:{action:'delete',ids:del_ids},
								success: function (data) { 
									parent.layer.close(index);
									if(data.status=='success'){
										parent.layer.alert('当前操作成功', {
											closeBtn: 0
										}, function(index){
											parent.layer.close(index);
											window.location.href=action_query_url;
										});
									}else{
										parent.layer.close(index);
										parent.layer.alert(data.message, {
											closeBtn: 0
										}, function(index){
											parent.layer.close(index);
											window.location.href=action_query_url;
										});
									}
									
									 
								} 
						});
				});
			 
			}
		}
	);
	
	 
	
	//修改按钮业务处理
	$("#table_edit").click(
		function()
		{
			var a=0;
			var id="" ;
			var checkbox = $("input[name='subBox']");
			checkbox.each(function() {
				if (this.checked) {
					id = this.value;
					a++;
				}
			});
			if(id==""){
				layer.alert("请选择要修改的记录!");
			}else{
			if(a!=1){
				layer.alert("请选择一条要修改的记录!");
			}else{
				window.location.href=action_base_url+"/modify?id="+id;
				}
			}
		}
	);
	
	//新增按钮业务处理
	$("#table_add").click(
			function()
			{
				window.location.href=action_base_url+"/add";
			}
	);
	//刷新按钮业务处理
	$("#table_refresh").click(
			function()
			{
				window.location.href=action_query_url;
			}
	);
	$(".modifyIcon").click(
			function(){
				 
				window.location.href=action_base_url+"/modify?id="+$(this).attr("value");
			}
	);
	$(".deleteIcon").click(
			function(){
				var id=($(this).attr("value"));
				layer.confirm('您确认删除您所选择的这条数据么？',function(index){
					//ajax提交删除数据
					$.ajax({
								type: "post", 
								url: action_base_url+"/delete", 
								dataType: "json",
								data:{action:'delete',ids:id},
								success: function (data) { 
									layer.alert(data.message);
									sOpen(action_query_url);
								} 
						});
				});
			}
	);
	
}
function json2str(j){
	return JSON.stringify(j);
}
function str2json(s){
	return JSON.parse(s);
}
function ssAlert(str) {
	var msgw, msgh, bordercolor;
	msgw = 400;//提示窗口的宽度
	msgh = 100;//提示窗口的高度
	titleheight = 25 //提示窗口标题高度
	bordercolor = "#c51100";//提示窗口的边框颜色
	titlecolor = "#c51100";//提示窗口的标题颜色
	var sWidth, sHeight;
	sWidth = screen.width;
	sHeight = screen.height;
	var bgObj = document.createElement("div");
	bgObj.setAttribute('id', 'bgDiv');
	bgObj.style.position = "absolute";
	bgObj.style.top = "0";
	bgObj.style.background = "#cccccc";
	bgObj.style.filter = "progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75";
	bgObj.style.opacity = "0.6";
	bgObj.style.left = "0";
	bgObj.style.width = sWidth + "px";
	bgObj.style.height = sHeight + "px";
	bgObj.style.zIndex = "10000";
	document.body.appendChild(bgObj);

	var msgObj = document.createElement("div")
	msgObj.setAttribute("id", "msgDiv");
	msgObj.setAttribute("align", "center");
	msgObj.style.background = "white";
	msgObj.style.border = "1px solid " + bordercolor;
	msgObj.style.position = "absolute";
	msgObj.style.left = "50%";
	msgObj.style.top = "50%";
	msgObj.style.font = "12px/1.6em Verdana, Geneva, Arial, Helvetica, sans-serif";
	msgObj.style.marginLeft = "-225px";
	msgObj.style.marginTop = -75 + document.documentElement.scrollTop
			+ "px";
	msgObj.style.width = msgw + "px";
	msgObj.style.height = msgh + "px";
	msgObj.style.textAlign = "center";
	msgObj.style.lineHeight = "25px";
	msgObj.style.zIndex = "10001";

	var title = document.createElement("h4");
	title.setAttribute("id", "msgTitle");
	title.setAttribute("align", "right");
	title.style.margin = "0";
	title.style.padding = "3px";
	title.style.background = bordercolor;
	title.style.filter = "progid:DXImageTransform.Microsoft.Alpha(startX=20, startY=20, finishX=100, finishY=100,style=1,opacity=75,finishOpacity=100);";
	title.style.opacity = "0.75";
	title.style.border = "1px solid " + bordercolor;
	title.style.height = "18px";
	title.style.font = "12px Verdana, Geneva, Arial, Helvetica, sans-serif";
	title.style.color = "white";
	title.style.cursor = "pointer";
	/*title.innerHTML="关闭";
	title.onclick=function(){
	document.body.removeChild(bgObj);
	document.getElementById("msgDiv").removeChild(title);
	document.body.removeChild(msgObj);
	     }*/
	document.body.appendChild(msgObj);
	document.getElementById("msgDiv").appendChild(title);
	var txt = document.createElement("p");
	txt.style.margin = "1em 0"
	txt.setAttribute("id", "msgTxt");
	txt.innerHTML = str;
	document.getElementById("msgDiv").appendChild(txt);
}
function div_close() {
	var bgObj = document.getElementById("bgDiv");
	var msgObj = document.getElementById("msgDiv");
	document.body.removeChild(bgObj);
	document.body.removeChild(msgObj);
}
function trim(str){ //删除左右两端的空格
    return str.replace(/(^\s*)|(\s*$)/g, "");
}
function ltrim(str){ //删除左边的空格
    return str.replace(/(^\s*)/g,"");
}
function rtrim(str){ //删除右边的空格
    return str.replace(/(\s*$)/g,"");
}
