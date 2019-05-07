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
<meta http-equiv="rrefresh" content="60">
<!-- Note there is no responsive meta tag here -->

<link rel="icon" href="image/favicon.ico">

<title>Otracking</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/home.css" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap-table.css">
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

	<div class="container-fluid mycontainer">
		<div class="row">
			<div class="col-xs-12">

				<!-- <div id="searchtop">
			<br> <br> <br> <br> <br>
		</div> -->
				<div class="row">
					<%-- <div class="col-xs-12">
				<h1>
					SEEE<small> 累计销售：5000台</small>
				</h1>
			</div> --%>
				</div>
				<div class="row">
					<h3>
						<span class="label label-success">订单状态</span>
					</h3>
					<div id="toolbar"></div>
				</div>
				<table id="table">
				</table>
			</div>
			<%-- <div class="col-xs-4">
				<div class="hrbottom">
					<h3>
						<span class="label label-success">WIP 可容纳量：500</span>
					</h3>
					<div id="canvas-holder" style="width: 100%">
						<canvas id="chart-area"></canvas>
					</div>
				</div>
				<div></div>
			</div> --%>
		</div>
	</div>


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

   <script src="https://unpkg.com/tableexport.jquery.plugin/tableExport.min.js"></script>
<script src="https://unpkg.com/tableexport.jquery.plugin/libs/jsPDF/jspdf.min.js"></script>
<script src="https://unpkg.com/tableexport.jquery.plugin/libs/jsPDF-AutoTable/jspdf.plugin.autotable.js"></script>
<script src="https://unpkg.com/bootstrap-table@1.14.2/dist/bootstrap-table.min.js"></script>
<script src="https://unpkg.com/bootstrap-table@1.14.2/dist/extensions/export/bootstrap-table-export.min.js"></script>
  <script>
		var order_id = null;
		function ordersearch() {
			alert(1);
		}


		var $table = $('#table'), $button = $('#btn_edit');
		$(function() {

			//1.初始化Table
			var oTable = new TableInit();
			oTable.Init();

		});
		var oTableInit;

		var tableConfig = {
			url : '/Otracking/GetBatchStatus', //请求后台的URL（*）
			method : 'get', //请求方式（*）
			contentType : "application/x-www-form-urlencoded",//必须要有！！！！
			toolbar : '#toolbar', //工具按钮用哪个容器
			striped : true, //是否显示行间隔色
			cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination : true, //是否显示分页（*）
			sortable : false, //是否启用排序
			sortOrder : "desc", //排序方式
			//editable : true,
			//queryParams: oTableInit.queryParams,//传递参数（*）
			sidePagination : "client", //分页方式：client客户端分页，server服务端分页（*）
			pageNumber : 1, //初始化加载第一页，默认第一页
			pageSize : 50, //每页的记录行数（*）
			pageList : [ 50, 100 ], //可供选择的每页的行数（*）
			search : true, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
			showExport : true,
			strictSearch : true,
			//showColumns: true,                  //是否显示所有的列
			showRefresh : true, //是否显示刷新按钮
			//minimumCountColumns: 2,             //最少允许的列数
			clickToSelect : false, //是否启用点击选中行
			//height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
			uniqueId : "ID", //每一行的唯一标识，一般为主键列
			//showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
			//cardView: false,                    //是否显示详细视图
			//detailView: false,                   //是否显示父子表+
			//showFullscreen : true,
			buttonsAlign : 'left',
			searchAlign : 'left',
			toolbarAlign : 'right',
			//searchText : '请输入订单名称或Batch号进行检索...',
			exportDataType:'all',
			 
	        onLoadSuccess:function(data){   //表格数据加载成功事件
	            rowCount = data.length-1;
	            $("#datatable").bootstrapTable('hideRow', {index:rowCount});
	            $("#datatable td").attr("data-tableexport-msonumberformat","\@");
	            $("#datatable tr").attr("data-tableexport-display","always");
	        },
	        onPageChange:function(number,size){  //表格翻页事件
	            $("#datatable").bootstrapTable('hideRow', {index:rowCount});
	            $("#datatable td").attr("data-tableexport-msonumberformat","\@");
	            $("#datatable tr").attr("data-tableexport-display","always");
	 
	        },
	        showExport: true,  //是否显示导出按钮
	        buttonsAlign:"right",  //按钮位置
	        exportTypes:['excel'],  //导出文件类型
	        Icons:'glyphicon-export',
	        exportOptions:{
	 
	        },
			columns : [ {
				field : 'id',
				title : '编号',
				sortable : true,
				align : 'center',
				valign : 'middle',
			}, {
				field : 'ordername',
				title : '订单名称',
				editable : true,
				align : 'left',
				valign : 'middle',
			}, {
				field : 'batchname',
				title : 'Batch',
				editable : true,
				align : 'center',
				valign : 'middle',
			}, {
				field : 'mechanical_sub_assembly',
				title : '柜体预组',
				align : 'center',
				valign : 'middle',
			},/*  {
										field : 'cabling_sub_assembly',
										title : '配线预组',
										align : 'center',
										valign : 'middle',
										
									},  */{
				field : 'mechanical_assembly',
				title : '总装机械',
				editable : true,
				align : 'center',
				valign : 'middle',
			}, /* {
								field : 'door_assembly',
								title : '门板安装',
								editable : true,
								align : 'center',
								valign : 'middle',
							},  */{
				field : 'cubicle_cabling',
				title : '柜体配线',
				editable : true,
				align : 'center',
				valign : 'middle',
			}, {
				field : 'FQC',
				title : 'FQC',
				align : 'center',
				valign : 'middle',
			}, {
				field : 'finaly_assembly',
				title : '最终装配',
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

		var TableInit = function() {
			var oTableInit = new Object();
			//初始化Table
			oTableInit.Init = function() {
				$('#table').bootstrapTable(tableConfig);

			};

			return oTableInit;
		};
		/* //PM占比设置
		var randomScalingFactor = function() {
			return Math.round(Math.random() * 100);
		};
		var pmProportion = [ 0, 0];
		function setChartArea() {
			$.ajax({
				url : '/Otracking/WIPProportion',
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
					backgroundColor : [ window.chartColors.blue,window.chartColors.orange ],
					label : 'Dataset 1'
				} ],
				labels : [ '余量', 'WIP']
			},
			options : {
				responsive : true,
				legend : {
					position : 'left',
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
										ctx.fillText(dataString + '',
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
			setChartArea();

		}; */
	</script>
</body>
</html>