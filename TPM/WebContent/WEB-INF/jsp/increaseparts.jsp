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
<script type="text/javascript">
	var parts = {};
	var myparts = {};
	window.onload = function() {
		$.ajax({
			url : 'http://localhost:8080/TPM/GetReplacementParts',
			type : 'GET',
			success : function(data) {
				parts = data;
			}
		});
	};
	function searchPart(thisinput) {
		var partname = document.getElementById("partname");
		var number = document.getElementById("number");
		var unit = document.getElementById("unit");
		var domain = document.getElementById("domain");
		var specification = document.getElementById("specification");
		var brand = document.getElementById("brand");
		var userep = document.getElementById("userep");
		var boxtype_id = document.getElementById("boxtype_id");
		var max = document.getElementById("max");
		var order_number = document.getElementById("order_number");
		var min = document.getElementById("min");
		var price = document.getElementById("price");
		partname.innerText = "";
		number.innerText = "";
		unit.innerText = "";
		domain.innerText = "";
		specification.innerText = "";
		brand.innerText = "";
		userep.innerText = "";
		boxtype_id.innerText = "";
		max.innerText = "";
		order_number.innerText = "";
		min.innerText = "";
		price.innerText = "";
		for (var i = 0; i < parts.length; i++) {
			if (parts[i].part_id == thisinput.value) {
				partname.innerText = "　" + parts[i].name;
				number.innerText = "　" + parts[i].number;
				unit.innerText = "　" + parts[i].unit;
				domain.innerText = "　" + parts[i].domain;
				specification.innerText = "　" + parts[i].specification;
				brand.innerText = "　" + parts[i].brand;
				userep.innerText = "　" + parts[i].userep;
				boxtype_id.innerText = "　" + parts[i].boxtype_id;
				max.innerText = "　" + parts[i].max;
				order_number.innerText = "　" + parts[i].order_number;
				min.innerText = "　" + parts[i].min;
				price.innerText = "　" + parts[i].price;
				break;
			}
		}
		if (partname.innerText == "") {
			partname.innerText = "无此备件";
		}
	}
</script>
</head>

<body>
	<%@include file="head.jsp"%>
	<div class="">
		<br>
		<div class="container insertEP">
			<div class="row">
				<div class="col-xs-7 ">
					<br>
					<form action="IncreasePart" method="post"
						class="form-horizontal">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">备品编号</label>
							<div class="col-sm-8">
								<input onBlur="searchPart(this)" name="replacementPart.part_id" type="text" class="form-control"
									id="partid" placeholder="S-***.....">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">备品名称</label>
							<div class="col-sm-8">
								<p id="partname" class="form-control-static bg-danger"></p>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">库存数量</label>
							<div class="col-sm-8">
								<p id="number" class="form-control-static bg-danger"></p>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">采购数量</label>
							<div class="col-sm-8">
								<input name="replacementPart.number" class="form-control"
									type="text" placeholder="请输入入库数量.....">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">计量单位</label>
							<div class="col-sm-8">
								<p id="unit" class="form-control-static bg-info"></p>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">库位</label>
							<div class="col-sm-8">
								<p id="domain" class="form-control-static bg-info"></p>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">备品规格</label>
							<div class="col-sm-8">
								<p id="specification" class="form-control-static bg-info"></p>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">品牌</label>
							<div class="col-sm-8">
								<p id="brand" class="form-control-static bg-info"></p>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">适用设备</label>
							<div class="col-sm-8">
								<p id="userep" class="form-control-static bg-info"></p>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">储存盒尺寸</label>
							<div class="col-sm-8">
								<p id="boxtype_id" class="form-control-static bg-info"></p>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">最大库存量</label>
							<div class="col-sm-8">
								<p id="max" class="form-control-static bg-info"></p>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">订购点</label>
							<div class="col-sm-8">
								<p id="order_number" class="form-control-static bg-info"></p>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">最小库存量</label>
							<div class="col-sm-8">
								<p id="min" class="form-control-static bg-info"></p>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">备件单价</label>
							<div class="col-sm-8">
								<p id="price" class="form-control-static bg-info"></p>
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