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
<link rel="stylesheet" href="css/bootstrap-table.css">
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
</style>
</head>

<body>
	<%@include file="head.jsp"%>
	<br>
	<div class="container-fluid">


		<div class="row insertEP">
			<div class="col-xs-12">
			<h3>
					<span class="label label-success">待处理维修申请</span>
				</h3>
				<table id="table"></table>
			</div>
		</div>
		<hr>
		<div class="row insertEP">
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
	<script src="js/bootstrap3-typeahead.js"></script>
	<script src="js/bootstrap-table.js"></script>
	<script src="js/bootstrap-table-zh-CN.js"></script>
	<script src="js/bootstrap-table-en-US.js"></script>
	<script type="text/javascript" src="js/Chartbundle.js"></script>
	<script type="text/javascript" src="js/utils.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="js/ie10-viewport-bug-workaround.js"></script>

	<script type="text/javascript">
		var tableConfig = {
			url : '/TPM/GetAllMaintenanceRequest', //请求后台的URL（*）
			method : 'get', //请求方式（*）
			contentType : "application/x-www-form-urlencoded",//必须要有！！！！
			//toolbar : '#toolbar', //工具按钮用哪个容器
			striped : true, //是否显示行间隔色
			cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination : true, //是否显示分页（*）
			sortable : false, //是否启用排序
			sortOrder : "desc", //排序方式
			//editable : true,
			//queryParams: oTableInit.queryParams,//传递参数（*）
			sidePagination : "client", //分页方式：client客户端分页，server服务端分页（*）
			pageNumber : 1, //初始化加载第一页，默认第一页
			pageSize : 10, //每页的记录行数（*）
			pageList : [ 10, 20, 30 ], //可供选择的每页的行数（*）
			search : false, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
			//strictSearch: true,
			//showColumns: true,                  //是否显示所有的列
			showRefresh : false, //是否显示刷新按钮
			//minimumCountColumns: 2,             //最少允许的列数
			clickToSelect : false, //是否启用点击选中行
			//height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
			uniqueId : "ID", //每一行的唯一标识，一般为主键列
			//showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
			//cardView: false,                    //是否显示详细视图
			//detailView: false,                   //是否显示父子表+
			//showFullscreen : true,
			buttonsAlign : 'right',
			searchAlign : 'right',
			toolbarAlign : 'left',
			//searchText : '请输入订单名称或Batch号进行检索...',
			columns : [ {
				field : 'area',
				title : '区域',
				editable : true,
				align : 'left',
				valign : 'middle',
			},{
				field : 'epid',
				title : '序号',
				editable : true,
				align : 'left',
				valign : 'middle',
			}, {
				field : 'epname',
				title : '设备/工具/工装',
				editable : true,
				align : 'left',
				valign : 'middle',
			}, {
				field : 'question_description',
				title : '问题描述',
				editable : true,
				align : 'left',
				valign : 'middle',
			}, {
				field : 'process_description',
				title : '建议处理方法',
				editable : true,
				align : 'center',
				valign : 'middle',
			}, {
				field : 'time',
				title : '提交时间',
				editable : true,
				align : 'center',
				valign : 'middle',
			}, {
				field : 'staff',
				title : '提交员工',
				align : 'center',
				valign : 'middle',
			} ],
			onEditableSave : function(field, row, oldValue, $el) {
				$.ajax({
					type : "post",
					url : "EditMO",
					data : {
						"id" : row.id,
						"fieldName" : field,
						"oldValue" : oldValue,
						"newValue" : row[field]
					},
					success : function(data, status) {
						if (status == "success") {
							if (status != 0) {
								alert("编辑成功");
							} else {
								alert("编辑失败");
							}
						}
					},
					error : function() {
						alert("编辑失败");
					},
					complete : function() {
						//alert("complete:"+"field:"+field+"rowid:"+row.id+"rowfield:"+row[field]+"oldvalue:"+oldValue+"el:"+$el);
						$table.bootstrapTable('refresh');
					}
				});
			}
		};

		$(function() {
			$('#table').bootstrapTable(tableConfig);
		});

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
					label : '',
					backgroundColor : "#ffffff",
					borderColor : "#ffffff",
					data : [ , , , , , , , , , , , , 50 ],
					fill : false,
				}, {
					label : '实际',
					fill : false,
					backgroundColor : "#38c859",
					borderColor : "#38c859",
					data : [ 17.14, 17.93, 24.0 ],
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
						ticks : {
							beginAtZero : true
						},
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
						}, {
							label : '',
							backgroundColor : "#ffffff",
							borderColor : "#ffffff",
							data : [ , , , , , , , , , , , , 200 ],
							fill : false,
						}, {
							label : '实际',
							fill : false,
							backgroundColor : "#38c859",
							borderColor : "#38c859",
							data : [ 133.24, 78.89 ,150.54 ],
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
						ticks : {
							beginAtZero : true
						},
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
							window.chartColors.red, window.chartColors.orange ],
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
			$('#table').bootstrapTable(tableConfig);
			var ctx = document.getElementById('canvasMTTR').getContext('2d');
			window.myLine = new Chart(ctx, configMTTR);
			var ctx = document.getElementById('canvasMTBF').getContext('2d');
			window.myLine = new Chart(ctx, configMTBF);
			setChartArea();

		};
	</script>
</body>
</html>