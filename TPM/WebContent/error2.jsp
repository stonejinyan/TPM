<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Hello, Bootstrap Table!</title>
<!-- 引入bootstrap样式 -->
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<!-- 引入bootstrap-table样式 -->
<link
	href="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.css"
	rel="stylesheet">
</head>
<body>
	<div id="toolbar"></div>
	<button id = "btn_export">123</button>
	<table id="table">
	</table>

	<!-- jquery及bootstrapjs -->
	<script src="https://cdn.bootcss.com/jquery/2.2.3/jquery.min.js"></script>
	<script
		src="https://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

	<!-- bootstrap-table.min.js -->
	<script
		src="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>
	<!-- 引入中文语言包 -->
	<script
		src="https://cdn.bootcss.com/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.min.js"></script>
	<!-- bootstrap-table-export数据导出---后面两个是Excel2007所需要的js -->
	<script src="js/tableExport.min.js"></script>
	<script src="js/bootstrap-table-export.js"></script>
	

	<script>
		$("#table").bootstrapTable(
				{ // 对应table标签的id
					url : '/Otracking/GetBatchStatus', //AJAX获取表格数据的url
					striped : true, //是否显示行间隔色(斑马线)
					pagination : true, //是否显示分页（*）
					sidePagination : "client", //分页方式：client客户端分页，server服务端分页（*）
					paginationLoop : false, //当前页是边界时是否可以继续按
					queryParams : function(params) { // 请求服务器数据时发送的参数，可以在这里添加额外的查询参数，返回false则终止请求
						return {
							limit : params.limit, // 每页要显示的数据条数
							offset : params.offset, // 每页显示数据的开始行号
						//sort: params.sort, // 要排序的字段
						//sortOrder: params.order, // 排序规则
						//dataId: $("#dataId").val() // 额外添加的参数
						}
					},//传递参数（*）
					pageNumber : 1, //初始化加载第一页，默认第一页
					pageSize : 10, //每页的记录行数（*）
					pageList : [ 10, 25, 50, 100, 'all' ], //可供选择的每页的行数（*）
					contentType : "application/x-www-form-urlencoded",//一种编码。在post请求的时候需要用到。这里用的get请求，注释掉这句话也能拿到数据
					//search: true,                     //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
					strictSearch : false, //是否全局匹配,false模糊匹配
					showColumns : true, //是否显示所有的列
					showRefresh : true, //是否显示刷新按钮
					minimumCountColumns : 2, //最少允许的列数
					clickToSelect : false, //是否启用点击选中行
					//height: 500,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
					//uniqueId: "id",                   //每一行的唯一标识，一般为主键列
					showToggle : true, //是否显示详细视图和列表视图的切换按钮
					cardView : false, //是否显示详细视图
					detailView : false, //是否显示父子表
					cache : false, // 设置为 false 禁用 AJAX 数据缓存， 默认为true
					sortable : true, //是否启用排序
					sortOrder : "asc", //排序方式
					sortName : 'sn', // 要排序的字段
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
					onLoadSuccess : function() { //加载成功时执行
						console.info("加载成功");
					},
					onLoadError : function() { //加载失败时执行
						console.info("加载数据失败");
					},

					//>>>>>>>>>>>>>>导出excel表格设置
					showExport : true, //是否显示导出按钮(此方法是自己写的目的是判断终端是电脑还是手机,电脑则返回true,手机返回falsee,手机不显示按钮)
					exportDataType : "basic", //basic', 'all', 'selected'.
					exportTypes : [ 'xlsx' ], //导出类型
					
					exportButton: $('#btn_export'),     //为按钮btn_export  绑定导出事件  自定义导出按钮(可以不用)
					exportOptions : {
						//ignoreColumn: [0,0],            //忽略某一列的索引  
						fileName : '数据导出', //文件名称设置  
						worksheetName : 'Sheet1', //表格工作区名称  
						tableName : '商品数据表',
						excelstyles : [ 'background-color', 'color',
								'font-size', 'font-weight' ],
					//onMsoNumberFormat: DoOnMsoNumberFormat  
					}
				//导出excel表格设置<<<<<<<<<<<<<<<<

				});
		function phoneOrPc(){
			var sUserAgent = navigator.userAgent.toLowerCase();  
			var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";  
			var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";  
			var bIsMidp = sUserAgent.match(/midp/i) == "midp";  
			var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";  
			var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";  
			var bIsAndroid = sUserAgent.match(/android/i) == "android";  
			var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";  
			var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";  
			if (bIsIpad || bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM) {  
				return false;  
			} else {  
			    return true; 
			}  
		}
	</script>
</body>
</html>