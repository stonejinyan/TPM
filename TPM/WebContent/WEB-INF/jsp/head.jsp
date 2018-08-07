<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
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
<!--  Logo 部位        -->
	<!-- Fixed navbar -->
	<nav class="navbar navbar-default">
		<div>
			<div class="row logobar">

				<div class="col-xs-3 logo text-right">
					<img alt="logo" src="image/logo.png">
				</div>
				<div class="col-xs-5">
					<div class="row">
						<h4 class="display-5  title">Total Productive Maintenance
							Management System</h4>
						<h5 class="display-5  title">
							<small class="display-5  title">全员生产性维护管理系统</small>
						</h5>
					</div>
				</div>
				<s:if test="%{#session.staff != null}">
				<div class="col-xs-2">
					<div class="row text-right">
						<h4 class="display-5  title text-right">${staff.name}</h4>
						<h6 class="display-5 title text-right">欢迎你！</h6>
					</div>
				</div>
				<div class="col-xs-2">
					<img class="img-responsive" alt="" src="image/head.png"
						width="50px">
				</div>
				</s:if>
			</div>
		</div>
		<s:if test="%{#session.staff != null}">
		<div class="container">
			<div class="navbar-header">
				<!-- The mobile navbar-toggle button can be safely removed since you do not need it in a non-responsive implementation -->
				
			</div>
			<!-- Note that the .navbar-collapse and .collapse classes have been removed from the #navbar -->
			<div id="navbar">
				<ul class="nav navbar-nav">
					<li <s:if test="#active=='home'">class="active"</s:if>><a href="home">首页</a></li>
					<li <s:if test="%{#active == 'EquipmentMaintain'}">class="active"</s:if>><a href="EquipmentMaintain">设备维修</a></li>
					<li <s:if test="%{#active == 'IncreaseParts'}">class="active"</s:if>><a href="IncreaseParts">备品入库</a></li>
					<li <s:if test="%{#active == 'NewEquipment'}">class="active"</s:if>><a href="NewEquipment">设备新增</a></li>
					<li <s:if test="%{#active == 'InsertParts'}">class="active"</s:if>><a href="InsertParts">备品新增</a></li>
					<li <s:if test="%{#active == 'EquipmentList'}">class="active"</s:if>><a href="EquipmentList">设备明细</a></li>
					<li <s:if test="%{#active == 'PartList'}">class="active"</s:if>><a href="PartList">备件明细</a></li>
					<li <s:if test="%{#active == 'equipmentmaintainRecord'}">class="active"</s:if>><a href="EquipmentMaintainRecord">设备维修记录</a></li>
					<!--  
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Dropdown <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li role="separator" class="divider"></li>
							<li class="dropdown-header">Nav header</li>
							<li><a href="#">Separated link</a></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
					-->
				</ul>
				<!-- 
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Link</a></li>
					<li><a href="#">Link</a></li>
					<li><a href="#">Link</a></li>
				</ul>
				 -->
			</div>
			<!--/.nav-collapse -->
		</div>
		</s:if>
	</nav>
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