<!DOCTYPE html>
<html lang="zh-cn"><head>
<%@page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<title>Artoria's Home</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
%>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="SHORTCUT ICON" href="static/img/NRO.ico">
<link href="static/css/common.css" rel="stylesheet">
<link href="static/plugin/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />

</head>
<body class="bd">
	<div class="adminbody">
		<div class="adminheader"></div>
		<jsp:include page="../common/left.jsp"></jsp:include>
		<div class="container">
			<div class="adminright">
				<form  class="form-horizontal" id="formMenu">
					<div class="row">
						<br />
						
						<div class="form-group">
							<label class="col-sm-2 control-label" >随笔内容</label>
							<div class="col-sm-8">
								<script id="container" name="content" type="text/plain" style="height:400px;" >${data.essaysValue}</script>
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-sm-5"></div>
							<div class="col-sm-5" >
								<input class="btn btn-primary" type="button" id="save" value="提交" >
							</div>
						</div>
						<input type="hidden" id="id" name="id" value="${data.essaysId }">
					</div>
				</form>
			</div>
		</div>
	</div>
<script type="text/javascript" src="static/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="baidu/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="baidu/ueditor/ueditor.all.js"></script>
 <script type="text/javascript">
	var ue = UE.getEditor('container');
	
	$(function(){
		
		$("#save").click(function(){
			 var dataJson= $("#formMenu").serializeArray();
			$.ajax({
				url:"admin/essays/modify",
				type:"post",
				data:dataJson,
				dataType: "json",
				success:function(data){
					if(data.msg="success"){
						alert("修改成功");
						window.location="admin/essays"
					}
				}
			})
		})
		
	})
	
</script>
</body>
</html>