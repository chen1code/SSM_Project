<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!--360浏览器优先以webkit内核解析-->


<title>userList</title>

<link rel="shortcut icon" href="">
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<link href="./resources/css/bootstrap-table.min.css" rel="stylesheet">
<link href="./resources/css/font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="./resources/css/style.css" rel="stylesheet">
<link href="./resources/css/main.css" rel="stylesheet">
</head>
<body class="gray-bg">
	<div class="row  border-bottom white-bg dashboard-header">
		<div class="row  border-bottom white-bg dashboard-header">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>用户管理</h5>
					</div>
					<div class="ibox-content">
						<div class="example">
							<p class="col-md-3" style="float:none">Tips:可只填一个条件</p>
							<div class="col-xs-3">
								<select id="searchSchools" class="form-control" name="toSchoolNumber">
									<option value="">选择学院</option>
								</select>
							</div>
							<div class="col-xs-3"><input type="text" id="searchUserName" class="form-control"placeholder="用户名" autocomplete="off" style="border-radius:5px"/></div>
							<div class="col-xs-3">
								<select id="searchUserType" class="form-control" name="user_type">
									<option value="" disabled selected style='display:none;'>用户身份类型</option>
									<option value="0">超级管理员</option>
									<option value="1">普通用户</option>
								</select>
							</div>
							<button id="searchUser" class="btn btn-primary" type="button"><i class="fa fa-search"></i>&nbsp;搜索</button>
							
							<table id="userTable" data-mobile-responsive="true"></table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 弹出窗口（模态框） -->
		<div class="modal inmodal fade" id="userDataModal" tabindex="-1"
			role="dialog" aria-hidden="true">
			<div class="modal-dialog modal-lg" style="width:60%">
				<div class="modal-content">
					<div class="col-sm-12">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<h5></h5>
							</div>
							<div class="ibox-content">
								<form class="form-horizontal m-t" id="userDataForm" method="post">
									<div class="form-group hide">
										<label class="col-sm-3 control-label">用户id：</label>
										<div class="col-sm-8">
											<input id="user_id" name="id" type="text"
												class="form-control" required="" aria-required="true"
												autocomplete="off">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">账号：</label>
										<div class="col-sm-8">
											<input id="user_account" name="account" type="text"
												class="form-control" required="" aria-required="true"
												autocomplete="off">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">密码：</label>
										<div class="col-sm-8">
											<input id="user_password" name="password" type="text"
												class="form-control" required="" aria-required="true"
												autocomplete="off">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">姓名：</label>
										<div class="col-sm-8">
											<input id="user_name" name="userName" type="text"
												class="form-control" required="" aria-required="true"
												autocomplete="off">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">学院：</label>
										<div class="col-sm-8">
											<select class="form-control m-b" name="toSchoolNumber" id="schools">
												<option value="null"></option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">用户类型：</label>
										<div class="col-sm-8">
											<select class="form-control m-b" name="user_type" id="userType">
												<option value="0">超级管理员</option>
												<option value="1">普通用户</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">注册日期：</label>
										<div class="col-sm-8">
											<input id="submission_date" name="submission_date"
												type="text" class="form-control" required=""
												aria-required="true" autocomplete="off">
										</div>
									</div>
									<div class="form-group hide">
										<div class="col-sm-4 col-sm-offset-3">
											<button class="btn btn-primary" id="updateUser">提交</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-white modal-close" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="send-message">保存</button>
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
							确认删除用户<span class="text-danger"></span>? <span
								class="selectId hide"></span>
						</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="deleteUserData">删除</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 全局js -->
	<script src="./resources/js/jquery.min.js"></script>
	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/bootstrap-table.min.js"></script>
	<script src="./resources/js/bootstrap-table-zh-CN.min.js"></script>
	<script src="./resources/js/main.js"></script>
	
	<script src="./resources/js/selectSchool.js"></script>
	<!-- jquery.validate -->
	<script src="./resources/js/jquery.validate.min.js"></script>
	<script src="./resources/js/messages_zh.min.js"></script>
	<script src="./resources/js/validateDemo.js"></script>
	
</body>
</html>