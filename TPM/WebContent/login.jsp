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
<!-- Custom styles for this template -->
<link href="css/custom.css" rel="stylesheet">
<link href="css/login.css" rel="stylesheet">
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
	<%@include file="WEB-INF/jsp/head.jsp"%>
	<div class="loginbackground">
		<div class="container">
			<br> <br>
			<div class="row">
				<div class="col-xs-8"></div>
				<div class="col-xs-4">
					<form id="defaultForm" action="UserLogin" method="post" class="form-horizontal">
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-9">
								<h4 class="text-danger">${error}</h4>
							</div>
							<label for="inputSESAID"
								class="col-sm-3 control-label labelcolor">账号:</label>
							<div class="col-sm-9">
								<input name="staff.sesaid" type="SESAID" class="form-control"
									id="SESAIDs" placeholder="SESAID">
								<span class="help-block" id="sesaid" />
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3"
								class="col-sm-3 control-label labelcolor">密码:</label>
							<div class="col-sm-9">
								<input name="staff.password" type="password"
									class="form-control" id="inputPassword3" placeholder="Password">
								<span class="help-block" id="password" />
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-2">
								<button type="submit" class="btn btn-default">Sign in</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@include file="WEB-INF/jsp/bottom.jsp"%>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script>
		window.jQuery
				|| document.write('<script src="js/jquery-1.10.2.min.js"><\/script>')
	</script>
	<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrapValidator.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="js/ie10-viewport-bug-workaround.js"></script>
 <script type="text/javascript">
	$(document).ready(function() {
	    $('#defaultForm').bootstrapValidator({
	        message: 'This value is not valid',
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	        	'staff.sesaid': {
	                container: '#sesaid',
	                validators: {
	                    notEmpty: {
	                        message: 'The SESAID is required and cannot be empty'
	                    }
	                }
	            },
	            'staff.password': {
	                container: '#password',
	                validators: {
	                    notEmpty: {
	                        message: 'The Password is required and cannot be empty'
	                    }
	                }
	            }
	        }
	    });
	});
</script>
</body>
</html>