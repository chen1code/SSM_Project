<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的课表</title>
<meta name="keywords" content="">
<meta name="description" content="">

<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<link href="./resources/css/bootstrap-table.min.css" rel="stylesheet">
<link href="./resources/css/font-awesome-4.7.0/css/font-awesome.min.css">
<link href="./resources/css/animate.css" rel="stylesheet">
<link href="./resources/css/style.css" rel="stylesheet">
<link href="./resources/css/main.css" rel="stylesheet">
</head>
<body class="gray-bg">
	<div class="row  border-bottom white-bg dashboard-header">
		<div class="col-sm-12">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<h5>我的课表</h5>
				</div>
				<div class="ibox-content">
					<div class="example">
						<button id="chooseCurriculum" class="btn btn-primary" type="button"><i class="fa fa-add"></i>&nbsp;选课</button>
						<table id="myCurriculumTable" data-mobile-responsive="true"></table>
					</div>
				</div>
			</div>
		</div>
		<!-- 查看新闻信息框 -->
		<!-- 确认弹出框 -->
		<div class="modal inmodal fade" id="chooseCurriculumModal"
			tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog modal-lg" style="width: 90%">
				<div class="modal-content">
					<div class="col-sm-12">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<h5>选课: <span id="myAccount" class="hide">${sessionScope.account}</span></h5>
							</div>
							<div class="ibox-content">
								<table id="chooseCurriculumTable" data-mobile-responsive="true"></table>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-white modal-close" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="saveCurriculumChoose">提交</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 确认弹出框 -->
		<div class="modal inmodal fade" id="confirmModal" tabindex="-1"
			role="dialog" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<!-- <h4 class="modal-title">确认信息</h4> -->
					</div>
					<div class="modal-body">
						<p class="confirm-hint text-center">
							确认删除该课程<span class="text-danger"></span>? <span
								class="selectId hide"></span>
						</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="deleteMyCurriculumData">删除</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<!-- 全局js -->
<script src="./resources/js/jquery.min.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<script src="./resources/js/bootstrap-table.min.js"></script>
<script src="./resources/js/bootstrap-table-zh-CN.min.js"></script>
<script src="./resources/js/main.js"></script>

<!-- jquery.validate -->
<script src="./resources/js/jquery.validate.min.js"></script>
<script src="./resources/js/messages_zh.min.js"></script>
<script src="./resources/js/validateDemo.js"></script>
</html>