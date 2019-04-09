<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增图书</title>
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
						<h5>新增图书</h5>
					</div>
					<div class="ibox-content">
						<form class="form-horizontal m-t" id="addBookForm" method="post">
							<div class="form-group">
								<label class="col-sm-3 control-label">图书类别：</label>
								<div class="col-sm-8">
									<select class="form-control m-b" name="bookType" required="" aria-required="true">
										<option value="工学">工学</option>
										<option value="理学">理学</option>
										<option value="医学">医学</option>
										<option value="经济学">经济学</option>
										<option value="法学">法学</option>
										<option value="教育学">教育学</option>
										<option value="文学">文学</option>
										<option value="艺术学">艺术学</option>
										<option value="管理学">管理学</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">ISBN：</label>
								<div class="col-sm-8">
									<input name="isbn" class="form-control"
										required="" aria-required="true" autocomplete="off">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">书名：</label>
								<div class="col-sm-8">
									<input name="bookName" class="form-control"
										required="" aria-required="true" autocomplete="off">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">作者：</label>
								<div class="col-sm-8">
									<input name="bookAuthor" class="form-control"
										required="" aria-required="true" autocomplete="off">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">出版时间：</label>
								<div class="col-sm-8">
									<input name="publishTime" class="form-control"
										required="" aria-required="true" autocomplete="off">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">出版社：</label>
								<div class="col-sm-8">
									<input name="publishCompany" class="form-control"
										required="" aria-required="true" autocomplete="off">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">图书简介：</label>
								<div class="col-sm-8">
									<textarea name="bookInfo" class="form-control" placeholder="填写图书相关介绍(非必填)" style="height:160px"></textarea>
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
			新增成功 ！
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