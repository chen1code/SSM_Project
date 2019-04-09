$(function(){
	//查学院
	checkSchools();
	$("#schools").change(function(){
		checkSpecialties($("#schools").val());
	})
})

function checkSchools(){
	$.ajax({
		url : "allSchools",
		type: "get",
		success : function(data){
			for(var i = 0; i < data.length; i++){
				var html = "<option value="+ data[i].schoolNumber +">"+ data[i].schoolName +"</option>"
				$("#schools").append(html);
				if($("#searchSchools")){
					$("#searchSchools").append(html);
				}
			}
		},
		errror: function(data){
			debugger;
			console.log(data);
		}
	})
}

function checkSpecialties(schoolNumber){
	$.ajax({
		url : "selectedSpecialties",
		async: false,
		type: "post",
		data : {
			toSchoolNumber : schoolNumber
		},
		success : function(data){
			for(var i = 0; i < data.length; i++){
				var html = "<option value="+ data[i].specialtyNumber +">"+ data[i].specialtyName +"</option>"
				$("#specialties").append(html);
			}
		}
	})
}