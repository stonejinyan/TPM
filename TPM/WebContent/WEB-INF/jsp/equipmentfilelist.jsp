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
						<span class="label label-success">${ep.epid}${ep.name} 文件查看</span>
					</h3>

					<p class="bg-danger">${savenumber}${updatenumber}${error}</p>
					<div id="toolbar" class="btn-group">
						<button id="btn_add" type="button" class="btn btn-default"
							data-toggle="modal" data-target="#exampleModal"
							data-whatever="@mdo">
							<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
						</button>
						<div class="modal fade" id="exampleModal" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title" id="exampleModalLabel">文件新增</h4>
									</div>
									<form action="SaveEPFile" method="post"
										enctype="multipart/form-data">
										<div class="modal-body">
											<div class="form-group">
												<label for="recipient-name" class="control-label">请输入文件名称</label>
												<input type="text" class="form-control" id="recipient-name"
													name="name">
											</div>
											<div class="form-group">
												
												<input type="hidden" class="form-control" id="recipient-name"
													name="id" value="${id }">
											</div>
											<div class="form-group">
												<label for="exampleInputFile">文件上传</label> <input
													type="file" name="uploadfile">
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
											<button type="submit" class="btn btn-primary">上传</button>
										</div>
									</form>
								</div>
							</div>
						</div>
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
	<script src="js/bootstrap3-typeahead.js"></script>
	<script src="js/bootstrap-table.js"></script>
	<script src="js/bootstrap-table-zh-CN.js"></script>
	<script type="text/javascript" src="js/Chartbundle.js"></script>
	<script type="text/javascript" src="js/utils.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="js/ie10-viewport-bug-workaround.js"></script>
	<script type="text/javascript">
		var tableConfig = {
			url : '/TPM/GetEquipmentFileList?id=${getFilesByep_id}', //请求后台的URL（*）
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
			buttonsAlign : 'right',
			searchAlign : 'right',
			toolbarAlign : 'left',
			//searchText : '请输入订单名称或Batch号进行检索...',
			columns : [ {
				field : 'id',
				title : '序号',
				editable : true,
				align : 'left',
				valign : 'middle',
			}, {
				field : 'name',
				title : '文件名称',
				editable : true,
				align : 'left',
				valign : 'middle',
			}, {
				field : 'link',
				title : '地址',
				editable : true,
				align : 'center',
				valign : 'middle',
			}, {
				field : 'TDDate',
				title : '上传时间',
				editable : true,
				align : 'center',
				valign : 'middle',
			}, {
				field : 'staff',
				title : '上传人',
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
	</script>
</body>
</html>