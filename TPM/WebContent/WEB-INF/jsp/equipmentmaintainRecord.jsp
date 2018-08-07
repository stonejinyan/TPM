<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- The above 2 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="stonejinyan">

<!-- Note there is no responsive meta tag here -->

<link rel="icon" href="image/favicon.ico">

<title>TPM</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/custom.css" rel="stylesheet">
<link href="css/login.css" rel="stylesheet">
<link href="css/insertequipment.css" rel="stylesheet">
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/non-responsive.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="js/html5shiv.min.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<%@include file="head.jsp"%>
	<br>
	<div class="">
		<div class="insertEP">
			<table
				class="table table-striped table-bordered table-hover table-condensed insertEP">
				<tr>
					<td class="text-center">序号</td>
					<td class="text-center">设备编号</td>
					<td class="text-center">设备名称</td>
					<td class="text-center">维修区域</td>
					<td class="text-center">问题描述</td>
					<td class="text-center">处置方法</td>
					<td class="text-center">维修人员</td>
					<!--  
					<td >环境影响度</td>
					<td >产量影响度</td>
					<td >设备复杂度</td>
					<td >设备制造渠道</td>
					<td >设备总价</td>
					-->
					<td class="text-center">维修类别</td>
					<td class="text-center">实际耗时</td>
					<td class="text-center">维修时间</td>
					<td class="text-center">操作</td>
				</tr>
				<s:iterator value="equipmentMaintainRecord">
				<tr>
					<td class="text-center">${id}</td>
					<td class="text-center">${epid}</td>
					<td class="text-center">${epname}</td>
					<td class="text-center">${areaname}</td>
					<td class="text-center">${question_description}</td>
					<td class="text-center">${process_description}</td>
					<td class="text-center">${staffname}</td>
					<!-- 
					<td >${environmental_impact}</td>
					<td >${output_impact}</td>
					<td >${ep_complexity}</td>
					<td >${ep_manufacturing_channel}</td>
					<td >${ep_cost}</td>
					-->
					<td class="text-center">${maintenancetypename}</td>
					<td class="text-center">${user_time}</td>
					<td class="text-center">${time}</td>
					<td class="text-center"><button type="button" class="btn btn-info">查看</button></td>
				</tr>
					</s:iterator>
			</table>
		</div>
	</div>
	<%@include file="bottom.jsp"%>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery.js"></script>
	<script>
		window.jQuery
				|| document.write('<script src="js/jquery.min.js"><\/script>')
	</script>
	<script src="js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>