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
		<br>
		<div class="container insertEP">
			<div class="row">
				<div class="col-xs-7 ">
					<br>
					<form action="InsertEquipment" method="post"
						class="form-horizontal">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">扭力工具</label>
							<div class="col-sm-8">
								<p id="partname" class="form-control-static bg-danger">　扭力工具新增</p>
							</div>
							<input name="equipment.type" type="hidden" class="form-control"
									id="inputEmail3" value="5">
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">编号</label>
							<div class="col-sm-8">
								<input name="equipment.epid" type="text" class="form-control"
									id="inputEmail3" placeholder="**-***.....">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">名称</label>
							<div class="col-sm-8">
								<input name="equipment.name" type="text" class="form-control"
									id="inputEmail3" placeholder="请输入名称.....">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">固资编号</label>
							<div class="col-sm-8">
								<input name="equipment.property_id" type="text" class="form-control"
									id="inputEmail3" placeholder="请输入固资编号.....">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">力矩</label>
							<div class="col-sm-8">
								<input name="equipment.n_m" type="text" class="form-control"
									id="inputEmail3" placeholder="请输入力矩大小，例:9N.M.....">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">区域领用人</label>
							<div class="col-sm-8">
								<input name="equipment.user" type="text" class="form-control"
									id="inputEmail3" placeholder="请输入领用人.....">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">描述</label>
							<div class="col-sm-8">
								<textarea name="equipment.description" class="form-control" rows="3"
									placeholder="请输入品牌等描述信息....."></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">状态</label>
							<div class="col-sm-8">
								<select name="equipment.status" class="form-control">
									<option value ="1">正常</option>
									<option value ="2">维修</option>
									<option value ="3">封存</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">类别</label>
							<div class="col-sm-8">
								<select name="equipment.attribute" class="form-control">
									<option value ="1">生产</option>
									<option value ="2">仓储</option>
									<option value ="3">检测</option>
									<option value ="4">测试</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">备份计划</label>
							<div class="col-sm-8">
								<textarea name="equipment.backup_plan" class="form-control" rows="3"
									placeholder="请输入备份计划....."></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">校验方式</label>
							<div class="col-sm-8">
								<select name="equipment.check_method" class="form-control">
									<option value ="0">无需校验</option>
									<option value ="1">内部校验</option>
									<option value ="2">外部校验</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">校验周期</label>
							<div class="col-sm-8">
								<select name="equipment.check_cycle" class="form-control">
									<option value ="0">无需校验</option>
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
									<option>6</option>
									<option>7</option>
									<option>8</option>
									<option>9</option>
									<option>10</option>
									<option>11</option>
									<option>12</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">校验负责人</label>
							<div class="col-sm-8">
								<select name="equipment.check_staff_id" class="form-control">
									<s:iterator value="staffList">
										<option value ="<s:property value="id" />"><s:property value="name" /></option>
									</s:iterator>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">保养负责人</label>
							<div class="col-sm-8">
								<select name="equipment.maintain_staff_id" class="form-control">
									<s:iterator value="staffList">
										<option value ="<s:property value="id" />"><s:property value="name" /></option>
									</s:iterator>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">存放区域</label>
							<div class="col-sm-8">
								<select name="equipment.save_area_id" class="form-control">
									<s:iterator value="processLine_AreaList">
										<option value ="<s:property value="id" />"><s:property value="name" /></option>
									</s:iterator>
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-4 col-sm-8">
								<button type="submit" class="btn btn-default">提交</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<br>
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