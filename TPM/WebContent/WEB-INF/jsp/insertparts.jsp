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
					<form action="InsertPart" method="post"
						class="form-horizontal">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">备品编号</label>
							<div class="col-sm-8">
								<input name="replacementPart.part_id" type="text" class="form-control"
									id="inputEmail3" placeholder="S-***.....">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">备品名称</label>
							<div class="col-sm-8">
								<input name="replacementPart.name" type="text" class="form-control"
									id="inputEmail3" placeholder="请输入备品名称.....">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">库位</label>
							<div class="col-sm-8">
								<input name="replacementPart.domain" type="text"
									class="form-control" id="inputEmail3"
									placeholder="请输入库位编号.....">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">备品规格</label>
							<div class="col-sm-8">
								<input name="replacementPart.specification" class="form-control"
									type="text" placeholder="请输入备品规格.....">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">品牌</label>
							<div class="col-sm-8">
								<input name="replacementPart.brand" class="form-control"
									type="text" placeholder="请输入备品品牌.....">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">适用设备</label>
							<div class="col-sm-8">
								<input name="replacementPart.userep" class="form-control"
									type="text" placeholder="请输入适用设备.....">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">供货周期评估</label>
							<div class="col-sm-8">
								<select name="replacementPart.deliverycycle"
									class="form-control">
									<option>1</option>
									<option>4</option>
									<option>7</option>
									<option>10</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">配件价值评估</label>
							<div class="col-sm-8">
								<select name="replacementPart.partvalue" class="form-control">
									<option>1</option>
									<option>4</option>
									<option>7</option>
									<option>10</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">设备关键度评估</label>
							<div class="col-sm-8">
								<select name="replacementPart.epcritical" class="form-control">
									<option>1</option>
									<option>4</option>
									<option>7</option>
									<option>10</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">可替代性评估</label>
							<div class="col-sm-8">
								<select name="replacementPart.vicarism"
									class="form-control">
									<option>1</option>
									<option>4</option>
									<option>7</option>
									<option>10</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">易损程度评估</label>
							<div class="col-sm-8">
								<select name="replacementPart.vulnerability" class="form-control">
									<option>1</option>
									<option>4</option>
									<option>7</option>
									<option>10</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">储存盒尺寸</label>
							<div class="col-sm-8">
								<select name="replacementPart.boxtype_id" class="form-control">
									<option value="250*150*120">250*150*120</option>
									<option value="350*200*160">350*200*160</option>
									<option value="350*200*161">350*200*161</option>
									<option value="350*450(定制)">350*450(定制)</option>
									<option value="450*300*180">450*300*180</option>
									<option value="450*300*183">450*300*183</option>
									<option value="定制抽屉盒">定制抽屉盒</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">最大库存量</label>
							<div class="col-sm-8">
								<input name="replacementPart.max" class="form-control"
									type="text" placeholder="请输入最大库存量.....">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">订购点</label>
							<div class="col-sm-8">
								<input name="replacementPart.order_number" class="form-control"
									type="text" placeholder="请输入订购点数量.....">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">最小库存量</label>
							<div class="col-sm-8">
								<input name="replacementPart.min" class="form-control"
									type="text" placeholder="请输入最小库存量.....">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">当前库存量</label>
							<div class="col-sm-8">
								<input name="replacementPart.number" class="form-control"
									type="text" placeholder="请输入当前库存量.....">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">计量单位</label>
							<div class="col-sm-8">
								<input name="replacementPart.unit" class="form-control"
									type="text" placeholder="请输入计量单位（例:个）.....">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">备件单价</label>
							<div class="col-sm-8">
								<input name="replacementPart.price" class="form-control"
									type="text" placeholder="请输入备件单价.....">
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