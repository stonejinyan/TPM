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
<link href="css/home.css" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap-table.css">
<link href="css/bootstrap-editable.css" rel="stylesheet">
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
	<div class="container-fluid mycontainer">
		<div class="row">
			<div class="col-xs-12">

				<!-- <div id="searchtop">
			<br> <br> <br> <br> <br>
		</div> -->
				<div class="row"></div>
				<div class="row">
					<h3>
						<span class="label label-success">${typename}</span>
					</h3>

					<div id="toolbar">
					<button id="btn_edit" type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
			</button>
					</div>
				</div>
				<table id="table"></table>
			</div>

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
	<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"
		charset="UTF-8"></script>
	<script type="text/javascript"
		src="js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
	<script src="js/bootstrap-editable.js"></script>
	<script src="js/bootstrap-table.js"></script>
	<script src="js/bootstrap-table-zh-CN.js"></script>
	<script src="js/bootstrap-table-editable.js"></script>
	<script src="js/combodate.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script type="text/javascript">
		var tableConfig = {
			url : '/TPM/GetEquipmentList?type=${type_id}', //请求后台的URL（*）
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
			pageSize : 20, //每页的记录行数（*）
			pageList : [ 20, 30, 50 ], //可供选择的每页的行数（*）
			search : true, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
			//strictSearch: true,
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
			columns : [ {
				field : 'id',
				title : '序号',
				align : 'left',
				valign : 'middle',
			},{
				field : 'epid',
				title : '编号',
				editable : false,
				align : 'left',
				valign : 'middle',
			}, {
				field : 'epname',
				title : '名称',
				editable : false,
				align : 'center',
				valign : 'middle',
			}, {
				field : 'property_id',
				title : '固资编号',
				editable : false,
				align : 'center',
				valign : 'middle',
			}, {
				field : 'description',
				title : '描述',
				align : 'center',
				valign : 'middle',
			}, {
				field : 'status',
				title : '状态',
				align : 'center',
				valign : 'middle',
			}, {
				field : 'attribute',
				title : '类型',
				align : 'center',
				valign : 'middle',

			}, {
				field : 'n_m',
				title : 'n_m',
				editable : false,
				align : 'center',
				valign : 'middle',
			}, {
				field : 'user',
				title : '区域领用人',
				editable : true,
				align : 'center',
				valign : 'middle',
			}, {
				field : 'backup_plan',
				title : '备份计划',
				editable : false,
				align : 'center',
				valign : 'middle',
			}, {
				field : 'checkmethodname',
				title : '校验方式',
				align : 'center',
				valign : 'middle',
			}, {
				field : 'checkstaffname',
				title : '校验负责人',
				align : 'center',
				valign : 'middle',
			}, {
				field : 'maintainstaffname',
				title : '保养负责人',
				align : 'center',
				valign : 'middle',
			} , {
				field : 'areaname',
				title : '存放区域',
				align : 'center',
				valign : 'middle',
			} , {
				field : 'type',
				title : '设备/模具/工装',
				align : 'center',
				valign : 'middle',
			}, {
				field : 'workstation',
				title : '工位',
				align : 'center',
				valign : 'middle',
			} , {
				field : 'fileList',
				title : '文件',
				align : 'center',
				valign : 'middle',
			} ],
			onEditableSave : function(field, row, oldValue, $el) {
				$.ajax({
					type : "post",
					url : "EditEPAction",
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
			$('#btn_edit').click(function() {
				editable();
			});
		});
		function editable() {
			$('#table .editable').editable('toggleDisabled');
		}
		$(function() {
			$('#table').bootstrapTable(tableConfig);
		});
	</script>
</body>
</html>