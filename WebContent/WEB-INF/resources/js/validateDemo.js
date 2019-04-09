$.validator.setDefaults({
	highlight : function(element) {
		$(element).closest('.form-group').removeClass('has-success').addClass(
				'has-error');
	},
	success : function(element) {
		element.closest('.form-group').removeClass('has-error').addClass(
				'has-success');
	},
	errorElement : "span",
	errorPlacement : function(error, element) {
		if (element.is(":radio") || element.is(":checkbox")) {
			error.appendTo(element.parent().parent().parent());
		} else {
			error.appendTo(element.parent());
		}
	},
	errorClass : "help-block m-b-none",
	validClass : "help-block m-b-none"

});

$().ready(function() {
	// validate the news form when it is submitted
	$("#newsPublishForm").validate({
		submitHandler: function(form) 
		   { 
			publishNews();
		   }  
	});
	//updateNews
	$("#newsUpdateForm").validate({
		submitHandler: function(form) 
		   { 
			updateNews();
		   } 
	})
	//validate userDataForm
	$("#userDataForm").validate({
		submitHandler: function(form) 
		   { 
			updateUser();
		   }  
	});
	//validate addCurriculumForm
	$("#addCurriculumForm").validate({
		submitHandler: function(form) 
		   { 
			addCurriculum();
		   }  
	});
	//udate curriculum
	$("#updateCurriculumForm").validate({
		submitHandler: function(form) 
		   { 
			updateCurriculum();
		   }  
	});
	
	//addBook
	$("#addBookForm").validate({
		submitHandler: function(form) 
		   { 
			addBook();
		   }  
	});
	//updateBook
	$("#booksUpdateForm").validate({
		submitHandler: function(form) 
		   { 
			updateBook();
		   }  
	});
});


//newsPublish
function publishNews(){
	var data = decodeURIComponent($("#newsPublishForm").serialize(),true);
	$.ajax({
		url: "newsPublish",
		type: "post",
		data: data,
		success: function(re_data){
			$(".success-alert").show();
			setTimeout(function(){
				$(".success-alert").hide();
			},2000)
			$("#newsPublishForm input").val("");
			$("#newsPublishForm textarea").val("");
			$(".form-group").removeClass("has-success");
		}
	})
}
//updateNews
function updateNews(){
	var data = decodeURIComponent($("#newsUpdateForm").serialize(),true);
	$.ajax({
		url : "updateNews",
		type: "post",
		data : data,
		success: function(data){
			$("#viewNewsDataModal .modal-close").click();
			$("#newsListTable").bootstrapTable('refresh');
		}
	})
}
//update user
function updateUser(){
	var data = decodeURIComponent($("#userDataForm").serialize(),true);
	$.ajax({
		url: "update_user",
		type: "post",
		data: data,
		success: function(re_data){
			$("#userDataModal .modal-close").click();
			$(".form-group").removeClass("has-success");
			$("#userTable").bootstrapTable('refresh');
		}
	})
}


//add curriculum
function addCurriculum(){
	var data = decodeURIComponent($("#addCurriculumForm").serialize(),true);
	$.ajax({
		url: "addCurriculum",
		type: "post",
		data: data,
		success: function(re_data){
			$(".success-alert").show();
			setTimeout(function(){
				$(".success-alert").hide();
			},2000)
			$("#addCurriculumForm input").val("");
			$("#addCurriculumForm select").val("");
			$(".form-group").removeClass("has-success");
		}
	})
}

//updateCurriculum
function updateCurriculum(){
	var data = decodeURIComponent($("#updateCurriculumForm").serialize(),true);
	$.ajax({
		url: "updateCurriculum",
		type: "post",
		data: data,
		success: function(re_data){
			$("#viewCurriculumDataModal .modal-close").click();
			$(".form-group").removeClass("has-success");
			$("#curriculumListTable").bootstrapTable('refresh');
		}
	})
}


//addBook
function addBook(){
	var data = decodeURIComponent($("#addBookForm").serialize(),true);
	$.ajax({
		url: "addBook",
		type: "post",
		data: data,
		success: function(re_data){
			$(".success-alert").show();
			setTimeout(function(){
				$(".success-alert").hide();
			},2000)
			$("#addBookForm input").val("");
			$("#addBookForm textarea").val("");
			$(".form-group").removeClass("has-success");
		}
	})
}

//update book
function updateBook(){
	var data = decodeURIComponent($("#booksUpdateForm").serialize(),true);
	console.log(data);
	$.ajax({
		url: "updateBook",
		type: "post",
		data: data,
		success: function(re_data){
			$("#viewBookDataModal .modal-close").click();
			$(".form-group").removeClass("has-success");
			$("#bookListTable").bootstrapTable('refresh');
		}
	})
}
