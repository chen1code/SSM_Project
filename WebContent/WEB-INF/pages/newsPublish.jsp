<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新闻发布</title>
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
						<h5>新闻发布</h5>
					</div>
					<div class="ibox-content">
						<form class="form-horizontal m-t" id="newsPublishForm" method="post">
							<div class="form-group">
								<label class="col-sm-3 control-label">新闻标题：</label>
								<div class="col-sm-8">
									<input id="news_title" name="title" minlength="2" type="text"
										class="form-control" required="" aria-required="true" autocomplete="off">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">作者：</label>
								<div class="col-sm-8">
									<input id="author" type="text" class="form-control"
										name="author" required="" aria-required="true" autocomplete="off">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">新闻类型：</label>
								<div class="col-sm-8">
									<select class="form-control m-b" name="newsType">
										<option value="校内通知">校内通知</option>
										<option value="活动相关">活动相关</option>
										<option value="科研通知">科研通知</option>
										<option value="其他">其他</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">新闻内容：</label>
								<div class="col-sm-8">
									<textarea id="news_content" name="content" class="form-control"
										required="" aria-required="true" style="height: 400px"></textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-4 col-sm-offset-3">
									<button class="btn btn-primary" id="publishNews">提交</button>
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

<!-- jquery.validate -->
<script src="./resources/js/jquery.validate.min.js"></script>
<script src="./resources/js/messages_zh.min.js"></script>
<script src="./resources/js/validateDemo.js"></script>

</html>