<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书列表</title>
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
					<h5>图书列表</h5>
				</div>
				<div class="ibox-content">
					<div class="example">
						<div class="col-sm-12">
							<p class="col-md-3" style="float:none">Tips:可只填一个条件</p>
							<div class="col-xs-3">
								<select id="bookType" class="form-control" name="curriculumType">
									<option value="">请选择书籍类型</option>
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
							<div class="col-xs-3"><input type="text" id="bookIsbn" class="form-control" placeholder="ISBN" autocomplete="off" style="border-radius:5px"/></div>
							<div class="col-xs-3">
								<input type="text" id="searchBookName" class="form-control" placeholder="书名" autocomplete="off" style="border-radius:5px"/>
							</div>
							<button id="searchBook" class="btn btn-primary" type="button"><i class="fa fa-search"></i>&nbsp;搜索</button>
						</div>
						<table id="bookListTable" data-mobile-responsive="true"></table>
					</div>
				</div>
			</div>
		</div>
		<!-- 查看新闻信息框 -->
		<!-- 确认弹出框 -->
		<div class="modal inmodal fade" id="viewBookDataModal" tabindex="-1"
			role="dialog" aria-hidden="true">
			<div class="modal-dialog modal-lg" style="width: 90%">
				<div class="modal-content">
					<div class="col-sm-12">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<h5></h5>
							</div>
							<div class="ibox-content">
								<form class="form-horizontal m-t" id="booksUpdateForm"
									method="post">
									<div class="form-group hide">
										<label class="col-sm-3 control-label">book_id：</label>
										<div class="col-sm-8">
											<input name="id" type="text"
												class="form-control" required="" aria-required="true"
												autocomplete="off">
										</div>
									</div>
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
											<input name="isbn" class="form-control" required=""
												aria-required="true" autocomplete="off">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">书名：</label>
										<div class="col-sm-8">
											<input name="bookName" class="form-control" required=""
												aria-required="true" autocomplete="off">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">作者：</label>
										<div class="col-sm-8">
											<input name="bookAuthor" class="form-control" required=""
												aria-required="true" autocomplete="off">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">出版时间：</label>
										<div class="col-sm-8">
											<input name="publishTime" class="form-control" required=""
												aria-required="true" autocomplete="off">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">出版社：</label>
										<div class="col-sm-8">
											<input name="publishCompany" class="form-control" required=""
												aria-required="true" autocomplete="off">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">图书简介：</label>
										<div class="col-sm-8">
											<textarea name="bookInfo" class="form-control"
												placeholder="填写图书相关介绍(非必填)" style="height: 160px"></textarea>
										</div>
									</div>
									<div class="form-group hide">
										<div class="col-sm-4 col-sm-offset-3">
											<button class="btn btn-primary" id="updateBookSend">提交</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-white modal-close"
							data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="updateBooksData">保存</button>
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
							确认删除<span class="text-danger"></span>? <span
								class="selectId hide"></span>
						</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="deleteBooksData">删除</button>
					</div>
				</div>
			</div>
		</div>
		<!-- small 提示框 -->
		<div class="alert alert-danger alert-dismissable success-alert">
			<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
			借阅成功 ！
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