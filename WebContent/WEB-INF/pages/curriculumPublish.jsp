<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增课程</title>
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
	<div class="wrapper wrapper-content animated">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>新增课程</h5>
					</div>
					<div class="ibox-content">
						<form class="form-horizontal m-t" id="addCurriculumForm" method="post">
							<div class="form-group">
								<label class="col-sm-3 control-label">学院：</label>
								<div class="col-sm-8">
									<select id="schools" class="form-control m-b" name="school" required="" aria-required="true">
										<option></option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">专业：</label>
								<div class="col-sm-8">
									<select id="specialties" class="form-control m-b" name="specialty" required="" aria-required="true">
										<option></option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">课程号：</label>
								<div class="col-sm-8">
									<input id="news_content" name="curriculumNumber" class="form-control"
										required="" aria-required="true" >
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">课程类型：</label>
								<div class="col-sm-8">
									<select class="form-control m-b" name="curriculumType" required="" aria-required="true">
										<option></option>
										<option value="公共学位课">公共学位课</option>
										<option value="学科基础课">学科基础课</option>
										<option value="专业课">专业课</option>
										<option value="选修课">选修课</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">课程名称：</label>
								<div class="col-sm-8">
									<input id="news_content" name="curriculumName" class="form-control"
										required="" aria-required="true" >
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">学分：</label>
								<div class="col-sm-8">
									<input id="news_content" name="credit" class="form-control"
										required="" aria-required="true" >
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">学时：</label>
								<div class="col-sm-8">
									<input id="news_content" name="period" class="form-control"
										required="" aria-required="true">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">修课学期：</label>
								<div class="col-sm-8">
									<select class="form-control m-b" name="startSemester" required="" aria-required="true">
										<option></option>
										<option value="春季">春季</option>
										<option value="秋季">秋季</option>
										<option value="春季秋季">春季秋季</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">上课地点：</label>
								<div class="col-sm-8">
									<select class="form-control m-b" name="location" required="" aria-required="true">
										<option></option>
										<option value="校本部">校本部</option>
										<option value="新校区">新校区</option>
										<option value="铁道学院">铁道学院</option>
										<option value="南校区">南校区</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-4 col-sm-offset-3">
									<button class="btn btn-primary">提交</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- small 提示框 -->
		<div class="alert alert-danger alert-dismissable success-alert">
			<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
			发布成功 ！
		</div>
	</div>
</body>
<!-- 全局js -->
<script src="./resources/js/jquery.min.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<script src="./resources/js/bootstrap-table.min.js"></script>
<script src="./resources/js/bootstrap-table-zh-CN.min.js"></script>

<!-- 学院 专业 -->
<script src="./resources/js/selectSchool.js"></script>

<!-- jquery.validate -->
<script src="./resources/js/jquery.validate.min.js"></script>
<script src="./resources/js/messages_zh.min.js"></script>
<script src="./resources/js/validateDemo.js"></script>

</html>