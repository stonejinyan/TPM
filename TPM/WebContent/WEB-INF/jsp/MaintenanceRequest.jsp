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
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet"
	media="screen">
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

<script type="text/javascript">
	var parts = {};
	var myparts = {};
	window.onload = function() {
		document.getElementById("equipment").disabled = true;
		$.ajax({
			url : '/TPM/GetReplacementParts',
			type : 'GET',
			success : function(data) {
				parts = data;
			}
		});
	};
</script>
</head>

<body>
	<%@include file="head.jsp"%>
	<div class="">
		<br>
		<div class="container insertEP">
			<div class="row">
				<div class="col-xs-7 ">
			<h3>
			<span class="label label-success">维修申请</span>
			</h3>
					<br>
					<form id="defaultForm" action="InsertMaintenanceRequest" method="get"
						class="form-horizontal">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">选择存放区域</label>
							<div class="col-sm-8">
								<select onChange="setEquipments()" id="equipmentarea"
									class="form-control" name="maintenanceRequest.area">
									<option value="">请选择存放区域</option>
									<s:iterator value="processLine_AreaList">
										<option value="<s:property value="id" />"><s:property
												value="name" /></option>
									</s:iterator>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-xs-3 control-label">选择编号</label>
							<div>
								<div class="col-xs-8">
									<select onChange="setPM()" id="equipment"
										name="maintenanceRequest.ep_id" class="form-control">
										<option value="">请先选择存放区域</option>
									</select>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-xs-3 control-label">维修日期</label>
							<div class="col-xs-5">
								<div class="control-group">
									<div id="datetimePicker" class="controls input-append date form_date" data-date=""
										data-date-format="yyyy-mm-dd" data-link-field="dtp_input2"
										data-link-format="yyyy-mm-dd">
										<input name="maintenanceRequest.time"
											class="text-center" size="16" type="text" readonly><div class="label label-success">选填:默认为今天</div>
										<span class="add-on"><i class="icon-remove"></i></span> <span
											class="add-on"><i class="icon-th"></i></span>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">问题描述</label>
							<div class="col-sm-8">
								<textarea name="maintenanceRequest.question_description"
									class="form-control" rows="3" placeholder="请输入问题描述....."></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">建议处理方法</label>
							<div class="col-sm-8">
								<textarea name="maintenanceRequest.process_description"
									class="form-control" rows="3" placeholder="请输入处理方法....."></textarea>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-4 col-sm-8">
								<button id="validateBtn" type="submit" class="btn btn-default">提交</button>
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
	<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrapValidator.js"></script>
	<script type="text/javascript" src="js/jquery.cxselect.js"></script>
	<script>
		window.jQuery
				|| document.write('<script src="js/jquery.min.js"><\/script>');
	</script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="js/ie10-viewport-bug-workaround.js"></script>
	<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"
		charset="UTF-8"></script>
	<script type="text/javascript"
		src="js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
	<script type="text/javascript">
		$('.form_datetime').datetimepicker({
			//language:  'zh-CN',
			format : 'yyyy-mm-dd',//显示格式
			minView : "month",//设置只显示到月份
			initialDate : new Date(),//初始化当前日期
			setDate : new Date(),//初始化当前日期
			autoclose : true,//选中自动关闭
			todayBtn : true,//显示今日按钮
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			forceParse : 0,
			showMeridian : 1
		});
		$('.form_date').datetimepicker({
			language : 'zh-CN',
			format : 'yyyy-mm-dd',//显示格式
			minView : "month",//设置只显示到月份
			initialDate : new Date(),//初始化当前日期
			setDate : new Date(),//初始化当前日期
			autoclose : true,//选中自动关闭
			todayBtn : true,//显示今日按钮
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 2,
			forceParse : 0
		});
		$('.form_time').datetimepicker({
			language : 'zh-CN',
			minView : "month",//设置只显示到月份
			initialDate : new Date(),//初始化当前日期
			setDate : new Date(),//初始化当前日期
			autoclose : true,//选中自动关闭
			todayBtn : true,//显示今日按钮
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 1,
			minView : 0,
			maxView : 1,
			forceParse : 0
		});
		var obj;
		function setEquipments() {
			document.getElementById("equipment").disabled = false;
			var sltArea = document.getElementById("equipmentarea");
			var sltEquipment = document.getElementById("equipment");
			for (var i = 0; i < sltEquipment.options.length;) {
				sltEquipment.removeChild(sltEquipment.options[i]);
			}
			var id = sltArea.options[sltArea.selectedIndex].value;
			//alert("id:"+id);
			$
					.ajax({
						url : '/TPM/GetEquipmentbyArea?save_area_id='
								+ id,
						type : 'GET',
						success : function(data) {
							//alert(data[0].name);
							//var obj = JSON.parse(data);
							obj = data;
							var opt = document.createElement('option');
							opt.value = '';
							opt.text = '请选择维修设备';
							sltEquipment.add(opt, null);
							for (var i = 0; i < obj.length; i++) {
								var opt = document.createElement('option');
								opt.value = obj[i].id;
								opt.text = obj[i].epid + '　:　' + obj[i].name;
								sltEquipment.add(opt, null);
							}
							setPM();
						}
					});
			if (id == 0) {
				document.getElementById("equipment").disabled = true;
				var opt = document.createElement('option');
				opt.value = '';
				opt.text = '请先选择设备存放区域';
				sltEquipment.add(opt, null);
			}
		}
		$(document).ready(function() {
		    $('#defaultForm').bootstrapValidator({
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		        	area: {
		                 validators: {
		                     notEmpty: {
		                         message: '请选择设备存放区域'
		                     }
		                 }
		             },
		        	'maintenanceDailyWorkRecord.user_time': {
		                validators: {
		                    notEmpty: {
		                        message: '实际耗时分钟数为空'
		                    }
		                }
		            },
		            'maintenanceDailyWorkRecord.ep_id': {
		                validators: {
		                    notEmpty: {
		                        message: '请选择维修设备'
		                    }
		                }
		            },
		            'maintenanceDailyWorkRecord.type': {
		                validators: {
		                    notEmpty: {
		                        message: '请选择维修类型'
		                    }
		                }
		            },
		            'maintenanceDailyWorkRecord.question_description': {
		                validators: {
		                    notEmpty: {
		                        message: '请输入问题描述'
		                    }
		                }
		            },
		            'maintenanceDailyWorkRecord.process_description': {
		                validators: {
		                    notEmpty: {
		                        message: '请输入处理方法'
		                    }
		                }
		            },
		            pmSchedule_id: {
		                validators: {
		                    notEmpty: {
		                        message: '请选择PM计划'
		                    }
		                }
		            }
		        }
		    });
		});
		
	</script>
</body>
</html>