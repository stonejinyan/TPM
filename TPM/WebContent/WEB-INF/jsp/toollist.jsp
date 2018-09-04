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

	<div class="">
		<div class="insertEP">
			<br>
			<form class="form-inline">
				<div class="form-group">
					<label for="exampleInputName2">编号</label> <input type="text"
						class="form-control" id="exampleInputName2" placeholder="请输入编号">
				</div>
				<div class="form-group">
					<label for="exampleInputEmail2">名称</label> <input type="email"
						class="form-control" id="exampleInputEmail2"
						placeholder="jane.doe@example.com">
				</div>
				<button type="submit" class="btn btn-default">筛选</button>
			</form>
			<br>
			<table
				class="table table-striped table-bordered table-hover table-condensed insertEP">
				<tr>
					<td class="text-center">序号</td>
					<td class="text-center">编号</td>
					<td class="text-center">名称</td>
					<td class="text-center">固资编号</td>
					<td class="text-center">描述</td>
					<td class="text-center">状态</td>
					<td class="text-center">类型</td>
					<!--  
					<td >环境影响度</td>
					<td >产量影响度</td>
					<td >设备复杂度</td>
					<td >设备制造渠道</td>
					<td >设备总价</td>
					-->
					<td class="text-center">n_m</td>
					<td class="text-center">上次校检时间</td>
					<td class="text-center">下次校检时间</td>
					<td class="text-center">校验方式</td>
					<!-- 
					<td class="text-center">校验周期(月)</td>
					<td class="text-center">校验负责人</td>
					<td class="text-center">保养负责人</td>
					-->
					<td class="text-center">存放区域</td>
					<td class="text-center">区域领用人</td>
					<td class="text-center">设备/模具/工装</td>
					<td class="text-center">操作</td>
				</tr>
				<s:iterator value="equipmentlist">
					<tr>
						<td class="text-center">${id}</td>
						<td class="text-center">${epid}</td>
						<td class="text-center" style="width: 100px">${epname}</td>
						<td class="text-center">${property_id}</td>
						<td class="text-center">${description}</td>
						<td class="text-center">${status}</td>
						<td class="text-center">${attribute}</td>
						<!-- 
					<td >${environmental_impact}</td>
					<td >${output_impact}</td>
					<td >${ep_complexity}</td>
					<td >${ep_manufacturing_channel}</td>
					<td >${ep_cost}</td>
					-->
						<td class="text-center">${n_m}</td>
						<td class="text-center">${check_time}</td>
						<td class="text-center" style="width: 100px">${next_check_time}</td>
						<td class="text-center">${checkmethodname}</td>
						<!--  
					<td class="text-center">${check_cycle}</td>
					<td class="text-center">${checkstaffname}</td>
					<td class="text-center">${maintainstaffname}</td>
					-->
						<td class="text-center">${areaname}</td>
						<td class="text-center">${user}</td>
						<td class="text-center">${type}</td>
						<td class="text-center"><button type="button"
								class="btn btn-info">查看</button></td>
					</tr>
				</s:iterator>
			</table>
						<div class="text-center">
				<ul class="pagination text-center">
					<s:if test='#pageBean.hasPre == true'>
						<li><a
							href="http://localhost:8080/TPM/EquipmentList?pageNow=1">首页</a></li>
						<li><a
							href="http://localhost:8080/TPM/EquipmentList?pageNow=${pageBean.pageNow-1 }">上一页</a></li>
					</s:if>
					<s:iterator value="pageNumbers" var="pageNumber">
						<s:if test='#pageNumber == #pageBean.pageNow'>
							<li class="active"><a
								href="http://localhost:8080/TPM/EquipmentList?pageNow=${pageNumber}">
									${pageNumber}</a></li>
						</s:if>
						<s:else>
							<li><a
								href="http://localhost:8080/TPM/EquipmentList?pageNow=${pageNumber}">
									${pageNumber}</a></li>
						</s:else>
					</s:iterator>
					<s:if test='#pageBean.hasNext == true'>
						<li><a
							href="http://localhost:8080/TPM/EquipmentList?pageNow=${pageBean.pageNow+1 }">下一页</a></li>
						<li><a
							href="http://localhost:8080/TPM/EquipmentList?pageNow=${pageBean.totalPage }">最后一页</a></li>
					</s:if>
				</ul>
			</div>
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