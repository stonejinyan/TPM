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
<style>
canvas {
	-moz-user-select: none;
	-webkit-user-select: none;
	-ms-user-select: none;
}

.chart-container {
	width: 550px;
	margin-left: 25px;
	padding-left: 0px;
	margin-right: 0px;
	margin-bottom: 5px;
}

.container1 {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap; //
	justify-content: center;
}

.container2 {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap; //
	justify-content: center;
}
</style>
</head>

<body>
	<%@include file="head.jsp"%>
	<br>
	<div class="container-fluid">
		<div class="row insertEP">
			<h3>
				　<span class="label label-success">KPI</span>
			</h3>
			<div class="container1 col-xs-6"></div>
			<div class="container2 col-xs-6"></div>
		</div>
		<hr>
		<div class="row">
			<div class="col-xs-6 insertEP">
				<h3>
					<span class="label label-success">PM计划</span>
				</h3>
			</div>
			<div class="col-xs-1"></div>
			<div class="col-xs-5 insertEP">
				<h3>
					<span class="label label-success">PM占比</span>
				</h3>
				<div id="canvas-holder" style="width: 100%">
					<canvas id="chart-area"></canvas>
				</div>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-12 insertEP"></div>
		</div>
	</div>
	<br>
	<%@include file="bottom.jsp"%>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
	<script>
		window.jQuery
				|| document.write('<script src="js/jquery.min.js"><\/script>')
	</script>
	<script src="js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="js/ie10-viewport-bug-workaround.js"></script>
	<script type="text/javascript" src="js/Chartbundle.js"></script>
	<script type="text/javascript" src="js/utils.js"></script>
	<script type="text/javascript">
		//MTTR  设置
		function createConfig(position) {
			return {
				type : 'line',
				data : {
					labels : [ 'January', 'February', 'March', 'April', 'May',
							'June', 'July', 'August', 'September', 'October',
							'November', 'December' ],
					datasets : [
							{
								label : '目标',
								borderColor : window.chartColors.red,
								backgroundColor : window.chartColors.red,
								data : [ 30, 30, 30, 30, 30, 30, 30, 30, 30,
										30, 30, 30 ],
								fill : false,
							}, {
								label : '实际',
								borderColor : window.chartColors.blue,
								backgroundColor : window.chartColors.blue,
								data : [ 22.4, 20.5, 24, 24.4, 23.5 ],
								fill : false,
							} ]
				},
				options : {
					responsive : true,
					title : {
						display : true,
						text : 'SEEE-2018年: ' + position
					},
					tooltips : {
						position : position,
						mode : 'index',
						intersect : false,
					},
				}
			};
		}
		//MTBF  设置
		function createConfig1(position) {
			return {
				type : 'line',
				data : {
					labels : [ 'January', 'February', 'March', 'April', 'May',
							'June', 'July', 'August', 'September', 'October',
							'November', 'December' ],
					datasets : [
							{
								label : '目标',
								borderColor : window.chartColors.red,
								backgroundColor : window.chartColors.red,
								data : [ 100, 100, 100, 100, 100, 100, 100,
										100, 100, 100, 100, 100 ],
								fill : false,
							},
							{
								label : '实际',
								borderColor : window.chartColors.blue,
								backgroundColor : window.chartColors.blue,
								data : [ 161.3, 64.3, 261.2, 133.5, 85.6,
										106.7, 161.4 ],
								fill : false,
							} ]
				},
				options : {
					responsive : true,
					title : {
						display : true,
						text : 'SEEE-2018年: ' + position
					},
					tooltips : {
						position : position,
						mode : 'index',
						intersect : false,
					},
				}
			};
		}
		//PM占比设置
		var randomScalingFactor = function() {
			return Math.round(Math.random() * 100);
		};
		var pmProportion = [];
		$.ajax({
			url : '/TPM/PmProportion',
			type : 'GET',
			success : function(data) {
				for (var i = 0; i < data.length; i++) {
					pmProportion[i] = data[i];
				}
			}
		});
				//alert(pmProportion);
		var config = {
			type : 'doughnut',
			data : {
				datasets : [ {
					data : pmProportion,
					backgroundColor: [
						window.chartColors.blue,
						window.chartColors.red,
						window.chartColors.yellow,
						window.chartColors.green,
						window.chartColors.orange,
					],
					label : 'Dataset 1'
				} ],
				labels : [ 'PM', 'RM', 'AM-巡线', '支援/调机', 'other' ]
			},
			options : {
				responsive : true,
				legend : {
					position : 'top',
				},
				title : {
					display : false,
					text : ''
				},
				animation : {
					animateScale : true,
					animateRotate : true
				}
			}
		};

		window.onload = function() {

			//MTTR初始化
			var container = document.querySelector('.container1');

			[ 'MTTR' ].forEach(function(position) {
				var div = document.createElement('div');
				div.classList.add('chart-container');

				var canvas = document.createElement('canvas');
				div.appendChild(canvas);
				container.appendChild(div);

				var ctx = canvas.getContext('2d');
				var config = createConfig(position);
				new Chart(ctx, config);
			});
			//MTBF初始化
			var container = document.querySelector('.container2');

			[ 'MTBF' ].forEach(function(position) {
				var div = document.createElement('div');
				div.classList.add('chart-container');

				var canvas = document.createElement('canvas');
				div.appendChild(canvas);
				container.appendChild(div);

				var ctx = canvas.getContext('2d');
				var config = createConfig1(position);
				new Chart(ctx, config);
			});
			var ctx = document.getElementById('chart-area').getContext('2d');
			window.myDoughnut = new Chart(ctx, config);
		};
	</script>
</body>
</html>