$(function(){
	//判断引用哪个bootstrap table
	if($(".ibox-title").html().indexOf("用户") >= 0){
		userTableInit();
	}
	if($(".ibox-title").html().indexOf("新闻") >= 0){
		newsListTableInit();
	}
	if($(".ibox-title").html().indexOf("课程列表") >= 0){
		curriculumTableInit();
	}
	if($(".ibox-title").html().indexOf("列表") >= 0){
		bookListTableInit();
	}
	if($(".ibox-title").html().indexOf("我的课表") >= 0){
		myCurriculumTableInit()
	}
	if($(".ibox-title").html().indexOf("借阅") >= 0){
		myBorrowBookTableInit()
	}
	
	//删除用户数据
	$("#deleteUserData").click(function(){
		var id = $("#confirmModal .confirm-hint .selectId").html();
		$.ajax({
			url : "delete_user",
			type: "post",
			data: {
				id : id
			},
			success: function(data){
				$("#confirmModal .close").click();
				$("#userTable").bootstrapTable('refresh');
			}
		})
	})
	//修改用户数据
	$("#send-message").click(function(){
		$("#updateUser").click();
	})
	//模糊查询获取用户
	$("#searchUser").click(function(){
		$("#userTable").bootstrapTable("refresh");
	})
	//updatenews send message
	$("#updateNewsData").click(function(){
		$("#updateNewsSend").click();
	})
	//删除新闻数据
	$("#deleteNewsData").click(function(){
		var id = $("#confirmModal .selectId").html();
		$.ajax({
			url : "deleteNews",
			type: "post",
			data : {id:id},
			success: function(data){
				$("#confirmModal .close").click();
				$("#newsListTable").bootstrapTable('refresh');
			}
		})
	})
	//update curriculum send message
	$("#updateCurriculumData").click(function(){
		$("#curriculumDataSend").click();
	})
	//模糊查询获取课程数据
	$("#searchCurriculum").click(function(){
		$("#curriculumListTable").bootstrapTable('refresh');;
	})
	//删除课程数据
	$("#deleteCurriculumData").click(function(){
		var id = $("#confirmModal .selectId").html();
		$.ajax({
			url : "deleteCurriculum",
			type: "post",
			data : {id:id},
			success: function(data){
				$("#confirmModal .close").click();
				$("#curriculumListTable").bootstrapTable('refresh');
			}
		})
	})
	//选课程
	$("#chooseCurriculum").click(function(){
		$("#chooseCurriculumModal").modal();
		chooseCurriculumTableInit();
	})
	$("#saveCurriculumChoose").click(function(){
		var selectData = $("#chooseCurriculumTable").bootstrapTable('getSelections');
		var studentNumber = $("#myAccount").html();
		var stuCurriculum = [];
		for(var i = 0; i < selectData.length; i++){
			stuCurriculum.push({"studentNumber": studentNumber,"curriculumNumber": selectData[i].curriculumNumber})
		}
		$.ajax({
			url: "chooseCurriculum",
			type: "post",
			contentType : "application/json;charsetset=UTF-8",
			dataType:'json',
			data: JSON.stringify(stuCurriculum),
			success: function(re_data){
				if(re_data.message="添加成功"){
					$("#chooseCurriculumModal .modal-close").click();
					$("#myCurriculumTable").bootstrapTable('refresh');
				}
			}
		})
	})
	//delete my curriculum
	$("#deleteMyCurriculumData").click(function(){
		var curriculumNumber = $("#confirmModal .selectId").html();
		$.ajax({
			url : "deleteMyCurriculum",
			type : "post",
			data: {curriculumNumber:curriculumNumber},
			success: function(){
				$("#confirmModal .close").click();
				$("#myCurriculumTable").bootstrapTable('refresh');
			}
		})
	})
	//update book send message
	$("#updateBooksData").click(function(){
		$("#updateBookSend").click();
	})
	//删除book数据
	$("#deleteBooksData").click(function(){
		var id = $("#confirmModal .selectId").html();
		$.ajax({
			url : "deleteBook",
			type: "post",
			data : {id:id},
			success: function(data){
				$("#confirmModal .close").click();
				$("#bookListTable").bootstrapTable('refresh');
			}
		})
	})
	//模糊搜索
	$("#searchBook").click(function(){
		$("#bookListTable").bootstrapTable('refresh');
	})
	//还书
	$("#returnBook").click(function(){
		var account = $("#account").html();
		var isbn = $(".confirm-hint .selectId").html();
		$.ajax({
			url : "returnBook",
			type : "post",
			data : {
				userAccount : account,
				bookIsbn : isbn
			},
			success : function(data){
				$("#confirmModal .close").click();
				$("#myBorrowBookTable").bootstrapTable('refresh');
			}
		})
	})
})

var userTableInit = function(){
		//首页用户表展示
		$("#userTable").bootstrapTable({
			url : "users",
			method : "post",
			contentType : "application/x-www-form-urlencoded",
			pagination: true, 
			sortOrder: "asc",                   //排序方式
	        queryParams: queryParams,//传递参数（*）
	        sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
	        pageNumber: 1,                       //初始化加载第一页，默认第一页
	        pageSize: 10,                       //每页的记录行数（*）
	        pageList: [5, 10, 20, 50],        //可供选择的每页的行数（*）
	        strictSearch: true,
	        showColumns: true,                  //是否显示所有的列
	        showRefresh: true,                  //是否显示刷新按钮
	        clickToSelect: true,                //是否启用点击选中行
	        //height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
	        uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
	        columns: [{
	        	fielf: "ID",
	        	title: "ID",
	        	formatter:function(value,row,index){
	                var pageSize=$('#userTable').bootstrapTable('getOptions').pageSize;
	                var pageNumber=$('#userTable').bootstrapTable('getOptions').pageNumber;
	                return pageSize * (pageNumber - 1) + index + 1;
	            }
	        },{
	        	field: "account",
	        	title: "账号"
	        },{
	        	field: "password",
	        	title: "密码"
	        },{
	        	field: "userName",
	        	title: "姓名"
	        },{
	        	field: "toSchoolNumber",
	        	title: "学院"
	        },{
	        	field: "user_type",
	        	title: "用户身份类型"
	        },{
	        	field: "submission_date",
	        	title: "注册日期"
	        },{
	        	field: "operation",
	        	title: "操作",
	        	formatter:function(value,row,index){
	        		return '<a id="viewData" class="btn btn-success btn-xs" style="margin-right:10px"><i class="fa fa-eye"></i> 查看</a>'
	        		+'<a id="changeData" class="btn btn-xs btn-warning" style="margin-right:10px"><i class="fa fa-edit"></i> 修改</a>'
	        		+'<a id="deleteData" class="btn btn-danger btn-xs"><i class="fa fa-close"></i> 删除</a>';
	        	},
	        	events: {
	        		'click #viewData': function(e, value, row, index){
	        			fill_user_data(row);
	        			$("#send-message").hide();
	        			$("#userDataModal .ibox-title h5").html("用户详情");
	        			$("#userDataForm input").prop("disabled","disabled");
	        			$("#userDataForm select").prop("disabled","disabled");
	        		},
	        		'click #changeData': function(e, value, row, index){
	        			fill_user_data(row);
	        			$("#send-message").show();
	        			$("#userDataModal .ibox-title h5").html("修改用户信息");
	        			$("#userDataForm input").removeAttr("disabled");
	        			$("#userDataForm select").removeAttr("disabled");
	        			$("#userDataForm #submission_date").prop("disabled","disabled");
	        		},
	        		'click #deleteData': function(e, value, row, index){
	        			$(".confirm-hint span").html(row.account);
	        			$(".confirm-hint .selectId").html(row.id);
	        			$("#confirmModal").modal();
	        		}
	        	}
	        }]
		})
		//生成查询参数 分页or查询
		function queryParams(params){
			if($("#schools").val()=="null"){
				$("#schools").val("");
			}
		   var temp = {
		       "offset": params.offset,
		       "limit":params.limit,
		       "toSchoolNumber" : $("#searchSchools").val(),
				"userName" : $("#searchUserName").val(),
				"user_type" : $("#searchUserType").val()
		   }
		   return temp;
		}
		//function 填充数据
		function fill_user_data(row){
			$("#userDataModal").modal();
			checkSchools();
			$("#userDataForm #user_id").val(row.id);
			$("#userDataForm #user_account").val(row.account);
			$("#userDataForm #user_password").val(row.password);
			$("#userDataForm #user_name").val(row.userName);
			$("#userDataForm #userType").val(row.user_type);
			$("#userDataForm #schools").val(row.toSchoolNumber);
			$("#userDataForm #submission_date").val(row.submission_date);
		}
}

//newsListTableInit
var newsListTableInit = function(){
	$("#newsListTable").bootstrapTable({
		url : "news",
		method : "get",
		pagination: true, 
		sortName: "publish_date",
		sortable: true,                     //是否启用排序
		sortOrder: "asc",                   //排序方式
        queryParams: newsListTableInit.queryParams,//传递参数（*）
        sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
        pageNumber: 1,                       //初始化加载第一页，默认第一页
        pageSize: 5,                       //每页的记录行数（*）
        pageList: [5, 10, 20, 50],        //可供选择的每页的行数（*）
        strictSearch: true,
        showColumns: true,                  //是否显示所有的列
        showRefresh: true,                  //是否显示刷新按钮
        clickToSelect: true,                //是否启用点击选中行
        uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
        columns: [{
        	fielf: "ID",
        	title: "ID",
        	formatter:function(value,row,index){
                var pageSize=$('#newsListTable').bootstrapTable('getOptions').pageSize;
                var pageNumber=$('#newsListTable').bootstrapTable('getOptions').pageNumber;
                return pageSize * (pageNumber - 1) + index + 1;
            }
        },{
        	field: "title",
        	title: "  新闻标题"
        },{
        	field: "author",
        	title: "作者"
        },{
        	field: "newsType",
        	title: "新闻类型"
        },{
        	field: "publish_date",
        	title: "发布日期"
        },{
        	field: "operation",
        	title: "操作",
        	formatter:function(value,row,index){
        		return '<a id="viewNewsData" class="btn btn-success btn-xs" style="margin-right:10px"><i class="fa fa-eye"></i> 查看</a>'
        		+'<a id="changeNewsData" class="btn btn-xs btn-warning ifType" style="margin-right:10px"><i class="fa fa-edit"></i> 修改</a>'
        		+'<a id="deleteNewsData" class="btn btn-danger btn-xs ifType"><i class="fa fa-close"></i> 删除</a>';
        	},
        	events: {
        		'click #viewNewsData': function(e, value, row, index){
        			fill_new_data(row);
        			$("#viewNewsDataModal .ibox-title h5").html("新闻详情");
        			$("#viewNewsDataModal input").prop("disabled","disabled");
        			$("#viewNewsDataModal select").prop("disabled","disabled");
        			$("#viewNewsDataModal textarea").prop("disabled","disabled");
        			$("#updateNewsData").hide();
        			
        		},
        		'click #changeNewsData': function(e, value, row, index){
        			fill_new_data(row);
        			$("#viewNewsDataModal .ibox-title h5").html("修改新闻信息");
        			$("#viewNewsDataModal input").removeAttr("disabled");
        			$("#viewNewsDataModal select").removeAttr("disabled");
        			$("#viewNewsDataModal textarea").removeAttr("disabled");
        			$("#updateNewsData").show();
        		},
        		'click #deleteNewsData': function(e, value, row, index){
        			$("#confirmModal").modal();
        			$(".confirm-hint span").html(row.title);
        			$(".confirm-hint .selectId").html(row.id);
        		}
        	}
        }],
        onPostBody: function(){
        	if(parent.$("#user_type").text() == "普通用户"){
    			$(".ifType").hide();
    		}
        }
	})
	function queryParams(params) {
		var temp1 = {
			"offset" : params.pageSize,
			"limit" : params.pageNumber
		}
		return temp1;
	}
	//填充数据
	function fill_new_data(row){
		$("#viewNewsDataModal").modal();
		$("#viewNewsDataModal #news_id").val(row.id);
		$("#viewNewsDataModal #news_title").val(row.title);
		$("#viewNewsDataModal #author").val(row.author);
		$("#viewNewsDataModal #newsType").val(row.newsType);
		$("#viewNewsDataModal #news_content").val(row.content);
	}
}


//curriculumListTableInit
var curriculumTableInit = function(){
	$("#curriculumListTable").bootstrapTable({
		url : "curriculumsList",
		method : "post",
		contentType : "application/x-www-form-urlencoded",
		pagination: true, 
		sortable: true,                     //是否启用排序
		sortOrder: "asc",                   //排序方式
        queryParams: queryParams,//传递参数（*）
        sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
        pageNumber: 1,                       //初始化加载第一页，默认第一页
        pageSize: 10,                       //每页的记录行数（*）
        pageList: [10, 20, 30, 50],        //可供选择的每页的行数（*）
        strictSearch: true,
        showColumns: true,                  //是否显示所有的列
        showRefresh: true,                  //是否显示刷新按钮
        clickToSelect: true,                //是否启用点击选中行
        uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
        columns: [{
        	fielf: "ID",
        	title: "ID",
        	formatter:function(value,row,index){
                var pageSize=$('#curriculumListTable').bootstrapTable('getOptions').pageSize;
                var pageNumber=$('#curriculumListTable').bootstrapTable('getOptions').pageNumber;
                return pageSize * (pageNumber - 1) + index + 1;
            }
        },{
        	field: "curriculumNumber",
        	title: "课程号"
        },{
        	field: "curriculumType",
        	title: "课程类型"
        },{
        	field: "curriculumName",
        	title: "课程名称"
        },{
        	field: "credit",
        	title: "学分"
        },{
        	field: "period",
        	title: "学时"
        },{
        	field: "startSemester",
        	title: "开课学期"
        },{
        	field: "location",
        	title: "上课地点"
        },{
        	field: "operation",
        	title: "操作",
        	formatter:function(value,row,index){
        		return '<a id="viewCurriculumData" class="btn btn-success btn-xs" style="margin-right:10px"><i class="fa fa-eye"></i> 查看</a>'
        		+'<a id="changeCurriculumData" class="btn btn-xs btn-warning ifType" style="margin-right:10px"><i class="fa fa-edit"></i> 修改</a>'
        		+'<a id="deleteCurriculumData" class="btn btn-danger btn-xs ifType"><i class="fa fa-close"></i> 删除</a>';
        	},
        	events: {
        		'click #viewCurriculumData': function(e, value, row, index){
        			fill_new_data(row);
        			$("#viewCurriculumDataModal .ibox-title h5").html("课程详情");
        			$("#viewCurriculumDataModal input").prop("disabled","disabled");
        			$("#viewCurriculumDataModal select").prop("disabled","disabled");
        			$("#updateCurriculumData").hide();
        			$("#specialties").val(row.specialty)
        		},
        		'click #changeCurriculumData': function(e, value, row, index){
        			fill_new_data(row);
        			$("#viewCurriculumDataModal .ibox-title h5").html("修改新闻信息");
        			$("#viewCurriculumDataModal input").removeAttr("disabled");
        			$("#viewCurriculumDataModal select").removeAttr("disabled");
        			$("#updateCurriculumData").show();
        		},
        		'click #deleteCurriculumData': function(e, value, row, index){
        			$("#confirmModal").modal();
        			$(".confirm-hint span").html(row.curriculumName);
        			$(".confirm-hint .selectId").html(row.id);
        		}
        	}
        }],
        onPostBody: function(){
        	if(parent.$("#user_type").text() == "普通用户"){
    			$(".ifType").hide();
    		}
        }
	})
	function queryParams(params) {
		var temp1 = {
			"offset" : params.offset,
			"limit" : params.limit,
			"curriculumNumber": $("#searchCurriculumNumber").val(),
			"curriculumType" : $("#searchCurriculumType").val(),
			"curriculumName" : $("#searchCurriculumName").val()
		}
		return temp1;
	}
	//填充数据
	function fill_new_data(row){
		$("#viewCurriculumDataModal").modal();
		var i = 0;
		var form_data = $("#viewCurriculumDataModal .form-group");
		var length = form_data.length;
		if(row.school != null){
        	checkSpecialties(row.school);
		}
		for (var key in row){
			if(form_data.eq(i).find("input").length>0){
				form_data.eq(i).find("input").val(row[key]);
			}else{
				form_data.eq(i).find("select").val(row[key])
			}
			i++;
		}
	}
}

//chooseCurriculum
//chooseCurriculumTableInit
var chooseCurriculumTableInit = function(){
	$("#chooseCurriculumTable").bootstrapTable({
		url : "curriculumsList",
		method : "post",
		contentType : "application/x-www-form-urlencoded",
		pagination: true, 
		sortable: true,                     //是否启用排序
		sortOrder: "asc",                   //排序方式
        queryParams: queryParams,//传递参数（*）
        sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
        pageNumber: 1,                       //初始化加载第一页，默认第一页
        pageSize: 100,                       //每页的记录行数（*）
        pageList: [5, 10, 20, 50],        //可供选择的每页的行数（*）
        strictSearch: true,
        showColumns: true,                  //是否显示所有的列
        showRefresh: true,                  //是否显示刷新按钮
        clickToSelect: true,                //是否启用点击选中行
        uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
        columns: [{
        	checkbox: true
        },{
        	fielf: "ID",
        	title: "ID",
        	formatter:function(value,row,index){
                var pageSize=$('#chooseCurriculumTable').bootstrapTable('getOptions').pageSize;
                var pageNumber=$('#chooseCurriculumTable').bootstrapTable('getOptions').pageNumber;
                return pageSize * (pageNumber - 1) + index + 1;
            }
        },{
        	field: "curriculumNumber",
        	title: "课程号"
        },{
        	field: "curriculumType",
        	title: "课程类型"
        },{
        	field: "curriculumName",
        	title: "课程名称"
        },{
        	field: "credit",
        	title: "学分"
        },{
        	field: "period",
        	title: "学时"
        },{
        	field: "startSemester",
        	title: "开课学期"
        },{
        	field: "location",
        	title: "上课地点"
        }]
	})
	function queryParams(params) {
		var temp1 = {
			"offset" : params.offset,
			"limit" : params.limit
		}
		return temp1;
	}
}

//myCurriculumTableInit
var myCurriculumTableInit = function(){
	$("#myCurriculumTable").bootstrapTable({
		url : "myCurriculumsList",
		method : "get",
		pagination: true, 
		sortable: true,                     //是否启用排序
		sortOrder: "asc",                   //排序方式
        queryParams: myCurriculumTableInit.queryParams,//传递参数（*）
        sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
        pageNumber: 1,                       //初始化加载第一页，默认第一页
        pageSize: 5,                       //每页的记录行数（*）
        pageList: [5, 10, 20, 50],        //可供选择的每页的行数（*）
        strictSearch: true,
        showColumns: true,                  //是否显示所有的列
        showRefresh: true,                  //是否显示刷新按钮
        clickToSelect: true,                //是否启用点击选中行
        uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
        columns: [{
        	field: "ID",
        	title: "ID",
        	formatter:function(value,row,index){
                var pageSize=$('#myCurriculumTable').bootstrapTable('getOptions').pageSize;
                var pageNumber=$('#myCurriculumTable').bootstrapTable('getOptions').pageNumber;
                return pageSize * (pageNumber - 1) + index + 1;
            }
        },{
        	field: "curriculumNumber",
        	title: "课程号"
        },{
        	field: "curriculumType",
        	title: "课程类型"
        },{
        	field: "curriculumName",
        	title: "课程名称"
        },{
        	field: "credit",
        	title: "学分"
        },{
        	field: "period",
        	title: "学时"
        },{
        	field: "startSemester",
        	title: "开课学期"
        },{
        	field: "location",
        	title: "上课地点"
        },{
        	field: "operation",
        	title: "操作",
        	formatter:function(value,row,index){
        		return '<a id="deleteCurriculumData" class="btn btn-danger btn-xs"><i class="fa fa-close"></i> 删除</a>';
        },
        events: {
        	'click #deleteCurriculumData': function(e, value, row, index){
    			$("#confirmModal").modal();
    			$(".confirm-hint span").html(row.curriculumName);
    			$(".confirm-hint .selectId").html(row.curriculumNumber);
    		}
        }
       }]
	})
	function queryParams(params) {
		var temp1 = {
			"offset" : params.pageSize,
			"limit" : params.pageNumber
		}
		return temp1;
	}
}

//bookTableInit
var bookListTableInit = function(){
	$("#bookListTable").bootstrapTable({
		url : "booksList",
		method : "post",
		contentType : "application/x-www-form-urlencoded",
		pagination: true, 
		sortable: true,                     //是否启用排序
		sortOrder: "asc",                   //排序方式
        queryParams: queryParams,//传递参数（*）
        sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
        pageNumber: 1,                       //初始化加载第一页，默认第一页
        pageSize: 5,                       //每页的记录行数（*）
        pageList: [5, 10, 20, 50],        //可供选择的每页的行数（*）
        strictSearch: true,
        showColumns: true,                  //是否显示所有的列
        showRefresh: true,                  //是否显示刷新按钮
        clickToSelect: true,                //是否启用点击选中行
        uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
        columns: [{
        	fielf: "ID",
        	title: "ID",
        	formatter:function(value,row,index){
                var pageSize=$('#bookListTable').bootstrapTable('getOptions').pageSize;
                var pageNumber=$('#bookListTable').bootstrapTable('getOptions').pageNumber;
                return pageSize * (pageNumber - 1) + index + 1;
            }
        },{
        	field: "bookType",
        	title: "图书类别"
        },{
        	field: "isbn",
        	title: "ISBN"
        },{
        	field: "bookName",
        	title: "书名"
        },{
        	field: "bookAuthor",
        	title: "作者"
        },{
        	field: "publishTime",
        	title: "出版时间"
        },{
        	field: "publishCompany",
        	title: "出版社"
        },{
        	field: "bookInfo",
        	title: "图书简介"
        },{
        	field: "operation",
        	title: "操作",
        	formatter:function(value,row,index){
        		return '<a id="borrowBook" class="btn btn-xs btn-primary" style="margin-right:10px"><i class="fa fa-edit"></i> 借阅</a>'
        		+'<a id="viewBookData" class="btn btn-success btn-xs" style="margin-right:10px"><i class="fa fa-eye"></i> 查看</a>'
        		+'<a id="changeBookData" class="btn btn-xs btn-warning ifType" style="margin-right:10px"><i class="fa fa-edit"></i> 修改</a>'
        		+'<a id="deleteBookData" class="btn btn-danger btn-xs ifType"><i class="fa fa-close"></i> 删除</a>';
        	},
        	events: {
        		'click #borrowBook' : function(e, value, row, index){
        			$.ajax({
        				url : "borrowBook",
        				type : "post",
        				data : {
        					bookIsbn : row.isbn,
        					bookName : row.bookName
        				},
        				success : function(data){
        					$(".success-alert").show();
        					setTimeout(function(){
        						$(".success-alert").hide();
        					},2000)
        				}
        			})
        		},
        		'click #viewBookData': function(e, value, row, index){
        			fill_new_data(row);
        			$("#viewBookDataModal .ibox-title h5").html("图书详情");
        			$("#viewBookDataModal input").prop("disabled","disabled");
        			$("#viewBookDataModal select").prop("disabled","disabled");
        			$("#viewBookDataModal textarea").prop("disabled","disabled");
        			$("#updateBooksData").hide();
        			
        		},
        		'click #changeBookData': function(e, value, row, index){
        			fill_new_data(row);
        			$("#viewBookDataModal .ibox-title h5").html("修改图书信息");
        			$("#viewBookDataModal input").removeAttr("disabled");
        			$("#viewBookDataModal select").removeAttr("disabled");
        			$("#viewBookDataModal textarea").removeAttr("disabled");
        			$("#updateBooksData").show();
        		},
        		'click #deleteBookData': function(e, value, row, index){
        			$("#confirmModal").modal();
        			$(".confirm-hint span").html(row.bookName);
        			$(".confirm-hint .selectId").html(row.id);
        		}
        	}
        }],
        onPostBody: function(){
        	if(parent.$("#user_type").text() == "普通用户"){
    			$(".ifType").hide();
    		}
        }
	})
	function queryParams(params) {
		if($("#bookType").val()=="null"){
			$("#bookType").val("")
		}
		var temp1 = {
			"offset" : params.offset,
			"limit" : params.limit,
			"bookType": $("#bookType").val(),
			"isbn" : $("#bookIsbn").val(),
			"bookName" : $("#searchBookName").val()
		}
		return temp1;
	}
	//填充数据
	function fill_new_data(row){
		$("#viewBookDataModal").modal();
		var i = 0;
		var form_data = $("#viewBookDataModal .form-group");
		var length = form_data.length;
		for (var key in row){
			if(form_data.eq(i).find("input").length>0){
				form_data.eq(i).find("input").val(row[key]);
			}else if(form_data.eq(i).find("select").length>0){
				form_data.eq(i).find("select").val(row[key]);
			}else{
				form_data.eq(i).find("textarea").val(row[key])
			}
			i++;
		}
	}
}

//我的借阅
var myBorrowBookTableInit = function(){
	$("#myBorrowBookTable").bootstrapTable({
		url : "myBorrowBookList",
		method : "post",
		contentType : "application/x-www-form-urlencoded",
		pagination: true, 
		sortable: true,                     //是否启用排序
		sortOrder: "asc",                   //排序方式
        queryParams: queryParams,//传递参数（*）
        sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
        pageNumber: 1,                       //初始化加载第一页，默认第一页
        pageSize: 5,                       //每页的记录行数（*）
        pageList: [5, 10, 20, 50],        //可供选择的每页的行数（*）
        strictSearch: true,
        showColumns: true,                  //是否显示所有的列
        showRefresh: true,                  //是否显示刷新按钮
        clickToSelect: true,                //是否启用点击选中行
        uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
        columns: [{
        	fielf: "ID",
        	title: "ID",
        	formatter:function(value,row,index){
                var pageSize=$('#myBorrowBookTable').bootstrapTable('getOptions').pageSize;
                var pageNumber=$('#myBorrowBookTable').bootstrapTable('getOptions').pageNumber;
                return pageSize * (pageNumber - 1) + index + 1;
            }
        },{
        	field: "bookIsbn",
        	title: "ISBN"
        },{
        	field: "bookName",
        	title: "书名"
        },{
        	field: "borrowDate",
        	title: "借书日期"
        },{
        	field: "operation",
        	title: "操作",
        	formatter:function(value,row,index){
        		return '<a id="returnBook" class="btn btn-danger btn-xs"><i class="fa fa-close"></i> 还书</a>';
        	},
        	events: {
        		'click #returnBook': function(e, value, row, index){
        			$("#confirmModal").modal();
        			$(".confirm-hint span").html(row.bookName);
        			$(".confirm-hint .selectId").html(row.bookIsbn);
        		}
        	}
        }]
	})
	function queryParams(params) {
		var temp1 = {
			"offset" : params.offset,
			"limit" : params.limit,
		}
		return temp1;
	}
}
