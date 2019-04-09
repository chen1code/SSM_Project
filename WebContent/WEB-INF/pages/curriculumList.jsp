<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>课程列表</title>
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
					<h5>课程列表</h5>
				</div>
				<div class="ibox-content">
					<div class="example">
						<div class="col-sm-12">
							<p class="col-md-3" style="float:none">Tips:可只填一个条件</p>
							<div class="col-xs-3"><input type="text" id="searchCurriculumNumber" class="form-control" placeholder="课程号" autocomplete="off" style="border-radius:5px"/></div>
							<div class="col-xs-3">
								<select id="searchCurriculumType" class="form-control" name="curriculumType">
									<option value="">请选择课程类型</option>
									<option value="必修课">必修课</option>
									<option value="学科基础课">学科基础课</option>
									<option value="专业课">专业课</option>
									<option value="选修课">选修课</option>
								</select>
							</div>
							<div class="col-xs-3">
								<input type="text" id="searchCurriculumName" class="form-control" placeholder="课程名称" autocomplete="off" style="border-radius:5px"/>
							</div>
							<button id="searchCurriculum" class="btn btn-primary" type="button"><i class="fa fa-search"></i>&nbsp;搜索</button>
						</div>
						<table id="curriculumListTable" data-mobile-responsive="true"></table>
					</div>
				</div>
			</div>
		</div>
		<!-- 查看信息框 -->
		<!-- 确认弹出框 -->
		<div class="modal inmodal fade" id="viewCurriculumDataModal"
			tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog modal-lg" style="width: 90%">
				<div class="modal-content">
					<div class="col-sm-12">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<h5></h5>
							</div>
							<div class="ibox-content">
								<form class="form-horizontal m-t" id="updateCurriculumForm"
									method="post">
									<div class="form-group hide">
										<label class="col-sm-3 control-label">id：</label>
										<div class="col-sm-8">
											<input id="" name="id" class="form-control" aria-required="true">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">学院：</label>
										<div class="col-sm-8">
											<select id="schools" class="form-control m-b" name="school" required=""
												aria-required="true">
												<option></option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">专业：</label>
										<div class="col-sm-8">
											<select id="specialties" class="form-control m-b" name="specialty" required=""
												aria-required="true">
												<option></option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">课程号：</label>
										<div class="col-sm-8">
											<input id="news_content" name="curriculumNumber"
												class="form-control" required="" aria-required="true">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">课程类型：</label>
										<div class="col-sm-8">
											<select class="form-control m-b" name="curriculumType"
												required="" aria-required="true">
												<option></option>
												<option value="公共学位课">公共学位课</option>
												<option value="必修课">必修课</option>
												<option value="学科基础课">学科基础课</option>
												<option value="专业课">专业课</option>
												<option value="选修课">选修课</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">课程名称：</label>
										<div class="col-sm-8">
											<input id="news_content" name="curriculumName"
												class="form-control" required="" aria-required="true">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">学分：</label>
										<div class="col-sm-8">
											<input id="news_content" name="credit" class="form-control"
												required="" aria-required="true">
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
											<select class="form-control m-b" name="startSemester"
												required="" aria-required="true">
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
											<input id="news_content" name="location" class="form-control"
												required="" aria-required="true">
										</div>
									</div>
									<div class="form-group hide">
										<div class="col-sm-4 col-sm-offset-3">
											<button class="btn btn-primary" id="curriculumDataSend">提交</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-white modal-close" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="updateCurriculumData">保存</button>
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
						<button type="button" class="btn btn-primary" id="deleteCurriculumData">删除</button>
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

<!-- 学院 专业 -->
<script src="./resources/js/selectSchool.js"></script>

<!-- jquery.validate -->
<script src="./resources/js/jquery.validate.min.js"></script>
<script src="./resources/js/messages_zh.min.js"></script>
<script src="./resources/js/validateDemo.js"></script>
</html>