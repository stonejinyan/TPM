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
<meta http-equiv="refresh" content="60">
<!-- Note there is no responsive meta tag here -->

<link rel="icon" href="image/favicon.ico">

<title>TPM</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/custom.css" rel="stylesheet">
<link href="css/login.css" rel="stylesheet">
<link href="css/home.css" rel="stylesheet">
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



		<div class="row PMplan">
			<div class="col-xs-6 PMplan hr">
				<h3>
					<span class="label label-success">预防性维护计划</span>
				</h3>
				<div class="bg-demo">
					<div class="">
						<div id="carousel-example-vertical"
							class="carousel vertical slide">
							<div class="carousel-inner" role="listbox">
								<%
									int i = 0;
									boolean first = true;
								%>
								<s:iterator value="Week_Pm_Schedule">
									<%
										if (first == true) {
									%>
									<div class="item active">
										<p class="ticker-headline">
										<table
											class="table table-striped table-bordered table-hover table-condensed insertEP">
											<tr>
												<td class="text-center">计划编号</td>
												<td class="text-center">备品编号</td>
												<td class="text-center">备品名称</td>
												<td class="text-center">保养日期</td>
												<td class="text-center">操作</td>
											</tr>
											<%
												first = false;
													}
													if (i != 0 && i % 4 == 0) {
											%>

											<div class="item">
												<p class="ticker-headline">
												<table
													class="table table-striped table-bordered table-hover table-condensed insertEP">
													<tr>
														<td class="text-center">计划编号</td>
														<td class="text-center">备品编号</td>
														<td class="text-center">备品名称</td>
														<td class="text-center">保养日期</td>
														<td class="text-center">操作</td>
													</tr>
													<%
														}
													%>

													<%
														i++;
													%>
													<tr>
														<td class="text-center">${id}</td>
														<td class="text-center">${epid}</td>
														<td class="text-center">${epname}</td>
														<td class="text-center">${time}</td>
														<td class="text-center"><a type="button"
															href="EquipmentMaintain" class="btn btn-info">维修</a></td>
													</tr>
													<%
														if (i != 0 && i % 4 == 0) {
													%>

												</table>
												</p>
											</div>
											<%
												}
											%>

											</s:iterator>
											<%
												if (i % 4 != 0) {
											%>

										</table>
										</p>
									</div>
									<%
										}
									%>
								
							</div>

							<!-- Controls -->
							<a class="up carousel-control" href="#carousel-example-vertical"
								role="button" data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a> <a class="down carousel-control"
								href="#carousel-example-vertical" role="button"
								data-slide="next"> <span
								class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-6 insertEP">
				<h3>
					<span class="label label-success">预防性维护资源占比</span>
				</h3>
				<div class="col-xs-offset-2" id="canvas-holder" style="width: 75%">
					<canvas id="chart-area"></canvas>
				</div>
			</div>
		</div>
		<hr>
		<div class="row insertEP">
			<div class="container1 col-xs-6 hr">
				<h3>
					<span class="label label-success">设备故障平均修复时间MTTR</span>
				</h3>
				<div style="width: 100%;">
					<canvas id="canvasMTTR"></canvas>
				</div>
			</div>
			<div class="container2 col-xs-6">
				<h3>
					<span class="label label-success">设备故障平均间隔时间MTBF</span>
				</h3>
				<div style="width: 100%;">
					<canvas id="canvasMTBF"></canvas>
				</div>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-12 insertEP"></div>
		</div>
	</div>
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
		var MONTHS = [ 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug',
				'Sep', 'Oct', 'Nov', 'Dec' ];
		var configMTTR = {
			type : 'line',
			data : {
				labels : MONTHS,
				datasets : [ {
					label : '目标',
					backgroundColor : window.chartColors.blue,
					borderColor : window.chartColors.blue,
					data : [ 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30 ],
					fill : false,
				}, {
					label : '实际',
					fill : false,
					backgroundColor : "#38c859",
					borderColor : "#38c859",
					data : [ 22.4, 20.5, 24, 24.4, 23.5 ,22.1,24.9,36.3,47.41],
				} ]
			},
			options : {
				responsive : true,
				title : {
					display : false,
					text : '设备故障平均修复时间MTTR'
				},
				tooltips : {
					mode : 'index',
					intersect : false,
				},
				hover : {
					mode : 'nearest',
					intersect : true
				},
				scales : {
					xAxes : [ {
						display : true,
						scaleLabel : {
							display : false,
							labelString : '月'
						}
					} ],
					yAxes : [ {
						display : true,
						scaleLabel : {
							display : true,
							labelString : '分钟'
						}
					} ]
				}
			}
		};
		var configMTBF = {
			type : 'line',
			data : {
				labels : MONTHS,
				datasets : [
						{
							label : '目标',
							backgroundColor : window.chartColors.blue,
							borderColor : window.chartColors.blue,
							data : [ 100, 100, 100, 100, 100, 100, 100, 100,
									100, 100, 100, 100 ],
							fill : false,
						},
						{
							label : '实际',
							fill : false,
							backgroundColor : "#38c859",
							borderColor : "#38c859",
							data : [ 161.3, 64.3, 261.2, 133.5, 85.6, 106.7,
									161.4 ,130.6,148.44],
						} ]
			},
			options : {
				responsive : true,
				title : {
					display : true,
					text : '设备平均故障间隔时间MTBF'
				},
				tooltips : {
					mode : 'index',
					intersect : false,
				},
				hover : {
					mode : 'nearest',
					intersect : true
				},
				scales : {
					xAxes : [ {
						display : true,
						scaleLabel : {
							display : false,
							labelString : 'Month'
						}
					} ],
					yAxes : [ {
						display : true,
						scaleLabel : {
							display : true,
							labelString : '小时'
						}
					} ]
				}
			}
		};
		//PM占比设置
		var randomScalingFactor = function() {
			return Math.round(Math.random() * 100);
		};
		var pmProportion = [ 0, 0, 0 ];
		function setChartArea() {
			$.ajax({
				url : '/TPM/PmProportion',
				type : 'GET',
				success : function(data) {
					//config.data.datasets.data.push(30);
					//alert(pmProportion);
					//for (var i = 0; i < data.length; i++) {
					//pmProportion[i] = data[i];
					//}
					var i = 0;
					config.data.datasets.forEach(function(dataset) {
						dataset.data = dataset.data.map(function() {
							return data[i++];
						});
					});
					var ctx = document.getElementById('chart-area').getContext(
							'2d');
					window.myDoughnut = new Chart(ctx, config);
				}
			});
		}
		var config = {
			type : 'doughnut',
			data : {
				datasets : [ {
					data : pmProportion,
					mytype : 'doughnut',
					backgroundColor : [ window.chartColors.blue,
							window.chartColors.red, window.chartColors.orange],
					label : 'Dataset 1'
				} ],
				labels : [ '设备保养PM', '应急性维修RM', '其他' ]
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

		// Define a plugin to provide data labels
		Chart.plugins.register({
			afterDatasetsDraw : function(chart) {
				if (chart.data.datasets[0].mytype == 'doughnut') {
					//alert(chart.getDatasetMeta(i));
					var ctx = chart.ctx;
					//var ctx = document.getElementById('chart-area').getContext('2d');
					chart.data.datasets.forEach(function(dataset, i) {
						var meta = chart.getDatasetMeta(i);
						if (!meta.hidden) {
							meta.data
									.forEach(function(element, index) {
										//if(dataset.labels[0].toString()!= 'PM' ){
										//return false;
										//}
										// Draw the text in black, with the specified font
										ctx.fillStyle = 'rgb(0, 0, 0)';

										var fontSize = 16;
										var fontStyle = 'normal';
										var fontFamily = 'Helvetica Neue';
										ctx.font = Chart.helpers
												.fontString(fontSize,
														fontStyle, fontFamily);

										// Just naively convert to string for now
										var dataString = dataset.data[index]
												.toString();

										// Make sure alignment settings are correct
										ctx.textAlign = 'center';
										ctx.textBaseline = 'middle';

										var padding = 5;
										var position = element
												.tooltipPosition();
										ctx.fillText(dataString + '%',
												position.x, position.y
														- (fontSize / 2)
														- padding + 10);
									});
						}
					});
				}
			}
		});

		window.onload = function() {

			var ctx = document.getElementById('canvasMTTR').getContext('2d');
			window.myLine = new Chart(ctx, configMTTR);
			var ctx = document.getElementById('canvasMTBF').getContext('2d');
			window.myLine = new Chart(ctx, configMTBF);
			setChartArea();

		};
	</script>
</body>
</html>