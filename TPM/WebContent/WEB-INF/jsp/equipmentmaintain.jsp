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
<link href="css/bootstrapValidator.css" rel="stylesheet">
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
			url : 'http://localhost:8080/TPM/GetReplacementParts',
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
					<br>
					<form action="InsertEquipmentMaintain" method="get"
						class="form-horizontal">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">选择存放区域</label>
							<div class="col-sm-8">
								<select onChange="setEquipments()" id="equipmentarea"
									 class="form-control">
									<option value="0">请选择设备存放区域</option>
									<s:iterator value="processLine_AreaList">
										<option value="<s:property value="id" />"><s:property
												value="name" /></option>
									</s:iterator>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-xs-3 control-label">选择设备编号</label>
							<div>
								<div class="col-xs-8">
									<select id="equipment" name="maintenanceDailyWorkRecord.ep_id" class="form-control">
										<option value="0">请先选择设备存放区域</option>
									</select>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-3 control-label" for="exampleInputAmount">实际耗时分钟数</label>
							<div class="col-xs-8">
								<div class="input-group">
									<input name="maintenanceDailyWorkRecord.user_time" type="text" class="form-control" id="exampleInputAmount"
										placeholder="请输入实际耗时分钟数....">
									<div class="input-group-addon">分钟</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-xs-3 control-label">维修日期</label>
							<div class="col-xs-8">
								<div class="control-group">
									<div class="controls input-append date form_date" data-date=""
										data-date-format="yyyy-mm-dd" data-link-field="dtp_input2"
										data-link-format="yyyy-mm-dd">
										<input name="maintenanceDailyWorkRecord.time" class="text-center" size="16" type="text" value=""
											readonly> <span class="add-on"><i
											class="icon-remove"></i></span> <span class="add-on"><i
											class="icon-th"></i></span>
									</div>
									
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">问题描述</label>
							<div class="col-sm-8">
								<textarea name="maintenanceDailyWorkRecord.question_description" class="form-control"
									rows="3" placeholder="请输入设备问题描述....."></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">处理方法</label>
							<div class="col-sm-8">
								<textarea name="maintenanceDailyWorkRecord.process_description" class="form-control"
									rows="3" placeholder="请输入设备处理方法....."></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">使用备品种类</label>
							<div class="col-sm-8">
								<select id="partkinds" onchange="newPart()"
									name="" class="form-control">
									<option value="0">0</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
								</select>
							</div>
						</div>
						<div id='newPart'></div>
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
	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>

	<script type="text/javascript" src="js/jquery.cxselect.js"></script>
	<script>
		window.jQuery
				|| document.write('<script src="js/jquery.min.js"><\/script>');
	</script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/bootstrapValidator.js"></script>
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
			minView : "month",//设置只显示到月份
			initialDate : new Date(),//初始化当前日期
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
			$.ajax({
						url : 'http://localhost:8080/TPM/GetEquipmentbyArea?save_area_id='+id,
						type : 'GET',
						success : function(data) {
							//alert(data[0].name);
							//var obj = JSON.parse(data);
							obj = data;
							for (var i = 0; i < obj.length; i++) {
								var opt = document.createElement('option');
								opt.value = obj[i].id;
								opt.text = obj[i].epid + '　:　' + obj[i].name;
								sltEquipment.add(opt, null);
							}
						}
					});
			if (id == 0) {
				document.getElementById("equipment").disabled = true;
				var opt = document.createElement('option');
				opt.value = '0';
				opt.text = '请先选择设备存放区域';
				sltEquipment.add(opt, null);
			}
		}
		function newPart() {
			var newPart = document.getElementById("newPart");
			var partkindsObj = document.getElementById("partkinds");
			var id = partkindsObj.options[partkindsObj.selectedIndex].value;
			//alert("13");
			//alert(partkinds);
			newPart.innerHTML = '';
			for (var i = 0; i < id; i++) {
				var sequence = i + 1;
				newPart.innerHTML = newPart.innerHTML
						+ '<div class="form-group"><label for="inputEmail3" class="col-sm-3 control-label bg-danger">备品'
						+ sequence
						+ ':ID</label><div class="col-sm-8"><input onBlur="searchPart(this)" name="useRecords['+i+'].part_id" type="text" class="form-control" id="'+sequence+'" placeholder="请输入备品ID：S-..."></div></div>'
						+ '<div class="form-group"><label for="inputEmail3" class="col-sm-3 control-label">使用数量</label><div class="col-sm-8"><input name="useRecords['+i+'].use_number" type="text" class="form-control" id="inputEmail3" placeholder="请输入备品使用数量（正整数）"></div></div>'
						+ '<div class="form-group"><label for="inputEmail3" class="col-sm-3 control-label">请核对备品名称</label><div class="col-sm-8"> <p id="partname'+sequence+'" class="form-control-static bg-danger"></p><input type="hidden" name="useRecords['+i+'].replacement_part_id" id="replacement_part_id'+sequence+'"/></div></div>';
			}
		}
		function searchPart(thisinput){
			var partname = document.getElementById("partname"+thisinput.id);
			var replacement_part_id = document.getElementById("replacement_part_id"+thisinput.id);
			//alert(1);
			//alert(parts[1].name);
			//alert(thisinput.value);
			for (var i = 0; i < parts.length; i++) {
				if (parts[i].part_id==thisinput.value) {
			    partname.innerText = parts[i].name;
			    replacement_part_id.value = parts[i].id;
				break;
				}
			}
			if (partname.innerText == "") {
				partname.innerText = "无此备件"
			}
		}
		
		
	</script>
</body>
</html>